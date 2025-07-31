package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.SellerStatus;

public interface SellerService {
	// 전체 목록 조회
	List<Seller> selectAll();
	
	// 판매자 한 건 조회 (ID 기반)
	Seller selectById(int sellerId);
	
	// 판매자 한 건 조회 (이메일 기반)
	Seller selectByEmail(String email);
	
	// 판매자 목록 조회 (상태값 기반)
	List<Seller> selectByStatus(SellerStatus sellerStatus);
	
	// 회원가입(판매자 가입)
	void insert(Seller seller);
	
	// 판매자 정보 수정
	int updateSeller(Seller seller);
	
	// 판매자 상태 수정(With msg)
	int updateStatus(Seller seller);
	
	// 가입 승인 및 스토어 생성
	void approveAndCreateStore(Seller seller);
	
	// 로그인
	Seller loginSeller(String email, String password);
	
	// 비밀번호 수정
	boolean updatePassword(String email, String password);
	
	// 비밀번호 확인
	boolean matchPassword(int sellerId, String password);
	
	// 회원 존재 여부(이메일 기반)
	boolean isEmailExists(String email);
	
	// 회원 존재 여부(사업자 등록번호)
	boolean isBusinessNumExists(String businessNum);
	
	// 임시 비밀번호 생성
	String generateTempPassword();
}
