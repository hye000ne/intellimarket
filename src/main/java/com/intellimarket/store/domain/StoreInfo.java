package com.intellimarket.store.domain;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("StoreInfo")
public class StoreInfo {
	private int storeInfoId;
	private String storeName;
	private String storeTel;
	private String logoPath;
	private String storeIntroduce;
	private String engName;

	private Seller seller;
	
	private MultipartFile imageFile;
}
