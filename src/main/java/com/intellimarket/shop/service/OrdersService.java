package com.intellimarket.shop.service;

import com.intellimarket.shop.domain.Orders;

public interface OrdersService {
	void insertPayment(Orders payment);
	
	Orders selectPayment(String impUid);
}
