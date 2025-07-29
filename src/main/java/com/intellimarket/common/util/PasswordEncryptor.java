package com.intellimarket.common.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 비밀번호 암호화 및 검증 유틸
 * - BCrypt 기반 단방향 해시 사용
 * @author 혜원
 */
public class PasswordEncryptor {
	private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	// 비밀번호 암호화
	public static String encode(String rawPassword) {
		return encoder.encode(rawPassword);
	}
	
	// 비밀번호 일치 여부 검증
	public static boolean matches(String rawPassword, String encodedPassword ) {
		return encoder.matches(rawPassword, encodedPassword);
	}
}
