package com.intellimarket.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.SubCategory;

@Repository
public interface SubCategoryDAO {
	public List selectAll();
	public SubCategory select(int subCategoryId);
	public List selectById(int topCategoryId);
	public List selectByStoreTop(@Param("storeInfoId") int storeInfoId, @Param("topCategoryId") int topCategoryId);
}
