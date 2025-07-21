package com.intellimarket.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.shop.dao.MemberDAO;
import com.intellimarket.shop.domain.Member;

@Service
public class MemberServiceImp implements MemberService {
	@Autowired MemberDAO memberDAO;
	
	@Override
	public List<Member> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Member SelectById(int memberId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insert(Member member) {
		return memberDAO.insert(member);
	}

	@Override
	public Member update(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member login(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isEmailDuplicated(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int changePassword(int memberId, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean checkPassword(int memberId, String password) {
		// TODO Auto-generated method stub
		return false;
	}
}
