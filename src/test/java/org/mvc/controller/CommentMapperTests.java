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

public class CommentMapperTests {
	
	
	@Setter(onMethod_= {@Autowired})
	private CommentMapper mapper;
	
	
	@Test
	public void testInsert() {
		for(int i = 1; i < 5000; i++) {
			CommentVO vo = new CommentVO();
			vo.setBno(120352);
			vo.setComments("comment"+i);
			vo.setCommenter("user"+i);
			
			mapper.rootInsert(vo);	
		}
	}
//	
//	<insert id="branchInsert">
//	insert into tbl_comment(cno, bno, gno, commenter, comments) values(seq_comment.nextval, #{bno}, #{gno}, #{commenter}, #{comments})
//	</insert>
	
	@Test
	public void testBranchInsert() {
		
		CommentVO vo = new CommentVO();
		vo.setBno(120352);
		vo.setGno(21);
		vo.setCommenter("gd01");
		vo.setComments("zzzz");
		
		mapper.branchInsert(vo);
	}
	
	@Test
	public void testRead() {
		mapper.read(1);
	}
	
	@Test
	public void testUpdate() {
		CommentVO vo = new CommentVO();
		vo.setCno(1);
		vo.setComments("commentupdate");
		
		mapper.update(vo);
		mapper.read(1);
	}
	
	@Test
	public void testDelete() {
		mapper.rootDelete(1);
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
