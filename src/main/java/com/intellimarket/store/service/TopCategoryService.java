package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.TopCategory;

public interface TopCategoryService {
	public List selectAll();
	public List selectByRootCategoryId(int rootCategoryId);
	public TopCategory select(int topCategoryId);
}
