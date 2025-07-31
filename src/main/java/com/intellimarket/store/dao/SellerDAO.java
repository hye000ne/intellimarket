package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.SellerStatus;

@Repository
public interface SellerDAO {
	
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

	// 비밀번호 수정
	int updatePassword(Seller seller);

	// 비밀번호 확인
	int matchPassword(Seller seller);

	// 회원 존재 여부(이메일 기반)
	int existByEmail(String email);

	// 회원 존재 여부(사업자 등록번호)
	int existByBusinessNum(String businessNum);

}