package org.mvc.service;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.mapper.BoardMapper;
import org.mvc.mapper.FileMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_= {@Autowired})
	BoardMapper mapper;
	@Setter(onMethod_= {@Autowired})
	FileMapper fmapper;
	
	
	@Override
	@Transactional
	public void rootInsert(BoardVO vo, String[] uuid) {
		mapper.rootInsert(vo);
		for(int i=0; i<uuid.length; i++) {
			fmapper.fileSumbit(uuid[i]);
		}
	}
	
	@Override
	@Transactional
	public int branchInsert(BoardVO vo, int bno) {
		mapper.boardInsertCount(bno);
		return mapper.branchInsert(vo);
	}

	@Override
	public BoardVO read(int bno) {
		return mapper.read(bno);
	}
	
	@Override
	@Transactional
	public int delete(int bno, int pbno) {
		mapper.boardDeleteCount(bno);
		mapper.delete(bno);
		return mapper.checkDeleteYN(bno);
	}

	@Override
	public int update(BoardVO vo) {
		return mapper.update(vo);
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
