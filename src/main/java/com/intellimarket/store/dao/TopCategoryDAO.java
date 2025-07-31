package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.TopCategory;

@Repository
public interface TopCategoryDAO {
	public List selectAll();
	public TopCategory select(int topCategoryId);
	public List selectById(int rootCategoryId);
	
}
