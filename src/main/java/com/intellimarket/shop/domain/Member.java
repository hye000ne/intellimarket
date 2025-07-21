package com.intellimarket.shop.domain;

import lombok.Data;

@Data
public class Member {
	private int memberId;
	private String email;
	private String password;
	private String name;
	private String birth;
	private String gender;
	private String phone;
	private String address;
}
