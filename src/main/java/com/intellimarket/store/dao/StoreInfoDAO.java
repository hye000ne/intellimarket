package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.StoreInfo;

@Repository
public interface StoreInfoDAO {
	// 전체 목록 조회
	public List<StoreInfo> selectAll();
	
	// 판매자 Id로 조회
	public StoreInfo selectById(int sellerId);
	
	// 스토어 목록 최신 등록순 조회
	public List<StoreInfo> selectRecentByCount(int count);
	
	// 스토어 정보 등록
	public void insert(StoreInfo storeInfo);
	
	// 스토어 정보 업데이트
	public int update(StoreInfo storeInfo);
	
	public int updateLogo(StoreInfo storeInfo);
	
	public int deletLogo(int storeInfoId);
}
