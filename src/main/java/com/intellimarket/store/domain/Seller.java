  package com.intellimarket.store.domain;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Seller")
public class Seller {
	private int sellerId;
	private String email;
	private String password;
	private String name;
	private int zipCode;
	private String address;
	private String detailAddress;
	private String tel;
	private String businessNum;
	private SellerStatus status;
	private String rejectMsg;
	private String accountNum;
	private String bank;
	
	private LocalDateTime createdDate;
	private LocalDateTime updatedDate;
}
