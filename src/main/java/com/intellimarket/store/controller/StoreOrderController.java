package com.intellimarket.store.controller;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.intellimarket.shop.domain.Order;
import com.intellimarket.shop.domain.OrderStatus;
import com.intellimarket.shop.service.OrderService;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.service.ProductService;

import lombok.extern.slf4j.Slf4j;

/**
 * 주문 기능 관련 컨트롤러
 * @author 지훈
 */

@Slf4j
@Controller
@RequestMapping("/store/seller/manage/order")
public class StoreOrderController {
	@Autowired ProductService productService;
	@Autowired OrderService orderService;
	
	/**
	 * 판매자 주문 리스트 페이지
	 */
	@GetMapping("/list")
	public String adminProductList(Model model , HttpSession session) {
		Seller loginSeller = (Seller) session.getAttribute("loginSeller");
		StoreInfo storeInfo = productService.getStoreInfo(loginSeller);
		int storeInfoId = storeInfo.getStoreInfoId();
		model.addAttribute("list", orderService.selectByStoreInfoId(storeInfoId));
		model.addAttribute("contentPage", "store/seller/order/orderList.jsp");
		return "layout/store";
	}
	
	/**
	 * 주문 상태 단건 / 복수건 변경
	 * */
	@PostMapping("/updateOrderStatus")
	public String updateOrderStatus(
	        @RequestParam(required = false) Integer orderId,
	        @RequestParam(required = false) String orderIds,
	        @RequestParam("status") OrderStatus status,
	        RedirectAttributes redirectAttributes) {
	    try {
	        if (orderId != null) {
	            orderService.updateStatus(orderId, status);
	            redirectAttributes.addFlashAttribute("msg", "주문 상태가 변경되었습니다.");
	        } else if (orderIds != null && !orderIds.isEmpty()) {
	            List<Integer> idList = Arrays.stream(orderIds.split(","))
	                                         .map(String::trim)
	                                         .map(Integer::parseInt)
	                                         .collect(Collectors.toList());
	            orderService.updateStatuses(idList, status);
	            redirectAttributes.addFlashAttribute("msg", "선택된 주문들의 상태가 변경되었습니다.");
	        } else {
	            redirectAttributes.addFlashAttribute("msg", "변경할 주문을 선택해주세요.");
	        }
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("msg", "주문 상태 변경 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return "redirect:/store/seller/manage/order/list";
	}
	
	/**
	 * 주문 수취인 주소 수정 요청
	 * */
	@PostMapping("/update")
	@ResponseBody
	public Map<String, Object> updateOrderAddress(@ModelAttribute Order order) {
	    Map<String, Object> res = new HashMap<>();
	    try {
	        // updatedDate는 서버에서 현재시간으로 세팅해주는게 좋음
	        order.setUpdatedDate(LocalDate.now());
	        
	        orderService.update(order);
	        
	        res.put("status", "ok");
	        res.put("msg", "배송지 정보가 변경되었습니다.");
	    } catch (Exception e) {
	        res.put("status", "fail");
	        res.put("msg", "배송지 정보 변경 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return res;
	}
	
	/**
	 * 판매자 주문 상세 / 수정 페이지
	 * */
	@GetMapping("/detail")
	public String memberDetailPage(@RequestParam int orderId, @RequestParam(required = false, defaultValue = "detail") String mode, Model model) {
		model.addAttribute("order", orderService.selectById(orderId));
		model.addAttribute("mode", mode); // detail, edit
		model.addAttribute("contentPage", "store/seller/order/orderDetail.jsp");
		return "layout/store";
	}
	
	
}
