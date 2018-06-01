package org.mvc.service;

import java.util.List;

import org.mvc.domain.FileVO;
import org.mvc.mapper.FileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class FileServiceImpl implements FileService {
	
	@Setter(onMethod_= {@Autowired})
	FileMapper mapper;
	
	@Override
	public void insertFile(FileVO vo) {
		mapper.insertFile(vo);
	}

	@Override
	public List<FileVO> listFile(int bno) {
		return mapper.listFile(bno);
	}
	
	

}
