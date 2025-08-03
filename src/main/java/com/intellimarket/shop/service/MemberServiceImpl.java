package com.intellimarket.shop.service;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.common.util.PasswordEncryptor;
import com.intellimarket.shop.dao.MemberDAO;
import com.intellimarket.shop.domain.Member;
import com.intellimarket.shop.domain.Member.MemberStatus;
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
		Member member = memberDAO.selectById(memberId);
		if(member == null) throw new ShopException("해당 회원을 찾을 수 없습니다.");
		return member;
	}
	
	// 회원 단 건 조회 (ID 기반)
	@Override
	public Member selectByEmail(String email){
		Member member = memberDAO.selectByEmail(email);
		if (member == null) throw new ShopException("해당 이메일의 회원을 찾을 수 없습니다.");
		return member;
	}
	
	// 회원가입
	@Override
	public void insert(Member member){
		if(memberDAO.existByEmail(member.getEmail()) > 0) throw new ShopException("이미 사용 중인 이메일입니다.");
		if(member.getPassword() == null || member.getPassword().isEmpty()) throw new ShopException("비밀번호는 필수 입력값입니다.");
		
		String encodedPassword = PasswordEncryptor.encode(member.getPassword());
		member.setPassword(encodedPassword);
		
		memberDAO.insert(member);
	}
	
	// 회원 정보 수정
	@Override
	public void updateMember(Member member){
		int result = memberDAO.updateMember(member); 
		if(result <= 0) throw new ShopException("회원 정보 수정에 실패했습니다.");
	}
	
	// 회원 상태 변경
	@Override
	public void updateMemberStatus(int memberId, MemberStatus status, String inactiveReason) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setStatus(status);
		member.setInactiveReason(inactiveReason);
		int result = memberDAO.updateMemberStatus(member);
		if(result <= 0) throw new ShopException("회원 탈퇴 처리에 실패했습니다.");
	}
	
	// 로그인
	@Override
	public Member loginMember(String email, String password){
		Member member = selectByEmail(email);
		matchPassword(member, password); // 비밀번호 확인 메서드에서 예외 호출
		
		return member;
	}

	// 비밀번호 확인
	@Override
	public void matchPassword(Member member, String password){
		if(!PasswordEncryptor.matches(password, member.getPassword())) throw new ShopException("비밀번호가 일치하지 않습니다.");
	}
	
	// 회원 존재 여부 (이메일 기반)
	@Override
	public boolean isEmailExists(String email) {
		return memberDAO.existByEmail(email) > 0;
	}
	
	// 비밀번호 수정
	@Override
	public void updatePassword(String email, String password) {
		Member member = new Member();
		member.setEmail(email);
		
		// 비밀번호 암호화
		String encodedPassword = PasswordEncryptor.encode(password);
		member.setPassword(encodedPassword);
		
		int result = memberDAO.updatePassword(member);
		if(result <= 0) throw new ShopException("비밀번호 변경에 실패했습니다.");
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