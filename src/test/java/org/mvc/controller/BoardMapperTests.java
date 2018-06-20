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
	public void rootWriterTest() {
		
		int bno = 120934;
		
		log.info(mapper.rootWriter(bno));
	}
	
	@Test
	public void setStatusOngoing() {
		int bno = 120924;
		String status = "ongoing";
		
		mapper.updateStatus(bno, status);
	}
	
	/*@Test
	public void rootinsert() {
		for(int i = 0 ; i < 100000 ; i++) {
			BoardVO vo = new BoardVO();
			vo.setTitle("title"+i);
			vo.setWriter("writer"+i);
			vo.setContent("content"+i);
			
			mapper.rootInsert(vo);
		}	
	}
	@Test
	public void branchInsert() {
		for(int i = 0 ; i < 10 ; i++) {
			BoardVO vo = new BoardVO();
			vo.setRbno(90000);
			vo.setBno(90000);
			vo.setDepth(0);
			
			vo.setTitle("title"+i);
			vo.setWriter("writer"+i);
			vo.setContent("content"+i);
			
			mapper.branchInsert(vo);
		}	
	}*/
	
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
		int bno = 999;
		mapper.delete(bno);
	}
	
	@Test
	public void list() {
		List<BoardVO> list = new ArrayList<BoardVO>();
		Criteria cri = new Criteria();
		cri.setPage(1);
		
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
		cri.setKeyword("9999");
		cri.setType("t");
		
		mapper.searchList(cri);
	}
	
	@Test
	public void searchTotal() {
		Criteria cri = new Criteria();
		cri.setKeyword("99999");
		cri.setType("t");
		int count = mapper.searchTotal(cri);
		log.info(count);
	}
	
	
	
	
}
