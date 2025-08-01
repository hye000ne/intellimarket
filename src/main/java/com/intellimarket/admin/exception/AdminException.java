package com.intellimarket.admin.exception;

public class AdminException extends RuntimeException {
	public AdminException(String msg, Exception e) {
		super(msg, e);
	}
	
	public AdminException(String msg) {
		super(msg);
	}
	
	public AdminException(Exception e) {
		super(e);
	}
}