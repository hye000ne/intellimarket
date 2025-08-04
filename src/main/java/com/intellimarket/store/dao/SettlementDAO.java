package com.intellimarket.store.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.Settlement;
import com.intellimarket.store.domain.SettlementStatus;

@Repository
public interface SettlementDAO {

	//전체 조회
	List<Settlement> selectAll();
	
	//단건 조회 (ID 기반)
	Settlement selectById(int settlementId);
	
	//스토어별 List 조회
	List<Settlement> selectByStoreInfoId(int storeInfoId);
	
	//스토어별 , status 별 List 조회
	List<Settlement> selectByStatusAndStoreInfoId(Map<String, Object> paramMap);
	
	//스토어별 , status 별 List 조회
	List<Settlement> selectByStatus(String status);
	
	//정산 상태 변경
	void updateStatus(Settlement settlement);
}
