package com.intellimarket.store.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.domain.SubCategory;
import com.intellimarket.store.domain.TopCategory;
import com.intellimarket.store.service.ProductService;
import com.intellimarket.store.service.StoreCategoryService;
import com.intellimarket.store.service.StoreInfoService;

@Controller	
@RequestMapping("/store")
public class StoreMainController {
	
	@Autowired
	StoreInfoService storeInfoService;
	
	@Autowired
	StoreCategoryService storeCategoryService;

	@Autowired
	ProductService productService;

	/**
	 * 쇼핑몰 메인 페이지
	 */
	@GetMapping("/{engName}")
	public String main(@PathVariable("engName") String engName, Model model) {
	    StoreInfo storeInfo = new StoreInfo();
	    storeInfo.setEngName(engName);
	    storeInfo = storeInfoService.selectByName(storeInfo);
	    
	    Map<TopCategory, List<SubCategory>> groupedCategories = storeCategoryService.getAllCategory(storeInfo);
	    List<Product> products = productService.selectById(storeInfo.getSeller().getSellerId());

	    model.addAttribute("storeInfo", storeInfo);
	    model.addAttribute("groupedCategories", groupedCategories);
	    model.addAttribute("products", products);
	    model.addAttribute("contentPage", "store/intelli/main.jsp");

	    return "layout/intelliStore";
	}
	
	
	/**
	 * 마켓 판매자용 소개 페이지
	 */
	@GetMapping("/seller")
	public String seller(Model model) {
		model.addAttribute("contentPage", "store/seller/about.jsp");
		return "layout/about";
	}
	
}