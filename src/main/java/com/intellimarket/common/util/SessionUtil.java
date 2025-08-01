package com.intellimarket.common.util;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.intellimarket.shop.domain.Member;

public class SessionUtil {
	public static Member getLoginMember(HttpSession session, Model model, String redirectUrl, String contentPage) {
	    Member member = (Member) session.getAttribute("loginMember");

	    if (member == null) {
	        model.addAttribute("alertMessage", "로그인 이후 사용 가능합니다.");
	        model.addAttribute("redirectUrl", redirectUrl);
	        model.addAttribute("contentPage", contentPage);
	        return null;
	    }

	    return member;
	}
}
