package org.mvc.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mvc.domain.CommentVO;
import org.mvc.mapper.CommentMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentMapperTests {
	
	
	@Setter(onMethod_= {@Autowired})
	private CommentMapper mapper;
	
	
	@Test
	public void testInsert() {
		for(int i=0; i < 100; i++) {
			CommentVO vo = new CommentVO();
			vo.setBno(1500000+i);
			vo.setComment("comment"+i);
			vo.setCommenter("user"+i);
			
			mapper.insert(vo);	
		}
	}
	
	@Test
	public void testRead() {
		mapper.read(1);
	}
	
	@Test
	public void testUpdate() {
		CommentVO vo = new CommentVO();
		vo.setCno(1);
		vo.setComment("commentupdate");
		
		mapper.update(vo);
		mapper.read(1);
	}
	
	@Test
	public void testDelete() {
		mapper.delete(1);
		mapper.read(1);
	}
	
	@Test
	public void testTotal() {
		mapper.total(1500000);
	
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria(1);
		int bno = 1500000;
		mapper.list(cri, bno);
	
	}

}
