package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.StoreInfo;

@Repository
public interface StoreInfoDAO {
	// 전체 목록 조회
	List<StoreInfo> selectAll();
	
	// 판매자 Id로 조회
	StoreInfo selectById(int sellerId);
	
	// 판먜자 한 건 조회(seller_id 기반)
	StoreInfo select(int sellerId);
	
	// 스토어 정보 등록
	void insert(StoreInfo storeInfo);
	
	// 스토어 정보 업데이트
	int update(StoreInfo storeInfo);
}
