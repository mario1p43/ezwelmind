package com.ezwel.admin.domain.entity.diagnosis;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class PollInfo extends PagingVo {

	/**
	 * 멘탈헬스 자가진단
	 * 진단 정보
	 */
	private static final long serialVersionUID = 5247941038872998120L;

	private String pollSeq;
	private String questionSetSeq;
	private String pollNm;
	private String allClientYn;
	private String clientCd;
	private String startDt;
	private String endDt;
	private String startTime;
	private String endTime;
	private String useYn;
	private String regId;
	private String regDt;
	private String stepCnt;
	

	private String datetime;
	private String dateTimeType;

}
