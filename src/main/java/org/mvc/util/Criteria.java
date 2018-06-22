package org.mvc.util;


import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class Criteria {
	
	private int page = 1;
	private String keyword;
	private String type;
	private String status;
	
	public String[] getArr() {
		
		if(this.type == null) {
			return null;
		}
		
		String[] types =  this.type.split("");
		return types;
	}
	
	public Criteria() {
		this.page = 1;
		this.status = "ongoing";
	}
	
	public Criteria(int page) {
		this.page = page;
	}
	
	public int getSkip() {
 		return (this.page -1 ) * 10; 
	}
	
	public String getUrl(String bno) {
		UriComponents uri;
		if(this.type != null) {
			uri = UriComponentsBuilder.newInstance()
					.path("").queryParam("status", this.status).queryParam("page", this.page).queryParam("type", this.type).queryParam("keyword", this.keyword).queryParam("bno", bno).build();
		}else {
			uri = UriComponentsBuilder.newInstance()
					.path("").queryParam("status", this.status).queryParam("page", this.page).queryParam("bno", bno).build();
		}
		return uri.toUriString();	
	}
	
	//auth type 
		private String authType;
		public String[] getAuthArr() {
			if(this.authType == null) {
				return null;
			}
			
			String[] authTypes =  this.authType.split("");
			return authTypes;
		}
		
		public String getAuthUrl() {
			UriComponents uri;
			if(this.type != null) {
				uri = UriComponentsBuilder.newInstance()
						.path("").queryParam("page", this.page).queryParam("authType", this.authType).queryParam("keyword", this.keyword).build();
			}else {
				uri = UriComponentsBuilder.newInstance()
						.path("").queryParam("page", this.page).build();
			}
			return uri.toUriString();	
		}


}
