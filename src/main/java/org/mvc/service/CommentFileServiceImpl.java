package org.mvc.service;

import java.util.List;

import org.mvc.domain.CommentFileVO;
import org.mvc.mapper.CommentFileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class CommentFileServiceImpl implements CommentFileService {
	
	@Setter(onMethod_= {@Autowired})
	private CommentFileMapper mapper;
	
	@Override
	public void insertFile(CommentFileVO vo) {
		mapper.insertFile(vo);
	}

	@Override
	public List<CommentFileVO> listFile(int cno) {
		return mapper.listFile(cno);
	}

}
