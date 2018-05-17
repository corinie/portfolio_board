package org.mvc.util;

import lombok.Getter;

@Getter
public class PageMaker {

	private boolean prev, next;
	private int page, start, end, total;
	private Criteria cri;
	
	public PageMaker() {
		
	}

	private int parse(String str) {
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			return 1;
		}
	}
	
	
	public PageMaker(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		this.page = cri.getPage() > 0 ? cri.getPage() : 1 ;
	
		int tempLast = (int)(Math.ceil(page/10.0)*10);
		this.start = tempLast-9;
		
		prev = (start != 1); // boolean
		
		if(tempLast*10 >= total) {
			tempLast = (int)(Math.ceil(total/10.0));
		}else {
			this.next = true;
		}
		
		this.end = tempLast;
		
	}

}