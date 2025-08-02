package com.intellimarket.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.StoreCategory;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.domain.SubCategory;
import com.intellimarket.store.domain.TopCategory;
import com.intellimarket.store.exception.StoreCategoryException;
import com.intellimarket.store.service.RootCategoryService;
import com.intellimarket.store.service.StoreCategoryService;
import com.intellimarket.store.service.StoreInfoService;
import com.intellimarket.store.service.SubCategoryService;
import com.intellimarket.store.service.TopCategoryService;

import lombok.extern.slf4j.Slf4j;

/**
 * 판매자 기능 관련 컨트롤러
 * 
 * @author 재환
 */
@Slf4j
@Controller
@RequestMapping("/store/seller/manage/editstore")
public class EditStoreController {
	
	@Autowired
	StoreCategoryService storeCategoryService;

	@Autowired
	StoreInfoService storeInfoService;

	@Autowired
	RootCategoryService rootCategoryService;

	@Autowired
	TopCategoryService topCategoryService;

	@Autowired
	SubCategoryService subCategoryService;

	/**
	 * 스토어 정보 관리 페이지
	 */
	@GetMapping("/info")
	public String info(HttpSession session, Model model) {
		Map<String, Object> res = new HashMap<>();

		// 셀러 정보 세션에서 받아오기
		Seller loginSeller = (Seller)session.getAttribute("loginSeller");
		
		// 스토어 정보 가져오기
		StoreInfo storeInfo = storeInfoService.selectById(loginSeller);
		
		
		model.addAttribute("storeInfo", storeInfo);
		model.addAttribute("contentPage", "store/seller/storeinfo.jsp");
		
		return "layout/store";
	}

	/**
	 * 스토어 정보 입력 처리 - 이메일, 사업자번호 중복 검증 후 DB 등록
	 */
	@PostMapping("/info/apply")
	@ResponseBody
	public Map<String, Object> applyInfo(@ModelAttribute StoreInfo storeInfo, HttpSession session) {
		// 세션에서 로그인한 판매자 정보 꺼내기
		Seller loginSeller = (Seller) session.getAttribute("loginSeller");

		// StoreInfo 객체에 로그인한 판매자의 ID(또는 Seller 객체) 설정
		storeInfo.setSeller(loginSeller);
		storeInfoService.update(storeInfo);

		Map<String, Object> res = new HashMap<>();
		res.put("status", "ok");
		res.put("msg", "스토어 등록이 완료되었습니다");
		return res;
	}
	
	/**
	 * 로고 등록 처리
	 */
	@PostMapping("/info/logo")
	@ResponseBody
	public Map<String, Object> updateLogo(@ModelAttribute StoreInfo storeInfo, HttpServletRequest request, HttpSession session) {
		Seller loginSeller = (Seller) session.getAttribute("loginSeller");
		
		// 파일 저장 경로
		String savePath = request.getServletContext().getRealPath("/resources/common/img/logo");
		
		
		Map<String, Object> res = new HashMap<>();
		storeInfoService.updateLogo(storeInfo, savePath, loginSeller);
		
		res.put("status", "ok");
		res.put("msg", "로고가 등록되었습니다.");
		
		return res;
	}
	

	/**
	 * 스토어 카테고리 선택 페이지
	 */
	@GetMapping("/category")
	public String applyCategory(Model model, HttpSession session) {
		Seller loginSeller = (Seller) session.getAttribute("loginSeller");
		
		// 스토어 보유한 모든 카테고리(서브-탑-루트) 몽땅 가져오기
		List<StoreCategory> storeCategoryCategories = storeCategoryService.getAllCategoryById(loginSeller);
		
		//카테고리 선택용 루트 카테고리
		model.addAttribute("rootCategories", rootCategoryService.selectAll());

		// 스토어가 가지고 있는 모든 카테고리(서브 ~ 루트) 몽땅
		model.addAttribute("usedCategory", storeCategoryCategories);
		model.addAttribute("contentPage", "store/seller/category.jsp");
		return "layout/store";
	}

	/**
	 * 스토어 루트 카테고리 선택
	 */
	@GetMapping("/category/top")
	@ResponseBody
	public Map<String, Object> getTopCategories(@RequestParam int rootCategoryId) {
		List<TopCategory> list = topCategoryService.selectById(rootCategoryId);
		Map<String, Object> res = new HashMap<>();
		res.put("status", "ok");
		res.put("topCategories", list);
		return res;
	}

	/**
	 * 스토어 탑 카테고리 선택
	 */
	@GetMapping("/category/sub")
	@ResponseBody
	public Map<String, Object> getSubCategories(@RequestParam int topCategoryId) {
		List<SubCategory> list = subCategoryService.selectById(topCategoryId);
		Map<String, Object> res = new HashMap<>();
		res.put("status", "ok");
		res.put("subCategories", list);
		return res;
	}

	@PostMapping("/category/apply")
	@ResponseBody
	public Map<String, Object> applyCategory(@RequestBody Map<String, List<Integer>> data, HttpSession session) {

		// 1. 세션에서 로그인한 판매자 정보 꺼내기
		Seller seller = (Seller) session.getAttribute("loginSeller");

		// 2. 넘겨받은 카테고리 리스트화
		List<Integer> subCategories = data.get("subCategories");

		// 3. 일시키기
		storeCategoryService.insert(subCategories, seller);

		Map<String, Object> res = new HashMap<>();
		res.put("status", "ok");
		return res;
	}
	
	@PostMapping("/category/delete")
	@ResponseBody
	public Map<String, Object> deleteCategory(@RequestBody Map<String, Integer> data, HttpSession session) {

		Map<String, Object> res = new HashMap<>();
		Seller seller = (Seller) session.getAttribute("loginSeller");

		try {
			storeCategoryService.delete(data.get("storeCategoryId"), seller);
			res.put("status", "ok");
		} catch (StoreCategoryException e){
			res.put("status","fail");
			res.put("message",e.getMessage());
		} catch (Exception e){
	        res.put("status", "error");
	        res.put("message", "서버 오류가 발생했습니다.");
	        e.printStackTrace();
		}
		return res;
	}
}
