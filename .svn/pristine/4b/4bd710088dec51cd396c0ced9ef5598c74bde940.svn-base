package com.ezwel.admin.service.message.queue;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

import com.ezwel.admin.service.message.QueueHelper;

/**
 * Message Queue SMS 처리
 * @author ddakker 2015. 7. 30.
 */
@Service
public class SmsService {
	private static Logger log = LoggerFactory.getLogger(SmsService.class);
	
	@Resource RabbitTemplate rabbitTemplateEzwelmind;
	
	public void send(String [] toArr, String from, String message) {
		for (String to : toArr) {
			send(to, from, message);
		}
	}
	
	public void send(String to, String from, String message) {
		send(to, from, message, null, null);
	}
	
	public void send(String to, String from, String message, String subject) {
		send(to, from, message, subject, null);
	}
	
	public void send(String to, String from, String message, Date reqDate) {
		send(to, from, message, null, reqDate);
	}
	
	/**
	 * SMS 발송
	 * @param to		누구에게
	 * @param from		누가
	 * @param message	뭔 내용을
	 * @param subject	MMS 일경우 타이틀
	 * @param reqDate	예약 발송
	 * @auther ddakker 2015. 8. 7.
	 */
	public void send(String to, String from, String message, String subject, Date reqDate) {
		Map<String, Object> messageData = null;
		try {
			messageData = new HashMap<>();
			messageData.put("to", to);
			messageData.put("from", from);
			messageData.put("message", message);
			messageData.put("subject", subject);
			messageData.put("reqDate", reqDate);
			
			
			log.info("SMS Queue Send {}, {}", QueueHelper.QUEUE_EZWELMIND_SMS, messageData);
			rabbitTemplateEzwelmind.convertAndSend(QueueHelper.QUEUE_EZWELMIND_SMS, messageData);
		} catch (AmqpException e) {
			log.error("e: {}, data: {}", e.toString(), messageData);
		}
	}
}
