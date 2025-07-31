package com.intellimarket.store.domain;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("Product")
public class Product {
	private int productId;
	private String productName;
	private String brandName;
	private int price;
	private int discount;
	private int productStock;
	private String introduce;
	private String productDetail;
	private String modelCode;
	private String origin;
	private ProductStatus status;
	private int salesCount;
	
	private LocalDateTime createdDate;
	private LocalDateTime updatedDate;
	
	private SubCategory subCategory;
	private MarketEvent marketEvent;
	private Seller seller;
	
	private MultipartFile[] photo;
	private List<ProductImage> imgList;
}
