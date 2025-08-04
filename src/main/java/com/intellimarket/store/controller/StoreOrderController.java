package com.intellimarket.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.intellimarket.shop.service.OrderService;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.service.ProductService;

import lombok.extern.slf4j.Slf4j;

/**
 * 주문 기능 관련 컨트롤러
 * @author 지훈
 */

@Slf4j
@Controller
@RequestMapping("/store/seller/manage/order")
public class StoreOrderController {
	@Autowired ProductService productService;
	@Autowired OrderService orderService;
	/**
	 * 판매자 주문 리스트 페이지
	 */
	@GetMapping("/list")
	public String adminProductList(Model model , HttpSession session) {
		Seller loginSeller = (Seller) session.getAttribute("loginSeller");
		StoreInfo storeInfo = productService.getStoreInfo(loginSeller);
		int storeInfoId = storeInfo.getStoreInfoId();
		model.addAttribute("list", orderService.selectByStoreInfoId(storeInfoId));
		model.addAttribute("contentPage", "store/seller/order/orderList.jsp");
		return "layout/store";
	}

	/**
	 * 판매자 주문 상세 / 수정 페이지
	 * */
	@GetMapping("/detail")
	public String memberDetailPage(@RequestParam int orderId, @RequestParam(required = false, defaultValue = "detail") String mode, Model model) {
		model.addAttribute("order", orderService.selectById(orderId));
		model.addAttribute("mode", mode); // detail, edit
		model.addAttribute("contentPage", "store/seller/order/orderDetail.jsp");
		return "layout/store";
	}
}
