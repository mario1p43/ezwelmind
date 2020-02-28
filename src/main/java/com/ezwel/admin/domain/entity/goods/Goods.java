package com.ezwel.admin.domain.entity.goods;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@Getter @Setter
public class Goods extends PagingVo {
	
	
	private String goodsCd;				// 상품코드
	private String goodsType;			// 판매유형
	private String receiptYn;			// 현금영수증발행여부
	private String dutyYn;				// 면세여부
	private String goodsCate1;			// 카테고리1
	private String goodsCate2;			// 카테고리2
	private String goodsNm;				// 강좌/상품명
	private String goodsAuth;			// 강사/저자명
	private String goodsSaleSt;			// 시작일/기간
	private String goodsSaleEd;			// 종료일
	private String goodsRegSt;			// 접수시작일
	private String goodsRegEd;			// 접수종료일
	private String goodsStock;			// 모집인원/가능수량
	private String goodsTarget;			// 강좌/학습 대상
	private String goodsDes;			// 소개/개요
	private String goodsPayYn;			// 신청형여부
	private String goodsStatus;			// 상태코드
	private String goodsRemark;			// 차시/실시방법/특이사항
	private String cspCd;				// CP코드
	private String goodsNormalPrice;	// 정상가
	private String goodsBuyPrice;		// 매입원가
	private String goodsDisRate;		// 할인율
	private String goodsSalePrice;		// 판매가
	private String regId;				// 등록자
	private String regDt;				// 등록일시
	private String modiId;				// 수정자
	private String modiDt;				// 수정일시
	
//	MIND_GOODS_SUB
	private String goodsBrand;			// 브랜드명
	private String goodsModel;			// 모델명
	private String goodsManu;			// 제조사
	private String goodsOrigin;			// 원산지
	private String goodsDlvr;			// 배송안내 
	private String goodsCancelRefund;	// 취소/환불 안내
	
//	MIND_GOODS_ATTACH
	private String fileNm;				// 파일명
	private String filePath;			// 파일경로
	
}
