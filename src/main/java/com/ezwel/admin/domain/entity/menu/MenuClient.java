package com.ezwel.admin.domain.entity.menu;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MenuClient {
	
	public String menuSeq;
	
	private String menuGroup;
	
	private String payType;
	
	private String useYn;
	
	private String dispYn;
	
	private String modiId;
	
	private String modiDt;
	
	private String clientCd;
	
	/**
	 * 클라이언트명
	 */
	private String clientNm;

}
