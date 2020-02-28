package com.ezwel.admin.service.counselor.dto;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@Getter @Setter
public class CounselorDto extends PagingVo {
	
	// 기관코드 mind_comm_cd 테이블
	private static int ORG_CODE = 100307;
	
	// 개인코드 mind_comm_cd 테이블
	private static int PRIVATE_CODE = 100308;
	
	private String reqSeq;
	
	private int reqType;
	
	private String searchNm;
	
	/**
	 * ORG_CODE, PRIVATE_CODE 참고
	 * @return type 기준으로 개인이면 개인관련 jsp, 기관이면 기관관련 jsp
	 */
	public String getReturnJsp() {
		return this.reqType ==  ORG_CODE ? "/madm/counselor/counselorOrgDetail" : "/madm/counselor/counselorPrivateDetail";
	}

}
