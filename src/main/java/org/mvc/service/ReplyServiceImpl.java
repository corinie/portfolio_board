package org.mvc.service;

import java.util.List;

import org.mvc.domain.CommentVO;
import org.mvc.mapper.CommentMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_={@Autowired})
	private CommentMapper mapper;
	
	@Override
	public void insert(CommentVO vo) {
		mapper.insert(vo);
	}

	@Override
	public CommentVO read(int rno) {
		return mapper.read(rno);
	}

	@Override
	public void update(CommentVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
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
