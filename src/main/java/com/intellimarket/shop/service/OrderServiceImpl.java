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
	public Order selectById(int orderId) {
		return ordersDAO.selectById(orderId);
	}

	@Override
	public List<Order> selectByStoreInfoId(int storeInfoId) {
		return ordersDAO.selectByStoreInfoId(storeInfoId);
	}

	@Override
	public void insert(Order order) {
		ordersDAO.insert(order);
	}

	@Override
	public void update(Order order) {
		ordersDAO.update(order);		
	}

	@Override
	public void delete(int orderId) {
		ordersDAO.delete(orderId);
	}
}
