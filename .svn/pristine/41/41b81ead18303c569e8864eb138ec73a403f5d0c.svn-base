package com.ezwel.admin.service.menu.dto;
import lombok.Getter;
import lombok.Setter;

import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.framework.web.vo.PagingVo;


@SuppressWarnings("serial")
@Getter @Setter
public class MenuCodeDto extends PagingVo {
	
	private String menuCd;
	
	private String menuGroup;

	private String menuDiv;
	
	private String menuNm;
	
	private String menuUrl;
	
	private String regId;
	
	private String regDt;
	
	private String modiId;
	
	private String modiDt;	
	
	
	public MenuCodeDto() {
		this(UserDetailsHelper.getAuthenticatedUser().getUserId());
	}
	
	public MenuCodeDto(String id) {
		this.regId = id;
		this.modiId = id;
	}

}
