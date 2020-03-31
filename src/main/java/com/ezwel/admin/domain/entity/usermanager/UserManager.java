package com.ezwel.admin.domain.entity.usermanager;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter @Setter
public class UserManager extends PagingVo {
	
	private String orderNum;
	private String clientCd;
	private String clientNm;
	private String userId;
	private String counselCd;
	private String orderDt;
	private String scheduleDt;
	private String counselNm;
	private String relation;
	private String rrn;
	private String gender;
	private String job;
	private String mobile;
	private String counselMobile;
	private String counselDiv;
	private String cause;
	private String memo;
	private String counselType;
	private String centerSeq;
	private String centerNm;
	private String counselorId;
	private String payType;
	private String orderStatus;
	private String extensionNum;
	private String userKey;
	private String deviceId;
	private String pushYn;
	private String allClientYn;
	private String pushSound;
	private String cancelDt;

	private String month;
	private String userNm;
	private String status;
	private String birthDd;
	private String branchCd;
	private String deptCd;
	private String teamCd;
	private String partCd;
	private String gradeCd;
	private String userAge;
	private String age;
	private String userGender;
	private String orderAmt;
	
	private String riskReason;
	private String risk;
	private String record;
	private String counselorNm;
	
	private String marryYn;
	private String statusNm;
	private String siteType;
	private String intakeCd;
	private String orderId;
	
//	온라인진단 현황 추가
	private String mdcRegSeq;
	private String userOrderNum;
	private String userBirth;
	private String email;
	private String userStatus;
	private String userRegDt;
	private String mdcSeq;
	private String areaSeq;
	private String resultPoint;
	private String resultTotYn;
	private String poolAnalysis;
	private String poolRecommend;
// 	종료
	
	private String confirmCallYn;
	private String surveyCallYn;
	private String counselTypeNm;
	private String orderStatusNm;
	private String recordStatus;
	private String counselReservChk;
	
	private String employeeCnt;
	private String employeeUseCnt;
	private String allUseCnt;
	private String counselCnt;
	
	private String m1;
	private String m2;
	private String m3;
	private String m4;
	private String m5;
	private String m6;
	private String m7;
	private String m8;
	private String m9;
	private String m10;
	private String m11;
	private String m12;
	private String tot;
	private String cnt;

	private String m1User;
	private String m2User;
	private String m3User;
	private String m4User;
	private String m5User;
	private String m6User;
	private String m7User;
	private String m8User;
	private String m9User;
	private String m10User;
	private String m11User;
	private String m12User;
	
	private String minCounselCd;

	private String count;
	private String areaNm;
	
	private String poolSeq;
	private String standDispType;
	private String standRiskLevel;
	private String standTotYn;
	private String standStPoint;
	private String standEndPoint;
	private String userSex;
	
	private String recordStatusNm;
	private String confirmCnt;
	
	private String noSiteTypeCnt;
	private String webCnt;
	private String mobileWebCnt;
	private String mobileAppCnt;
	private String adminCnt;
	private String excelCnt;
	private String orderTotCnt;

	private String finalGoal;
	private String counselPlan;
	private String mainIssue;
	private String goal;
	private String intervention;
	private String counselMemo;
	private String time;
	private String counselFeedBack;
	private String callingIssue;
	private String content6;
	private String content5;
	private String content4;
	
	
	private String orderStatusCd;

	/** 상담주제 분류 */
	private String subjectItemCd1;
	
	/** 상담주제 분류 */
	private String subjectItemCd2;
	
	/** 상담주제 분류 */
	private String subjectItemCd3;
	
	/** 마인드프리즘 상태값 */
	private String mindPrismStatus;
}
