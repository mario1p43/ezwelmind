package com.ezwel.admin.service.menu.dto;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter @Setter
public class ClientCopyDto {
	
	/**
	 * 복사해줄 고객사
	 */
	private String fromClientCd;
	
	/**
	 * 복사당하는 고객사
	 */
	private String toClientCd;
	
	private String menuGroup;
	
	private String modiId;
	
	
	/**
	 * true 일때만 로직이 실행되야됨.
	 * 같은 고객사끼리는 복사가 불가능하기 때문에
	 * @return 다르면 true
	 */
	public boolean copyVaildate() {
		return !fromClientCd.equals(toClientCd);
	}

}
