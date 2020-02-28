package com.ezwel.admin.domain.entity.service;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PromotionGoodsData extends PagingVo{

	private String goodsCd;
	private String goodsType;
	private String goodsTypeNm;
	private String cspCd;
	private String cspNm;
	private String goodsNm;
	private String buyPrice;
	private String salePrice;
	private String prmBuyPrice;
	private String prmSalePrice;
	private String statusCd;
	private String sort;
	private String prmGoods;
	
	
}
