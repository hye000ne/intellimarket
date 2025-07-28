package com.intellimarket.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.shop.domain.Member;

@Repository
public interface MemberDAO {
	// 전체 목록 조회
	List<Member> selectAll();
	
	// 회원 단 건 조회 (ID 기반)
	Member selectById(int memberId);
	
	// 회원가입
	void insert(Member member);
	
	// 회원 정보 수정
	int updateMember(Member member);
	
	// 회원 탈퇴
	int delete(int memberId);
	
	// 로그인
	Member loginMember(Member member);
	
	// 비밀번호 수정
	int updatePassword(Member member);
	
	// 비밀번호 확인
	int matchPassword(Member member);

	// 이메일 중복확인
	int existByEmail(String email);
}
