package org.mvc.service;

import java.util.List;

import org.mvc.domain.FileVO;

public interface FileService {
	
	public void insertFile(FileVO vo);
	public List<FileVO> listFile(int bno);

}
