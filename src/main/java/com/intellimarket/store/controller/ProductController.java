package com.intellimarket.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.intellimarket.common.util.Paging;
import com.intellimarket.store.domain.Product;
import com.intellimarket.store.service.ProductService;
import com.intellimarket.store.service.StoreCategoryService;

import lombok.extern.slf4j.Slf4j;

/**
 * 상품 기능 관련 컨트롤러
 * @author 지훈
 */

@Slf4j
@Controller
@RequestMapping("/store/seller/manage/product")
public class ProductController {
	@Autowired ProductService productService;
	@Autowired StoreCategoryService storeCategoryService;
	@Autowired Paging paging;
	
	/**
	 * seller가 보유한 상위 카테고리 조회
	 */
	@GetMapping("/getList")

	public ModelAndView getList(HttpServletRequest request) {
		List productList = productService.selectBySellerId();
		paging.init(productList,request);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("topList",topList);
		
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
		
		return mav;
	}
	
	@PostMapping("/regist")
	@ResponseBody
	public Map<String, Object> regist(@ModelAttribute Product product) {
		productService.insert(product);
		Map<String, Object> res = new HashMap<>();
		res.put("status","ok");
		res.put("msg", "상품 등록이 완료되었습니다");
		return res;
	}
	
}
