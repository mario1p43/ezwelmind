package com.ezwel.admin.common.support.bean;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class EncryptComponent {
	private static Logger log = LoggerFactory.getLogger(EncryptComponent.class);
	
	@Resource
	private MessageDigestPasswordEncoder passwordEncoder;
	
	/**
	 * 스프링 시큐리티 공통 암호화 모듈로 인코딩
	 * @param src
	 * @return
	 * @auther ddakker 2015. 8. 27.
	 */
	public String encode(String val) {
		String encode = passwordEncoder.encodePassword(val, "");
		log.debug("encode val: {}, encode: {}", val, encode);
		
		return encode;
	}
}
