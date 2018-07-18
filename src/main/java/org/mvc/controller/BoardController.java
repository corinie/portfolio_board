package org.mvc.controller;


import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.service.BoardService;
import org.mvc.service.FileService;
import org.mvc.util.Criteria;
import org.mvc.util.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
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
	@Setter(onMethod_={@Autowired})	
	private FileService fservice;
	
	
	//CRUD
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/register")
	public void insert(Model model) {
		log.info("get insert");
		
		
			
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String insertPost(BoardVO vo, String[] uuid, RedirectAttributes rattr) {
		log.info("post insert");
		service.rootInsert(vo, uuid);
		rattr.addFlashAttribute("message", "0");
		
		return "redirect:/board/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/replyregister")
	public void branchInsert(int bno, Model model) {
		log.info("get branchinsert");
		
		model.addAttribute("vo", service.read(bno));
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/replyregister")
	public String branchInsertPost(BoardVO vo, RedirectAttributes rattr, String[] uuid) {
		log.info("post branchinsert");
		
		service.branchInsert(vo, vo.getBno(), uuid);
		rattr.addFlashAttribute("message", "brsuccess");
		
		return "redirect:/board/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/view")
	public void read(int bno, Authentication authentication, Criteria cri, Model model) {
		log.info("get view");
		UserDetails user = (UserDetails)authentication.getPrincipal();
		model.addAttribute("rootWriter", service.rootWriter(bno));
		model.addAttribute("vo", service.read(bno));
		model.addAttribute("fileList", fservice.listFile(bno));
		model.addAttribute("cri", cri);
		model.addAttribute("user", user);
		
//		boolean projectManager = 
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/update")
	public void update(int bno, Model model) {
		log.info("get update");
		
		model.addAttribute("vo", service.read(bno));
		model.addAttribute("fileList", fservice.listFile(bno));
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/update")
	public String updatePost(BoardVO vo, String type, String keyword, int page, String[] uuid, RedirectAttributes rattr) {
		log.info("post update");
		
		service.update(vo, uuid);	
		rattr.addFlashAttribute("message", "2");
		if(type == null) {
			return "redirect:/board/list?page="+page;
		}else {
			return "redirect:/board/list?page="+page+"&type="+type+"&keyword="+keyword;
		}
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/statusupdate")
	public String statusUpdate(int bno, String status) {
		service.allStatus(bno, status);
		return "redirect:/board/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/delete")
	public String delete(int bno, int pbno, RedirectAttributes rattr) {
		log.info("post delete");
		service.delete(bno, pbno);
		rattr.addFlashAttribute("message", "1");
		return "redirect:/board/list";
	}

	//LIST, SEARCH	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		List<BoardVO> list = null;
		PageMaker pm = null;
		log.info("+++++++++++++++++++++++++"+cri.getStatus());
		if(cri.getType() == null) {
			list = service.list(cri);
			pm = new PageMaker(cri, service.total(cri.getStatus()));
		}
		else if(cri.getType() != null) {
			list = service.searchList(cri);
			pm = new PageMaker(cri, service.searchTotal(cri));
		}

		model.addAttribute("cri",cri);
		model.addAttribute("pm", pm);
		model.addAttribute("list", list); 
		
		log.info(list);
		
	}
	
	@GetMapping("/about")
	public void about() {
		log.info("get dev......");
	}
	
	@GetMapping("/dev")
	public void dev() {
		log.info("get dev......");
	}
	
	@GetMapping("/skills")
	public void skills() {
		log.info("get skills......");
	}
}
