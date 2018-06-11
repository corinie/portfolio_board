package org.mvc.mapper;

import org.mvc.domain.AuthVO;
import org.mvc.domain.MemberVO;

public interface MemberMapper {
	
	public void createMember(MemberVO vo);
	
	public void setAuth(AuthVO vo);
	
	public MemberVO readMember(String mid);
}
