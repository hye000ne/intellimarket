package com.intellimarket.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreMainController {
	
	@GetMapping("/main")
	public String main(Model model) {
		model.addAttribute("contentPage", "store/main.jsp");
		return "layout/store";
	}
}


