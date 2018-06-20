package org.mvc.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mvc.domain.MessageVO;
import org.mvc.mapper.MessageMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MessageMapperTests {
	
	
	@Setter(onMethod_={@Autowired})
	private MessageMapper mapper;
	
	@Test
	public void confirmFinalMessageTest() {
		
		mapper.confirmFinalMessage(120901);
		
	}
	
	@Test
	public void confirmFinalReceiver() {
		
		mapper.confirmFinalReceiver(120901);
		
	}
	
	@Test
	public void confirmMessageTest() {
		
		mapper.confirmMessage(120906);
		
	}
	
	@Test
	public void confirmReceiverTest() {
		
		mapper.confirmReceiver(120906);
		
	}
	
	@Test
	public void listTest() {
		
		mapper.getList("user99", new Criteria(1));
		
	}
	
	@Test
	public void refuseMessageTest() {
		
		mapper.refuseMessage(120906);
		
	}
	
	
	
	@Test
	public void readTest() {
		
		MessageVO vo = mapper.read(51);
		
		log.info(vo);
		
	}
	
	@Test
	public void updateStatus() {
		
		mapper.updateStatus(43);
		
	}
	
	@Test
	public void deleteTest() {
		
		mapper.delete(43);
		
	}
	

}
