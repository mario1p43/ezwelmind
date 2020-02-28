package com.ezwel.admin.service.service.dto;

import java.io.File;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.core.support.util.DateUtils;

@Getter @Setter
public class PromotionDto  extends FileMind {
	
	private String searchPromotionNm;
	private String searchPromotionCd;
	private String selectStatus;
	private String reqFromDt;
	private String reqToDt;
	
	private String[] goodsCdArr;
	private String[] authCdArr;
	
	private int prmCd;
	private String status;
	
	private String menuCd;
	private String menuNm;
	
	private String selectdisplay;
	private String selectsort;
	
	private String promotionmenuCd;
	private String promotionmenu;
	private String promotionnm;
	private String acontent;
	private String selectperNo;
	private String amemo;
	private String imgurl;
	
	private String mreqFromDt;
	private String mreqToDt;
	
	private String goodsCd;
	private String goodsNm;
	private String normalPrice;
	private String buyPrice;
	private String salePrice;
	
	private String regId;
	private int goodsSort;
	
	
	/**
	 * 프로모션 메인 이미지 업로드 경로
	 */
	@Override
	public String contextFilePath(String fileNm) {
		return File.separator + "promotion" + File.separator + DateUtils.getDateFormat("yyyy") + File.separator + DateUtils.getDateFormat("MM");
	}
	
	
}
