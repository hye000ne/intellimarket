package com.intellimarket.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/cart")
public class CartController {
	@GetMapping
	public String cart(Model model) {
		model.addAttribute("contentPage", "shop/cart.jsp");
		return "layout/shop";
	}
}
