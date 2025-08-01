package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.TopCategory;

@Repository
public interface TopCategoryDAO {
	List selectAll();
	TopCategory select(int topCategoryId);
	List selectById(int rootCategoryId);
	
}
