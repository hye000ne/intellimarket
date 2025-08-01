package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.store.dao.SubCategoryDAO;
import com.intellimarket.store.domain.SubCategory;

@Service
public class SubCategoryServiceImpl implements SubCategoryService{
	@Autowired SubCategoryDAO subCategoryDAO;
	
	@Override
	public List selectAll() {
		return subCategoryDAO.selectAll();
	}

	@Override
	public List selectById(int topCategoryId) {
		return subCategoryDAO.selectById(topCategoryId);
	}

	@Override
	public SubCategory select(int subCategoryId) {
		return subCategoryDAO.select(subCategoryId);
	}

	@Override
	public List selectByStoreTop(int storeInfoId, int topCategoryId) {
		return subCategoryDAO.selectByStoreTop(storeInfoId, topCategoryId);
	}

}
