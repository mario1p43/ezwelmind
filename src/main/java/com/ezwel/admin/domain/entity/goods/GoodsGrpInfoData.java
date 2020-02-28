package com.ezwel.admin.domain.entity.goods;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class GoodsGrpInfoData {

	private int	goodsGrpCd;		//상품군 코드
	private String layoutSeq;	//레이아웃 일련번호
	private int goodsCd;		//상품일련번호
	private String goodsDesc;	//상품설명
	private String regDt;		//등록일시
	private String modiDt;		//수정일시
	
	private int cdSet;		//공정위 카테고리
}
