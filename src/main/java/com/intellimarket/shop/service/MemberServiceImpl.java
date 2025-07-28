package com.intellimarket.shop.service;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.shop.dao.MemberDAO;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.exception.ShopException;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberDAO memberDAO;
	
	// 전체 목록 조회
	@Override
	public List<Member> selectAll(){
		return memberDAO.selectAll();
	}
	
	// 회원 단 건 조회 (ID 기반)
	@Override
	public Member selectById(int memberId){
		return memberDAO.selectById(memberId);
	}
	
	// 회원가입
	@Override
	public void insert(Member member){
		if(memberDAO.existByEmail(member.getEmail()) > 0) throw new ShopException("이미 사용 중인 이메일입니다.");
		// TODO 비밀번호 암호화 로직 예정
		memberDAO.insert(member);
	}
	
	// 회원 정보 수정
	@Override
	public int updateMember(Member member){
		return memberDAO.updateMember(member);
	}
	
	// 회원 탈퇴
	@Override
	public int delete(int memberId){
		return memberDAO.delete(memberId);
	}
	
	// 로그인
	@Override
	public Member loginMember(String email, String password){
		Member member = new Member();
		member.setEmail(email);
		member.setPassword(password);
		
		return memberDAO.loginMember(member);
	}

	// 비밀번호 확인
	@Override
	public boolean matchPassword(int memberId, String password){
		Member member = new Member();
		member.setMemberId(memberId);
		member.setPassword(password);
		
		return memberDAO.matchPassword(member) > 0;
	}
	
	// 회원 존재 여부 (이메일 기반)
	@Override
	public boolean isEmailExists(String email) {
		return memberDAO.existByEmail(email) > 0;
	}
	
	// 비밀번호 수정
	@Override
	public boolean updatePassword(String email, String password) {
		Member member = new Member();
		member.setEmail(email);
		member.setPassword(password);
		
		return memberDAO.updatePassword(member) > 0;
	}
	
	/** 
	 * 임시 비밀번호 생성 메서드 
	 * - 영문 대소문자 + 숫자 조합 10자리
	 */
	@Override
	public String generateTempPassword() {
		int len = 10;
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder sb = new StringBuilder(); // 문자열 누적용
		Random rnd = new SecureRandom(); // 보안용 난수 생성기
		
	    for (int i = 0; i < len; i++) sb.append(chars.charAt(rnd.nextInt(chars.length())));
    	
	    return sb.toString();
	}
}