package com.intellimarket.shop.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intellimarket.shop.domain.Order;
import com.intellimarket.shop.domain.OrderStatus;

public interface OrderService {
	List<Order> selectAll();
	
	Order selectById(int orderId);

	List<Order> selectByStoreInfoId(int storeInfoId);
	
	List<Order> selectByMerchantUid(@Param("merchantUid") String merchantUid, @Param("memberId") int memberId);
	
	List<Order> selectByMemberId(int memberId);
	
	int insert(Order order);
	
	void update(Order order);
	
    void updateStatus(int orderId, OrderStatus status);
    
    void updateStatuses(List<Integer> orderIds, OrderStatus status);
	
	int delete(int orderId);
}
