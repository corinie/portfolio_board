package org.mvc.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Integer bno, pbno, rbno, depth, hit, replycount, boardcount;
	private String title, content, writer, status, deleteyn;
	private Date regdate, updatedate;
}
