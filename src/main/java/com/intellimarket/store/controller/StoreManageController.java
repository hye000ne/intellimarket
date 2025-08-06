package com.intellimarket.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.service.ProductService;
import com.intellimarket.store.service.SellerService;
import com.intellimarket.store.service.StoreInfoService;

import lombok.extern.slf4j.Slf4j;
	
@Slf4j
@Controller
@RequestMapping("/store/seller/manage")
public class StoreManageController {
	@Autowired ProductService productService;
	@Autowired SellerService sellerService;
	@Autowired StoreInfoService storeInfoService;
	/**
	 * 판매자 메인 페이지
	 */
	@GetMapping
	public String manage(Model model, HttpSession session, RedirectAttributes redirectAttrs) {
	    Seller loginSeller = (Seller) session.getAttribute("loginSeller");
	    if (loginSeller == null) {
	        redirectAttrs.addFlashAttribute("msg", "로그인이 필요합니다");
	        return "redirect:/store/seller/login";
	    }
	    
	    StoreInfo storeInfo = storeInfoService.selectById(loginSeller);
	    
	    if(storeInfo.getEngName()==null) {
	    	model.addAttribute("contentPage", "store/seller/storeinfo.jsp");
	    } else {
	    	model.addAttribute("list", productService.selectById(loginSeller.getSellerId()));
	    	model.addAttribute("contentPage", "store/seller/product/productList.jsp");
	    }
	    
	    session.setAttribute("loginSeller", sellerService.selectById(loginSeller.getSellerId()));
	    session.setAttribute("loginStoreInfo", storeInfo);
	    return "layout/store";
	}

}
