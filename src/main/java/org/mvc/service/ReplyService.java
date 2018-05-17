package org.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.ReplyVO;
import org.mvc.util.Criteria;

public interface ReplyService {

	public void insert(ReplyVO vo);
	public ReplyVO read(int rno);
	public void update(ReplyVO vo);
	public void delete(int rno);
	
	public List<ReplyVO> list(@Param("cri")Criteria cri, @Param("bno")int bno);
	public int total(int bno);
}
