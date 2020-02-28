package com.ezwel.admin.service.counsel.dto;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CounselDto extends PagingVo {
	
	private String counselCd;
	
	private String userId;
	
	private String ymd;
	
	private String stTime;
	
	private String centerSeq;
	
	private String edTime;
	
	private String regId;
	
	private String modiId;
	
	private String scheduleSeq;
	
	private String scheduleType;
	
	private String holidayYn;
	
	private String counselorId;
	
	private String scheduleDt;
	
	private String userKey;

	private String startDt;
	
	private String endDt;
	
	private String smsYn;
	
	private String smsDt;
	
	private String highCategoryCd;
	
	private String clientCd;
}
