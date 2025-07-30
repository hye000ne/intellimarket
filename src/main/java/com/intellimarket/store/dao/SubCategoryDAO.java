package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.SubCategory;

@Repository
public interface SubCategoryDAO {
	public List selectAll();
	public List selectByTopCategoryId(int topCategoryId);
	public SubCategory select(int subCategoryId);
}
