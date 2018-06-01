package org.mvc.service;

import java.util.List;

import org.mvc.domain.CommentVO;
import org.mvc.mapper.CommentFileMapper;
import org.mvc.mapper.CommentMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class CommentServiceImpl implements CommentService{

	@Setter(onMethod_={@Autowired})
	private CommentMapper mapper;
	@Setter(onMethod_={@Autowired})
	private CommentFileMapper fileMapper;
	
	@Transactional
	@Override
	public void rootInsert(CommentVO vo) {
		mapper.rootInsert(vo);
		String uuid = vo.getUuid();
		fileMapper.submitFile(uuid);
	}
	
	@Override
	public void branchInsert(CommentVO vo) {
		mapper.branchInsert(vo);
	}

	@Override
	public CommentVO read(int cno) {
		return mapper.read(cno);
	}

	@Override
	public void update(CommentVO vo) {
		mapper.update(vo);
	}

	@Override
	public void rootDelete(int cno) {
		mapper.rootDelete(cno);
	}
	
	@Override
	public void branchDelete(int cno) {
		mapper.branchDelete(cno);
	}

	@Override
	public List<CommentVO> list(Criteria cri, int bno) {
		return mapper.list(cri, bno);
	}

	@Override
	public int total(int bno) {
		return mapper.total(bno);
	}

}
