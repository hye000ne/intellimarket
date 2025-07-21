package com.intellimarket.shop.dao;

import org.springframework.stereotype.Repository;

import com.intellimarket.shop.domain.Member;

@Repository
public interface MemberDAO {
	public int insert(Member member);
}
