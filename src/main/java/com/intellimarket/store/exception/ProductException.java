package com.intellimarket.store.exception;

public class ProductException extends RuntimeException{
	public ProductException(String msg, Exception e) {
		super(msg, e);
	}
	
	public ProductException(String msg) {
		super(msg);
	}
	
	public ProductException(Exception e) {
		super(e);
	}
}
