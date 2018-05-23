package org.mvc.mapper;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.util.Criteria;

public interface BoardMapper {

	
	public int rootInsert(BoardVO vo);	
	public int branchInsert(BoardVO vo);	
	public BoardVO read(int bno);
	public int update(BoardVO vo);
	public int checkDeleteYN(int bno);
	public int delete(int bno);
	
	public int boardDeleteCount(int bno);
	public int boardInsertCount(int bno);
	
	public List<BoardVO> list(Criteria cri);
	public int total();
	
	public List<BoardVO> searchList(Criteria cri);
	public int searchTotal(Criteria cri);
	
	
	public List<BoardVO> replyList(int bno);
	
}
