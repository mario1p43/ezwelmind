package com.ezwel.admin.service.common.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("squid:S1068")
public class CommonDto {

	private String commCd;

	private String highCommCd;

	private String commNm;

	private String optionCd;

	private String useYn;

	private String commDesc;

	private String orderNo;

	private String regDt;

	private String clientCd;
	
	private int centerSeq;
	
	/**
	 * 코드값 in절에 (mybatis에서 for문으로)
	 */
	private String[] arrayCode;

}
