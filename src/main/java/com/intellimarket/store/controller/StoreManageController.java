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
	 * 판매자 상품 리스트 페이지
	 */
	@GetMapping("/productList")
	public String adminProductList(Model model) {
		
		int sellerId = 4; // 예시: 로그인된 seller의 ID (실제로는 세션에서 꺼내야 함)
		int storeInfoId = 1;

		List<TopCategory> topList = storeCategoryService.getTopCategoriesByStoreInfoId(storeInfoId);

		// <TopCategory, List<Product>> 형태로 묶어서 전달
		Map<TopCategory, List<Product>> productMap = new LinkedHashMap<>();

		for (TopCategory top : topList) {
			List<Product> list = productService.selectBySellerIdAndTCId(sellerId, top.getTopCategoryId());
			productMap.put(top, list);
		}

		model.addAttribute("productMap", productMap);
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
