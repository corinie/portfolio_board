package org.mvc.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Integer bno, hits, replycount;
	private String title, content, writer, deleteyn;
	private Date regdate, updatedate;
	
}
