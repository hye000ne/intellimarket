package com.intellimarket.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.intellimarket.admin.domain.Banner;
import com.intellimarket.admin.domain.Banner.BannerStatus;
import com.intellimarket.admin.exception.AdminException;
import com.intellimarket.admin.service.BannerService;


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
	@ResponseBody
	public Map<String, Object> registBanner(@ModelAttribute Banner banner, HttpServletRequest request) {
		// 파일 저장 경로
		String savePath = request.getServletContext().getRealPath("/resources/common/img/banner");
		
		Map<String, Object> res = new HashMap<>();
		bannerService.regist(banner, savePath);
		
		res.put("status", "ok");
		res.put("msg", "배너가 등록되었습니다.");
		
		return res;
	}

	/**
	 * 배너 상태 변경 처리
	 */
	@GetMapping("/banner/updateBannerStatus")
	public String updateBannerStatus(
			@RequestParam int bannerId,
			@RequestParam BannerStatus status,
			RedirectAttributes redirectAttr) {
		try {
			bannerService.updateBannerStatus(bannerId, status);
			redirectAttr.addFlashAttribute("msg", "배너 상태 변경이 완료되었습니다.");
		} catch (AdminException e) {
			redirectAttr.addFlashAttribute("msg", e.getMessage());
		}
		return "redirect:/admin/market/banner/list";
	}
	
	/**
	 * 배너 삭제 처리
	 */
	@GetMapping("/banner/delete")
	public String deleteBanner(int bannerId, HttpServletRequest request, RedirectAttributes redirectAttr) {
		try {
			String savePath = request.getServletContext().getRealPath("/resources/common/img/banner");
			bannerService.deleteBanner(bannerId, savePath);
			redirectAttr.addFlashAttribute("msg", "배너 삭제가 완료되었습니다.");
		} catch (AdminException e) {
			redirectAttr.addFlashAttribute("msg", e.getMessage());
		}
		return "redirect:/admin/market/banner/list";
	}
	
	@ExceptionHandler(AdminException.class)
	@ResponseBody
	public Map<String, Object> handleShopException(AdminException e) {
	    Map<String, Object> res = new HashMap<>();
	    res.put("status", "fail");
	    res.put("msg", e.getMessage());
	    return res;
	}
}
