package com.intellimarket.shop.service;

import java.util.List;

import com.intellimarket.shop.domain.Order;

public interface OrderService {
	List<Order> selectAll();
	
	List<Order> selectById(int ordersId);

	List<Order> selectByStoreInfoId(int storeInfoId);
	
	void insert(Order orders);
	
	void update(Order orders);
	
	void delete(int ordersId);
}
