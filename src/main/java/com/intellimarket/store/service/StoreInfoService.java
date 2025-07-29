package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.StoreInfo;

public interface StoreInfoService {
	// 전체 목록 조회
	List<StoreInfo> selectAll();
	
	// 판매자 한 건 조회(ID 기반)
	StoreInfo selectById(int storeInfoId);
	
	// 스토어 정보 등록
	void insert(StoreInfo storeInfo);
}
