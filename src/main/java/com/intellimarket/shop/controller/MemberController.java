package com.intellimarket.shop.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.common.util.CookieUtil;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.domain.Member.MemberStatus;
import com.intellimarket.shop.domain.Member.Role;
import com.intellimarket.shop.exception.ShopException;
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
	 * - 이메일 중복 검증 후 DB 등록
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
	 * - 성공 시 세션에 loginMember 저장
	 */
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Object> login(@RequestParam String email, @RequestParam String password
			, @RequestParam(value="rememberEmail", required = false) String rememberEmail
			, HttpServletResponse response 
			, HttpSession session) {
		Map<String, Object> res = new HashMap<>();
		Member loginMember = memberService.loginMember(email, password);
		
		if(loginMember != null) {
			// 이메일 저장하기 체크 시
			if(rememberEmail != null) {
				// 쿠키에 저장 (만료시간 7일)
				CookieUtil.setCookie(response, "rememberEmail", email, 60*60*24*7); 
			} else {
				// 쿠키 삭제
				CookieUtil.deleteCookie(response, "rememberEmail");
			}
			session.setAttribute("loginMember", loginMember);
			res.put("status", "ok");
			res.put("msg", loginMember.getName()+"님, 안녕하세요.");
			if(loginMember.getRole() == Role.ADMIN) {
				res.put("url", "/admin/main");
			} else {
				res.put("url", "/shop/main");
			}
		} else {
			res.put("status", "fail");
			res.put("msg", "이메일과 비밀번호를 확인해주세요.");
		}
		
		return res;
	}
	
	/**
	 * 회원 정보 수정
	 */
	@PostMapping("/update")
	@ResponseBody
	public Map<String, Object> update(@ModelAttribute Member member) {
		Map<String, Object> res = new HashMap<>();
		memberService.updateMember(member);
		res.put("status", "ok");
		res.put("msg", "회원 정보 수정이 완료되었습니다.");
		return res;
	}
	
	/**
	 * 회원 상태 변경
	 * - 회원 탈퇴 시 호출
	 */
	@PostMapping("/updateMemberStatus")
	public Map<String, Object> updateMemberStatus(@RequestParam int memberId, @RequestParam MemberStatus status, @RequestParam String inactiveReason) { 
		Map<String, Object> res = new HashMap<>();
		memberService.updateMemberStatus(memberId, status, inactiveReason);
		res.put("status", "ok");
		res.put("msg", "회원 탈퇴 처리되었습니다.");
		return res;
	}
	
	/**
	 * 로그아웃 처리
	 * - 세션 만료
	 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/shop/main";
	}
	
	/**
	 * 이메일 중복 체크
	 * - 회원가입 시 사용
	 * - 이미 사용 중인 이메일이면 예외 발생
	 */
	@PostMapping("/checkEmailDuplicate")
	@ResponseBody
	public void checkEmailDuplicate(@RequestParam String email) {
		if(memberService.isEmailExists(email)) {
			throw new ShopException("이미 사용 중인 이메일입니다.");
		} 
	}
	
	/**
	 * 이메일 존재 여부 확인
	 * - 비밀번호 찾기 시 사용
	 */
	@PostMapping("/checkEmailExist")
	@ResponseBody
	public boolean checkEmailExist(@RequestParam String email) {
		return memberService.isEmailExists(email);
	}
	
	/**
	 * 인증 코드 검증
	 * - 비밀번호 찾기 시 전송된 인증코드 검증
	 * - 세션에 저장된 코드와 비교 후 삭제
	 */
	@PostMapping("/verifyAuthCode")
	@ResponseBody
	public Map<String, Object> verifyAuthCode(@RequestParam String email, @RequestParam("authCode") String inputCode, HttpSession session) {
		String sessionCode = (String)session.getAttribute("authCode_" + email);
		Map<String, Object> res = new HashMap<>();
		
		if(sessionCode != null & sessionCode.equals(inputCode)) {
			session.removeAttribute("authCode_" + email); // dlswmd
			res.put("status", "ok");
		} else {
			res.put("status", "fail");
			res.put("msg", "인증번호가 일치하지 않습니다.");
		}
		
		return res;
	}
	
}