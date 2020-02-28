package com.ezwel.admin.domain.entity.client;

import com.ezwel.core.framework.web.vo.Vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 고객사제도기간
 * 		- MIND_CLIENT_JEDO_PERIOD
 * @author ddakker 2015. 8. 19.
 */
@Setter @Getter
public class ClientSub extends Vo {
	
	private String clientCd;
	
	private String gubunType;
	
	private String dispType;
	
	private String dispNo;
	
	private String useYn;
	
	private String dispYn;
	
	private String essenYn;
	
	private String commCd;
	
	private String commNm;
}
