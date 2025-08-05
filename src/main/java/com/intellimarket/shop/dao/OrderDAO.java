package com.intellimarket.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.intellimarket.shop.domain.Order;
import com.intellimarket.shop.domain.OrderStatus;

@Repository
public interface OrderDAO {
	List<Order> selectAll();
	
	Order selectById(int orderId);
	
	List<Order> selectByStoreInfoId(int storeInfoId);
	
	List<Order> selectByMerchantUid(@Param("merchantUid") String merchantUid, @Param("memberId") int memberId);
	
	List<Order> selectByMemberId(int memberId);
	
	int insert(Order order);
	
	void update(Order order);
	
    void updateStatus(Order order);
    
    void updateStatuses(@Param("orderIds") List<Integer> orderIds, @Param("status") OrderStatus status);
	
	void delete(int orderId);
}
