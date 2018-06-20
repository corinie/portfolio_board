package org.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.MessageVO;
import org.mvc.util.Criteria;

public interface MessageMapper {
	
	public void confirmFinalMessage(int bno);
	public void confirmFinalReceiver(int rbno);
	
	public void confirmMessage(int bno);
	public void confirmReceiver(int bno);
	
	public void refuseMessage(int bno);
	
	
	public List<MessageVO> getList(@Param("receiver") String receiver, @Param("cri") Criteria cri);
	public int total(String receiver);
	
	public MessageVO read(int rmno);
	public void updateStatus(int rmno);
	
	public void delete(int rmno);
}
