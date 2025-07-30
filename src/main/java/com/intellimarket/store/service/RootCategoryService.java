package com.intellimarket.store.service;

import java.util.List;

import com.intellimarket.store.domain.RootCategory;

public interface RootCategoryService {
	public List selectAll();
	public RootCategory select(int rootCategoryId);
}
