package org.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mvc.domain.ReplyVO;
import org.mvc.service.ReplyService;
import org.mvc.util.Criteria;
import org.mvc.util.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reply/*")
@Log4j
public class ReplyController {
	
	@Setter(onMethod_= {@Autowired})
	private ReplyService service;
	
	@GetMapping("/{bno}/{page}")
	public ResponseEntity<Map<String, Object>> list(@PathVariable("bno") int bno, Criteria cri){
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> map = new HashMap<>();
		
		try {
			PageMaker pm = new PageMaker(cri, service.total(bno));
			map.put("list", service.list(cri, bno));
			map.put("pm", pm);
				
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@PostMapping("")
	public ResponseEntity<String> insert(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			service.insert(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@PutMapping("/delete/{rno}")
	public ResponseEntity<String> delete(@PathVariable("rno") int rno){
		ResponseEntity<String> entity = null;
		try {
			service.delete(rno);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@PutMapping("/{rno}")
	public ResponseEntity<String> update(@RequestBody ReplyVO vo, @PathVariable("rno") int rno){
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.update(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@GetMapping("/{rno}")
	public ResponseEntity<ReplyVO> read(@PathVariable("rno") int rno){
		ResponseEntity<ReplyVO> entity = null;
		try {
			entity = new ResponseEntity<ReplyVO>(service.read(rno), HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}

}
