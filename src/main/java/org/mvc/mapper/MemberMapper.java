package org.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.AuthVO;
import org.mvc.domain.MemberVO;
import org.mvc.util.Criteria;

public interface MemberMapper {
	
	public void createMember(MemberVO vo);
	public MemberVO readMember(String mid);
	
	public int setAuth(AuthVO vo);
	public int deleteAuth(String mid);
	
	public List<MemberVO> listMember(Criteria cri);
	public int total();
	
	public List<MemberVO> searchListMember(Criteria cri);
	public int searchTotal(Criteria cri);
	
	public int changeAuth(@Param("mid") String mid, @Param("cri") Criteria cri);
}
