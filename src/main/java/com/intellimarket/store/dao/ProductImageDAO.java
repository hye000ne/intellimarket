package com.intellimarket.store.dao;

import org.springframework.stereotype.Repository;

import com.intellimarket.store.domain.ProductImage;

@Repository
public interface ProductImageDAO {
	public void insert(ProductImage productImage);
}
