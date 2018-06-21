package org.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mvc.domain.AuthVO;
import org.mvc.domain.MemberVO;
import org.mvc.service.BoardService;
import org.mvc.service.MemberService;
import org.mvc.util.Criteria;
import org.mvc.util.ExcelRead;
import org.mvc.util.PageMaker;
import org.mvc.util.ReadOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {

	@Setter(onMethod_ = { @Autowired })
	private MemberService service;

	@Setter(onMethod_ = { @Autowired })
	private BoardService bservice;

	@Autowired
	private PasswordEncoder encoder;

	@Setter(onMethod_ = { @Autowired })
	private MemberService mservice;

	@GetMapping("/list")
	public void getlist(Criteria cri, Model model) {
		log.info("get member list by admin........");
		List<MemberVO> list = null;
		PageMaker pm = null;
		if (cri.getAuthType() == null) {
			list = service.list(cri);
			pm = new PageMaker(cri, service.total());
		} else if (cri.getAuthType() != null) {
			list = service.searchList(cri);
			pm = new PageMaker(cri, service.searchTotal(cri));
		}

		model.addAttribute("cri", cri);
		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
	}

	@PostMapping("/insert")
	public String insertMeber(MultipartFile[] uploadFile) throws Exception {

		FileOutputStream outputStream = null;

		UUID uuid = UUID.randomUUID();

		String filePath = "C:/zzz/excel/" + uuid.toString() + "_" + uploadFile[0].getOriginalFilename();
		outputStream = new FileOutputStream(new File(filePath));
		outputStream.write(uploadFile[0].getBytes());

		ReadOption ro = new ReadOption();
		ro.setFilePath(filePath);
		ro.setOutputColumns("A", "B", "C", "D");
		ro.setStartRow(2);
		ExcelRead excelRead = new ExcelRead();
		List<Map<String, String>> result = excelRead.read(ro);
		MemberVO vo = new MemberVO();
		AuthVO avo = new AuthVO();
		for (Map<String, String> map : result) {
			if (!map.get("A").isEmpty()) {
				vo.setMname(map.get("A"));
				vo.setMid(map.get("B"));
				vo.setMpw(encoder.encode(map.get("C")));
				vo.setEmail(map.get("D"));

				avo.setMid(map.get("B"));
				avo.setAuth("ROLE_MEMBER");

				mservice.insertMember(vo, avo);
			}
		}
		outputStream.close();
		return "redirect:/admin/list";
	}
}
