package com.ezwel.admin.domain.entity.service;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PromotionData  extends PagingVo {

	private String menuCd;
	private String menuNm;
	private String prmCd;
	private String prmNm;
	private String stdt;
	private String eddt;
	private String goodsCount;
	private String statusCd;
	private String statusNm;
	private String regDt;
	
	private String content;
	private String display;
	private String sort;
	private String perNo;
	private String img;
	private String memo;
	
	
}
