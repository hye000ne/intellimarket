package com.intellimarket.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.shop.domain.Order;

@Repository
public interface OrderDAO {
	List<Order> selectAll();
	
	Order selectById(int orderId);
	
	List<Order> selectByStoreInfoId(int storeInfoId);
	
	void insert(Order order);
	
	void update(Order order);
	
	void updateStatus(Order order);
	
	void delete(int orderId);
}
