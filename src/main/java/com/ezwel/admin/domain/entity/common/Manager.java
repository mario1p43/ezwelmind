package com.ezwel.admin.domain.entity.common;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Manager implements Serializable {
	private String userId;
	private String userType;
	private String userTypeNm;
	private String userNm;
	private String useYn;
	private String mgrStatus;
	private String email;
	private String mobile;
	private String branchCd;
	private String deptCd;
	private String teamCd;
	private String regDt;
	private String modiDt;
	private String cspCd;
	private String authCd;

	private int centerSeq;
	private String centerOwnerYn;

	private String imsiPwdYn;
}
