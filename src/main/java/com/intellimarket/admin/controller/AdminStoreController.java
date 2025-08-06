package com.intellimarket.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.intellimarket.common.util.SessionUtil;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.Settlement;
import com.intellimarket.store.domain.SettlementStatus;
import com.intellimarket.store.service.SettlementService;
import com.intellimarket.store.service.StoreInfoService;

/**
 * 관리자 스토어 기능 관련 컨트롤러
 * @author 혜원
 */
@Controller
@RequestMapping("/admin/store")
public class AdminStoreController {
	@Autowired StoreInfoService storeInfoService;
	@Autowired SettlementService settlementService;

	/**
	 * 스토어 목록 페이지
	 */
	@GetMapping("/list")
	public String storeListPage(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
		if (member == null) return "layout/shop";
		
		model.addAttribute("list", storeInfoService.selectAll());
		model.addAttribute("contentPage", "admin/store/list.jsp");
		model.addAttribute("menuGroup", "store");
		model.addAttribute("subMenu", "storeList");
		return "layout/admin";
	}
	
	/**
	 * 스토어 상세 페이지 
	 */
	@GetMapping("/detail")
	public String storeDetailPage(@RequestParam int sellerId, Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
		if (member == null) return "layout/shop";
		
		Seller seller = new Seller();
		seller.setSellerId(sellerId);
		
		model.addAttribute("store", storeInfoService.selectById(seller));
		model.addAttribute("contentPage", "admin/store/detail.jsp");
		model.addAttribute("menuGroup", "store");
		model.addAttribute("subMenu", "storeList");
		return "layout/admin";
	}
	
	/**
	 * 스토어 정산관리 페이지
	 */
	@GetMapping("/settlement")
	public String storeSettlementPage(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
		if (member == null) return "layout/shop";
		
		SettlementStatus status = SettlementStatus.valueOf("REQUESTED"); // 정산 상태: 요청
		
//		model.addAttribute("list", settlementService.selectByStatus(status));
		model.addAttribute("list", settlementService.selectAll());
		model.addAttribute("contentPage", "admin/store/settlement.jsp");
		model.addAttribute("menuGroup", "store");
		model.addAttribute("subMenu", "storeSettlement");
		return "layout/admin";
	}
	
	/**
	 * 스토어 정산처리
	 */
	@PostMapping("/settlement")
	public String storeSettlement(
				@RequestParam int settlementId,
				@RequestParam int netAmount,
				RedirectAttributes redirectAttr) {
		SettlementStatus status = SettlementStatus.valueOf("COMPLETED"); // 정산 상태: 완료
		
		Settlement settlement = new Settlement();
		settlement.setSettlementId(settlementId);
		settlement.setNetAmount(netAmount);
		settlement.setSettlementStatus(status);
		
		try {
			settlementService.updateStatus(settlement);
			redirectAttr.addFlashAttribute("msg", "정산 승인 처리가 완료되었습니다.");
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/admin/store/settlement";
	}
}