package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreInfo;

public interface StoreInfoService {
	// 전체 목록 조회
	List<StoreInfo> selectAll();
	
	// 판매자 ID로 조회
	StoreInfo selectById(Seller seller);

	// 스토어 영문명으로 조회
	StoreInfo selectByName(StoreInfo storeInfo);
	
	// 스토어 정보 등록
	void insert(StoreInfo storeInfo);
	
	// 스토어 정보 업데이트	
	int update(StoreInfo storeInfo);
	
	void updateLogo(StoreInfo storeInfo, String savepath, Seller seller);
}
