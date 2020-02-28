package com.ezwel.admin.domain.entity.mgr;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MgrAgree {

	/**
	 * 관리자인증
	 */
	
	//아이디
	private String userId;
	
	//승인유형
	private int agreeCd;
	
	//고객사코드
	private String clientCd;
	
	//승인여부
	private String agreeYn;
	
	//승인일시
	private String agreeDt;
	
	//등록일시
	private String regDt;
	
}
