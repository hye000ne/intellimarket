package com.intellimarket.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.store.dao.TopCategoryDAO;
import com.intellimarket.store.domain.TopCategory;

@Service
public class TopCategoryServiceImpl implements TopCategoryService{
	@Autowired TopCategoryDAO topCategoryDAO;
	
	@Override
	public List selectAll() {
		return topCategoryDAO.selectAll();
	}

	@Override
	public List selectByRootCategoryId(int rootCategoryId) {
		return topCategoryDAO.selectByRootCategoryId(rootCategoryId);
	}

	@Override
	public TopCategory select(int topCategoryId) {
		return topCategoryDAO.select(topCategoryId);
	}

}
