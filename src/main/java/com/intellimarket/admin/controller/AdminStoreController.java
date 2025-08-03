package com.intellimarket.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intellimarket.common.util.SessionUtil;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.store.service.StoreInfoService;

/**
 * 관리자 스토어 기능 관련 컨트롤러
 * @author 혜원
 */
@Controller
@RequestMapping("/admin/store")
public class AdminStoreController {
	@Autowired StoreInfoService storeInfoService;
	/**
	 * 스토어 목록 페이지
	 */
	@GetMapping("/list")
	public String memberListPage(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
		if (member == null) return "layout/shop";
		
		model.addAttribute("list", storeInfoService.selectAll());
		model.addAttribute("contentPage", "admin/store/list.jsp");
		model.addAttribute("menuGroup", "store");
		model.addAttribute("subMenu", "storeList");
		return "layout/admin";
	}
	
	/**
	 * 스토어 상세 페이지 
	 */
//	@GetMapping("/detail")
//	public String memberDetailPage(@RequestParam int sellerId, Model model, HttpSession session) {
//		// 로그인 사용자 세션 확인
//		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
//		if (member == null) return "layout/shop";.3
	
//		Seller seller = new Seller();
//		seller.setSellerId(sellerId);
//		
//		model.addAttribute("store", storeInfoService.selectById(seller));
//		model.addAttribute("contentPage", "admin/store/detail.jsp");
//		model.addAttribute("menuGroup", "store");
//		model.addAttribute("subMenu", "storeList");
//		return "layout/admin";
//	}
}