package com.intellimarket.shop.domain;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.intellimarket.store.domain.Product;

import lombok.Data;

@Data
@Alias("Cart")
public class Cart {
	
	private int cartId;
	
	private int quantity;
	
	private Member member;
	
	private Product product;
}
