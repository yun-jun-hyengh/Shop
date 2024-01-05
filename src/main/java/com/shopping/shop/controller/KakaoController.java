package com.shopping.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/oauth")
public class KakaoController {
	
	@ResponseBody
	@GetMapping("/kakao")
	public void getAccessToken(@RequestParam String code) {
		System.out.println("code = " + code);
	}
}
