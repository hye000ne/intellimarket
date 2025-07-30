package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.TopCategory;

public interface StoreCategoryService {
	public List selectByStoreInfoId(int storeInfoId);
	public List<TopCategory> getTopCategoriesByStoreInfoId(int storeInfoId);
}
