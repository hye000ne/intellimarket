package com.intellimarket.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/member")
public class MemberController {
	@Autowired MemberService memberService;
	
	@PostMapping("/join")
	public String join(@ModelAttribute Member member, Model model) {
		// 유효성 검사
		// 패스워드 암호화
		// service 호출
		log.debug("member :" + member);
		memberService.insert(member);
		
		return "redirect:/shop/login";
	}
}
