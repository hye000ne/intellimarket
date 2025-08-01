package com.intellimarket.shop.controller.mypagecontroller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intellimarket.common.util.SessionUtil;
import com.intellimarket.shop.domain.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/mypage/inquiries")
public class InquiriesController {
	
	@GetMapping
	public String showInquiriesPage(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/login.jsp", "shop/loginFailAlert.jsp");

	    if (member == null) {
	        return "layout/shop";
	    }
		
		model.addAttribute("contentPage", "shop/mypage/inquiries.jsp");
		return "layout/shop";
	}
}
