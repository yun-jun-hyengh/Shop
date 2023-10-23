package com.shopping.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopping.shop.service.AdminService;
import com.shopping.shop.service.VisitCountService;
import com.shopping.shop.vo.PageCriteria;
import com.shopping.shop.vo.PagingMaker;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private VisitCountService visitCountService;
	
	// 관리자 페이지 입장 
	@GetMapping("/adminMain")
	public String adminMain(Model model) throws Exception {
		int totalUser = adminService.getTotalMember();
		model.addAttribute("totalUser", totalUser);
		//model.addAttribute("userCount", sessionCount.getActiveSessions());
		model.addAttribute("list", adminService.memberList());
		return "admin/main";
	}
	
	// 방문자 정보 
	@GetMapping("/visitlist")
	public String visitlist(PageCriteria cria, Model model) throws Exception {
		model.addAttribute("list", visitCountService.listCriteria(cria));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(cria);
		pagingMaker.setTotalData(visitCountService.listCountData(cria));
		model.addAttribute("pagingMaker", pagingMaker);
		model.addAttribute("finalEndPage", pagingMaker.getFinalEndPage());
		return "admin/visitList";
	}
	
	// 회원 리스트
	@GetMapping("/memberlist")
	public String memberlist() throws Exception {
		return "admin/memberList";
	}
	
}
