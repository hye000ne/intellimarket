package com.intellimarket.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String main(Model model) {
		model.addAttribute("contentPage", "admin/main.jsp");
		return "layout/admin";
	}
}
