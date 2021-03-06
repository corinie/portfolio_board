package org.mvc.service;

import java.util.List;

import org.mvc.domain.AuthVO;
import org.mvc.domain.MemberVO;
import org.mvc.util.Criteria;

public interface MemberService {
	public List<MemberVO> list(Criteria cri);
	public int total();
	
	public List<MemberVO> searchList(Criteria cri);
	public int searchTotal(Criteria cri);
	
	public int setAuth(AuthVO vo);
	public void insertMember(MemberVO vo, AuthVO avo);
	public int deleteAuth(String mid);
	public int changeAuth(String mid, Criteria cri);
}
