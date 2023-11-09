package com.shopping.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shopping.shop.service.NoticeReplyService;
import com.shopping.shop.vo.NoticeReplyVO;

@RestController
@RequestMapping("/replies")
public class NoticeReplyController {
	
	@Autowired
	private NoticeReplyService noticeReplyService;
	
	@PostMapping("")
	public ResponseEntity<String> input(@RequestBody NoticeReplyVO vo) {
		ResponseEntity<String> resEntity = null;
		try {
			noticeReplyService.noticeReWrite(vo);
			resEntity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	// https://dev-gorany.tistory.com/16
	@GetMapping("/selectAll/{bno}")
	public ResponseEntity<List<NoticeReplyVO>> list(@PathVariable("bno") int bno) {
		ResponseEntity<List<NoticeReplyVO>> resEntity = null;
		try {
			resEntity = new ResponseEntity<List<NoticeReplyVO>>(noticeReplyService.noticeReList(bno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<List<NoticeReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	
	
}
