package com.ezwel.common.domain;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

/**
 * 권한에 대한 계층 정보
 * 		- ACL_AUTH_HIERARCHY
 * @author ddakker 2014. 9. 01.
 */
@Getter @Setter
@SuppressWarnings("squid:S1068")
public class AuthHierarchy extends PagingVo {
	private Long seq;
	private String parentAuthCd;
	private String childAuthCd;
}
