package org.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.service.BoardService;
import org.mvc.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Setter(onMethod_={@Autowired})	
	private BoardService service;
	
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		List<BoardVO> list;
		
		list = service.list(cri);
		
		model.addAttribute("list", list);
		
	}
}
