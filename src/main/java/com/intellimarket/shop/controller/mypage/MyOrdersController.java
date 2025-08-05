package com.intellimarket.shop.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.common.util.SessionUtil;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.domain.Order;
import com.intellimarket.shop.domain.OrderStatus;
import com.intellimarket.shop.domain.SettlementRequest;
import com.intellimarket.shop.exception.ShopException;
import com.intellimarket.shop.service.OrderService;
import com.intellimarket.store.domain.Product;
import com.intellimarket.store.service.SettlementService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/mypage/myorders")
public class MyOrdersController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private SettlementService settlementService;
	
	@GetMapping
	public String showMyOrdersPage(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.USER);

	    if (member == null) {
	        return "layout/shop";
	    }
	    
	    List<Order> orderList =  orderService.selectByMemberId(member.getMemberId());
	    
		model.addAttribute("orderList", orderList);
		model.addAttribute("contentPage", "shop/mypage/myorders.jsp");
		return "layout/shop";
	}
	
	@PostMapping("/insert/settlement")
	@Transactional
	@ResponseBody
	public ResponseEntity<?> insertSettlement(@RequestBody SettlementRequest settlementRequest, HttpSession session, Model model){
		if(settlementService.insert(settlementRequest.getProduct(), settlementRequest.getPrice()) < 1) {
			throw new ShopException("정산 등록 실패");
		}
		
		return ResponseEntity.ok("정산 등록 완료");
	}
	
	@PostMapping("update/orderstatus")
	@Transactional
	@ResponseBody
	public ResponseEntity<?> updateStatus(@RequestBody SettlementRequest settlementRequest, HttpSession session, Model model){
		
		orderService.updateStatus(settlementRequest.getOrder().getOrderId(), settlementRequest.getStatus());
		
		return ResponseEntity.ok("상태 업데이트 완료"); 
	}
}
