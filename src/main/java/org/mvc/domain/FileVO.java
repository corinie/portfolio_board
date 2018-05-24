package org.mvc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FileVO {

	private int fno, bno;
	private String fname, address, deleteyn, image;
	private Date regdate, updatedate;
	
}
