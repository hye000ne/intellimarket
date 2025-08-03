package com.intellimarket.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.shop.domain.Order;

@Repository
public interface OrderDAO {
	List<Order> selectAll();
	
	List<Order> selectById(int ordersId);
	
	List<Order> selectByStoreInfoId(int storeInfoId);
	
	void insert(Order orders);
	
	void update(Order orders);
	
	void delete(int ordersId);
}
