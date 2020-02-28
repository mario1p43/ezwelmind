package com.ezwel.admin.service.center.dto;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.core.support.util.DateUtils;
import com.ezwel.core.support.util.StringUtils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class CenterDto extends FileMind{

	private static final long serialVersionUID = -4801512155794586085L;
	
	private int 	centerSeq;
	private String 	centerNm;
	private String 	centerType;
	private String 	homepage;
	private String 	area1;
	private String 	area2;
	private String 	post;
	private String 	addr1;
	private String 	addr2;
	private int 	infraPersonalCnt;
	private String 	infraWaitRoomYn;
	private int 	infraPlayRoomCnt;
	private String 	infraEduRoomYn;
	private String 	infraEtc;
	private String 	ownerNm;
	private String 	bsnsNum;
	private String 	bcond;
	private String 	bitem;
	private String 	telNum;
	private String 	faxNum;
	private String 	bankCd;
	private String 	bankNum;
	private String 	bankOrder;
	private String 	fileNm1;
	private String 	filePath1;
	private String 	fileNm2;
	private String 	filePath2;
	private String 	fileNm3;
	private String 	filePath3;
	private String 	regDt;
	private String 	regId;
	private String 	modiDt;
	private String 	modiId;
	private String	typeChoice;
	private String  searchCenterSeq;
	
	private String  searchCentertype1;
	private String  searchCentertype2;
	private String  searchCentertype3;
	private String  searchCentertype4;

	private String 	calcType;
	private String 	calcDd1;
	private String 	calcDd2;
	
	private String 	dispYn;
	private String mapUrl;
	
	private String centerIntro;
	private String ymd;
	
	private String mgrMemo;
	private String publicTraffic;
	
	private String mentalPsy;
	//검색시작일
	private String startDt;	
	//검색종료일
	private String endDt;
	
	//TODO: 추후에 명칭 변경 기타검사,상담외 프로그램,센터 주요강점 
	private String etcTest1;
	private String etcTest2;
	private String etcTest3;
	
	/* 심리,법률 재무 상세 검색을 위한 변수*/
	private String languageType;
	private String specialType;
	private String jobType;
	private String personalType;
	private String familyType;
	private String traumaType;
	private String targetType;
	private String lawCounselType;
	private String financeCounselType;
	private String preferredType;
	private String tendencyType;
	
	private String aroundInfo;
	private String parkingLotYn;

	private String highCommCd;
	
	private String carefulInfo;
	private String 	userId;
	private int extraIdx;
	private String 	extraNm;
	private String 	extraTarget;
	private String 	extraCost;  
	
	@Override
	public String contextFilePath(String fileNm) {
		
		//if ("file1".equals(fileNm)) {
			return File.separator + "partner" + File.separator + "center" + File.separator + DateUtils.getDateFormat("yyyy") + File.separator + DateUtils.getDateFormat("MM") + File.separator ;
		/*} else  {
			return File.separator + "partner" + File.separator + "center" + File.separator + DateUtils.getDateFormat("yyyy") + File.separator + DateUtils.getDateFormat("MM");
		}*/
	}
	
	public List<String> getAreaList() {
		if(StringUtils.isBlank(area1)) {
			return null;
		}
		String text = area1;
		String[] areaArray = text.split(",");
		return Arrays.asList(areaArray);
	}
}
