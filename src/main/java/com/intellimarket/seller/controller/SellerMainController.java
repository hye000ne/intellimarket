package com.intellimarket.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 판매자 기능 관련 컨트롤러
 * @author 지훈
 */
@Slf4j
@Controller
@RequestMapping("/seller")
public class SellerMainController {
	/**
	 * 판매자 관리 메인 페이지
	 * */
	@GetMapping("/admin/main")
	public String adminMain(Model model) {
		model.addAttribute("contentPage", "seller/main.jsp");
		return "layout/seller";
	}
	
	/**
	 * 판매자 상품 리스트 페이지
	 */
	@GetMapping("/admin/product/list")
	public String adminProductList(Model model) {
		model.addAttribute("contentPage","seller/productList.jsp");
		return "layout/seller";
	}
	
	/**
	 * 판매자 상품 등록 페이지
	 */
	@GetMapping("/admin/product/regist")
	public String adminProductRegist(Model model) {
		model.addAttribute("contentPage","seller/productRegist.jsp");
		return "layout/seller";
	}
}
