package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.TopCategory;

public interface TopCategoryService {
	public List selectAll();
	public TopCategory select(int topCategoryId);
	public List selectById(int rootCategoryId);
	
}
