package com.intellimarket.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.intellimarket.shop.service.MemberService;

/**
 * 관리자 회원 기능 관련 컨트롤러
 * @author 혜원
 */
@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	@Autowired MemberService memberService;
	/**
	 * 회원 목록 페이지
	 */
	@GetMapping("/list")
	public String memberListPage(Model model) {
		model.addAttribute("list", memberService.selectAll());
		model.addAttribute("contentPage", "admin/member/list.jsp");
		return "layout/admin";
	}
	
	/**
	 * 회원 상세 페이지 
	 */
	@GetMapping("/detail")
	public String memberDetailPage(@RequestParam int memberId, @RequestParam(required = false, defaultValue = "detail") String mode, Model model) {
		model.addAttribute("member", memberService.selectById(memberId));
		model.addAttribute("mode", mode); // detail, edit
		model.addAttribute("contentPage", "admin/member/detail.jsp");
		return "layout/admin";
	}
	
	/**
	 * 회원 등록 페이지 
	 */
	@GetMapping("/join")
	public String memberJoinForm(Model model) {
		model.addAttribute("contentPage", "admin/member/join.jsp");
		return "layout/admin";
	}
	
}
