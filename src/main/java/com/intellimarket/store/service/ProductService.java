package com.intellimarket.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intellimarket.store.domain.Product;

public interface ProductService {
	// 전체 목록 조회
	List<Product> selectAll();
	
	// 상품 단 건 조회
	Product select(int productId);
	
	// 판매자별 상품 목록 조회
	List<Product> selectById(int sellerId);
	
	// 상품 등록
	void insert(Product product);
	
	// 상품 정보 수정
	int updateProduct(Product product);
	
	// 상품 삭제
	int delete(int productId);
}
