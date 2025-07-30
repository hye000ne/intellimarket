package com.intellimarket.store.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;

import com.intellimarket.store.dao.StoreCategoryDAO;
import com.intellimarket.store.domain.StoreCategory;
import com.intellimarket.store.domain.TopCategory;

public class StoreCategoryServiceImpl implements StoreCategoryService{
	@Autowired StoreCategoryDAO storeCategoryDAO;
	
	@Override
	public List selectByStoreInfoId(int storeInfoId) {
		return storeCategoryDAO.selectByStoreInfoId(storeInfoId);
	}

	//판매자가 보유한 Subcategories 를 통해 TopCategory를 List로 추출하여 /Store/Admin/ProductList에 사용
	@Override
	public List<TopCategory> getTopCategoriesByStoreInfoId(int storeInfoId) {
		List<StoreCategory> storeCategories = storeCategoryDAO.selectByStoreInfoId(storeInfoId);
		
		return storeCategories.stream()
	            .map(sc -> sc.getSubCategory().getTopCategory())
	            .distinct()  // equals & hashCode properly implemented in TopCategory
	            .collect(Collectors.toList());
	}

}
