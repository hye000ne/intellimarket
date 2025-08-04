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
	public List<Cart> selectAllByStatus(int member_id) {
		return cartDAO.selectAllByStatus(member_id);
	}

	@Override
	public int insert(Cart cart) {
		return cartDAO.insert(cart);
	}

	@Override
	public int updateQuantity(Cart cart) {
		return cartDAO.updateQuantity(cart);
	}

	@Override
	public int delete(int cart_id) {
		return cartDAO.delete(cart_id);
	}
}
