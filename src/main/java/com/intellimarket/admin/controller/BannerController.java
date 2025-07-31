package com.intellimarket.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.admin.domain.Banner;
import com.intellimarket.admin.exception.AdminException;
import com.intellimarket.admin.service.BannerService;
import com.intellimarket.shop.exception.ShopException;


@Controller
@RequestMapping("/admin/market")
public class BannerController {
	@Autowired BannerService bannerService;
	/**
	 * 배너 목록 페이지
	 */
	@GetMapping("/banner/list")
	public String bannerListPage(Model model) {
		model.addAttribute("list", bannerService.selectAll());
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
	public Map<String, Object> registBanner(Banner banner) {
		Map<String, Object> res = new HashMap<>();
		bannerService.regist(banner);
		res.put("result", "ok");
		res.put("msg", "배너 등록되었습니다.");
		
		return res;
	}
	
	/**
	 * 배너 삭제 처리
	 */
	@GetMapping("/banner/delete")
	public Map<String, Object> deleteBanner(int bannerId) {
		Map<String, Object> res = new HashMap<>();
		bannerService.deleteBanner(bannerId);
		res.put("result", "ok");
		res.put("msg", "배너 삭제되었습니다.");
		
		return res;
	}
	
	@ExceptionHandler(ShopException.class)
	@ResponseBody
	public Map<String, Object> handleShopException(AdminException e) {
	    Map<String, Object> res = new HashMap<>();
	    res.put("status", "fail");
	    res.put("msg", e.getMessage());
	    return res;
	}
}
