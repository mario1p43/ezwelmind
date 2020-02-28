package com.ezwel.admin.domain.entity.pCounselorMgr;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MindCounsel {

	/**
	 * 상담/진단
	 */
	
	//신청내역일련번호
	private int counselCd;
	
	//인테이크코드
	private int intakeCd;
	
	//고객사코드
	private String clientCd;
	
	//유저키
	private int userKey;
	
	//카테고리일련번호
	private int categoryCd;
	
	//상담센터일련번호
	private int centerSeq;
	
	//일정일련번호
	private int scheduleSeq;
	
	//상담일시
	private String counselDt;
	
	//상담방법
	private int counselType;
	
	//상담사ID(USER_ID)
	private String counselorId;
	
	//상담비용
	private String counselPrice;
	
	//추가시간
	private String addTime;
	
	//추가비용
	private String addPrice;
	
	//상태(상담예약)
	private int status;

	//상태(상담일지)
	private int recordStatus;
	
	//메모
	private String memo;
	
	//등록일시
	private String regDt;
	
	//등록ID
	private String regId;
	
	//취소일시
	private String cancelDt;
	
	//취소ID
	private String cancelId;
}
