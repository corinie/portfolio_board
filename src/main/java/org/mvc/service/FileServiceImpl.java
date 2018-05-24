package org.mvc.service;

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
	public void fileInsert(FileVO vo) {
		mapper.fileInsert(vo);
	}

}
