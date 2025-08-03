package com.intellimarket.common.util;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.service.MemberService;

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
	
	/**
	 * 세션에 저장된 로그인 회원 정보를 DB에서 새로 조회해 갱신
	 * @param session
	 * @param memberService
	 */
	public static void refreshLoginMember(HttpSession session, MemberService memberService) {
	    Member loginMember = (Member) session.getAttribute("loginMember");

	    if (loginMember != null) {
	        Member refreshed = memberService.selectById(loginMember.getMemberId());
	        session.setAttribute("loginMember", refreshed);
	    }
	}
}
