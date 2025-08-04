package com.intellimarket.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.shop.dao.OrderDAO;
import com.intellimarket.shop.domain.Order;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public List<Order> selectAll() {
		return orderDAO.selectAll();
	}

	@Override
	public Order selectById(int orderId) {
		return orderDAO.selectById(orderId);
	}

	@Override
	public List<Order> selectByStoreInfoId(int storeInfoId) {
		return orderDAO.selectByStoreInfoId(storeInfoId);
	}

	@Override
	public void insert(Order order) {
		orderDAO.insert(order);
	}

	@Override
	public void update(Order order) {
		orderDAO.update(order);		
	}

	@Override
	public void updateStatus(Order order) {
		orderDAO.updateStatus(order);
	}

	@Override
	public void delete(int orderId) {
		orderDAO.delete(orderId);
	}
}
