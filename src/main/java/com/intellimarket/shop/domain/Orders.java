package com.intellimarket.shop.domain;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
@Alias("Payment")
public class Orders {
	@JsonProperty("imp_uid")
	private String impUid;
	
	@JsonProperty("merchant_uid")
	private String merchantUid;
	
	@JsonProperty("name")
	private String name;
}