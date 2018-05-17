package org.mvc.controller;

import java.util.List;

import org.mvc.domain.BoardVO;
import org.mvc.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	@GetMapping("/{bno}")
	public ResponseEntity<List<BoardVO>> replyList(@PathVariable int bno){
		
		ResponseEntity<List<BoardVO>> entity = null;
		try {
			entity = new ResponseEntity<List<BoardVO>>(service.replyList(bno), HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	
	

}
