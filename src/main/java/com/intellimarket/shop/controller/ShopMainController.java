package com.intellimarket.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 쇼핑몰 컨트롤러
 * @author 혜원
 */
@Controller
@RequestMapping("/shop")
public class ShopMainController {
	@GetMapping("/main")
	public String main(Model model) {
		model.addAttribute("contentPage", "shop/main.jsp");
        return "layout/shop";
    }
	
	@GetMapping("/login")
	public String loginForm(Model model) {
		model.addAttribute("contentPage", "shop/login.jsp");
		return "layout/shop";
	}
	
	@GetMapping("/join")
	public String joinForm(Model model) {
		model.addAttribute("contentPage", "shop/join.jsp");
		return "layout/shop";
	}
}
