package com.intellimarket.seller.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("TopCategory")
public class TopCategory {
	private int topCategoryId;
	private String categoryName;
	private RootCategory rootCategory;
}
