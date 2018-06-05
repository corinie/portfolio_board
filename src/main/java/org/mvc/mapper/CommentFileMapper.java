package org.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.CommentFileVO;

public interface CommentFileMapper {
	
	public void insertFile(CommentFileVO vo);
	public void submitFile(String uuid);
	
	public void updateSubmitFile(@Param("uuid") String uuid, @Param("cno") int cno);
	public void updateNull(int cno);
	public void deleteFullFile(int bno);
	
	public List<CommentFileVO> listFile(int bno);
	

}
