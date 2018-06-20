package org.mvc.service;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.mapper.BoardMapper;
import org.mvc.mapper.CommentFileMapper;
import org.mvc.mapper.CommentMapper;
import org.mvc.mapper.FileMapper;
import org.mvc.mapper.MessageMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_= {@Autowired})
	BoardMapper mapper;
	@Setter(onMethod_= {@Autowired})
	FileMapper fmapper;
	@Setter(onMethod_= {@Autowired})
	CommentMapper cmapper;
	@Setter(onMethod_= {@Autowired})
	CommentFileMapper cfmapper;
	@Setter(onMethod_= {@Autowired})
	MessageMapper mmapper;
	
	@Override
	@Transactional
	public void rootInsert(BoardVO vo, String[] uuid) {
		mapper.rootInsert(vo);
		if(uuid != null) {
			for(int i=0; i<uuid.length; i++) {
				fmapper.submitFile(uuid[i]);
			}
		}
	}
	
	@Override
	@Transactional
	public void branchInsert(BoardVO vo, int bno, String[] uuid) {
		mapper.boardInsertCount(bno);
		mapper.branchInsert(vo);
		if(uuid != null) {
			for(int i=0; i<uuid.length; i++) {
				fmapper.submitFile(uuid[i]);
			}
		}
	}

	@Override
	public BoardVO read(int bno) {
		return mapper.read(bno);
	}
	
	@Override
	public String rootWriter(int bno) {
		return mapper.rootWriter(bno);
	}
	
	@Override
	@Transactional
	public int delete(int bno, int pbno) {
		mapper.boardDeleteCount(bno);
		mapper.delete(bno);
		fmapper.updateNull(bno);
		cmapper.commentFullDelete(bno);
		cfmapper.deleteFullFile(bno);
		return mapper.checkDeleteYN(bno);
	}

	@Override
	@Transactional
	public int update(BoardVO vo, String[] uuid) {
		fmapper.updateNull(vo.getBno());
		if(uuid != null) {
			for(int i=0; i<uuid.length; i++) {
				fmapper.updateSumbitFile(uuid[i], vo.getBno());
			}
		}
		return mapper.update(vo);
	}
	
	@Override
	@Transactional
	public void allStatus(int bno, String status) {
		mapper.updateStatus(bno, status);

		if(status.equals("ongoing")) {
			mmapper.confirmMessage(bno);
			mmapper.confirmReceiver(bno);
			mapper.updateAllStatus(bno);
			mapper.updateParentStatus(bno);
		}
		if(status.equals("completion")) {
			mapper.updateAllStatus(bno);
			mapper.updateParentStatus(bno);
			mapper.updateRootStatus(bno);
			mmapper.confirmFinalMessage(bno);
			mmapper.confirmFinalReceiver(bno);
		}
		if(status.equals("refuse")) {
			mmapper.refuseMessage(bno);
			mmapper.confirmReceiver(bno);
		}

	}
	

	@Override
	public List<BoardVO> list(Criteria cri) {
		return mapper.list(cri);
	}
	
	@Override
	public int total() {
		return mapper.total();
	}

	@Override
	public List<BoardVO> searchList(Criteria cri) {
		return mapper.searchList(cri);
	}

	@Override
	public int searchTotal(Criteria cri) {
		return mapper.searchTotal(cri);
	}

	@Override
	public List<BoardVO> replyList(int bno) {
		return mapper.replyList(bno);
	}

	
	

}
