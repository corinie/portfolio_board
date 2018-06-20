package org.mvc.service;

import java.util.List;

import org.mvc.domain.MemberVO;
import org.mvc.mapper.MemberMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
