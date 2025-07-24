package com.intellimarket.common.mail.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.common.mail.service.MailService;

@Controller
public class MailController {
	@Autowired MailService mailService;
	
	@PostMapping("/sendAuthEmail")
	@ResponseBody
	public Map<String, Object> sendAuthEmail(@RequestParam String email) {
		Map<String, Object> res = new HashMap<>();
		String authCode = generateAuthCode();
		String subject = "[IntelliMarket] 이메일 인증 코드입니다.";
		String body = "인증코드 : " + authCode;
		
		mailService.sendMail(email, subject, body);
		res.put("status", "ok");
		res.put("msg", "인증번호가 발송되었습니다.");
		
		return res;
	}
	
	private String generateAuthCode() {
		// 6자리 난수 (100000 ~ 999999 사이의 정수)
		int code = (int)((Math.random() * 9 + 1) * 100000);
		return String.valueOf(code);
	}
}
