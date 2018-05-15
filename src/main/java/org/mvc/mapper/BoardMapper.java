package org.mvc.mapper;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.util.Criteria;

public interface BoardMapper {

	public List<BoardVO> list(Criteria cri);
	
	public int insert(BoardVO vo);
	
	public BoardVO read(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO vo);
}
