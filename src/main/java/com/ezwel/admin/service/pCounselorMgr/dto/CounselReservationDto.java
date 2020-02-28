package com.ezwel.admin.service.pCounselorMgr.dto;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@Getter @Setter
public class CounselReservationDto extends PagingVo{

	private int counselCd;	//신청내역일련번호
	
	private int intakeCd;	//인테이크코드
	
	private String clientCd;	//고객사코드
	
	private int userKey;	//유저키
	
	private int categoryCd;	//카테고리일련번호
	
	private int centerSeq;	//센터일련번호
	
	private int scheduleSeq;	//일정일련번호
	
	private String counselDt;	//확정일시
	
	private int counselType;	//상담방법
	
	private String counselorId; //상담사ID(상담원)
	
	private String counselPrice;	//상담비용
	
	private String addTime;	//추가시간
	
	private String addPrice;	//추가비용
	
	private int counselStatus;	//상태(상담/진단)
	
	private int intakeStatus;	//상태(상담예약상태)
	
	private String memo;	//메모
	
	private String regDt;	//등록일시
	
	private String regId;	//등록ID
	
	private String cancelDt;	//취소일시
	
	private String cancelId;	//취소ID
	
	private String holidayYn;	//휴무일여부
	
	private String ymd;	//년월일
	
	private int scheduleType;	//상담유형(상담, 검사)
	
	private String stTime;	//시작시간
	
	private String edTime;	//종료시간
		
	private String modiDt;	//수정일시
	
	private String modiId;	//수정ID
	
	private String counselNm;	//내담자명
	
	private int counselDiv;	//상담분야
	
	private int recordStatus;	//상태(일지작성여부)
	
	private String counselorNm;	//상담자명
	
	private String ownerNm;	//임직원명
	
	private String mobile;	//모바일
	
	private String startDt;	//검색시작일
	
	private String endDt;	//검색종료일

	private String userId;	//검색종료일
	
	private String scheduleDt;	//상담날짜
	
	private int extensionNum;	//연장회차
	
	private String centerOwnerYn;
	
	private String orderByNm; //order by 주체
	
	private String orderByType; //order by 상태 asc : desc
}
