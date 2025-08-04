package com.intellimarket.store.domain;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Alias("Settlement")
public class Settlement {

	private int settelementId;
	private StoreInfo storeInfo;
	private int requestedAmount;
	private int feeAmount;
	private int netAmount;
	private SettlementStatus status;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate settlementRequestedAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate settlementCompletedAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate updatedAt;
}
