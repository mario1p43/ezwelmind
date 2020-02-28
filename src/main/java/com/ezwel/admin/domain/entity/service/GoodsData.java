package com.ezwel.admin.domain.entity.service;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@Getter @Setter
public class GoodsData extends PagingVo{

	private String goodsCd;
	private String goodsType;
	private String receiptYn;
	private String dutyYn;
	private String cate1;
	private String cate2;
	private String goodsNm;
	private String auth;
	private String saleSt;
	private String saleStTime;
	private String saleStMIN;
	private String saleEd;
	private String saleEdTime;
	private String saleEdMIN;
	private String regSt;
	private String regEd;
	private String stock;
	private String target;
	private String des;
	private String payYn;
	private String goodsStatus;
	private String remark;
	private String cspCd;
	private String cspNm;
	private String normalPrice;
	private String buyPrice;
	private String disRate;
	private String salePrice;
	private String textbook;
	private String totEdu;
	private String usePeriod;
	private String totItem;
	private String info1;
	private String info2;
	private String introduce;
	private String content;
	private String cancelRefund;
	private String mainFileNm;
	private String mainFilePath;	//썸네일 메인 패스
	private String detailFileNm;
	private String detailFilePath;	//썸네일 디테일 패스
	private String lecNo;
	private String lecNm;
	private String lecTime;
	private String lecPath;
	private String lecPayYn;
	
	
	
//	MIND_GOODS_SUB
	private String goodsSearch;
	private String goodsBrand;
	private String goodsModel;
	private String goodsManu;
	private String goodsOrigin;
	private String goodsLinkKey;
	private String goodsOrderOption1;
	private String goodsOrderOption2;
	private String goodsDlvr;
	private String goodsCancelRefund;
	
	
//	MIND_GOODS_DETAIL	
	private String goodsTextbook;
	private String goodsTotEdu;
	private String goodsUsePeriod;
	private String goodsTotItem;
	private String goodsAddInfo1;
	private String goodsAddinfo2;
	private String goodsIntroduce;
	private String goodsContent;
	
}
