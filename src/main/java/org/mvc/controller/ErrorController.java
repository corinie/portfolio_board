package org.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ErrorController {
	
	@GetMapping("/autherror")
	public void autherror() {
		
		log.info("get autherror");
		
	}

}
