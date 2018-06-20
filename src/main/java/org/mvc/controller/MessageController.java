package org.mvc.controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mvc.domain.MessageVO;
import org.mvc.service.MessageService;
import org.mvc.util.Criteria;
import org.mvc.util.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/message/*")
public class MessageController {
	
	@Setter(onMethod_={@Autowired})
	private MessageService service;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public void list(Principal principal, Criteria cri, Model model) {
		log.info("get list....");
		
		List<MessageVO> list = service.getList(principal.getName(), cri);
		
		PageMaker pm = new PageMaker(cri, service.total(principal.getName()));
		
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/view")
	public void view(int rmno, Model model) {
		log.info("get view....");
		
		MessageVO vo = service.read(rmno);
		
		model.addAttribute("vo", vo);
		
	}
	
	@PostMapping("/delete")
	public String delete(int[] delete) {
		log.info("post delete....");
			
		service.delete(delete);
		
		return "redirect:/message/list";
	}

}
