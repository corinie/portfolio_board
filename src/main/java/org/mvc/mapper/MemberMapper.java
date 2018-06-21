package org.mvc.mapper;

import java.util.List;

import org.mvc.domain.AuthVO;
import org.mvc.domain.MemberVO;
import org.mvc.util.Criteria;

public interface MemberMapper {
	
	public void createMember(MemberVO vo);
	public MemberVO readMember(String mid);
	
	public void setAuth(AuthVO vo);
	public void insertMember(MemberVO vo);
	
	public List<MemberVO> listMember(Criteria cri);
	public int total();
	
	public List<MemberVO> searchListMember(Criteria cri);
	public int searchTotal(Criteria cri);
}
