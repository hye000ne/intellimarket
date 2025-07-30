package com.intellimarket.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.intellimarket.store.domain.SellerStatus;
import com.intellimarket.store.service.SellerService;


/**
 * 관리자 판매자 기능 관련 컨트롤러
 * @author 혜원
 */
@Controller
@RequestMapping("/admin/seller")
public class AdminSellerController {
	@Autowired SellerService sellerService;
	/**
	 * 판매자 가입 승인 페이지
	 */
	@GetMapping("/approval")
	public String approvalPage(Model model) {
		SellerStatus status = SellerStatus.valueOf("PENDING");
		model.addAttribute("list", sellerService.selectByStatus(status));
		model.addAttribute("contentPage", "admin/seller/approval.jsp");
		return "layout/admin";
	}
	
	/**
	 * 판매자 상태 변경
	 */
	@PostMapping("/changeSellerStatus")
	public String changeSellerStatus(@RequestParam int sellerId, @RequestParam SellerStatus status, @RequestParam(required = false) String msg) {
		    //sellerStatus = SellerStatus.valueOf(status);
		return "redirect:/admin/seller/approval";
	}
	
	/**
	 * 판매자 목록 페이지
	 */
	@GetMapping("/list")
	public String sellerListPage(Model model) {
		model.addAttribute("contentPage", "admin/seller/list.jsp");
		return "layout/admin";
	}
	
	/**
	 * 판매자 상세 페이지 
	 */
	@GetMapping("/detail")
	public String sellerDetailPage(@RequestParam int sellerId, @RequestParam(required = false, defaultValue = "detail") String mode, Model model) {
		model.addAttribute("mode", mode); // detail, edit
		model.addAttribute("contentPage", "admin/seller/detail.jsp");
		return "layout/admin";
	}
}
