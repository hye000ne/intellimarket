package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface StoreCategoryDAO {
	public List selectById(int storeInfoId);
}
