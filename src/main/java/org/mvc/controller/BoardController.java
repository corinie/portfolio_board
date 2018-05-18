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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_={@Autowired})	
	private BoardService service;
	
	//CRUD
	@GetMapping("/register")
	public void insert() {
		log.info("get insert");
		
	}
	
	@PostMapping("/register")
	public String insertPost(BoardVO vo, RedirectAttributes rattr) {
		log.info("post insert");
		service.rootInsert(vo);
		rattr.addFlashAttribute("message", "rsuccess");
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/replyregister")
	public void branchInsert(int bno, Model model) {
		log.info("get branchinsert");
		
		model.addAttribute("vo", service.read(bno));
	}
	
	@PostMapping("/replyregister")
	public String branchInsertPost(BoardVO vo, RedirectAttributes rattr) {
		log.info("post branchinsert");
		
		service.branchInsert(vo, vo.getBno());
		rattr.addFlashAttribute("message", "brsuccess");
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/view")
	public void read(int bno, Criteria cri, Model model) {
		log.info("get view");
		
		model.addAttribute("vo", service.read(bno));
		model.addAttribute("cri", cri);
	}
	
	
	@GetMapping("/update")
	public void update(int bno, Model model) {
		log.info("get update");
		
		model.addAttribute("vo", service.read(bno));
	}
	
	@PostMapping("/update")
	public String updatePost(BoardVO vo, String type, String keyword, int page, RedirectAttributes rattr) {
		log.info("post update");
		service.update(vo);	
		rattr.addFlashAttribute("message", "usuccess");
		if(type == null) {
			return "redirect:/board/list?page="+page;
		}else {
			return "redirect:/board/list?page="+page+"&type="+type+"&keyword="+keyword;
		}
	}
	
	
	@PostMapping("/delete")
	public String delete(int bno, int pbno, RedirectAttributes rattr) {
		log.info("post delete");
		service.delete(bno, pbno);
		rattr.addFlashAttribute("message", "dsuccess");
		return "redirect:/board/list";
	}
	
	//LIST, SEARCH
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		List<BoardVO> list = null;
		PageMaker pm = null;
		if(cri.getType() == null) {
			list = service.list(cri);
			pm = new PageMaker(cri, service.total());
		}
		else if(cri.getType() != null) {
			list = service.searchList(cri);
			pm = new PageMaker(cri, service.searchTotal(cri));
		}
		model.addAttribute("cri",cri);
		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
	}
}
