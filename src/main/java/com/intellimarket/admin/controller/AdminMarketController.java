package com.intellimarket.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/market")
public class AdminMarketController {
	/**
	 * 배너 목록 페이지
	 */
	@GetMapping("/banner/list")
	public String bannerListPage(Model model) {
		model.addAttribute("contentPage", "admin/market/banner/list.jsp");
		return "layout/admin";
	}
	
	/**
	 * 배너 등록 페이지
	 */
	@GetMapping("/banner/regist")
	public String registBannerPage(Model model) {
		model.addAttribute("contentPage", "admin/market/banner/regist.jsp");
		return "layout/admin";
	}
	
	/**
	 * 배너 등록 처리
	 */
	@PostMapping("/banner/regist")
	public Map<String, Object> registBanner() {
		Map<String, Object> res = new HashMap<>();
		
		res.put("result", "ok");
		res.put("msg", "배너 등록되었습니다.");
		
		return res;
	}
}
