package com.ezwel.admin.service.client.dto;

import com.ezwel.core.framework.web.vo.Vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ClientSubDto extends Vo {
	
	private String clientCd;
	private String gubunType;
	private String dispType;
	private String dispNo;
	private String useYn;
	private String dispYn;
	private String essenYn;

}
