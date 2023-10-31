package com.shopping.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@GetMapping("/noticelist")
	public String list() throws Exception {
		return "notice/noticeList";
	}
	
	@GetMapping("/noticewrite")
	public String write() throws Exception {
		return "notice/write";
	}
	
}
