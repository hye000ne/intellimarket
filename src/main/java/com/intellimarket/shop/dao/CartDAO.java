package com.intellimarket.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.intellimarket.shop.domain.Cart;

import lombok.Data;

@Repository
public interface CartDAO {
	Cart selectById(int cart_id);
	
	List<Cart> selectAll();
	
	List<Cart> selectAllByMemberId(int member_id);
	
	void insert(Cart cart);
	
	int updateQuantity(@Param("cartId") int cartId, @Param("quantity") int quantity);
	
	int delete(int cart_id);
}
