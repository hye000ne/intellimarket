package com.intellimarket.storeadmin.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("StoreInfo")
public class StoreInfo {
	private int storeInfoId;
	private String storeName;
	private String storeTel;
	private String logoPath;
}
