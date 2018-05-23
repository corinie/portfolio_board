package org.mvc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int cno,gno,bno,depth;
	private String commenter, comments, deleteyn;
	private Date regdate,updatedate;

}
