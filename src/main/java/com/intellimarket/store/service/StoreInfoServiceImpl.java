package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.admin.exception.AdminException;
import com.intellimarket.common.exception.CommonException;
import com.intellimarket.common.util.FileManager;
import com.intellimarket.store.dao.StoreCategoryDAO;
import com.intellimarket.store.dao.StoreInfoDAO;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreInfo;

@Service
public class StoreInfoServiceImpl implements StoreInfoService {

	@Autowired
	StoreInfoDAO storeInfoDAO;

	@Autowired
	StoreCategoryDAO storeCategoryDAO;
	
	@Autowired
	FileManager fileManager;

	@Override
	public List<StoreInfo> selectAll() {
		return storeInfoDAO.selectAll();
	}

	@Override
	public StoreInfo selectById(Seller seller) {
		return storeInfoDAO.selectById(seller.getSellerId());
	}
		
	@Override
	public StoreInfo selectByName(StoreInfo storeInfo) {
		return storeInfoDAO.selectByName(storeInfo.getEngName());
	}
  
	@Override
	public List<StoreInfo> selectRecentByCount(int count){
		return storeInfoDAO.selectRecentByCount(count);
	}

  @Override
	public void insert(StoreInfo storeInfo) {
		storeInfoDAO.insert(storeInfo);
	}

	@Override
	public int update(StoreInfo storeInfo) {
		return storeInfoDAO.update(storeInfo);
	}

	@Override
	public void updateLogo(StoreInfo storeInfo, String savepath, Seller seller) {
		try {
			storeInfo.setSeller(seller);
			
			// 1. 이미지 저장
			fileManager.save(storeInfo, savepath);
			
			// 2.DB 저장
			int result = storeInfoDAO.updateLogo(storeInfo);
			if(result <= 0) throw new AdminException("배너 정보 저장에 실패했습니다.");
		} catch (CommonException e) {
			throw new AdminException("배너 이미지 저장에 실패했습니다.", e);
		}
	}


}
