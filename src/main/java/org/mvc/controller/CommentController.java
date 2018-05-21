package org.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mvc.domain.CommentVO;
import org.mvc.service.CommentService;
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
@RequestMapping("/comment/*")
@Log4j
public class CommentController {
	
	@Setter(onMethod_= {@Autowired})
	private CommentService service;
	
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
	
	@PostMapping("/root")
	public ResponseEntity<String> rootInsert(@RequestBody CommentVO vo){
		ResponseEntity<String> entity = null;
		try {
			service.rootInsert(vo);
			entity = new ResponseEntity<String>("rsuccess", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@PostMapping("/branch")
	public ResponseEntity<String> branchInsert(@RequestBody CommentVO vo){
		ResponseEntity<String> entity = null;
		try {
			service.branchInsert(vo);
			entity = new ResponseEntity<String>("bsuccess", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@PutMapping("/delete/{cno}")
	public ResponseEntity<String> delete(@PathVariable("cno") int cno){
		ResponseEntity<String> entity = null;
		try {
			service.delete(cno);
			entity = new ResponseEntity<String>("dsuccess", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@PutMapping("/{cno}")
	public ResponseEntity<String> update(@RequestBody CommentVO vo, @PathVariable("cno") int cno){
		ResponseEntity<String> entity = null;
		try {
			vo.setCno(cno);
			service.update(vo);
			entity = new ResponseEntity<String>("usuccess", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}
	
	@GetMapping("/{cno}")
	public ResponseEntity<CommentVO> read(@PathVariable("cno") int cno){
		ResponseEntity<CommentVO> entity = null;
		try {
			entity = new ResponseEntity<CommentVO>(service.read(cno), HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); 
		}
		return entity;
	}

}
