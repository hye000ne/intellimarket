package com.intellimarket.shop.service;

import java.util.List;

import com.intellimarket.shop.domain.Cart;

public interface CartService {
	Cart selectById(int cart_id);
	
	List<Cart> selectAll();
	
	List<Cart> selectAllByMemberId(int member_id);
	
	void insert(Cart cart);
	
	void updateQuantity(int quantity);
	
	void delete(int cart_id);
}
