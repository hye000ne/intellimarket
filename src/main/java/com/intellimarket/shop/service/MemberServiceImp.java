package com.intellimarket.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intellimarket.shop.dao.MemberDAO;
import com.intellimarket.shop.domain.Member;

@Service
public class MemberServiceImp implements MemberService {
	@Autowired MemberDAO memberDAO;
	
	@Override
	public int insert(Member member) {
		return memberDAO.insert(member);
	}
}
