package com.intellimarket.shop.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intellimarket.shop.domain.Cart;

public interface CartService {
	Cart selectById(int cart_id);
	
	List<Cart> selectAll();
	
	List<Cart> selectAllByMemberId(int member_id);
	
	List<Cart> selectAllByStatus(int member_id);
	
	int insert(Cart cart);
	
	int updateQuantity(Cart cart);

	int delete(int cart_id);
	
	int deleteByMemberIdAndProductIds(int memberId, List<Integer> productIds);
}
