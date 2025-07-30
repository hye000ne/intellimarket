package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.SubCategory;

public interface SubCategoryService {
	public List selectAll();
	public List selectByTopCategoryId(int topCategoryId);
	public SubCategory select(int subCategoryId);
}
