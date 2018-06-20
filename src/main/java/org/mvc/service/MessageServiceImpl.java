package org.mvc.service;

import java.util.List;

import org.mvc.domain.MessageVO;
import org.mvc.mapper.MessageMapper;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Setter(onMethod_= {@Autowired})
	private MessageMapper mapper;
	
	@Override
	public List<MessageVO> getList(String receiver, Criteria cri) {
		
		return mapper.getList(receiver, cri);
	}

	@Override
	public MessageVO read(int rmno) {
		
		mapper.updateStatus(rmno);
		return mapper.read(rmno);
	}

	@Override
	public void delete(int[] rmno) {
		for(int i=0; i<rmno.length; i++) {
			mapper.delete(rmno[i]);
		}
	}

	@Override
	public int total(String receiver) {
		
		return mapper.total(receiver);
	}
	
	
}
