package org.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.domain.MessageVO;
import org.mvc.util.Criteria;

public interface MessageService {
	
	public List<MessageVO> getList(@Param("receiver") String receiver, @Param("cri") Criteria cri);
	
	public int total(String receiver);
	
	public MessageVO read(int rmno);
	
	public void delete(int[] rmno);

}
