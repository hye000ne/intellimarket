package com.intellimarket.common.exception;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.intellimarket.admin.exception.AdminException;
import com.intellimarket.shop.exception.ShopException;
import com.intellimarket.store.exception.SellerException;

import lombok.extern.slf4j.Slf4j;

/**
 * 전역 예외 처리 클래스
 * - 모든 컨트롤러에서 발생하는 예외를 일괄 처리
 * - API 응답(JSON)과 페이지 응답(JSP)을 구분해서 처리
 * @author 혜원
 */
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

	/**
     * 404 Not Found 예외 처리
     * - 존재하지 않는 URL 요청 시 404.jsp로 포워딩
     */
    @ExceptionHandler(NoHandlerFoundException.class)
    public String handle404(NoHandlerFoundException e) {
    	e.printStackTrace();
        return "common/error/404";
    }

    /**
	 * 그 외 모든 예외 처리 (500 에러) - 정의되지 않은 예외는 500.jsp로 포워딩
	 */
    @ExceptionHandler(Exception.class)
   public String handleException(Exception e) {
  	e.printStackTrace();
       return "common/error/500";
    }
    
    /**
     * 비즈니스 로직에서 발생하는 커스텀 예외 처리 (JSON 응답)
     * - ShopException, AdminException, SellerException 등에서 공통 처리
     * - 클라이언트에 status, msg 반환
     */
    @ExceptionHandler({ShopException.class, AdminException.class, CommonException.class, SellerException.class})
    @ResponseBody
    public Map<String, Object> handleBusinessException(RuntimeException e) {
        Map<String, Object> res = new HashMap<>();
        res.put("status", "fail");
        res.put("msg", e.getMessage());
        return res;
    }
}