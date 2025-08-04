package com.intellimarket.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intellimarket.common.util.SessionUtil;
import com.intellimarket.shop.domain.Member;

/**
 * 쇼핑몰 관리자 메인/화면 이동 진입 처리
 * @author 혜원
 */
@Controller
@RequestMapping("/admin")
public class AdminMainController {
	/**
	 * 쇼핑몰 관리자 메인 페이지 
	 */
	@GetMapping("/main")
	public String main(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
		if (member == null) return "layout/shop";
		
		model.addAttribute("contentPage", "admin/main.jsp");
		return "layout/admin";
	}
}
