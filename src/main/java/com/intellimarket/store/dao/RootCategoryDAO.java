package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.RootCategory;

@Repository
public interface RootCategoryDAO {
	List selectAll();
	RootCategory select(int rootCategoryId);
}
