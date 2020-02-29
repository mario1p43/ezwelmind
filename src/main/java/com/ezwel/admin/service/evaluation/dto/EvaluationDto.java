package com.ezwel.admin.service.evaluation.dto;


import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class EvaluationDto extends PagingVo {

//	mind_evaluation
	private String evalSeq;
	private String evalType;
	private String evalTitle;
	private String evalStatus;
	private String evalDisNum;

//	mind_evaluation_item
	private int itemSeq;
	private String itemNo;
	private String itemTitle;
	private String itemType;
	private String itemLimit;
	private String itemYn;

//	mind_evaluation_user
	private String evalUserSeq;
	private String targetSeq;
	private String userKey;
	private String itemAns;
	private String regDt;


	private String counselCd;
	private String encodeUserKey;
	private String encodeCounselCd;
	private String item01Ans;
	private String item02Ans;
	private String item03Ans;
	private String item04Ans;
	private String item05Ans;
	private String item06Ans;
	
	private String clientCd;
	private String userNm;
	private String userId;
	
	private String orderNum;
	

	private String itemAns1;
	private String itemAns2;
	private String itemAns3;
	private String itemAns4;
	private String itemAns5;
	private String itemAns6;
	private String itemAns7;
	private String itemAns8;
	private String itemAns9;
	private String itemAns10;
	
	private int countNum;
	private String itemAnsMerge;
	private String intakeCd;
	
	private String counselorId;
	

	private String startMonth;
	private String endMonth;
	
	private String showYn;
	
	private int centerSeq;	//센터일련번호
	
	
	
}
