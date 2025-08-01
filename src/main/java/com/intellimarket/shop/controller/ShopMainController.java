package com.intellimarket.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intellimarket.admin.service.BannerService;
import com.intellimarket.common.util.CookieUtil;

/**
 * 쇼핑몰 메인/화면 이동 진입 처리
 * @author 혜원
 */
@Controller
@RequestMapping("/shop")
public class ShopMainController {
	@Autowired BannerService bannerService;
	/**
	 * 쇼핑몰 메인 페이지
	 */
	@GetMapping("/main")
	public String main(Model model) {
		model.addAttribute("bannerList", bannerService.selectByStatus("Y"));
		model.addAttribute("contentPage", "shop/main.jsp");
        return "layout/shop";
    }
	
	/**
	 * 로그인 폼 페이지
	 */
	@GetMapping("/login")
	public String loginForm(Model model, HttpServletRequest request) {
		String rememberedEmail = CookieUtil.getCookie(request, "rememberEmail");
		model.addAttribute("email", rememberedEmail);
		model.addAttribute("contentPage", "shop/member/login.jsp");
		return "layout/shop";
	}
	
	/**
	 * 회원가입 폼 페이지
	 */
	@GetMapping("/join")
	public String joinForm(Model model) {
		model.addAttribute("contentPage", "shop/member/join.jsp");
		return "layout/shop";
	}
	
	/**
	 * 비밀번호 찾기 폼 페이지
	 */
	@GetMapping("/findPw")
	public String findPwForm(Model model) {
		model.addAttribute("contentPage", "shop/member/findPw.jsp");
		return "layout/shop";
	}
}
