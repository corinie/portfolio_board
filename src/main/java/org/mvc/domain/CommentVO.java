package org.mvc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int cno,gno,bno;
	private String commenter, comment;
	private Date regdate,updatedate;

}
