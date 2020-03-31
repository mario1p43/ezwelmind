package com.ezwel.admin.common.support.connect;

import lombok.Getter;
import lombok.Setter;

/**
 * 마인드프리즘 API 오류
 * 
 * @author starkaby12
 *
 */
@Getter
@Setter
public class MindPrismApiException extends Exception {
	
	private static final long serialVersionUID = 1L;
	
	private int responseCode = 0;
	private String errorCode = "";
	
	public MindPrismApiException() {
		super();
	}
	
	
	public MindPrismApiException(String msg) {
		super(msg);
	}
	
	public MindPrismApiException(String msg, int responseCode) {
		super(msg);
		this.responseCode = responseCode;
	}
	
	public MindPrismApiException(String msg, int responseCode, String errorCode) {
		this(msg, responseCode);
		this.errorCode = errorCode;
	}
}
