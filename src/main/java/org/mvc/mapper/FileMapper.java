package org.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.FileVO;

public interface FileMapper {
	
	public void insertFile(FileVO vo);
	public void submitFile(String uuid);
	
	public void updateSumbitFile(@Param("uuid") String uuid, @Param("bno") int bno);
	public void updateNull(int bno);
	
	public List<FileVO> listFile(int bno);
	

}
