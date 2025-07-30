package com.intellimarket.store.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("RootCategory")
public class RootCategory {
	private int rootCategoryId;
	private String categoryName;
	private List<TopCategory> topList;
}
