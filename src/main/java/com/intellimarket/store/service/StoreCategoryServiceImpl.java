package com.intellimarket.store.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.store.dao.StoreCategoryDAO;
import com.intellimarket.store.dao.StoreInfoDAO;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreCategory;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.domain.SubCategory;
import com.intellimarket.store.domain.TopCategory;

@Service
public class StoreCategoryServiceImpl implements StoreCategoryService {
	@Autowired
	StoreCategoryDAO storeCategoryDAO;
	
	@Autowired
	StoreInfoDAO storeInfoDAO;

	@Override
	public List selectById(int storeInfoId) {
		return storeCategoryDAO.selectById(storeInfoId);
	}

	@Override
	public void insert(List<Integer> subCategories, Seller seller) {
		StoreInfo storeInfo = storeInfoDAO.selectById(seller.getSellerId());
		
		List<StoreCategory> storeCategories = new ArrayList<>();
		for (Integer subCategoryId : subCategories) {
			StoreCategory storeCategory = new StoreCategory();

			storeCategory.setStoreInfo(storeInfo);

			SubCategory subCategory = new SubCategory();
		    subCategory.setSubCategoryId(subCategoryId);

		    storeCategory.setSubCategory(subCategory);
		    storeCategories.add(storeCategory);
		}
		storeCategoryDAO.insert(storeCategories);
	}

	// 판매자가 보유한 Subcategories 를 통해 TopCategory를 List로 추출하여 /Store/Admin/ProductList에
	// 사용
	@Override
	public List<TopCategory> getTopCategoryById(int storeInfoId) {
		List<StoreCategory> storeCategories = storeCategoryDAO.selectById(storeInfoId);

		return storeCategories.stream().map(sc -> sc.getSubCategory().getTopCategory()).distinct() // equals & hashCode
																									// properly
																									// implemented in
																									// TopCategory
				.collect(Collectors.toList());
	}

	@Override
	public void update(StoreCategory StoreCategory) {

	}

}
