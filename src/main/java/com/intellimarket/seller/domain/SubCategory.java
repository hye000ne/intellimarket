package com.intellimarket.seller.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("SubCategory")
public class SubCategory {
	private int subCategoryId;
	private String categoryName;
	private TopCategory topCategory;
}
