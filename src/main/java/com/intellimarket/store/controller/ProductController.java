package com.intellimarket.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.common.util.Paging;
import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.SubCategory;
import com.intellimarket.store.domain.TopCategory;
import com.intellimarket.store.service.ProductService;
import com.intellimarket.store.service.StoreCategoryService;
import com.intellimarket.store.service.SubCategoryService;

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
	@Autowired SubCategoryService subCategoryService;
	@Autowired Paging paging;
	
	/**
	 * seller가 보유한 상위 카테고리 조회
	 */
	@GetMapping("/getStoreTopList")
	@ResponseBody
	public List<TopCategory> getTopListByStoreInfoId(int storeInfoId) {
		return storeCategoryService.getTopCategoryById(storeInfoId);
	}
	
	/**
	 * seller가 보유한 하위 카테고리중 , 선택한 상위 카테고리에 해당하는 하위 카테고리 출력
	 * */
	@GetMapping("/getStoreSubList")
	@ResponseBody
	public List<SubCategory> getSubCategoryListByStoreAndTop( @RequestParam int storeInfoId, @RequestParam int topCategoryId) {
	    return subCategoryService.selectByStoreTop(storeInfoId, topCategoryId);
	}
	
	/**
	 * 상품 등록
	 * */
	@PostMapping("/regist")
	@ResponseBody
	public Map<String, Object> regist(@ModelAttribute Product product, HttpSession session, HttpServletRequest request) {
		//세션에서 login한 Seller 정보 받아오기
		Seller loginSeller = (Seller) session.getAttribute("loginSeller");
		String prefix="p";
		//product.setSeller(loginSeller);
		// 파일이 저장될 경로 지정
		String savePath = request.getServletContext().getRealPath("/resources/store/img");
		
		Map<String, Object> res = new HashMap<>();
		try {
			productService.insert(product,savePath,prefix);
			res.put("status","ok");
			res.put("msg", "상품 등록이 완료되었습니다");
		} catch (Exception e) {
			res.put("status","fail");
			res.put("msg", "상품 등록이 실패되었습니다");
			productService.remove(product, savePath,prefix);
			e.printStackTrace();
		}
		
		return res;
	}
	
}
