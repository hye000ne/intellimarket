package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.intellimarket.common.exception.CommonException;
import com.intellimarket.common.util.FileManager;
import com.intellimarket.shop.exception.ShopException;
import com.intellimarket.store.dao.ProductDAO;
import com.intellimarket.store.dao.ProductImageDAO;
import com.intellimarket.store.dao.StoreInfoDAO;
import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.ProductImage;
import com.intellimarket.store.domain.ProductStatus;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.exception.ProductException;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired ProductDAO productDAO;
	@Autowired StoreInfoDAO storeInfoDAO;
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
		validateProduct(product);
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

	@Override
	@Transactional
	public int updateProduct(Product product, String savePath, String prefix) {
		validateProduct(product);
	    int result = productDAO.updateProduct(product);

	    MultipartFile[] photo = product.getPhoto();

	    // 새 이미지가 있을 경우에만 삭제 및 재업로드 수행
	    if (photo != null && photo.length > 0 && !photo[0].isEmpty()) {
	        // 기존 이미지 DB 삭제
	        productImageDAO.delete(product.getProductId());

	        // 기존 이미지 파일 삭제
	        fileManager.remove(product, savePath, prefix);

	        // 새 이미지 저장
	        fileManager.save(product, savePath, prefix);

	        int id = product.getProductId();
	        for (ProductImage productImage : product.getImgList()) {
	            Product p = new Product();
	            p.setProductId(id);
	            productImage.setProduct(p);
	            productImageDAO.insert(productImage);
	        }
	    }

	    return result;
	}
	
	// 상품 상태 변경
	@Override
	public void updateStatus(int productId, ProductStatus status) {
		Product product = new Product();
		product.setProductId(productId);
		product.setStatus(status);
		
		int result = productDAO.updateStatus(product);
		if(result <= 0) throw new ShopException("상품 상태 변경에 실패했습니다.");
	}

	// 상품 삭제
	@Override
	public int delete(int productId) {
		return productDAO.delete(productId);
	}

	@Override
	public StoreInfo getStoreInfo(Seller seller) {
		return storeInfoDAO.selectById(seller.getSellerId());
	}

	//상품 유효성 검사
	private boolean isBlank(String str) {
	    return str == null || str.trim().isEmpty();
	}
	
	@Override
	public void validateProduct(Product product) {
	    if (product.getSubCategory() == null || product.getSubCategory().getTopCategory() == null) {
	        throw new ProductException("카테고리가 지정되지 않았습니다.");
	    }

	    if (isBlank(product.getProductName())) {
	        throw new ProductException("상품명을 입력해주세요.");
	    }

	    if (isBlank(product.getBrandName())) {
	        throw new ProductException("브랜드명을 입력해주세요.");
	    }

	    if (product.getPrice() <= 0) {
	        throw new ProductException("상품 가격은 0보다 커야 합니다.");
	    }

	    if (product.getDiscount() < 0) {
	        throw new ProductException("할인 가격은 0 이상이어야 합니다.");
	    }

	    if (product.getDiscount() > product.getPrice()) {
	        throw new ProductException("할인 가격은 상품 가격보다 클 수 없습니다.");
	    }

	    if (product.getProductStock() <= 0) {
	        throw new ProductException("상품 재고는 0보다 커야 합니다.");
	    }

	    if (isBlank(product.getModelCode())) {
	        throw new ProductException("모델명을 입력해주세요.");
	    }

	    if (isBlank(product.getOrigin())) {
	        throw new ProductException("원산지를 입력해주세요.");
	    }

	    if (isBlank(product.getIntroduce())) {
	        throw new ProductException("간단소개를 입력해주세요.");
	    }

	    if (isBlank(product.getProductDetail())) {
	        throw new ProductException("상세 설명을 입력해주세요.");
	    }
		
	}

}
