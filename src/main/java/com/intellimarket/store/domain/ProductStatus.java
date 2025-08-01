package com.intellimarket.store.domain;

public enum ProductStatus {
	ACTIVATE("활성화"),
	INACTIVATE("비활성화");

	private final String label;

	ProductStatus(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}
}
