package org.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mvc.domain.BoardVO;
import org.mvc.mapper.BoardMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_={@Autowired})	
	private BoardMapper mapper;
	
	@Test
	public void insert() {
		for(int i = 0 ; i <10 ; i++) {
			BoardVO vo = new BoardVO();
			vo.setContent("content"+i);
			vo.setTitle("title"+i);
			vo.setWriter("writer"+i);
			mapper.insert(vo);
		}
	}
	
	@Test
	public void read() {
		int bno = 1515555;
		mapper.read(bno);
	}
	
	@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(1545555);
		vo.setTitle("UpdateTitle");
		vo.setContent("UpdateContent");
		
		mapper.update(vo);
	}
	
	@Test
	public void delete() {	
		int bno = 1515555;
		mapper.delete(bno);
	}
	
	@Test
	public void list() {
		List<BoardVO> list = new ArrayList<BoardVO>();
		Criteria cri = new Criteria();
		cri.setPage(10);
		
		mapper.list(cri);
	}
	
	@Test
	public void total() {
		int count = mapper.total();
		log.info(count);
	}
	
	@Test
	public void searchList() {
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setKeyword("up");
		cri.setType("t");
		log.info("================================================================================");
		log.info(cri.getKeyword());
		log.info(cri.getType());
		mapper.searchList(cri);
	}
	
}
