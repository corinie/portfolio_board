package org.mvc.service;

import java.util.List;

import org.mvc.domain.AuthVO;
import org.mvc.domain.MemberVO;
import org.mvc.mapper.MemberMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> list(Criteria cri) {
		return mapper.listMember(cri);
	}

	@Override
	public int total() {
		return mapper.total();
	}
	
	@Override
	public List<MemberVO> searchList(Criteria cri){
		return mapper.searchListMember(cri);
	}
	
	@Override
	public int searchTotal(Criteria cri) {
		return mapper.searchTotal(cri);
	}
	
	@Override
	public int setAuth(AuthVO vo) {
		return mapper.setAuth(vo);
	}
	
	@Override
	public int changeAuth(String mid, Criteria cri) {
		return mapper.changeAuth(mid, cri);
	}
	
	@Override
	public int deleteAuth(String mid) {
		return mapper.deleteAuth(mid);
	}
	@Transactional
	@Override
	public void insertMember(MemberVO vo, AuthVO avo) {
		mapper.insertMember(vo);
		mapper.setAuth(avo);
	}
}
