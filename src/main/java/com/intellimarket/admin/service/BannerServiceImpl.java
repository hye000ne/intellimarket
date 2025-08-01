package com.intellimarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.admin.dao.BannerDAO;
import com.intellimarket.admin.domain.Banner;
import com.intellimarket.admin.domain.Banner.BannerStatus;
import com.intellimarket.admin.exception.AdminException;
import com.intellimarket.common.exception.CommonException;
import com.intellimarket.common.util.FileManager;

@Service
public class BannerServiceImpl implements BannerService {
	@Autowired BannerDAO bannerDAO;
	@Autowired FileManager fileManager;
	
	@Override
	public List<Banner> selectAll() {
		return bannerDAO.selectAll();
	}

	@Override
	public List<Banner> selectByStatus(String status) {
		return bannerDAO.selectByStatus(status);
	}
	
	@Override
	public Banner selectById(int bannerId) {
		Banner banner = bannerDAO.selectById(bannerId);
		if(banner == null) throw new AdminException("해당 배너를 찾을 수 없습니다.");
		return banner;
	}

	@Override
	public void regist(Banner banner, String savepath) {
		
		try {
			// 1. 이미지 저장
			fileManager.save(banner, savepath);
			
			// 2.DB 저장
			int result = bannerDAO.regist(banner);
			if(result <= 0) throw new AdminException("배너 정보 저장에 실패했습니다.");
		} catch (CommonException e) {
			throw new AdminException("배너 이미지 저장에 실패했습니다.", e);
		}
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
	public void deleteBanner(int bannerId, String savePath) {
		Banner banner = selectById(bannerId); // null 체크, 예외 처리 포함
		fileManager.remove(banner, savePath); // 실제 파일 삭제
		int result = bannerDAO.deleteBanner(bannerId); //DB 삭제
		if(result <= 0) throw new AdminException("배너 삭제 처리에 실패했습니다.");
	}
}
