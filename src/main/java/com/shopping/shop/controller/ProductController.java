package com.shopping.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@GetMapping("/productRegister")
	public String productRegister() {
		return "product/productRegister";
	}
}
