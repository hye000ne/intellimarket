package com.intellimarket.shop.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Member {
	private int memberId;
	private String email;
	private String password;
	private String name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth;
	
	private String phone;
	private int zipCode;
	private String address;
	private String detailAddress;
	private String gender;
	
	private String status;
	private LocalDateTime createdDate;
	private LocalDateTime updatedDate;
}
