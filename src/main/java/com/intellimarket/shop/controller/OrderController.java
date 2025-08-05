package com.intellimarket.shop.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.common.util.SessionUtil;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.domain.Order;
import com.intellimarket.shop.exception.ShopException;
import com.intellimarket.shop.service.CartService;
import com.intellimarket.shop.service.MemberService;
import com.intellimarket.shop.service.OrderService;
import com.intellimarket.store.domain.Product;
import com.intellimarket.store.service.ProductService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/shop/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping
	public String orders(@RequestParam(required = false)Integer product_id, @RequestParam(required = false)Integer quantity, Model model, HttpSession session) {
		
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/loginFailAlert.jsp", Member.Role.USER);

	    if (member == null) {
	        return "layout/shop";
	    }
		
		//결제 상품 리스트 (0 이면 장바구니에서 접근, 다른 번호일 경우 바로결제버튼을 클릭해서 접근)
		List<?> list; 
		if(product_id == 0) {
			list = cartService.selectAllByStatus(member.getMemberId());
		}else { 
			Product product = productService.select(product_id);
			list = Arrays.asList(product);
			model.addAttribute("quantity", quantity != null ? quantity : 1);
		}
		
		model.addAttribute("loginMember", member);
		model.addAttribute("list", list);
		model.addAttribute("contentPage", "shop/orders/order.jsp");
		
		return "layout/shop";
	}
	
	@PostMapping("/complete")
	@Transactional
	@ResponseBody
	 public ResponseEntity<?> complete(@RequestBody List<Order> orders, HttpSession session, Model model) {
       
		Member member = SessionUtil.getLoginMember(session, model, "shop/loginFailAlert.jsp", Member.Role.USER);

        if (member == null) {
            throw new ShopException("로그인이 필요합니다.");
        }
		
		for (Order order : orders) {
            order.setMember(member);
            
            if(orderService.insert(order) < 1) {
            	throw new ShopException("결제에 실패하였습니다.");
            }
        }
		
		return ResponseEntity.ok("결제가 완료되었습니다.");
	}
	
	/* 결제 테이블 등록 완료 이후*/
	
	@PostMapping("/success")
	public String success(@RequestParam("merchantUid") String merchantUid, @RequestParam("totalAmount") int totalAmount, Model model, HttpSession session) {
		
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/loginFailAlert.jsp", Member.Role.USER);
		
		if (member == null) {
	        return "layout/shop";
	    }
		
		List<Order> orderList = orderService.selectByMerchantUid(merchantUid, member.getMemberId());
		
		model.addAttribute("totalPrice", totalAmount);
		model.addAttribute("address", orderList.get(0).getAddress() + " " +orderList.get(0).getDetailAddress());
		model.addAttribute("memberId", member.getName());
		model.addAttribute("contentPage", "shop/orders/ordersuccess.jsp");
		return "layout/shop";
	}
	
	
}
