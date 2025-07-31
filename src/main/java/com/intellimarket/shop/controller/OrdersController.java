package com.intellimarket.shop.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.shop.domain.Cart;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.domain.Orders;
import com.intellimarket.shop.service.CartService;
import com.intellimarket.shop.service.MemberService;
import com.intellimarket.shop.service.OrdersService;
import com.intellimarket.store.service.ProductService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/shop/orders")
public class OrdersController {
	
	@Autowired
	private OrdersService paymentService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping
	public String orders(@RequestParam(required = false)Integer product_id, Model model, HttpSession session) {
		
		// 로그인 사용자 세션 확인
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member == null) {
			model.addAttribute("contentPage", "shop/login.jsp");
			return "layout/shop";
		}
		
		log.debug(member.getName());
		log.debug(member.getEmail());
		log.debug(member.getPhone());
		log.debug(""+member.getZipCode());
		log.debug(member.getAddress());
		log.debug(member.getDetailAddress());
		
		//결제 상품 리스트 (0 이면 장바구니에서 접근, 다른 번호일 경우 바로결제버튼을 클릭해서 접근)
		List<?> list; 
		if(product_id == 0) { 
			list = cartService.selectAllByMemberId(member.getMemberId());
		}else { 
			list = Arrays.asList(productService.select(product_id));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("contentPage", "shop/orders.jsp");
		
		return "layout/shop";
	}
	
	@PostMapping("/complete")
	@ResponseBody
	public String complete(@RequestBody Orders payment, Model model) {
		String impUid = payment.getImpUid();
		String merchantUid = payment.getMerchantUid();
		String name = payment.getName();
		
		log.debug("impUid : " + impUid);
		log.debug("merchantUid : " + merchantUid);
		log.debug("name : " + name);
		
		model.addAttribute("contentPage", "shop/main.jsp");
		
		return "layout/shop";
	}
	
	
}
