package com.intellimarket.shop.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Alias("Member")
public class Member {
	private int memberId;
	private String email;
	private String password;
	private String name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth;
	
	private String phone;
	private MemberStatus status;
	private String inactiveReason;
	private int zipCode;
	private String address;
	private String detailAddress;
	private Gender gender;
	
	private Role role;
	private LocalDate createdDate;
	private LocalDate updatedDate;
	
	// ENUM 정의
    public enum Gender { M, F }
    public enum MemberStatus { ACTIVE, INACTIVE}
    public enum Role { USER, ADMIN }
}
