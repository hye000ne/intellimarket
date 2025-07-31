package com.intellimarket.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.SubCategory;

@Repository
public interface SubCategoryDAO {
	List selectAll();
	SubCategory select(int subCategoryId);
	List selectById(int topCategoryId);
	List selectByStoreTop(@Param("storeInfoId") int storeInfoId, @Param("topCategoryId") int topCategoryId);
}
