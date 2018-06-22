package org.mvc.controller;

import java.util.List;



import org.mvc.domain.MemberVO;
import org.mvc.service.MemberService;
import org.mvc.util.Criteria;
import org.mvc.util.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import lombok.Setter;
import lombok.extern.log4j.Log4j;



@Controller
@RequestMapping("/admin/*")
@Log4j
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {

	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
	
	@GetMapping("/list")
	public void getlist(Criteria cri,Model model) {
		log.info("get member list by admin........");
		List<MemberVO> list = null;
		PageMaker pm = null;
		if(cri.getAuthType() == null) {
			list = service.list(cri);
			pm = new PageMaker(cri, service.total());
		}
		else if(cri.getAuthType() != null) {
			list = service.searchList(cri);
			pm = new PageMaker(cri, service.searchTotal(cri));
		}
				
		model.addAttribute("cri",cri);
		model.addAttribute("pm", pm);
		model.addAttribute("list", list); 
			
	}
	
	
	@PostMapping("/authChange")
	public String authChange(String[] mid, Criteria cri, String keyword, RedirectAttributes rattr) {
		log.info("post authChange.....");

		for(int i = 0; i < mid.length; i++) {
			service.deleteAuth(mid[i]);
			service.changeAuth(mid[i],cri);
		}
			
		
		rattr.addFlashAttribute("message", "2");
		
		
		if(cri.getAuthType() == null) {
			return "redirect:/admin/list";
		}else {
			return "redirect:/admin/list?authType="+cri.getAuthType().split("")[0]+"&keyword";
		}
		
		
	}
}
