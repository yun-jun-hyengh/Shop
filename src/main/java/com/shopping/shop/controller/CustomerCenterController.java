package com.shopping.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/center")
public class CustomerCenterController {
	
	@GetMapping("/centerList")
	public String centerList() {
		return "center/centerList";
	}
}
