package com.intellimarket.store.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.StoreCategory;

@Repository
public interface StoreCategoryDAO {
	public List selectById(int storeInfoId);
	public List selectRootById(int storeInfoId);
	public StoreCategory selectByStoreCategoryId(int storeCategoryId);
	public void insert(List<StoreCategory> storeCategories);
	public void delete(int storeCategoryId);
}
