package com.shopping.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.shop.service.NoticeReplyService;
import com.shopping.shop.service.NoticeService;
import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.NoticeReplyVO;
import com.shopping.shop.vo.NoticeVO;
import com.shopping.shop.vo.PagingMaker;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeReplyService noticeReplyService;
	
	@GetMapping("/noticelist")
	public String list(Model model, @ModelAttribute("fCri") FindCriteria fCri) throws Exception {
		model.addAttribute("list", noticeService.noticeList(fCri));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(fCri);
		pagingMaker.setTotalData(noticeService.noticeFindCountData(fCri));
		
		model.addAttribute("pagingMaker", pagingMaker);
		model.addAttribute("finalEndPage", pagingMaker.getFinalEndPage());
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
	public void read(@RequestParam("bno") int bno, Model model, @ModelAttribute("fCri") FindCriteria fCri) throws Exception {
		NoticeVO vo = noticeService.noticeRead(bno);
		model.addAttribute("noticeVO", noticeService.noticeRead(bno));
		noticeService.viewCount(vo.getBno());
		
		//List<NoticeReplyVO> replyList = noticeReplyService.noticeReList(bno);
		//model.addAttribute("replyList", replyList);
	}
	
	@PostMapping("/noticeDel")
	@ResponseBody
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr,
			FindCriteria fCri) throws Exception{
		//System.out.println("삭제할 게시글 번호 : " + bno);
		int result = noticeService.noticeDelete(bno);
		if(result == 1) {
			rttr.addAttribute("page", fCri.getPage());
			rttr.addAttribute("numPerPage", fCri.getNumPerPage());
			rttr.addAttribute("findType", fCri.getFindType());
			rttr.addAttribute("keyword", fCri.getKeyword());
			return "success";
		} 
		return "fali";
	}
	
	@GetMapping("/noticeModifyPage")
	public void modifyPage(@RequestParam("bno") int bno, Model model, 
			@ModelAttribute("fCri") FindCriteria fCri) throws Exception {
		model.addAttribute("noticeVO", noticeService.noticeRead(bno));
	}
	
	@PostMapping("/noticeModifyPage")
	public String modify(NoticeVO noticeVO, RedirectAttributes rttr,
			FindCriteria fCri) throws Exception {
		noticeService.noticeUpdate(noticeVO);
		
		rttr.addAttribute("page", fCri.getPage());
		rttr.addAttribute("numPerPage", fCri.getNumPerPage());
		rttr.addAttribute("findType", fCri.getFindType());
		rttr.addAttribute("keyword", fCri.getKeyword());
		rttr.addFlashAttribute("modifyResult","modSuccess");
		return "redirect:/notice/noticelist";
	}
}
