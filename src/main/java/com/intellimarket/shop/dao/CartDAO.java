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
	
	List<Cart> selectAllByStatus(int member_id);
	
	int insert(Cart cart);
	
	int updateQuantity(Cart cart);
	
	int delete(int cart_id);
}
