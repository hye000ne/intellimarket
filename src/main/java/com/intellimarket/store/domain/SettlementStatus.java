package com.intellimarket.store.domain;

public enum SettlementStatus {
	READY("정산 대기"),       
	REQUESTED("정산 요청"),    
	COMPLETED("정산 완료"),            
	FAILED("정산 실패");
    
    private final String label;

    SettlementStatus(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

}
