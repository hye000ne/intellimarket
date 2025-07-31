package com.intellimarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.intellimarket.admin.dao.BannerDAO;
import com.intellimarket.admin.domain.Banner;
import com.intellimarket.admin.domain.Banner.BannerStatus;
import com.intellimarket.admin.exception.AdminException;

public class BannerServiceImpl implements BannerService {
	@Autowired BannerDAO bannerDAO;
	
	@Override
	public List<Banner> selectAll() {
		return bannerDAO.selectAll();
	}

	@Override
	public Banner selectById(int bannerId) {
		Banner banner = bannerDAO.selectById(bannerId);
		if(banner == null) throw new AdminException("해당 배너를 찾을 수 없습니다.");
		return banner;
	}

	@Override
	public void regist(Banner banner) {
		int result = bannerDAO.regist(banner);
		if(result <= 0) throw new AdminException("배너 등록 처리에 실패했습니다.");
	}

	@Override
	public void updateBanner(Banner banner) {
		int result = bannerDAO.updateBanner(banner);
		if(result <= 0) throw new AdminException("배너 수정 처리에 실패했습니다.");
	}

	@Override
	public void updateBannerStatus(int bannerId, BannerStatus status) {
		Banner banner = new Banner();
		banner.setBannerId(bannerId);
		banner.setStatus(status);
		
		int result = bannerDAO.updateBannerStatus(banner);
		if(result <= 0) throw new AdminException("배너 상태 변경 처리에 실패했습니다.");
	}

	@Override
	public void deleteBanner(int bannerId) {
		int result = bannerDAO.deleteBanner(bannerId);
		if(result <= 0) throw new AdminException("배너 삭제 처리에 실패했습니다.");
	}
}
