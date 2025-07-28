package com.intellimarket.seller.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.seller.domain.Seller;

@Repository
public interface SellerDAO {
	// 전체 목록 조회
	List<Seller> selectAll();
	
	// 판매자 한 건 조회 (ID 기반)
	Seller selectById(int sellerId);
	
	// 판매자 한 건 조회 (이메일 기반)
	Seller selectByEmail(String email);
	
	// 회원가입(판매자 가입)
	void insert(Seller seller);
	
	// 회원 정보 수정
	int updateSeller(Seller seller);
	
	// 판매자 탈퇴
	int delete(int sellerId);
	
	// 로그인
	Seller loginSeller(Seller seller);
	
	// 비밀번호 수정
	int updatePassword(Seller seller);
	
	// 비밀번호 확인
	int matchPassword(Seller seller);
	
	// 이메일 중복확인
	int existByEmail(String email);
	
	// 사업자번호 중복확인
	int existByBusinessNum(String businessNum);
}
