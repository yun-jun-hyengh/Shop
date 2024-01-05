package com.shopping.shop.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.shop.service.KakaoAPI;

//@RestController
@Controller
@RequestMapping("/oauth")
public class KakaoController {
	
	@Autowired
	private KakaoAPI kakao;
	
	//@ResponseBody
	@GetMapping("/kakao")
	public String getAccessToken(@RequestParam String code, HttpSession session) {
		System.out.println("code = " + code);
		
		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		if(userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}
		return "redirect:/";
	}
	
	
}
