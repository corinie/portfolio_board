package org.mvc.service;

import java.util.List;

import org.mvc.domain.FileVO;

public interface FileService {
	
	public void fileInsert(FileVO vo);
	public List<FileVO> fileList(int bno);

}
