package com.intellimarket.store.domain;

public enum SellerStatus {
	PENDING("대기"),
	APPROVED("승인"),
	REJECTED("반려"),
	SUSPENDED("정지");

	private final String label;

	SellerStatus(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}
}