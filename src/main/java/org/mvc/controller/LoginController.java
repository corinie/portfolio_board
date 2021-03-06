package org.mvc.controller;





import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/login/*")
@Log4j
public class LoginController {
	
	@GetMapping("/login")
	public void login() {
		log.info("get login......");		
	}
	
}
