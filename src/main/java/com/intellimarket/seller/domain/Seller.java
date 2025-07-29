package com.intellimarket.seller.domain;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Seller")
public class Seller {
	private int sellerId;
	private String email;
	private String password;
	private int zipCode;
	private String address;
	private String detailAddress;
	private String tel;
	private String businessNum;
	private SellerStatus status;
	private StoreInfo storeInfo;
	
	private LocalDateTime createDate;
	private LocalDateTime updatedDate;
}
