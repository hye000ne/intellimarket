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

import lombok.extern.slf4j.Slf4j;

/**
 * 상품 기능 관련 컨트롤러
 * @author 지훈
 */

@Slf4j
@Controller
@RequestMapping("/store/admin/product")
public class ProductController {
	@Autowired ProductService productService;
	@Autowired Paging paging;
	
	/**
	 * seller가 보유한 상품 조회
	 */
	@GetMapping("/list")
	public ModelAndView getList(HttpServletRequest request) {
		List productList = productService.selectBySellerId();
		paging.init(productList,request);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("productList",productList);
		mav.addObject("paging",paging);
		
		mav.setViewName("store/admin/productList");
		return mav;
	}
	
}
