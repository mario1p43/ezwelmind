package com.ezwel.admin.domain.entity.edu;

import com.ezwel.core.framework.web.vo.PagingVo;
import com.ezwel.core.support.util.StringUtils;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class EducationInfoDto extends PagingVo{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1874734817023818922L;

	private String eduId;
	private String eduType;
	private String eduDiv;
	private String eduNm;
	private String eduHour;
	private String eduDtFm;
	private String eduDtTo;
	private String eduPlace;
	private String eduEtc;
	private String userNm;
	private String userId;
	
	
	private String gender;
	private String excelFlag;
	
	private String clientCd;
	
	// 고객사
	private String clientNm;
	
	// 상담코드
	
	private String counselCd;
	private String scheduleDt;

	// 임직원 명
	private String staffNm;

	// 내담자명
	private String mgrNm;

	// 상담타입
	private String counselType;

	// 상담상태
	private String counselStatus;

	// 센터 명
	private String centerNm;

	// 센터코드
	private int centerSeq;
	
	// 센터코드
	private String centerSeq2;

	// 상담자 명
	private String counselorNm;

	// 상담자 명
	private String counselorId;


	// 가격
	private String price;

	// 세금 타입
	private String taxType;

	// 은행명
	private String bankNm;


	// 예금주
	private String accountOwner;
	
	
	
}
