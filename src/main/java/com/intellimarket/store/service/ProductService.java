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
	void insert(Product product,String savePath, String prefix);
	
	//상품 등록 과정에서 트랜잭션에서 처리할 수 없는 파일 삭제 처리
	void remove(Product product, String savePath, String prefix);
	
	// 상품 정보 수정
	int updateProduct(Product product);
	
	// 상품 삭제
	int delete(int productId);
}
