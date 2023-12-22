package com.shopping.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.shopping.shop.service.AdminService;
import com.shopping.shop.service.VisitCountService;
import com.shopping.shop.vo.CateVO;
import com.shopping.shop.vo.FindCriteria;
import com.shopping.shop.vo.MemberVO;
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
		int todayTotalUserCount = adminService.getTodayMember();
		model.addAttribute("totalUser", totalUser);
		//model.addAttribute("userCount", sessionCount.getActiveSessions());
		model.addAttribute("list", adminService.memberList());
		model.addAttribute("todayTotalUserCount", todayTotalUserCount);
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
	public String memberlist(@ModelAttribute("fcri") FindCriteria fcri, Model model) throws Exception {
		//model.addAttribute("list", adminService.memberCriteria(fcri));
		model.addAttribute("list", adminService.allMemberList(fcri));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(fcri);
		
		pagingMaker.setTotalData(adminService.findMemberCountData(fcri));
		model.addAttribute("pagingMaker", pagingMaker);
		model.addAttribute("finalEndPage", pagingMaker.getFinalEndPage());
		return "admin/memberList";
	}
	
	// 회원 권한 수정 
	@PostMapping("/roleModify")
	@ResponseBody
	public int roleMod(HttpServletRequest request) throws Exception {
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		int adminCk = Integer.parseInt(request.getParameter("adminCk"));
		System.out.println(memberNum);
		System.out.println(adminCk);
		String changeNum = Integer.toString(memberNum);
		String changeCk = Integer.toString(adminCk);
		
		if(!changeNum.equals("") && !changeCk.equals("")) {
			HashMap<String, Object> list = new HashMap<String, Object>();
			list.put("memberNum", memberNum);
			list.put("adminCk", adminCk);
			adminService.gradeUpdate(list);
			return 1;
		}
		return 0;
	}
	
	// 회원 엑셀 다운로드
	@PostMapping("/excelDown")
	@ResponseBody
	public void excelDown(@ModelAttribute MemberVO memberVO,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		adminService.excelDown(memberVO, response);
	}
	
	@GetMapping("/weekJoin")
	public @ResponseBody String week() throws Exception {
		Gson gson = new Gson();
		return gson.toJson(adminService.getWeekMember());
	}
	
	// 카테고리 등록 페이지 
	@GetMapping("/cateRegister")
	public String cateRegister(Model model) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		List<CateVO> list = adminService.cateList();
		String cateList = obj.writeValueAsString(list);
		model.addAttribute("cateList", cateList);
		//System.out.println("데이뚠 데이터 : " + cateList);
		return "admin/cateRegister";
	}
	
	@PostMapping("/cate1")
	@ResponseBody
	public String cate1(CateVO catevo) throws Exception {
		int tier = catevo.getTier();
		String cateName = catevo.getCateName();
		System.out.println(tier);
		System.out.println(cateName);
		return "success";
	}
	
	@PostMapping("/cate2")
	@ResponseBody
	public String cate2(CateVO catevo) throws Exception {
		int tier = catevo.getTier();
		String cateName = catevo.getCateName();
		String cateParent1 = catevo.getCateParent1();
		System.out.println(tier);
		System.out.println(cateName);
		System.out.println(cateParent1);
		return "success";
	}
	
	@PostMapping("/cate3")
	@ResponseBody
	public String cate3(CateVO catevo) throws Exception {
		
		return "";
	}
}
