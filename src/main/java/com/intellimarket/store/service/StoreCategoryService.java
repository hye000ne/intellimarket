package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.TopCategory;

public interface StoreCategoryService {
	public List selectById(int storeInfoId);
	public List<TopCategory> getTopCategoryById(int storeInfoId);
}
