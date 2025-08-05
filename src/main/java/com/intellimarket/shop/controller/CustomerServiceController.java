package com.intellimarket.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/customerservice")
public class CustomerServiceController {

	@GetMapping("/faq")
	public String faq(Model model) {
		
		model.addAttribute("contentPage", "shop/customerservice/faq.jsp");
		return "layout/shop";
	}
	
	@GetMapping("/information")
public String information(Model model) {
		
		model.addAttribute("contentPage", "shop/customerservice/information.jsp");
		return "layout/shop";
	}
}
