package com.intellimarket.shop.service;

import java.util.List;

import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.domain.Member.MemberStatus;

public interface MemberService {
	// 전체 목록 조회
	List<Member> selectAll();
	
	// 회원 단 건 조회 (ID 기반)
	Member selectById(int memberId);
	
	// 회원 단 건 조회 (이메일 기반)
	Member selectByEmail(String email);
	
	// 회원가입
	void insert(Member member);
	
	// 회원 정보 변경
	void updateMember(Member member);
	
	// 회원 상태 변경
	void updateMemberStatus(int memberId, MemberStatus status, String inactiveReason);
	
	// 로그인
	Member loginMember(String email, String password);
	
	// 비밀번호 변경
	void updatePassword(String email, String password);
	
	// 비밀번호 확인
	boolean matchPassword(int memberId, String password);
	
	// 회원 존재 여부 (이메일 기반)
	boolean isEmailExists(String email);
	
	// 임시 비밀번호 생성
	String generateTempPassword();
}
