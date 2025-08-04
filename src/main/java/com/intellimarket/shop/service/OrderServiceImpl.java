package com.intellimarket.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.shop.dao.OrderDAO;
import com.intellimarket.shop.domain.Order;
import com.intellimarket.shop.domain.OrderStatus;

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
	public List<Order> selectByMerchantUid(String merchantUid, int memberId) {
		return orderDAO.selectByMerchantUid(merchantUid, memberId);
	}

	@Override
	public List<Order> selectByMemberId(int memberId) {
		return orderDAO.selectByMemberId(memberId);
	}

	@Override
	public int insert(Order order) {
		return orderDAO.insert(order);
	}

	@Override
	public void update(Order order) {
		orderDAO.update(order);		
	}

    // 단건
    @Override
    public void updateStatus(int orderId, OrderStatus status) {
        Order order = new Order();
        order.setOrderId(orderId);
        order.setOrderStatus(status);
        orderDAO.updateStatus(order);
    }

    // 복수건
    @Override
    public void updateStatuses(List<Integer> orderIds, OrderStatus status) {
    	orderDAO.updateStatuses(orderIds, status);
    }

	@Override
	public void delete(int orderId) {
		orderDAO.delete(orderId);
	}
}
