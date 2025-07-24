package com.intellimarket.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

    @Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        // 1) 메일 발송에 사용할 SMTP 서버 주소 및 포트 설정 (Gmail 예시)
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587); // TLS용 포트

        // 2) 메일 계정 정보: '발신용 계정' 아이디(이메일 주소)와 비밀번호
        mailSender.setUsername("");  // 구글 계정 이메일 주소
        mailSender.setPassword("");     // 구글 앱 비밀번호

        // 3) SMTP 서버로 보낼 프로퍼티 세팅
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");        // 메일 전송 프로토콜 지정
        props.put("mail.smtp.auth", "true");                 // SMTP 인증 사용 여부
        props.put("mail.smtp.starttls.enable", "true");      // TLS 보안 연결 사용
        props.put("mail.debug", "true");                     // 디버그 모드 (메일 전송 로그)

        return mailSender;
    }
}