package org.mvc.service;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.util.Criteria;

public interface BoardService {
	
	public void rootInsert(BoardVO vo, String[] uuid);
	public void branchInsert(BoardVO vo, int bno, String[] uuid);
	public BoardVO read(int bno);
	public int delete(int bno, int pbno);
	public int update(BoardVO vo, String[] uuid);
	
	public List<BoardVO> list(Criteria cri);
	public int total();
	
	public List<BoardVO> searchList(Criteria cri);
	public int searchTotal(Criteria cri);
	
	public List<BoardVO> replyList(int bno);
	
}
