package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreCategory;
import com.intellimarket.store.domain.TopCategory;

public interface StoreCategoryService {
	public List selectById(int storeInfoId);
	public void update(StoreCategory StoreCategory);
	public List<TopCategory> getTopCategoryById(int storeInfoId);
	public List<StoreCategory> getAllCategoryById(Seller seller);
	public void insert(List<Integer> StoreCategory, Seller seller);
	public void delete(int storeCategoryId, Seller seller);
}
