package com.intellimarket.store.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("RootCategory")
public class RootCategory {
	private int rootCategoryId;
	private String categoryName;
}
