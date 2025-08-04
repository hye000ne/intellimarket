package com.intellimarket.store.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.store.dao.ProductDAO;
import com.intellimarket.store.dao.StoreCategoryDAO;
import com.intellimarket.store.dao.StoreInfoDAO;
import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreCategory;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.domain.SubCategory;
import com.intellimarket.store.domain.TopCategory;
import com.intellimarket.store.exception.StoreCategoryException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StoreCategoryServiceImpl implements StoreCategoryService {
	@Autowired
	StoreCategoryDAO storeCategoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	StoreInfoDAO storeInfoDAO;

	@Override
	public List selectById(int storeInfoId) {
		return storeCategoryDAO.selectById(storeInfoId);
	}

	@Override
	public void insert(List<Integer> subCategories, Seller seller) {
		StoreInfo storeInfo = storeInfoDAO.selectById(seller.getSellerId());
		
		List<StoreCategory> storeCategories = new ArrayList<>();
		for (Integer subCategoryId : subCategories) {
			StoreCategory storeCategory = new StoreCategory();

			storeCategory.setStoreInfo(storeInfo);

			SubCategory subCategory = new SubCategory();
		    subCategory.setSubCategoryId(subCategoryId);

		    storeCategory.setSubCategory(subCategory);
		    storeCategories.add(storeCategory);
		}
		storeCategoryDAO.insert(storeCategories);
	}

	// 판매자가 보유한 Subcategories 를 통해 TopCategory를 List로 추출하여 /Store/Admin/ProductList에
	// 사용
	@Override
	public List<TopCategory> getTopCategoryById(int storeInfoId) {
		List<StoreCategory> storeCategories = storeCategoryDAO.selectById(storeInfoId);

		return storeCategories.stream().map(sc -> sc.getSubCategory().getTopCategory()).distinct() // equals & hashCode
																									// properly
																									// implemented in
																									// TopCategory
				.collect(Collectors.toList());
	}

	@Override
	public void update(StoreCategory StoreCategory) {

	}

	@Override
	public Map<TopCategory, List<SubCategory>> getAllCategory(StoreInfo storeInfo) {
	    List<StoreCategory> storeCategoriesFull = storeCategoryDAO.selectRootById(storeInfo.getStoreInfoId());

	    Map<TopCategory, List<SubCategory>> groupedCategories = new LinkedHashMap<>();

	    for(StoreCategory sc : storeCategoriesFull){
	        TopCategory top = sc.getSubCategory().getTopCategory();
	        List<SubCategory> subList = groupedCategories.get(top);
	        if(subList == null) {
	            subList = new ArrayList<>();
	            groupedCategories.put(top, subList);
	        }
	        subList.add(sc.getSubCategory());
	    }
	    return groupedCategories;
	}


	@Override
	public void delete(int storeCategoryId, Seller seller) throws StoreCategoryException{
	    int loginSellerId = seller.getSellerId();

	    // 로그인한 판매자의 스토어 정보 조회
	    int loginStoreInfoId = storeInfoDAO.selectById(loginSellerId).getStoreInfoId();

	    // 삭제 요청 카테고리 정보 조회
	    StoreCategory storeCategory = storeCategoryDAO.selectByStoreCategoryId(storeCategoryId);
	    if (storeCategory == null) {
	        throw new StoreCategoryException("해당 카테고리가 존재하지 않습니다.");
	    }

	    // 권한 체크: 소유 스토어 일치 여부
	    if (loginStoreInfoId != storeCategory.getStoreInfo().getStoreInfoId()) {
	        throw new StoreCategoryException("로그인한 사용자 정보와 일치하지 않는 스토어 카테고리는 삭제할 수 없습니다.");
	    }

	    // 해당 판매자의 상품 목록 조회 및 검사
	    List<Product> products = productDAO.selectById(loginSellerId);
	    if (products == null) {
	        products = new ArrayList<>();
	    }

	    List<String> usedProducts = new ArrayList<>();
	    int delSubCategoryId = storeCategory.getSubCategory().getSubCategoryId();

	    for (Product product : products) {
	        if (delSubCategoryId == product.getSubCategory().getSubCategoryId()) {
	            usedProducts.add(product.getProductName());
	        }
	    }

	    if (!usedProducts.isEmpty()) {
	        throw new StoreCategoryException("등록 되어있는 상품이 해당 카테고리를 사용하고 있습니다. [상품명 : " + String.join(", ", usedProducts) + "]");
	    }

	    storeCategoryDAO.delete(storeCategoryId);
	}
	
	@Override
	public List<StoreCategory> getAllCategoryById(Seller seller) {
		StoreInfo storeInfo = storeInfoDAO.selectById(seller.getSellerId());
		return storeCategoryDAO.selectRootById(storeInfo.getStoreInfoId());
	}


}
