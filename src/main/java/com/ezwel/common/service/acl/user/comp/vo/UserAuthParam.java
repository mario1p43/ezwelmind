package com.ezwel.common.service.acl.user.comp.vo;

import com.ezwel.common.domain.UserAuth;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 사용자정보 확장 Param
 * @auther ddakker 2014. 7. 7.
 */
@Getter @Setter
@ToString
@SuppressWarnings({ "squid:S1068", "serial" })
public class UserAuthParam extends UserAuth {
	// -------------------- UI 구성 및 JOIN 확장 TABLE FIELD ----------------------
	private String authCd;
	private String userAuthKey;

	private String[] userIdArr;
	private String[] authCdArr;
	private String[] userAuthKeyArr;

	private String searchKey;		// 검색어키
	private String searchKwd;		// 검색어
	private String searchAuthCode;	// 검색어
	
	private String serviceType;		//userType 암호화
    // -------------------- //UI 구성 및 JOIN 확장 TABLE FIELD --------------------

}
