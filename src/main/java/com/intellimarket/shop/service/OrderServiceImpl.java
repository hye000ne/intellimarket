package com.intellimarket.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.shop.dao.OrderDAO;
import com.intellimarket.shop.domain.Order;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO ordersDAO;
	
	@Override
	public List<Order> selectAll() {
		return ordersDAO.selectAll();
	}

	@Override
	public List<Order> selectById(int ordersId) {
		return ordersDAO.selectById(ordersId);
	}

	@Override
	public List<Order> selectByStoreInfoId(int storeInfoId) {
		return ordersDAO.selectByStoreInfoId(storeInfoId);
	}

	@Override
	public void insert(Order orders) {
		ordersDAO.insert(orders);
	}

	@Override
	public void update(Order orders) {
		ordersDAO.update(orders);		
	}

	@Override
	public void delete(int ordersId) {
		ordersDAO.delete(ordersId);
	}
}
