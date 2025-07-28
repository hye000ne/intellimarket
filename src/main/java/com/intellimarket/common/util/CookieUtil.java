package com.intellimarket.common.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 쿠키 관련 편의 메서드 유틸
 * @author 혜원
 */
public class CookieUtil {
	// 쿠키 생성
	public static void setCookie(HttpServletResponse response, String name, String value, int maxAge) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	
	// 쿠키 값 조회
	public static String getCookie(HttpServletRequest request, String name) {
		if(request.getCookies() == null) return null;
		
		for(Cookie cookie : request.getCookies()) {
			if(cookie.getName().equals(name)) {
				return cookie.getValue();
			}
		}
		
		return null;
	}
	
	// 쿠키 삭제
	public static void deleteCookie(HttpServletResponse response, String name) {
		setCookie(response, name, null, 0);
	}
}