package org.mvc.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mvc.domain.FileVO;
import org.mvc.mapper.FileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FileMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	private FileMapper mapper;
	
	@Test
	public void testInsert() {
		
		FileVO vo = new FileVO();
		vo.setFname("sadfssdfadf");
		vo.setUuid("asdfsasdfdfdsd");
		vo.setImage("n");
		
		mapper.fileInsert(vo);
	}

}
