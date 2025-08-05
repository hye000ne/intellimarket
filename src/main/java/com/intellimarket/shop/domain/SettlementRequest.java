package com.intellimarket.shop.domain;

import com.intellimarket.store.domain.Product;

import lombok.Data;

@Data
public class SettlementRequest {
	private String merchantUid;
    private int quantity;
    private int price;
    private OrderStatus status;
    private Product product;
    private Order order;
}
