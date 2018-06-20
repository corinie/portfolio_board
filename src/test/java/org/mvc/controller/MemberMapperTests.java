package org.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mvc.domain.AuthVO;
import org.mvc.domain.BoardVO;
import org.mvc.domain.MemberVO;
import org.mvc.mapper.MemberMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberMapperTests {
	
	 @Autowired
     private PasswordEncoder encoder;
     
     @Autowired
     private MemberMapper mapper;


     //DB연동시 Transactional 상황 처리
     @Test
     public void testInsert() {
           for(int i = 100; i < 200; i++) {
                MemberVO vo = new MemberVO();
               
                vo.setMid("user" + i);
                vo.setMpw(encoder.encode("pw" + i));
                vo.setMname("사용자" + i);
                vo.setEmail(i+"@corinie.com");
                mapper.createMember(vo);
                
                
                if( i >= 0) {
                	 AuthVO avo = new AuthVO();
                     avo.setMid("user" + i);
                     avo.setAuth("ROLE_MEMBER");
                
                     mapper.setAuth(avo);
                }
                if( i>=80 ) {
                	 AuthVO avo = new AuthVO();
                	avo.setMid("user" + i);
                	avo.setAuth("ROLE_MANAGER");
                     
                	  mapper.setAuth(avo);
                     
                }
                
                if( i>=90 ) {
                	 AuthVO avo = new AuthVO();
                     avo.setMid("user" + i);
                     avo.setAuth("ROLE_ADMIN");
                     
                     mapper.setAuth(avo);
                     
                }
           }
     }

	
	@Test
	public void readMemberRead() {
		
		log.info(mapper.readMember("user0"));
		
	}
	
	@Test
	public void listMember() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		Criteria cri = new Criteria();
		cri.setPage(1);
		
		log.info(mapper.listMember(cri));
	}
	
	
	@Test
	public void searchList() {
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setType("a");
		
		mapper.searchTotal(cri);
	}
}