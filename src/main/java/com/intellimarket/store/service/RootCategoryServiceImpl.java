package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.intellimarket.store.dao.RootCategoryDAO;
import com.intellimarket.store.domain.RootCategory;

public class RootCategoryServiceImpl implements RootCategoryService{
	@Autowired RootCategoryDAO rootCategoryDAO;
	
	@Override
	public List selectAll() {
		return rootCategoryDAO.selectAll();
	}

	@Override
	public RootCategory select(int rootCategoryId) {
		return rootCategoryDAO.select(rootCategoryId);
	}

}
