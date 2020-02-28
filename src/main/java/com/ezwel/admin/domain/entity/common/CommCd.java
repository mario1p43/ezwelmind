package com.ezwel.admin.domain.entity.common;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class CommCd {
	
	/**
	 * 코드번호
	 * @key
	 */
	private int commCd;
	
	/**
	 * 상위코드
	 */
	private int highCommCd;
	
	/**
	 * 코드명
	 */
	private String commNm;
	
	/**
	 * 문자코드값
	 */
	private String optionCd;
	
	/**
	 * 사용여부
	 */
	private String useYn;
	
	/**
	 * 비고
	 */
	private String commDesc;
	
	/**
	 * 등록일시
	 */
	private String regDt;
	
	
	private String  extraNm;
	private String  extraTarget;
	private String  extraCost;
	

}
