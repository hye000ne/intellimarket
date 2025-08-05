package com.intellimarket.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.intellimarket.shop.domain.Cart;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.exception.ShopException;
import com.intellimarket.shop.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@GetMapping
	public String cart(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.USER);

		if (member == null) {
			return "layout/shop";
		}
		
		List<Cart> cartList = cartService.selectAllByMemberId(member.getMemberId());

		model.addAttribute("cartList", cartList);

		model.addAttribute("contentPage", "shop/orders/cart.jsp");
		return "layout/shop";
	}
	
	@PostMapping("/insert")
	@Transactional
	@ResponseBody
	public ResponseEntity<?> insert(@RequestBody Cart cart, HttpSession session, Model model){
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.USER);

	    if (member == null) {
	        throw new ShopException("로그인이 필요합니다.");
	    }
	    
	    cart.setMember(member);
	    
	    if(cartService.insert(cart) < 1) {
	    	throw new ShopException("장바구니 등록에 실패하셨습니다.");
	    }
	    
	    return ResponseEntity.ok("장바구니가 업데이트되었습니다.");
	}
	
	@PostMapping("/update")
	@Transactional
	@ResponseBody
	public ResponseEntity<?> updateCart(@RequestBody List<Cart> cartList, HttpSession session, Model model) {
	    Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.USER);

	    if (member == null) {
	        throw new ShopException("로그인이 필요합니다.");
	    }
	    
	    for (Cart cart : cartList) {   	
	        if(cartService.updateQuantity(cart) < 1) {
	        	throw new ShopException("장바구니 업데이트에 실패하셨습니다.");
	        }
	    }

	    return ResponseEntity.ok("장바구니가 업데이트되었습니다.");
	}
	
	@ResponseBody
	@Transactional
	@PostMapping("/delete")
	public ResponseEntity<?> delete(@RequestBody List<Integer> productIds, HttpSession session, Model model) {
	    Member member = SessionUtil.getLoginMember(session, model, "shop/loginFailAlert.jsp", Member.Role.USER);
	    if (member == null) {
	        throw new ShopException("로그인이 필요합니다.");
	    }

	    if (productIds == null || productIds.isEmpty()) {
	        throw new ShopException("삭제할 상품이 없습니다.");
	    }

	    cartService.deleteByMemberIdAndProductIds(member.getMemberId(), productIds);

	    return ResponseEntity.ok("장바구니에서 삭제되었습니다.");
	}
}
