package org.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.CommentVO;
import org.mvc.util.Criteria;

public interface ReplyService {

	public void insert(CommentVO vo);
	public CommentVO read(int rno);
	public void update(CommentVO vo);
	public void delete(int rno);
	
	public List<CommentVO> list(@Param("cri")Criteria cri, @Param("bno")int bno);
	public int total(int bno);
}
