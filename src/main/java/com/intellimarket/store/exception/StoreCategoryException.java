package com.intellimarket.store.exception;

public class StoreCategoryException extends RuntimeException{
	public StoreCategoryException(String msg, Exception e) {
		super(msg, e);
	}
	
	public StoreCategoryException(String msg) {
		super(msg);
	}
	
	public StoreCategoryException(Exception e) {
		super(e);
	}
}
