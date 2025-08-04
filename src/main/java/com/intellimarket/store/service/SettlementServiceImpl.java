package com.intellimarket.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.store.dao.SettlementDAO;
import com.intellimarket.store.domain.Settlement;
import com.intellimarket.store.domain.SettlementStatus;

@Service
public class SettlementServiceImpl implements SettlementService{
	
	@Autowired
	private SettlementDAO settlementDAO;
	
	@Override
	public List selectAll() {
		return settlementDAO.selectAll();
	}

	@Override
	public Settlement selectById(int settlementId) {
		return settlementDAO.selectById(settlementId);
	}

	@Override
	public List selectByStoreInfoId(int storeInfoId) {
		return settlementDAO.selectByStoreInfoId(storeInfoId);
	}

	@Override
	public List selectByStatusAndStoreInfoId(Map<String, Object> paramMap) {
		return settlementDAO.selectByStatusAndStoreInfoId(paramMap);
	}
	
	@Override
	public List<Settlement> selectByStatus(SettlementStatus status) {
		return settlementDAO.selectByStatus(status.name());
	}

	@Override
	public void updateStatus(int settlementId , SettlementStatus settlementStatus) {
		Settlement settlement = new Settlement();
		settlement.setSettlementId(settlementId);
		settlement.setSettlementStatus(settlementStatus);
		settlementDAO.updateStatus(settlement);
	}
	
	@Override
	public int updateStatusToRequested(int storeInfoId, String yearMonth) {
		return settlementDAO.updateStatusToRequested(storeInfoId, yearMonth);
	}

	@Override
	public int countByStatusAndId(String settlementStatus, int storeInfoId, String yearMonth) {
		return settlementDAO.countByStatusAndId(settlementStatus, storeInfoId, yearMonth);
	}

	@Override
	public int sumAmountByStatusAndId(String settlementStatus, int storeInfoId, String yearMonth) {
		return settlementDAO.sumAmountByStatusAndId(settlementStatus, storeInfoId, yearMonth);
	}

	@Override
	public int countByStatus(String settlementStatus, String yearMonth) {
		return settlementDAO.countByStatus(settlementStatus, yearMonth);
	}

	@Override
	public int sumAmountByStatus(String settlementStatus, String yearMonth) {
		return settlementDAO.sumAmountByStatus(settlementStatus, yearMonth);
	}



}
