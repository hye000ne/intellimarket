package com.intellimarket.store.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("TopCategory")
public class TopCategory {
	private int topCategoryId;
	private String categoryName;
	private List<SubCategory> subList;
	private RootCategory rootCategory;
}
