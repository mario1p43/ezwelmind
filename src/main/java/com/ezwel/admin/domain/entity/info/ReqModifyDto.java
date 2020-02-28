package com.ezwel.admin.domain.entity.info;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReqModifyDto extends PagingVo{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6417628843259293061L;

	private String centerNm;
	
	private String userId;
	
	private String userNm;
	
	private String rrn;
	
	private String gender;
	
	private String mobile;
	
	private String area;
	
	private String authCd;
	
	private String workType;
	
	private String channelType;
	
	private String modiId;
	
	private String modiDt;
}
