package com.intellimarket.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.shop.dao.OrdersDAO;
import com.intellimarket.shop.domain.Orders;

@Service
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersDAO paymentDAO;
	
	@Override
	public void insertPayment(Orders payment) {
		
		
	}

	@Override
	public Orders selectPayment(String impUid) {
		
		return null;
	}

}
