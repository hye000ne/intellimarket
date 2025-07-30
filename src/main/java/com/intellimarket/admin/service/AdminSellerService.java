package com.intellimarket.admin.service;

public interface AdminSellerService {
	boolean changeApprovalStatus(int sellerId, String status, String msg);
}
