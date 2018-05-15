package org.mvc.controller;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.service.BoardService;
import org.mvc.util.Criteria;
import org.mvc.util.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_={@Autowired})	
	private BoardService service;
	
	
	@GetMapping("/register")
	public void insert() {
		log.info("get insert");
		
	}
	
	@PostMapping("/register")
	public void insertPost(BoardVO vo) {
		log.info("post insert");
		service.insert(vo);	
	}
	
	@GetMapping("/view")
	public void read(int bno, Model model) {
		log.info("get view");
		
		model.addAttribute("vo", service.read(bno));
	}
	
	
	@GetMapping("/update")
	public void update(int bno, Model model) {
		log.info("get update");
		
		model.addAttribute("vo", service.read(bno));
	}
	
	@PostMapping("/update")
	public String updatePost(BoardVO vo, int page) {
		log.info("post update");
		service.update(vo);	
		
		return "redirect:/board/list?page="+page;
	}
	
	
	@PostMapping("/delete")
	public String delete(int bno) {
		log.info("post delete");
		service.delete(bno);
		
		return "redirect:/board/list";
	}
	

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		List<BoardVO> list = service.list(cri);
		PageMaker pm = new PageMaker(cri, service.total());
		model.addAttribute("pm",pm);
		model.addAttribute("list", list);
	}
}
