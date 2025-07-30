package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.intellimarket.store.dao.SubCategoryDAO;
import com.intellimarket.store.domain.SubCategory;

public class SubCategoryServiceImpl implements SubCategoryService{
	@Autowired SubCategoryDAO subCategoryDAO;
	
	@Override
	public List selectAll() {
		return subCategoryDAO.selectAll();
	}

	@Override
	public List selectByTopCategoryId(int topCategoryId) {
		return subCategoryDAO.selectByTopCategoryId(topCategoryId);
	}

	@Override
	public SubCategory select(int subCategoryId) {
		return subCategoryDAO.select(subCategoryId);
	}

}
