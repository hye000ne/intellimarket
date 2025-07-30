package com.intellimarket.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	
@RequestMapping("/store")
public class StoreMainController {
	
	/**
	 * 마켓 판매자용 소개 페이지
	 */
	@GetMapping("/seller")
	public String seller(Model model) {
		model.addAttribute("contentPage", "store/seller/about.jsp");
		return "layout/about";
	}
	
}