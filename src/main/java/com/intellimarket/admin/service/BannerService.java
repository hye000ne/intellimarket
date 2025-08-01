package com.intellimarket.admin.service;

import java.util.List;

import com.intellimarket.admin.domain.Banner;
import com.intellimarket.admin.domain.Banner.BannerStatus;

public interface BannerService {
	List<Banner> selectAll();
	List<Banner> selectByStatus(String status);
	Banner selectById(int bannerId);
	void regist(Banner banner, String savepath);
	void updateBanner(Banner banner);
	void updateBannerStatus(int bannerId, BannerStatus status);
	void deleteBanner(int bannerId, String savePath);
}
