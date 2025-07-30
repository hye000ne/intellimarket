package com.intellimarket.admin.service;

import org.springframework.stereotype.Service;

@Service
public class AdminSellerServiceImpl implements AdminSellerService {
	@Override
	public boolean changeApprovalStatus(int sellerId, String status, String msg) {
		return false;
	}
}
