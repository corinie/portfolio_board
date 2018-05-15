package org.mvc.util;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
public class Criteria {
	
	private int page = 1;
	private String keyword;
	private String type;
	
	public String[] getArr() {
		
		String[] types =  this.type.split("");
		return types;
		
	}
	
	public Criteria() {
		this.page = 1;
	}
	
	public Criteria(int page) {
		this.page = page;
	}
	
	public int getSkip() {
 		return (this.page -1 ) * 10; 
	}
}
