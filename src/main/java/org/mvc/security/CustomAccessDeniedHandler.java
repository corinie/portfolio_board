package org.mvc.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, 
			HttpServletResponse response, AccessDeniedException accessException)
			throws IOException, ServletException {

		log.error("Access Denied Handler");
		log.error("Redirect....");
		log.error("--------------------------------------");
		log.error(accessException);
		
		if(accessException !=null) {
			Cookie[] cookies = request.getCookies();
			
			if(cookies != null && cookies.length > 0 ) {
				
				for (Cookie ck : cookies) {
					ck.setMaxAge(-1);
				}
			}
		}

		if(request.getHeader("X-CSRF-TOKEN") != null) {
			
			response.getWriter().write("ERROR");
			
			return;
		}
		
		response.sendRedirect("/autherror");

	}

}

