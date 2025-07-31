package com.intellimarket.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.shop.dao.CartDAO;
import com.intellimarket.shop.domain.Cart;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public Cart selectById(int cart_id) {
		return cartDAO.selectById(cart_id);
	}

	@Override
	public List<Cart> selectAll() {
		return cartDAO.selectAll();
	}

	@Override
	public List<Cart> selectAllByMemberId(int member_id) {
		return cartDAO.selectAllByMemberId(member_id);
	}
	
	@Override
	public void insert(Cart cart) {
		cartDAO.insert(cart);
	}

	@Override
	public void updateQuantity(int quantity) {
		cartDAO.updateQuantity(quantity);
	}

	@Override
	public void delete(int cart_id) {
		cartDAO.delete(cart_id);
	}
}
