package com.ezwel.admin.service.pCounselorMgr.dto;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;
@Getter @Setter
@SuppressWarnings("squid:S1068")
public class PCounselorMgrDto {

	/**
	 * 상담일정
	 */
	
	//일정일련번호
	private int scheduleSeq;
	
	//센터일련번호
	private int centderSeq;
	
	//신청내역일련번호
	private int counselCd;
	
	//상담원ID
	private String userId;
	
	//휴무일여부
	private String holidayYn;
	
	//년월일
	private String ymd;
	
	//상담유형
	private int scheduleType;
	
	//시작시간
	private String stTime;
	
	//종료시간
	private String edTime;
	
	//등록일시
	private String regDt;
	
	//등록ID
	private String regId;
	
	//수정일시
	private String modiDt;
	
	//수정ID
	private String modiId;
}
