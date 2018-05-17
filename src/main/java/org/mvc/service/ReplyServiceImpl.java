package org.mvc.service;

import java.util.List;

import org.mvc.domain.ReplyVO;
import org.mvc.mapper.ReplyMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_={@Autowired})
	private ReplyMapper mapper;
	
	@Override
	public void insert(ReplyVO vo) {
		mapper.insert(vo);
	}

	@Override
	public ReplyVO read(int rno) {
		return mapper.read(rno);
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> list(Criteria cri, int bno) {
		return mapper.list(cri, bno);
	}

	@Override
	public int total(int bno) {
		return mapper.total(bno);
	}

}
