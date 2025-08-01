package com.intellimarket.store.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.TopCategory;
import com.intellimarket.store.service.ProductService;
import com.intellimarket.store.service.StoreCategoryService;

@Controller
@RequestMapping("/store/seller/manage")
public class StoreManageController {
	@Autowired ProductService productService;
	@Autowired StoreCategoryService storeCategoryService;
	
	/**
	 * 판매자 메인 페이지
	 */
	@GetMapping("")
	public String manage(Model model) {
		model.addAttribute("contentPage", "store/seller/adminMain.jsp");
		return "layout/store";
	}
	
	/**
	 * 스토어 정보 관리 페이지(커스텀마이징)
	 */
	@GetMapping("/editstore")
	public String editstore(Model model) {
		model.addAttribute("contentPage", "store/seller/editStore.jsp");
		return "layout/store";
	}
}
