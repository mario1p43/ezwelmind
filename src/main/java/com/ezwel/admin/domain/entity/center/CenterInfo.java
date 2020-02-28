package com.ezwel.admin.domain.entity.center;

import org.apache.commons.lang.StringUtils;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CenterInfo extends PagingVo{
	
	private static final long serialVersionUID = 8060286325853613089L;
	
	private int 	centerSeq;
	private String 	centerNm;
	private String 	centerType;
	private String 	centerIntro;
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
	private String 	telNum1;
	private String 	telNum2;
	private String 	telNum3;
	private String 	faxNum;
	private String 	faxNum1;
	private String 	faxNum2;
	private String 	faxNum3;
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
	private String 	ModiDt;
	private String 	ModiId;
	private String 	employ;	//인원
	private String	typeCounsel;	//센터구분(상담)
	private String	typeDispatch;	//센터구분(파견)
	private String	typeGroup;		//센터구분(집단)
	private String	typeLecture;	//센터구분(강의)
	private String  mapUrl;
	
	private int 	calcType;
	private String 	calcDd1;
	private String 	calcDd2;
	private String 	dispYn;

	private String mentalPsy;
	
	private String 	area1Nm;
	private String 	area2Nm;
	private String 	ymd;
	private String 	centerCnt;
	private String  counselYmd;
	
	private String mgrMemo;
	private String publicTraffic;
	
	/*TODO: 추후에 정식 명칭으로 변경해야 함*/
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
	private String extraNm;
	private String extraTarget;
	private String extraCost;
	
	private String carefulInfo;
	private String extraIdx;
	
	public void setTelInfo(String telNum) {
		if(!telNum.isEmpty()) {
			this.telNum1 = StringUtils.split(telNum, "-")[0];
			this.telNum2 = StringUtils.split(telNum, "-")[1];
			this.telNum3 = StringUtils.split(telNum, "-")[2];
		}
	}
	public void setFaxInfo(String faxNum) {
		if(!telNum.isEmpty()) {
			this.faxNum1 = StringUtils.split(faxNum, "-")[0];
			this.faxNum2 = StringUtils.split(faxNum, "-")[1];
			this.faxNum3 = StringUtils.split(faxNum, "-")[2];
		}
	}
	
	
}
