package com.intellimarket.store.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.ProductImage;

@Repository
public interface ProductImageDAO {
	// 썸네일 이미지 등록
	void insert(ProductImage productImage);
	
	List<ProductImage> selectById(int productId);
}
