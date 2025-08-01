package com.intellimarket.admin.domain;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("Banner")
public class Banner {
	private int bannerId;
	private String title;
	private String imagePath;
	private BannerStatus status;
	private String linkUrl;
	private LocalDate createdDate;
	
	// 업로드한 이미지 파일
	private MultipartFile imageFile;
	
	public enum BannerStatus { Y, N }
}
