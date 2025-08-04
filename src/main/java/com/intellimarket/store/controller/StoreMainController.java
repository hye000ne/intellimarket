package com.intellimarket.store.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 판메자 메인 페이지 반환
	 */
	@GetMapping("/{engName}")
	public String home(@PathVariable("engName") String engName, Model model) {
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
	 * 전체 상품 카테고리를 출력
	 */
	@GetMapping("/{engName}/all")
	@ResponseBody
	public List<Product> getAll(@PathVariable("engName") String engName, Model model) {
	    StoreInfo storeInfo = new StoreInfo();
	    storeInfo.setEngName(engName);
	    storeInfo = storeInfoService.selectByName(storeInfo);
	    
	    Map<TopCategory, List<SubCategory>> groupedCategories = storeCategoryService.getAllCategory(storeInfo);
	    List<Product> products = productService.selectById(storeInfo.getSeller().getSellerId());

//	    model.addAttribute("storeInfo", storeInfo);
//	    model.addAttribute("groupedCategories", groupedCategories);
//	    model.addAttribute("products", products);
//	    model.addAttribute("contentPage", "store/intelli/main.jsp");

	    return products;
	}
	
	
	/**
	 * 탑 카테고리 상품들을 반환
	 */
	@GetMapping("/{engName}/top/{topId}")
	@ResponseBody
	public List<Product> getTop(@PathVariable("engName") String engName, @PathVariable("topId") String topId, Model model) {
		StoreInfo storeInfo = new StoreInfo();
		storeInfo.setEngName(engName);
		
		List<Product> products = productService.getTopProduct(storeInfo, topId);
		return products;
	}
	
	/**
	 * 서브 카테고리 상품들을 반환
	 */
	@GetMapping("/{engName}/sub/{subId}")
	@ResponseBody
	public List<Product> getSub(@PathVariable("engName") String engName, @PathVariable("subId") String subId, Model model) {
		StoreInfo storeInfo = new StoreInfo();
		storeInfo.setEngName(engName);
		
		List<Product> products = productService.getSubProduct(storeInfo, subId);
		
		return products;
	}
	
	/**
	 * 상품 디테일 페이지 반환
	 */
	@GetMapping("/{engName}/products/{productId}")
	public String getDetailFrag(@PathVariable("engName") String engName, @PathVariable("productId") String productId, Model model) {
		
	    model.addAttribute("contentPage", "store/intelli/detail.jsp");
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