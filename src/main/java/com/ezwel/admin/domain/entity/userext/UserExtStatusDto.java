package com.ezwel.admin.domain.entity.userext;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UserExtStatusDto  extends PagingVo{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6293132408708471266L;
	
	private String regDt;
	
	private String clientNm;
	
	private String staffNm;
	
	private String counselNm;
	
	private String riskDegree;

	private String centerNm;
	
	private String counselorNm;
	
	private String recordCd;
	
	private String pointSeq;
	
	private String extensionStatus;
		
	private String counselorId;
	private int centerSeq;
	
	private String orderByNm;
	
	
	private String ownerNm;
	
	private String 	mobile;
	private String counselDiv;
	private String 	counselType;
	private String  channelType;
	private String 	ymd;
	private String 	stTime;
	
	private String 	counselCd	;
	
	private String  intakeCd;
	private String  userKey;
	
	private String clientCd;
	
	private String  needPay;
	private String  recordStatus;
	private String orderByType;
	private String  counselMgrNm;
	private String startDt;
	private String endDt;
	private String risk;

	private String fileSeq1;
	private String fileSeq2;
	private String fileSeq3;
	
	private String filename1;
	private String filename2;
	private String filename3;
	
	private String filefath1;
	private String filefath2;
	private String filefath3;
	
	private String apprStatus1;
	private String apprStatus2;
	private String apprStatus3;
	
	private String regId1;
	private String regId2;
	private String regId3;
	
	private String regDt1;
	private String regDt2;
	private String regDt3;
	
	private String teamCd;
	
}
