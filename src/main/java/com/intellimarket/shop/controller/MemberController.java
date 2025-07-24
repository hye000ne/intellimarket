package com.intellimarket.shop.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.service.MemberService;

import lombok.extern.slf4j.Slf4j;


/**
 * 회원 기능 관련 컨트롤러
 * @author 혜원
 */
@Slf4j
@Controller
@RequestMapping("/shop/member")
public class MemberController {
	@Autowired MemberService memberService;
	
	/**
	 * 회원 가입 처리
	 * - 이메일 중복 검증 후 등록
	 */
	@PostMapping("/join")
	@ResponseBody
	public Map<String, Object> join(@ModelAttribute Member member) {
		memberService.insert(member);
		Map<String, Object> res = new HashMap<>();
		res.put("status", "ok");
		res.put("msg", "회원가입이 완료되었습니다.");
		return res;
	}
	
	/**
	 * 로그인 처리
	 * - email/password로 로그인 시도
	 * - 성공 시 세션에 loginMember 저장
	 * @param email
	 * @param password
	 * @param session
	 * @return
	 */
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Object> login(@RequestParam String email, @RequestParam String password, HttpSession session) {
		Map<String, Object> res = new HashMap<>();
		Member loginMember = memberService.loginMember(email, password);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			res.put("status", "ok");
			res.put("msg", loginMember.getName()+"님, 안녕하세요.");
		} else {
			res.put("status", "fail");
			res.put("msg", "이메일과 비밀번호를 확인해주세요.");
		}
		
		return res;
	}
	
	/**
	 * 로그아웃 처리
	 * - 세션 만료 처리
	 * @param session
	 * @return
	 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/shop/main";
	}
	
	/**
	 * 이메일 중복 체크
	 * - 이미 사용 중인 이메일이면 예외 발생
	 * @param email
	 * @return
	 */
	@PostMapping("/checkEmail")
	@ResponseBody
	public boolean checkEmailDuplicate(@RequestParam String email) {
		memberService.existByEmail(email);
		return true;
	}
}
