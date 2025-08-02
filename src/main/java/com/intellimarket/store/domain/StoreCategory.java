package com.intellimarket.store.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("StoreCategory")
public class StoreCategory {
    private int storeCategoryId;
    private StoreInfo storeInfo;
    private SubCategory subCategory;
}
