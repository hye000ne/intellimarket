package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.common.exception.CommonException;
import com.intellimarket.common.util.FileManager;
import com.intellimarket.store.dao.ProductDAO;
import com.intellimarket.store.dao.ProductImageDAO;
import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.ProductImage;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired ProductDAO productDAO;
	@Autowired ProductImageDAO productImageDAO;
	@Autowired FileManager fileManager;
	
	// 전체 목록 조회
	@Override
	public List<Product> selectAll() {
		return productDAO.selectAll();
	}
	
	// 판매자별 상품 목록 조회
	@Override
	public List<Product> selectById(int sellerId) {
		return productDAO.selectById(sellerId);
	}

	// 상품 단 건 조회
	@Override
	public Product select(int productId) {
		return productDAO.select(productId);
	}

	// 상품 등록
	@Override
	public void insert(Product product,String savePath, String prefix) throws CommonException{
		// 1. 상품정보 저장
		productDAO.insert(product);
		
		// 2. 썸네일 파일 서버에 저장
		fileManager.save(product,savePath, prefix);
		
		// 3. 썸네일 파일명 DB에 저장
		for(ProductImage productImage : product.getImgList()) {
			productImage.setProduct(product);
			productImageDAO.insert(productImage);
		}
	}
	
	//트랜잭션에서 처리할 수 없는 파일 삭제 처리
	@Override
	public void remove(Product product, String savePath, String prefix) {
		fileManager.remove(product, savePath, prefix);
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
