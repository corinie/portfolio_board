package org.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.CommentFileVO;

public interface CommentFileMapper {
	
	public void insertFile(CommentFileVO vo);
	public void submitFile(String uuid);
	
	public void updateSumbitFile(@Param("uuid") String uuid, @Param("bno") int bno);
	public void updateNull(int bno);
	
	public List<CommentFileVO> listFile(int bno);

}
