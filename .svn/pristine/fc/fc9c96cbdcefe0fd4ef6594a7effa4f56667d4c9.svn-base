package com.ezwel.admin.service.order;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.sms.SmsResult;
import com.ezwel.admin.persist.Order.OrderMapper;


@Service
public class OrderService {

	@Resource
	private OrderMapper orderMapper;
	
	
	/**
	 * 
	 * @return
	 */
	public List<SmsResult> getOrderComletionSmsMsg() {
		return orderMapper.getOrderComletionSmsMsg();
	}
	
	/**
	 * 
	 * @return
	 */
	public List<SmsResult> getOrderComletionPoliceSmsMsg() {
		return orderMapper.getOrderComletionPoliceSmsMsg();
	}

}
