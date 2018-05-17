package org.mvc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int rno,gno,bno;
	private String replyer, reply;
	private Date regdate,updatedate;

}
