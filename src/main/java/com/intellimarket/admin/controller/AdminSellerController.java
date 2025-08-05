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

import com.intellimarket.common.service.MailService;
import com.intellimarket.common.util.SessionUtil;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.SellerStatus;
import com.intellimarket.store.service.SellerService;


/**
 * 관리자 판매자 기능 관련 컨트롤러
 * @author 혜원
 */
@Controller
@RequestMapping("/admin/seller")
public class AdminSellerController {
	
	@Autowired MailService mailService;
	@Autowired SellerService sellerService;
	/**
	 * 판매자 가입 승인 페이지
	 */
	@GetMapping("/approval")
	public String approvalPage(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
		if (member == null) return "layout/shop";
		
		SellerStatus status = SellerStatus.valueOf("PENDING"); // 판매자 상태 : 대기
		model.addAttribute("list", sellerService.selectByStatus(status));
		model.addAttribute("contentPage", "admin/seller/approval.jsp");
		model.addAttribute("menuGroup", "seller");
		model.addAttribute("subMenu", "approval");
		return "layout/admin";
	}
	
	/**
	 * 판매자 상태 변경
	 */
	@PostMapping("/changeSellerStatus")
	public String changeSellerStatus(
				@RequestParam int sellerId,
				@RequestParam SellerStatus status,
				@RequestParam(required = false) String msg,
				RedirectAttributes redirectAttr) {
		Seller seller = sellerService.selectById(sellerId);
		seller.setStatus(status);
		
		String toEmail = seller.getEmail();
		String subject="";
		String text ="";
		
		
		if(msg != null) {
			seller.setRejectMsg(msg);
			subject = "[IntelliMarket] 인텔리마켓 판매자 신청이 반려 되었습니다!";
			text = seller.getName() + " 판매자님 안녕하세요. 인텔리마켓 입니다. 판매자 신청이 다음과 같은 사유로 반려되었습니다 [사유: "+msg+"]";
		} else {
			subject = "[IntelliMarket] 인텔리마켓 판매자 신청이 승인 되었습니다!";
			text = seller.getName() + " 판매자님 안녕하세요. 인텔리마켓 비즈니스 담당자 입니다. 판매자 신청이 정상 승인되었습니다.";
		}
		
		try {
			sellerService.updateStatus(seller);
			redirectAttr.addFlashAttribute("msg", "판매자 "+ status.getLabel() +" 처리가 완료되었습니다.");
			// 이메일 발송

		} catch (Exception e) {
			redirectAttr.addFlashAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		mailService.sendMail(toEmail, subject, text);
		return "redirect:/admin/seller/approval";
	}
	
	/**
	 * 판매자 목록 페이지
	 */
	@GetMapping("/list")
	public String sellerListPage(Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
		if (member == null) return "layout/shop";
		
		SellerStatus status = SellerStatus.valueOf("APPROVED"); // 판매자 상태 : 승인
		model.addAttribute("list", sellerService.selectByStatus(status));
		model.addAttribute("contentPage", "admin/seller/list.jsp");
		model.addAttribute("menuGroup", "seller");
		model.addAttribute("subMenu", "sellerList");
		return "layout/admin";
	}
	
	/**
	 * 판매자 상세 페이지 
	 */
	@GetMapping("/detail")
	public String sellerDetailPage(@RequestParam int sellerId, Model model, HttpSession session) {
		// 로그인 사용자 세션 확인
		Member member = SessionUtil.getLoginMember(session, model, "shop/common/loginFailAlert.jsp", Member.Role.ADMIN);
		if (member == null) return "layout/shop";
		
		model.addAttribute("seller", sellerService.selectById(sellerId));
		model.addAttribute("contentPage", "admin/seller/detail.jsp");
		model.addAttribute("menuGroup", "seller");
		model.addAttribute("subMenu", "sellerList");
		return "layout/admin";
	}
}
