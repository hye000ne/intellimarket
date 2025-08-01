package com.intellimarket.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.shop.domain.Cart;

import lombok.Data;

@Repository
public interface CartDAO {
	Cart selectById(int cart_id);
	
	List<Cart> selectAll();
	
	List<Cart> selectAllByMemberId(int member_id);
	
	void insert(Cart cart);
	
	void updateQuantity(int quantity);
	
	void delete(int cart_id);
}
