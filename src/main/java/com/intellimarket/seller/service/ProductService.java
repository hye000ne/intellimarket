package com.intellimarket.seller.service;

import java.util.List;

import com.intellimarket.seller.domain.Product;

public interface ProductService {
	// 전체 목록 조회
	List<Product> selectAll();
	
	// 상품 단 건 조회
	Product select(int productId);
	
	// 상품 등록
	void insert(Product product);
	
	// 상품 정보 수정
	int updateProduct(Product product);
	
	// 상품 삭제
	int delete(int productId);
}
