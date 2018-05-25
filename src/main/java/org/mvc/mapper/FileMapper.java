package org.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.FileVO;

public interface FileMapper {
	
	public void fileInsert(FileVO vo);
	public void fileDelete(int fno);
	public void fileUpdate(int fno);
	public void fileSumbit(String uuid);
	public void fileUpdateSumbit(@Param("uuid") String uuid, @Param("bno") int bno);
	public List<FileVO> fileList(int bno);
	public void updateNull(int bno);

}
