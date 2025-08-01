package com.intellimarket.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intellimarket.store.service.ProductService;

import lombok.extern.slf4j.Slf4j;
	
@Slf4j
@Controller
@RequestMapping("/store/seller/manage")
public class StoreManageController {
	@Autowired ProductService productService;


	/**
	 * 판매자 메인 페이지
	 */
	@GetMapping("")
	public String manage(Model model) {
		model.addAttribute("contentPage", "store/seller/adminMain.jsp");
		return "layout/store";
	}

	/**
	 * 판매자 상품 리스트 페이지
	 */
	@GetMapping("/productList")
	public String adminProductList(Model model) {
		
		model.addAttribute("contentPage", "store/seller/productList.jsp");
		return "layout/store";
	}

	/**
	 * 판매자 상품 등록 페이지
	 */
	@GetMapping("/productRegist")
	public String adminProductRegist(Model model) {
		model.addAttribute("contentPage", "store/seller/productRegist.jsp");
		return "layout/store";
	}
	
	
}
