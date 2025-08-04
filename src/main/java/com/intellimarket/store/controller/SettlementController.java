package com.intellimarket.store.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.service.ProductService;
import com.intellimarket.store.service.SettlementService;

import lombok.extern.slf4j.Slf4j;

/**
 * 정산 기능 관련 컨트롤러
 * @author 지훈
 */

@Slf4j
@Controller
@RequestMapping("/store/seller/manage/settlement")
public class SettlementController {
	@Autowired ProductService productService;
	@Autowired SettlementService settlementService;
	
	/**
	 * 판매자 정산 요약 페이지
	 */
	@GetMapping("/summery")
	public String adminProductList(Model model , @RequestParam(required = false) String year,@RequestParam(required = false) String month, HttpSession session) {
	    //처음 진입 시 , year 와 month는 현재 달로 기본 셋팅
		if (year == null || year.isEmpty()) {
	        year = String.valueOf(LocalDate.now().getYear());
	    }
	    if (month == null || month.isEmpty()) {
	        month = String.format("%02d", LocalDate.now().getMonthValue());
	    }
		
		//로그인한 seller로 부터 storeinfo Id 구하기.
		Seller loginSeller = (Seller) session.getAttribute("loginSeller");
		StoreInfo storeInfo = productService.getStoreInfo(loginSeller);
		int storeInfoId = storeInfo.getStoreInfoId();
		
		//받아온 year 와 month 파라미터 조합하기.
		String formattedMonth = month.length() == 1 ? "0" + month : month;
		String yearMonth = year + "-" + formattedMonth;
		
	    // 상태별 건수
	    int readyCount = settlementService.countByStatusAndId("READY", storeInfoId, yearMonth);
	    int requestedCount = settlementService.countByStatusAndId("REQUESTED", storeInfoId, yearMonth);
	    int completedCount = settlementService.countByStatusAndId("COMPLETED", storeInfoId, yearMonth);

	    // 상태별 금액
	    int readyAmount = settlementService.sumAmountByStatusAndId("READY", storeInfoId, yearMonth);
	    int requestedAmount = settlementService.sumAmountByStatusAndId("REQUESTED", storeInfoId, yearMonth);
	    int completedAmount = settlementService.sumAmountByStatusAndId("COMPLETED", storeInfoId, yearMonth);
	    
	    // 모델에 담기
	    model.addAttribute("readyCount", readyCount);
	    model.addAttribute("requestedCount", requestedCount);
	    model.addAttribute("completedCount", completedCount);
	    model.addAttribute("readyAmount", readyAmount);
	    model.addAttribute("requestedAmount", requestedAmount);
	    model.addAttribute("completedAmount", completedAmount);
	    model.addAttribute("yearMonth", yearMonth);
		
		model.addAttribute("contentPage", "store/seller/settlement/settlementSummery.jsp");
		return "layout/store";
	}
	
	
	@PostMapping("/updatestatus")
	public String updateSettlementStatus(
	    @RequestParam String year,
	    @RequestParam String month,
	    HttpSession session,
	    RedirectAttributes redirectAttributes) {
	    
	    Seller loginSeller = (Seller) session.getAttribute("loginSeller");
	    StoreInfo storeInfo = productService.getStoreInfo(loginSeller);
	    int storeInfoId = storeInfo.getStoreInfoId();

		//받아온 year 와 month 파라미터 조합하기.
		String formattedMonth = month.length() == 1 ? "0" + month : month;
		String yearMonth = year + "-" + formattedMonth;
		
	    int updatedCount = settlementService.updateStatusToRequested(storeInfoId, yearMonth);

	    // redirect 시 메시지 전달
	    redirectAttributes.addFlashAttribute("msg", "총 " + updatedCount + "건이 정산 요청되었습니다.");

	    return "redirect:/store/seller/manage/settlement/summery?year=" + year + "&month=" + month;
	}
}
