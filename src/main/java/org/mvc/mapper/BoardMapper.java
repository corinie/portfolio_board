package org.mvc.mapper;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.util.Criteria;

public interface BoardMapper {

	
	public int insert(BoardVO vo);	
	public BoardVO read(int bno);
	public int update(BoardVO vo);
	public int delete(int bno);
	
	public List<BoardVO> list(Criteria cri);
	public int total();
	
	public List<BoardVO> searchList(Criteria cri);
	public int searchTotal(Criteria cri);
	
	
}
