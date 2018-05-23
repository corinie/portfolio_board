package org.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.CommentVO;
import org.mvc.util.Criteria;

public interface CommentMapper {

	public void rootInsert(CommentVO vo);
	public void branchInsert(CommentVO vo);
	public CommentVO read(int cno);
	public void update(CommentVO vo);
	public void rootDelete(int cno);
	public void branchDelete(int cno);
	
	public List<CommentVO> list(@Param("cri")Criteria cri, @Param("bno")int bno);
	public int total(int bno);
	
}
