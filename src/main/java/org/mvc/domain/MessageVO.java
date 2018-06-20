package org.mvc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {
	
	private int mno, rmno;
	private String title, message, sender, receiver, status, deleteyn;
	private Date regdate, updatedate;

}
