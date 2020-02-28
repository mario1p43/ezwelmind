package com.ezwel.common.service.acl.user.comp.vo;

import com.ezwel.common.domain.UserAuth;

import lombok.Getter;
import lombok.Setter;


/**
 * 사용자정보 확장 Vo
 * @auther ddakker 2014. 7. 7.
 */
@Getter @Setter
@SuppressWarnings("squid:S1068")
public class UserAuthVo extends UserAuth {
	// -------------------- UI 구성 및 JOIN 확장 TABLE FIELD ----------------------
	private String authCd;		// AuthVo.authCd
	private String userAuthKey;
    // -------------------- //UI 구성 및 JOIN 확장 TABLE FIELD --------------------
}
