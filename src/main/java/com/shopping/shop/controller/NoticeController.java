package com.shopping.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.shop.service.NoticeService;
import com.shopping.shop.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/noticelist")
	public String list(Model model) throws Exception {
		model.addAttribute("list", noticeService.noticeList());
		return "notice/noticeList";
	}
	
	@GetMapping("/noticewrite")
	public String writePage() throws Exception {
		return "notice/write";
	}
	
	@PostMapping("/noticewrite")
	@ResponseBody
	public String write(NoticeVO vo) throws Exception {
		int result = noticeService.noticeInsert(vo);
		if(result == 1) {
			return "ok";
		}
		return "fail";
	}
	
	@GetMapping("/noticeRead")
	public void read(@RequestParam("bno") int bno, Model model) throws Exception {
		model.addAttribute("noticeVO", noticeService.noticeRead(bno));
	}
	
}
