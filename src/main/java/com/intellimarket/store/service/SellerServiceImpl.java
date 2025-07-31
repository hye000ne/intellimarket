package com.intellimarket.store.service;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.intellimarket.common.util.PasswordEncryptor;
import com.intellimarket.shop.exception.ShopException;
import com.intellimarket.store.dao.SellerDAO;
import com.intellimarket.store.dao.StoreInfoDAO;
import com.intellimarket.store.domain.Seller;
import com.intellimarket.store.domain.SellerStatus;
import com.intellimarket.store.domain.StoreInfo;
import com.intellimarket.store.exception.SellerException;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	SellerDAO sellerDAO;
	
	@Autowired	
	StoreInfoDAO storeInfoDAO;

	// 전체 목록 조회
	@Override
	public List<Seller> selectAll() {
		return sellerDAO.selectAll();
	}

	// 판매자 한 건 조회(Id 기반)
	@Override
	public Seller selectById(int sellerId) {
		return sellerDAO.selectById(sellerId);
	}

	// 판매자 한 건 조회(이메일 기반)
	@Override
	public Seller selectByEmail(String email) {
		return sellerDAO.selectByEmail(email);
	}

	// 판매자 목록 조회(상태값 기반)
	@Override
	public List<Seller> selectByStatus(SellerStatus sellerStatus) {
		return sellerDAO.selectByStatus(sellerStatus);
	}

	// 회원가입
	@Override
	public void insert(Seller seller) {
		if (sellerDAO.existByEmail(seller.getEmail()) > 0)
			throw new SellerException("이미 사용 중인 이메일입니다.");
		if (sellerDAO.existByBusinessNum(seller.getBusinessNum()) > 0)
			throw new SellerException("이미 사용 중인 사업자 등록번호입니다.");
		if (seller.getPassword() == null || seller.getPassword().isEmpty())
			throw new SellerException("비밀번호는 필수 입력값입니다.");
		String encodedPassword = PasswordEncryptor.encode(seller.getPassword());
		seller.setPassword(encodedPassword);

		sellerDAO.insert(seller);
	}

	// 판매자 정보 수정
	@Override
	public int updateSeller(Seller seller) {
		return sellerDAO.updateSeller(seller);
	}

	// 판매자 정보 수정
	@Override
	public int updateStatus(Seller seller) {
		return sellerDAO.updateStatus(seller);
	}
	
	
	// 가입 승인 및 스토어 생성
	@Transactional
	public void approveAndCreateStore(Seller seller) {
		sellerDAO.updateStatus(seller);
		
		StoreInfo storeInfo = new StoreInfo();
		storeInfo.setStoreName(seller.getName()+" 님의 스토어");
		storeInfo.setStoreTel(seller.getTel());
		storeInfo.setLogoPath("");
		storeInfo.setStoreIntroduce(seller.getName()+" 님의 인텔리한 상점입니다");
		storeInfo.setSeller(seller);
		
		storeInfoDAO.insert(storeInfo);
	}

	// 로그인
	@Override
	public Seller loginSeller(String email, String password) {
		Seller seller = selectByEmail(email);
		if (seller == null)
			throw new ShopException("가입되지 않은 이메일입니다.");
		if (!PasswordEncryptor.matches(password, seller.getPassword()))
			throw new SellerException("비밀번호가 일치하지 않습니다.");

		return seller;
	}

	// 비밀번호 확인
	@Override
	public boolean matchPassword(int sellerId, String password) {
		Seller seller = selectById(sellerId);
		return PasswordEncryptor.matches(password, seller.getPassword());
	}

	// 비밀번호 수정
	@Override
	public boolean updatePassword(String email, String password) {
		Seller seller = new Seller();
		seller.setEmail(email);

		// 비밀번호 암호화
		String encodedPassword = PasswordEncryptor.encode(password);
		seller.setPassword(password);

		return sellerDAO.updatePassword(seller) > 0;  
	}

	/**
	 * 임시 비밀번호 생성 메서드 - 영문 대소문자 + 숫자 조합 10자리
	 */
	@Override
	public String generateTempPassword() {
		int len = 10;
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder sb = new StringBuilder(); // 문자열 누적용
		Random rnd = new SecureRandom(); // 보안용 난수 생성기

		for (int i = 0; i < len; i++)
			sb.append(chars.charAt(rnd.nextInt(chars.length())));

		return sb.toString();
	}

	// 회원 존재 여부 (이메일 기반)
	@Override
	public boolean isEmailExists(String email) {
		return sellerDAO.existByEmail(email) > 0;
	}

	@Override
	public boolean isBusinessNumExists(String businessNum) {
		return sellerDAO.existByBusinessNum(businessNum) > 0;
	}



}
