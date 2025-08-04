package com.intellimarket.shop.domain;

public enum OrderStatus {
	ORDER_CONFIRMED("주문확인중"),       
    PREPARING_SHIPMENT("배송준비중"),    
    IN_TRANSIT("배송중"),            
    DELIVERED("배송완료"),              
    CANCEL("취소"),     
    CHANGE("교환"),
    RETURN("환불"),
    CANCEL_COMPLETE("취소완료"),     
    CHANGE_COMPLETE("교환완료"),
    RETURN_COMPLETE("환불완료");
    
    private final String label;

    OrderStatus(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}
}
