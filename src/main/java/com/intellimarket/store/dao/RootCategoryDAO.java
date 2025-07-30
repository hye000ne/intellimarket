package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.RootCategory;

@Repository
public interface RootCategoryDAO {
	public List selectAll();
	public RootCategory select(int rootCategoryId);
}
