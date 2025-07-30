package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.store.dao.ProductDAO;
import com.intellimarket.store.domain.Product;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired ProductDAO productDAO;

	// 전체 목록 조회
	@Override
	public List<Product> selectAll() {
		return productDAO.selectAll();
	}
	
	// 판매자별 상품 목록 조회
	@Override
	public List<Product> selectBySellerId() {
		return productDAO.selectBySellerId();
	}
	
	// 상품 단 건 조회
	@Override
	public Product select(int productId) {
		return productDAO.select(productId);
	}

	// 상품 등록
	@Override
	public void insert(Product product) {
		productDAO.insert(product);
	}

	// 상품 정보 수정
	@Override
	public int updateProduct(Product product) {
		return productDAO.updateProduct(product);
	}

	// 상품 삭제
	@Override
	public int delete(int productId) {
		return productDAO.delete(productId);
	}


	
}
