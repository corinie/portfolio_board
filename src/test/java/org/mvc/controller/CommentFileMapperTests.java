package org.mvc.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mvc.domain.CommentFileVO;
import org.mvc.mapper.CommentFileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentFileMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	CommentFileMapper mapper;
	
	@Test
	public void testInsert() {
		
		CommentFileVO vo = new CommentFileVO();
		vo.setFname("testfname");
		vo.setDatefolder("testfolder");
		vo.setUuid("sdfasdfsfsdafsfesd");
		
		mapper.insertFile(vo);
		
	}
	
	@Test
	public void testSubmitCno() {
		
		CommentFileVO vo = new CommentFileVO();
		vo.setFname("testfname");
		vo.setDatefolder("testfolder");
		vo.setUuid("sdfasdfsfsdafsfesd");
		
		String uuid = "sdfasdfsfsdafsfesd";
		
		mapper.insertFile(vo);
		mapper.submitFile(uuid);
		
	}

}
