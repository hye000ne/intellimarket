package com.intellimarket.shop.dao;

import org.springframework.stereotype.Repository;

import com.intellimarket.shop.domain.Orders;

@Repository
public interface OrdersDAO {
	void insertPayment(Orders payment);
	
	Orders selectPayment(String impUid);
}
