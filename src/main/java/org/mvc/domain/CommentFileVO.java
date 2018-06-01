package org.mvc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentFileVO {
	
	private int cno, cfno;
	private String uuid, fname, datefolder;
	private Date regdate, updatedate;
}
