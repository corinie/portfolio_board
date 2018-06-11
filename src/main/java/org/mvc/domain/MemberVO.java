package org.mvc.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String mname, mid, mpw, email;
	private String deleteyn;
	private Date regdate, updatedate;
	
	private List<AuthVO> authList;
}
