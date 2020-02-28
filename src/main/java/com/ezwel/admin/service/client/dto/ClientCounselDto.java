package com.ezwel.admin.service.client.dto;

import com.ezwel.core.framework.web.vo.PagingVo;
import com.ezwel.core.framework.web.vo.Vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ClientCounselDto extends PagingVo{
	private String counselNm;		//내담장
	private String centerSeq;		//센터번호
	private String counselorNm;		//상담사이름
	private String clientCd;		//고객사코드
	private String startDt;			//시작일
	private String endDt;			//종료일
	private String extensionDt;		//연장일
	private String counselCd;
}
