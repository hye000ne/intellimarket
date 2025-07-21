package com.intellimarket.shop.service;

import java.util.List;

import com.intellimarket.shop.domain.Member;

public interface MemberService {
	// 전체 목록 조회
	List<Member> selectAll();
	
	// 회원 단 건 조회 (ID 기반)
	Member SelectById(int memberId);
	
	// 회원가입
	int insert(Member member);
	
	// 회원 정보 수정
	Member update(Member member);
	
	// 회원 탈퇴
	int delete(int memberId);
	
	// 로그인
	Member login(String email, String password);

	// 이메일 중복확인
	boolean isEmailDuplicated(String email);
	
	// 비밀번호 변경
	int changePassword(int memberId, String password);
	
	// 비밀번호 확인
	boolean checkPassword(int memberId, String password);
}
