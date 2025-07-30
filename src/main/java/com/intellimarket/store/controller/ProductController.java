package com.intellimarket.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.intellimarket.common.util.Paging;
import com.intellimarket.store.service.ProductService;
import com.intellimarket.store.service.StoreCategoryService;

import lombok.extern.slf4j.Slf4j;

/**
 * 상품 기능 관련 컨트롤러
 * @author 지훈
 */

@Slf4j
@Controller
@RequestMapping("/store/seller/product")
public class ProductController {
	@Autowired ProductService productService;
	@Autowired StoreCategoryService storeCategoryService;
	@Autowired Paging paging;
	
	/**
	 * seller가 보유한 상품 조회
	 */
	@GetMapping("/getList")
	public ModelAndView getProductListBySellerId(int sellerId,HttpServletRequest request) {
		List productList = productService.selectBySellerId(sellerId);
		paging.init(productList,request);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("productList",productList);
		mav.addObject("paging",paging);
		
		mav.setViewName("store/admin/productList");
		return mav;
	}
	
	/**
	 * seller가 보유한 상위 카테고리 조회
	 */
	@GetMapping("/getTopList")
	public ModelAndView getTopListByStoreInfoId(int storeInfoId) {
		List topList = storeCategoryService.getTopCategoriesByStoreInfoId(storeInfoId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("topList",topList);
		
		mav.setViewName("store/admin/productList");
		return mav;
	}
	
	/**
	 * seller가 보유한 모든 하위 카테고리 조회
	 * */
	@GetMapping("/getSubList")
	public ModelAndView getSubListByStoreInfoId(int StoreInfoId) {
		List subList = storeCategoryService.selectByStoreInfoId(StoreInfoId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subList",subList);
		
		mav.setViewName("store/admin/productList");
		return mav;
	}
}
