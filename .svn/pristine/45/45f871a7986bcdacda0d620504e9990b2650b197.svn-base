package com.ezwel.admin.service.service.dto;

import java.util.Calendar;
import java.util.GregorianCalendar;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class GoodsDto  extends FileMind{
	
	private String goodsCd;
	private String highCommCd;
	
//mind_goods	
	private String goodsType;
	private String receiptYn;
	private String dutyYn;
	private String goodsCate1;
	private String goodsCate2;
	private String goodsNm;
	private String goodsAuth;
	private String goodsSaleSt;
	private String goodsSaleEd;
	private String goodsRegSt;
	private String goodsRegEd;
	private String goodsStock;
	private String goodsTarget;
	private String goodsDes;
	private String goodsPayYn;
	private String goodsStatus;
	private String goodsRemark;
	private String cspCd;
	private String goodsNormalPrice;
	private String goodsBuyPrice;
	private String goodsDisRate;
	private String goodsSalePrice;
	private String regId;	//등록자
	private String modiId;	//수정자
	private String goodsLink;
	
	private String cspNm;
	
//mind_goods_detail	
	private String goodsTextbook;
	private String goodsTotEdu;
	private String goodsContent;
	private String goodsIntroduce;
	private String goodsUsePeriod;
	private String goodsCancelRefund;
	private String goodsTotItem;
	private String goodsAddInfo1;
	private String goodsAddInfo2;
	
//mind_goods_lecture
	private Integer lecCount;
	private String[] lecNmArr;
	private String[] lecTimeArr;
	private String[] lecPathArr;
	private String[] lecPayYnArr;
	private String lecNm;
	private String lecTime;
	private String lecPath;
	private String lecPayYn;
	
//mind_goods_attach
	private String fileSeq;
	private String attachFileType;
	private String attachFileNm;
	private String attachFilePath;
	private String fileNm125;
	private String filePath125;
	private String fileNm300;
	private String filePath300;
	private String fileNm500;
	private String filePath500;

//etc
	private String saleStHour;
	private String saleStMin;
	private String saleEdHour;
	private String saleEdMin;
	
//mind_goods_sub
	private String goodsSearch;	//검색키워드
	private String goodsBrand;	//브랜드
	private String goodsModel;	//모델명
	private String goodsManu;	//제조사
	private String goodsOrigin;	//원산지
	private String goodsLinkKey;	//연동상품키
	private String goodsHopeDlvrYn;	//희망배송일여부
	private String dlvrPriceYn;	//배송비 부과여부
	private String dlvrPrice;	//배송비
	private String requiredCheckYn;	//필수확인사항 여부
	private String requiredCheckContent;	//필수확인사항
	private String requiredInputYn;	//필수입력사항 여부
	private String requiredInputContent;	//필수입력사항
	private String goodsDlvr;	//배송안내
	private String goodsSubGoodsCancelRefund;	//교환,환불,반품,취소
	private String goodsDesc;	//상품상세 설명
	private String dcAmtYn;	//할인액 공개여부
	private String dcRateYn;	//할인율 공개여부
	
	
//mind_goods_option_grp
	private String grpCd;	//옵션 그룹번호
	private String grpNm;	//옵션 그룹명
	private String optionUseYn;	//사용여부
	private String selectYn;	//선택필수
	private String grpSort;		//정렬순서

//mind_goods_option_item
	private String itemCd;	//옵션 상세 번호
	private String itemNm;	//옵션 상세명
	private String itemBuyPrice;	//옵션 매입가
	private String itemSalePrice;	//옵션 판매가
	private String optionItemUseYn;	//사용여부
	private String itemSort;	//정렬순서
	
	
//mind_goods_grp_info
	private int goodsGrpCd;		//상품군코드
	private String layoutSeq;	//레이아웃 일련번호
	private String grpInfoGoodsDesc;	//상품설명
	
	private String[] layoutSeqArr;	//레이아웃 일련번호
	private String[] grpInfoGoodsDescArr;	//상품설명
//mind_goods_grp_layout
	private String title;	//제목
	private String grpLayoutUseYn;	//사용여부
	private String useExample;	//사용예시
	private String Etc;	//비고
	private String dispNum;	//화면노출순서

//goodspreview
	private String tempImgUrl1;	//미리보기용 임시 url
	private String tempImgUrl2;	//미리보기용 임시 url
	private String tempImgUrl3;	//미리보기용 임시 url
	
	@Override
	public String contextFilePath(String fileNm) {
		// 파일 저장할 폴더 주소 (dir - path 다음부터)
		GregorianCalendar today = new GregorianCalendar();
		String resultUrl = "/goods/" ; 
		
		resultUrl += today.get(Calendar.YEAR);
		resultUrl += "/";
		resultUrl += today.get(Calendar.MONTH) + 1;
		resultUrl += "/";
		
		return resultUrl;
	}
}
