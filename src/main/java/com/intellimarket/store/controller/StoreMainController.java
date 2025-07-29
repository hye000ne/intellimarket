package com.intellimarket.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreMainController {
	/**
	 * 판매자 메인 페이지
	 * */
	@GetMapping("/admin/main")
	public String main(Model model) {
		model.addAttribute("contentPage", "store/admin/adminMain.jsp");
		return "layout/store";
	}
	
	/**
	 * 판매자 상품 리스트 페이지
	 */
	@GetMapping("/admin/product/list")
	public String adminProductList(Model model) {
		model.addAttribute("contentPage","store/admin/productList.jsp");
		return "layout/store";
	}
	
	/**
	 * 판매자 상품 등록 페이지
	 */
	@GetMapping("/admin/product/regist")
	public String adminProductRegist(Model model) {
		model.addAttribute("contentPage","store/admin/productRegist.jsp");
		return "layout/store";
	}
}


