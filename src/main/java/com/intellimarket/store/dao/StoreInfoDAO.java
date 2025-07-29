package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.StoreInfo;

@Repository
public interface StoreInfoDAO {
	// 전체 목록 조회
	List<StoreInfo> selectAll();
	
	// 판매자 한 건 조회(ID 기반)
	StoreInfo selectById(int StoreInfoId);
	
	// 스토어 정보 등록
	void insert(StoreInfo storeInfo);
}
