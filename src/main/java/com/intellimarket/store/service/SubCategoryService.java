package com.intellimarket.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intellimarket.store.domain.SubCategory;

public interface SubCategoryService {
	public List selectAll();
	public SubCategory select(int subCategoryId);
	public List selectById(int topCategoryId);
	public List selectByStoreTop(@Param("storeInfoId") int storeInfoId, @Param("topCategoryId") int topCategoryId);
	
}
