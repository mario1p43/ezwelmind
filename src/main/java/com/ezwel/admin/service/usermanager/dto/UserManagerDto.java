package com.ezwel.admin.service.usermanager.dto;

import java.util.ArrayList;
import java.util.List;

import com.ezwel.admin.domain.entity.sales.Sales;
import com.ezwel.core.framework.web.vo.PagingVo;
import com.ezwel.core.support.util.FormatUtil;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter @Setter
public class UserManagerDto extends PagingVo {
	
	private String clientCd;
	
	private String userNm;	
	
	private String year;	
	
	private String month;
	
	private String startMonth;
	
	private String endMonth;

	private String searchStMonth;
	
	private String searchEdMonth;
	
	private String siteType;
	
	private String userId;
	
	private String intakeCd;
	
	private String dispYn;
	
	private String type;
	
	private String counselCd;
	
	private String centerSeq;
	
	private String counselNm;
	
	private String counselorNm;
	
	private String counselorId;
	
	private String counselDiv;

	private String userKey;
	
	private String[] counselStatusArr;

	private String[] siteTypeArr;
	
	private String[] riskArr;
	
	private String[] orderStatusArr;
	
	private String searchYn;
	
	private String periodSeq;
	
	private String periodNo;
	
	private String startDd;
	
	private String endDd;
	
	private String totFlag;
	
	private String mgrId;
	
	private String counselMgrId;
	
	private String standDispType;
	
	private String userSex;
	
	private String counselReservChk;
	
	private String mobile;
	
	private String counselMobile;
	
	private String searchYear;
	
	// sales
	private String salesSeq;
	private String salesNm;
	private String salesType;
	private String unitPrice;
	private String janUserCnt;
	private String febUserCnt;
	private String marUserCnt;
	private String aprUserCnt;
	private String mayUserCnt;
	private String junUserCnt;
	private String julUserCnt;
	private String augUserCnt;
	private String sepUserCnt;
	private String octUserCnt;
	private String novUserCnt;
	private String decUserCnt;
	private String orderNo;
	private String regId;
	private String regDt;
	
	private List<UserManagerDto> sales = new ArrayList<>(); 
	// sales
	
	public String getMobile() {
		return FormatUtil.phone(this.mobile); 
	}
	
	public String getCounselMobile() {
		return FormatUtil.phone(this.counselMobile); 		
	}
}
