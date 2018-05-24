package org.mvc.mapper;

import java.util.List;

import org.mvc.domain.FileVO;

public interface FileMapper {
	
	public void fileInsert(FileVO vo);
	public void fileDelete(int fno);
	public void fileUpdate(int fno);
	public void fileSumbit(String uuid);
	public List<FileVO> fileList(int bno);

}
