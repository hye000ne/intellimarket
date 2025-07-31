package com.intellimarket.admin.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Banner")
public class Banner {
	private int bannerId;
	private String title;
	private String imagePath;
	private BannerStatus status;
	private String linkURl;
	
	public enum BannerStatus { Y, N }
}
