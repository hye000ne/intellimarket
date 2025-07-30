package com.intellimarket.store.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.service.StoreInfoService;

import lombok.extern.slf4j.Slf4j;

/**
 * 판매자 기능 관련 컨트롤러
 * @author 재환
 */
@Slf4j
@Controller
@RequestMapping("/seller/storeinfo")
public class StoreInfoController {

	@Autowired
	StoreInfoService storeInfoService;
	
	/**
	 * 스토어 정보 입력 처리
	 * - 이메일, 사업자번호 중복 검증 후 DB 등록
	 */
	
	@PostMapping("/regist")
	@ResponseBody
	public Map<String, Object> join(@ModelAttribute StoreInfo storeInfo, HttpSession session){
	    // 세션에서 로그인한 판매자 정보 꺼내기
	    Seller loginSeller = (Seller) session.getAttribute("loginSeller");
	    
	    if (loginSeller == null) {
	        Map<String, Object> res = new HashMap<>();
	        res.put("status", "fail");
	        res.put("msg", "로그인이 필요합니다.");
	        return res;
	    }
	    
	 // StoreInfo 객체에 로그인한 판매자의 ID(또는 Seller 객체) 설정
	    storeInfo.setSeller(loginSeller);
	    // 또는 storeInfo.setSellerId(loginSeller.getSellerId()); 
	    // (만약 seller 객체가 아닌 sellerId만 필드로 가지고 있다면)

	    storeInfoService.insert(storeInfo);
	    Map<String, Object> res = new HashMap<>();
	    res.put("status", "ok");
	    res.put("msg", "스토어 등록이 완료되었습니다");
	    return res;
	}
	
	
}
