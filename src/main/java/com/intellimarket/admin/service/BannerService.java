package com.intellimarket.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.intellimarket.admin.domain.Banner;
import com.intellimarket.admin.domain.Banner.BannerStatus;

@Service
public interface BannerService {
	List<Banner> selectAll();
	Banner selectById(int bannerId);
	void regist(Banner banner);
	void updateBanner(Banner banner);
	void updateBannerStatus(int bannerId, BannerStatus status);
	void deleteBanner(int bannerId);
}
