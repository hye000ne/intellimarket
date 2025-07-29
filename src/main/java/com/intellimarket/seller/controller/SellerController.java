package com.intellimarket.seller.controller;

<<<<<<< HEAD
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
import com.intellimarket.seller.domain.Seller;
import com.intellimarket.seller.service.SellerService;
import com.intellimarket.shop.exception.ShopException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 판매자 기능 관련 컨트롤러
 * @author 재환
 */
@Slf4j
@Controller
@RequestMapping("/seller/member")
public class SellerController {
	@Autowired
	SellerService sellerService;
	
	
	/**
	 * 회원 가입 처리
	 * - 이메일, 사업자번호 중복 검증 후 DB 등록
	 */
	
	@PostMapping("/join")
	@ResponseBody
	public Map<String, Object> join(@ModelAttribute Seller seller){
		sellerService.insert(seller);
		Map<String, Object> res = new HashMap<>();
		res.put("status", "ok");
		res.put("msg", "회원가입이 완료되었습니다");
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
		Seller loginSeller = sellerService.loginSeller(email, password);
		
		if(loginSeller != null) {
			// 이메일 저장하기 체크 시
			if(rememberEmail != null) {
				// 쿠키에 저장 (만료시간 7일)
				CookieUtil.setCookie(response, "rememberEmail", email, 60*60*24*7); 
			} else {
				// 쿠키 삭제
				CookieUtil.deleteCookie(response, "rememberEmail");
			}
			session.setAttribute("loginMember", loginSeller);
			res.put("status", "ok");
			res.put("msg", loginSeller.getName()+"님, 안녕하세요.");
		} else {
			res.put("status", "fail");
			res.put("msg", "이메일과 비밀번호를 확인해주세요.");
		}
		
		return res;
	}
	
	/**
	 * 로그아웃 처리
	 * - 세션 만료
	 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/seller/main";
	}
	
	/**
	 * 이메일 중복 체크
	 * - 회원가입 시 사용
	 * - 이미 사용 중인 이메일이면 예외 발생
	 */
	@PostMapping("/checkEmailDuplicate")
	@ResponseBody
	public void checkEmailDuplicate(@RequestParam String email) {
		if(sellerService.isEmailExists(email)) {
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
		return sellerService.isEmailExists(email);
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