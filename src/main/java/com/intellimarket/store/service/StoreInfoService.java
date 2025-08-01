package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.StoreInfo;

public interface StoreInfoService {
	// 전체 목록 조회
	List<StoreInfo> selectAll();
	
	// 판매자 ID로 조회
	StoreInfo selectById(int storeInfoId);
	
	// 스토어 정보 등록
	void insert(StoreInfo storeInfo);
	
	// 스토어 정보 업데이트	
	int update(StoreInfo storeInfo);
}
