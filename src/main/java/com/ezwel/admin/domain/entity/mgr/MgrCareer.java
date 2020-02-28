package com.ezwel.admin.domain.entity.mgr;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MgrCareer {
	
	private String userId;

	private String organizationName;
	
	private String role;
	
	private String roleStartDate;
	
	private String roleEndDate;
}
