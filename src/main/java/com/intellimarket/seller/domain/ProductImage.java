package com.intellimarket.seller.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ProductImage")
public class ProductImage {
	private int productImageId;
	private String filename;
	private Product product;
}
