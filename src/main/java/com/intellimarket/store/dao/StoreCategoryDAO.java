package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.StoreCategory;

@Repository
public interface StoreCategoryDAO {
	public List selectById(int storeInfoId);
	public void insert(List<StoreCategory> storeCategories);
}
