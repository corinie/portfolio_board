package org.mvc.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mvc.domain.ReplyVO;
import org.mvc.mapper.ReplyMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	
	@Setter(onMethod_= {@Autowired})
	private ReplyMapper mapper;
	
	
	@Test
	public void testInsert() {
		for(int i=0; i < 100; i++) {
			ReplyVO vo = new ReplyVO();
			vo.setBno(1500000+i);
			vo.setReply("reply"+i);
			vo.setReplyer("user"+i);
			
			mapper.insert(vo);	
		}
	}
	
	@Test
	public void testRead() {
		mapper.read(1);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(1);
		vo.setReply("replyupdate");
		
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
