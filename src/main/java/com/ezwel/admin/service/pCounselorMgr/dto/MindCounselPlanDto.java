package com.ezwel.admin.service.pCounselorMgr.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MindCounselPlanDto {

	//인테이크코드
//	private int intakeCd;
	private String intakeCd;
	
	//고객사코드
	private String clientCd;
	
	//센터일련번호
	private int centerSeq;
	
	//상담사ID / USERID
	private String counselorId;
	
	//최종목표
	private String finalGoal;
	
	//과정목표
	private String courseGoal;
	
	//상담계획
	private String counselPlan;
	
	//등록ID
	private String regId;
	
	//등록일시
	private String regDt;
	
	//수정ID
	private String modiId;
	
	//수정일시
	private String modiDt;
	
	private String counselCd;
}
