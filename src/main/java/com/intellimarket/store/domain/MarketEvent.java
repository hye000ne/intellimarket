package com.intellimarket.store.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MarketEvent")
public class MarketEvent {
	private int marketEventId;
	private String eventName;
	private String eventDetail;
}
