package com.ezwel.common.domain;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

/**
 * URL 패턴 정보
 * 		- ACL_RESOURCE
 * @author ddakker 2014. 8. 29.
 */
@Getter @Setter
@SuppressWarnings("squid:S1068")
public class Resource extends PagingVo {
	private String resourceCd;			// 롤코드
	private String resourceNm;			// 명칭
	private String resourceDc;			// 설명
	private String resourceUrl;			// URL 패턴
	private String regDt;				// 등록일
	private String modiDt;				// 수정일
}
