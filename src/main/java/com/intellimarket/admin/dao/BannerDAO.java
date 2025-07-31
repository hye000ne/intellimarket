package com.intellimarket.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.intellimarket.admin.domain.Banner;

@Repository
public interface BannerDAO {
	public List<Banner> selectAll();
	public Banner selectById(int bannerId);
	public int regist(Banner banner);
	public int updateBanner(Banner banner);
	public int updateBannerStatus(Banner banner);
	public int deleteBanner(int bannerId);
}
