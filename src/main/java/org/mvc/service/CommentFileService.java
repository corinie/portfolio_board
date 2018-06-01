package org.mvc.service;

import java.util.List;

import org.mvc.domain.CommentFileVO;


public interface CommentFileService {
	
	public void insertFile(CommentFileVO vo);
	public List<CommentFileVO> listFile(int cno);


}
