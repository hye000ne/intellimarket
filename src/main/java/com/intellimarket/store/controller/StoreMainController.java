package com.intellimarket.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreCategory;
import com.intellimarket.store.domain.StoreInfo;
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
	@GetMapping("/")
	public String main(Model model, @RequestParam("sellerId") int sellerId, HttpSession session) {
	    // sellerId를 파라미터로 받아서 서비스 메서드 호출
		Seller seller = new Seller();
		seller.setSellerId(sellerId);
		
	    StoreInfo storeInfo = storeInfoService.selectById(seller);

	    List<StoreCategory> storeCategories = storeCategoryService.getAllCategoryById(seller);
	    List<Product> products = productService.selectById(sellerId);

	    model.addAttribute("storeInfo", storeInfo);
	    model.addAttribute("storeCategories", storeCategories);
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