package com.ezwel.admin.domain.entity.banner;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;


public class InvChannel extends PagingVo {

	/**
	 * 채널코드
	 */
	@Getter @Setter
	private String channelCd;
	
	/**
	 * 채널명
	 */
	@Getter @Setter
	private String channelNm;
	
	/**
	 * 채널설명
	 */
	@Getter @Setter
	private String channelDesc;

}
