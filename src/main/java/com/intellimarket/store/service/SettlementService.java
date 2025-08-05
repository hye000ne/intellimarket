package com.intellimarket.store.service;

import java.util.List;
import java.util.Map;

import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.Settlement;
import com.intellimarket.store.domain.SettlementStatus;

public interface SettlementService {
	//전체 조회
	List<Settlement> selectAll();
	
	//단건 조회 (ID 기반)
	Settlement selectById(int settlementId);
	
	//스토어별 List 조회
	List<Settlement> selectByStoreInfoId(int storeInfoId);
	
	//스토어별 , status 별 List 조회
	List<Settlement> selectByStatusAndStoreInfoId(Map<String, Object> paramMap);
	
	//status 별 List 조회
	List<Settlement> selectByStatus(SettlementStatus status);
	
	//정산 상태 변경
	void updateStatus(int settlementId , SettlementStatus settlementStatus);
	
	//status가 READY인 건 일괄 REQUESTED 요청 (단, yearMonth / storeInfoId 입력 필요)
	int updateStatusToRequested(int storeInfoId, String yearMonth);
	
	//스토어 및 상태별 정산 건수
    int countByStatusAndId(String settlementStatus, int storeInfoId, String yearMonth);

    //스토어 및 상태별 정산 금액 합계
    int sumAmountByStatusAndId(String settlementStatus, int storeInfoId, String yearMonth);
    
    //상태별 정산 건수
    int countByStatus(String settlementStatus, String yearMonth);

    //상태별 정산 금액 합계
    int sumAmountByStatus(String settlementStatus, String yearMonth);
    
    // 상품 구매 확정 시 , settlement insert
    void insert(Product product,int requestedAmount);
}
