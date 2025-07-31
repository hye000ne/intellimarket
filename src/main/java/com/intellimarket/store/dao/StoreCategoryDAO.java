package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface StoreCategoryDAO {
	List selectById(int storeInfoId);
}
