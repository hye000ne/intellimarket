package com.intellimarket.common.exception;

public class CommonException extends RuntimeException {
    public CommonException(String msg, Exception e) {
        super(msg, e);
    }

    public CommonException(String msg) {
        super(msg);
    }

    public CommonException(Exception e) {
        super(e);
    }
}