package com.intellimarket.shop.domain;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import com.intellimarket.store.domain.Product;
import com.intellimarket.store.domain.StoreInfo;

import lombok.Data;

@Data
@Alias("Order")
public class Order {
	private int orderId;
	
	private String merchantUid;
	
	private int quantity;
	
	private int zipCode;
	
	private String address;
	
	private String detailAddress;
	
	private LocalDate createdDate;
	
	private LocalDate updatedDate;
	
	private int totalPrice;
	
	private OrderStatus orderStatus;
	
	private Member member;
	
	private Product product;
	
	private StoreInfo storeInfo;
}