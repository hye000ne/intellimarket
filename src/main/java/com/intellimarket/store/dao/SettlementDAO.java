package com.intellimarket.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	List<Settlement> selectByStatus(SettlementStatus status);
	
	//정산 상태 변경
	void updateStatus(Settlement settlement);
	
	//status가 READY인 건 일괄 REQUESTED 요청 (단, yearMonth / storeInfoId 입력 필요) 
	int updateStatusToRequested(@Param("storeInfoId") int storeInfoId, @Param("yearMonth") String yearMonth);
	
	//스토어 및 상태별 정산 건수
    int countByStatusAndId(@Param("settlementStatus") String settlementStatus, 
            			@Param("storeInfoId") int storeInfoId, 
            			@Param("yearMonth") String yearMonth);
    
    //스토어 및 상태별 정산 금액 합계
    int sumAmountByStatusAndId(@Param("settlementStatus") String settlementStatus, 
                			@Param("storeInfoId") int storeInfoId, 
                			@Param("yearMonth") String yearMonth);
    
    //상태별 정산 건수
    int countByStatus(@Param("settlementStatus") String settlementStatus, 
			@Param("yearMonth") String yearMonth);

    //상태별 정산 금액 합계
    int sumAmountByStatus(@Param("settlementStatus") String settlementStatus, 
    			@Param("yearMonth") String yearMonth);  
    
    //구매확정 시 , settlement insert
    void insert (Settlement settlement);
}
