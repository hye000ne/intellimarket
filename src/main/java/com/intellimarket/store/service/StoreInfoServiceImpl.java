package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.store.dao.StoreInfoDAO;
import com.intellimarket.store.domain.StoreInfo;

@Service
public class StoreInfoServiceImpl implements StoreInfoService {
	
	@Autowired StoreInfoDAO storeInfoDAO;
	

	@Override
	public List<StoreInfo> selectAll() {
		return storeInfoDAO.selectAll();
	}

	@Override
	public StoreInfo selectById(int storeInfoId) {
		return storeInfoDAO.selectById(storeInfoId);
	}

	@Override
	public void insert(StoreInfo storeInfo) {
		storeInfoDAO.insert(storeInfo);
	}

	@Override
	public int update(StoreInfo storeInfo) {
		return storeInfoDAO.update(storeInfo);
	}

}
