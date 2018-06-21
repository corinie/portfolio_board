package org.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.BoardVO;
import org.mvc.domain.MemberVO;
import org.mvc.util.Criteria;

public interface BoardMapper {
	public void rootInsert(BoardVO vo);	
	public int branchInsert(BoardVO vo);	
	public BoardVO read(int bno);
	public String rootWriter(int bno);
	public int update(BoardVO vo);
	public int checkDeleteYN(int bno);
	public int delete(int bno);
	
	public int boardDeleteCount(int bno);
	public int boardInsertCount(int bno);
	
	public List<BoardVO> list(Criteria cri);
	public int total(String status);
	
	public List<BoardVO> searchList(Criteria cri);
	public int searchTotal(Criteria cri);
	
	public List<BoardVO> replyList(int bno);
	
	public void updateStatus(@Param("bno") int bno, @Param("status") String status);
	public void updateAllStatus(int bno);
	public void updateParentStatus(int bno);
	public void updateRootStatus(int bno);
	public void updatePauseStatus(int bno);
	}