package com.intellimarket.common.mail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.intellimarket.common.exception.CommonException;

@Service
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMail(String toEmail, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom(""); 								// 발신자
		message.setTo(toEmail); 							// 수신자
		message.setSubject(subject); 						// 메일 제목
		message.setText(text); 								// 메일 내용
		
		try {
			mailSender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
			throw new CommonException("인증 메일 전송에 실패했습니다.");
		}
	}
}
