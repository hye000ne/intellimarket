package com.intellimarket.shop.service;

import java.util.List;

import com.intellimarket.shop.domain.Order;

public interface OrderService {
	List<Order> selectAll();
	
	Order selectById(int orderId);

	List<Order> selectByStoreInfoId(int storeInfoId);
	
	void insert(Order order);
	
	void update(Order order);
	
	void delete(int orderId);
}
