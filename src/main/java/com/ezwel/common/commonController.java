package com.ezwel.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class commonController {
	private static Logger log = LoggerFactory.getLogger(commonController.class);
	public static final String IS_MOBILE = "MOBILE";
	private static final String IS_PHONE = "PHONE";
	public static final String IS_TABLET = "TABLET";
	public static final String IS_PC = "PC";

	/**
	 * 모바일,타블렛,PC구분
	 * @param req
	 * @return
	 */
	public static String test() {
		return "ddddddd";
	}
	public static String isDevice(HttpServletRequest req) {
	    String userAgent = req.getHeader("User-Agent").toUpperCase();
		
	    if(userAgent.indexOf(IS_MOBILE) > -1) {
	        if(userAgent.indexOf(IS_PHONE) == -1) {
	        	return IS_MOBILE;
	        }else {
			    return IS_TABLET;
	        }
	    	
	    } else {
	    	return IS_PC;
	    }
	}
		
	
}