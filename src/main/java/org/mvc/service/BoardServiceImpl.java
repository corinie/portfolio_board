package org.mvc.service;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.mapper.BoardMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_= {@Autowired})
	BoardMapper mapper;
	

	
	@Override
	public int insert(BoardVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public BoardVO read(int bno) {
		return mapper.read(bno);
	}

	@Override
	public int delete(int bno) {
		return mapper.delete(bno);
	}

	@Override
	public int update(BoardVO vo) {
		return mapper.update(vo);
	}

	
	@Override
	public List<BoardVO> list(Criteria cri) {
		return mapper.list(cri);
	}
	
	@Override
	public int total() {
		return mapper.total();
	}

	@Override
	public List<BoardVO> searchList(Criteria cri) {
		return mapper.searchList(cri);
	}

	@Override
	public int searchTotal(Criteria cri) {
		return mapper.searchTotal(cri);
	}
	
	

}
