package com.intellimarket.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.common.exception.CommonException;
import com.intellimarket.common.service.MailService;
import com.intellimarket.shop.exception.ShopException;
import com.intellimarket.shop.service.MemberService;

/**
 * 공통 메일 처리 컨트롤러
 * - 인증코드 메일 발송
 * @author 혜원
 */
@Controller
public class MailController {
	@Autowired MailService mailService;
	@Autowired MemberService memberService;
	/**
	 * 인증번호 메일 발송
	 * - 인증코드 생성 후 세션 저장
	 * - 메일 발송
	 */
	@PostMapping("/sendAuthEmail")
	@ResponseBody
	public Map<String, Object> sendAuthEmail(@RequestParam String email, HttpSession session) {
		Map<String, Object> res = new HashMap<>();
		String authCode = generateAuthCode();
		String subject = "[IntelliMarket] 이메일 인증 코드입니다.";
		String body = "인증코드 : " + authCode;
		
		// 인증 코드 세션에 저장
		session.setAttribute("authCode_" + email, authCode);
		// 메일 전송
		mailService.sendMail(email, subject, body);
		
		res.put("status", "ok");
		res.put("msg", "인증번호가 발송되었습니다.");
		
		return res;
	}
	
	@PostMapping("/sendTempPasswordEmail")
	@ResponseBody
	public Map<String, Object> sendTempPasswordEmail(@RequestParam String email) {
		Map<String, Object> res = new HashMap<>();
		// 1. 임시 비밀번호 생성
		String tempPassword = memberService.generateTempPassword();
		// 2. 임시 비밀번호 DB 업데이트
		memberService.updatePassword(email, tempPassword);
		// 3. 메일 전송
		String subject = "[IntelliMarket] 임시 비밀번호입니다.";
		String body = "임시 비밀번호 : " + tempPassword;
		
		mailService.sendMail(email, subject, body);
		
		res.put("status", "ok");
		res.put("msg", "임시 비밀번호가 발송되었습니다.");
		
		return res;
	}
	
	/** 
	 * 6자리 숫자 인증코드 생성
	 * - 100000 ~ 999999 사이의 정수
	 */
	private String generateAuthCode() {
		int code = (int)((Math.random() * 9 + 1) * 100000);
		return String.valueOf(code);
	}
	
	@ExceptionHandler({ShopException.class, CommonException.class})
	@ResponseBody
	public Map<String, Object> handleMailException(CommonException e) {
	    Map<String, Object> res = new HashMap<>();
	    res.put("status", "fail");
	    res.put("msg", e.getMessage());
	    return res;
	}

}