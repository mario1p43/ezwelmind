package com.ezwel.admin.persist.Order;

import java.util.List;

import com.ezwel.admin.domain.entity.sms.SmsResult;

@SuppressWarnings("PMD.UnusedModifier")
public interface OrderMapper {
	
	public List<SmsResult> getOrderComletionSmsMsg();

	public List<SmsResult> getOrderComletionPoliceSmsMsg();
	
}
