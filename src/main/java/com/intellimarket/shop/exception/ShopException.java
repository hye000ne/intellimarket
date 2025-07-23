package com.intellimarket.shop.exception;

public class ShopException extends RuntimeException {
	public ShopException(String msg, Exception e) {
		super(msg, e);
	}
	
	public ShopException(String msg) {
		super(msg);
	}
	
	public ShopException(Exception e) {
		super(e);
	}
}
