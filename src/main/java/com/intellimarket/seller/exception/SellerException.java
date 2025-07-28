package com.intellimarket.seller.exception;

public class SellerException extends RuntimeException{
	public SellerException(String msg, Exception e) {
		super(msg, e);
	}
	
	public SellerException(String msg) {
		super(msg);
	}
	
	public SellerException(Exception e) {
		super(e);
	}
}
