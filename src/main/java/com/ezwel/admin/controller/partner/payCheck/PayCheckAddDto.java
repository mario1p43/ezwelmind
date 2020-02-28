package com.ezwel.admin.controller.partner.payCheck;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PayCheckAddDto extends PagingVo{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String userId;		// 유저 ID
	
	public String clientCd;		// 고객사코드
	
	public String clientNm;		// 고객사
	
	public String counselCd;	// 상담코드
	
	public String scheduleDt;	// 상담일시
	
	public String staffNm;		// 임직원
	
	public String mgrNm;		// 내담자
	
	public String counselType;	// 상담타입
	
	public String counselStatus;		// 상담상태
	
	public String centerNm;		// 상담기관
	
	public String centerSeq;	// 상담기관코드
	
	public String counselorNm;	// 상담사
	
	public String counselorId;	// 상담사ID

	public String price;		// 가격
	
	public String taxType;		// 세금구분
	
	public String bankNm;		// 은행명
	
	public String accountOwner;	// 예금주
	
	public String startDt;	//검색시작일
	
	public String endDt;	//검색종료일
	
	
	public String searchClientCd;	// 고객사코드(검색)
	
	public String searchStaffNm;	// 임직원(검색)
	
	public String searchMgrNm;		// 내담자(검색)
	
	public String searchCounselorNm;	// 상담사(검색)
	
	public String searchCenterSeq;	// 상담기관코드
	
	
	public String writeMonth;	//작성일자(월)
	
	public String writeDay;		//작성일자(일)
	
	public String issueMonth;	//발행기한(월)
	
	public String issueDay;		//발행기한(일)
	
	public String issueHour;	//발행기한(시)
	
	public String email;		//이메일
	
	public String insertType;	// I : INSERT, U : UPDATE
	
	public String ownerCheck;		//오너 체크
	public String ownerCheckDt;		//오너 체크일
	public String counselorCheck;		//상담사 체크
	public String counselorDt;		//상담사 체크일 
	public String managerCheck;		//상담사 체크
	public String managerDt;		//상담사 체크일 
	public String recordStatus;   //일지 상태
	
	@Override
	public String toString() {
		return "payCheckAddDto [clientCd=" + clientCd + ", clientNm=" + clientNm + ", counselCd=" + counselCd + ", scheduleDt=" + scheduleDt 
				+ ", staffNm=" + staffNm + ", mgrNm=" + mgrNm + ", counselType=" + counselType + ", counselStatus=" + counselStatus 
				+ ", centerNm=" + centerNm + ", centerSeq=" + centerSeq + ", counselorNm=" + counselorNm + ", counselorId=" + counselorId 
				+ ", price=" + price + ", taxType=" + taxType + ", bankNm=" + bankNm + ", accountOwner=" + accountOwner 
				+ ", searchClientCd=" + searchClientCd + ", searchStaffNm=" + searchStaffNm + ", searchMgrNm=" + searchMgrNm 
				+ ", searchCounselorNm=" + searchCounselorNm + ", searchCenterSeq=" + searchCenterSeq 
				+ ", startDt=" + startDt + ", endDt=" + endDt + "]";
	}

}
