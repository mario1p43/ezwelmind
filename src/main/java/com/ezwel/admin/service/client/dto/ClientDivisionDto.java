package com.ezwel.admin.service.client.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ClientDivisionDto {
	
	private String commCd;
	
	private String clientCd;
	
	private String highCommCd;
	
	private String commNm;
	
	private String optionCd;
	
	private String useYn;
	
	/** 부서에 한해서 정렬기준으로 사용*/
	private String orderNo;
	
	
	private String[] divisionData;
	
	
	/**
	 * 
	 * @param data [0] commCd, [1] highCommCd, [2] commNm, [3] order정렬순서(현재는 사용하지 않음), [4] useYn
	 */
	public void setValue(String[] data) {
		this.setCommCd(data[0]);
		this.setHighCommCd(data[1]);
		this.setCommNm(data[2]);
		this.setOrderNo(data[3]);
		this.setUseYn(data[4]);
		
		this.setOptionCd("division"); // 필수, mind_client_comm_cd 테이블의 division은 부서를 나타냄
	}
	
	public void setTopicValue(String[] data) {
		this.setCommCd(data[0]);
		this.setHighCommCd(data[1]);
		this.setCommNm(data[2]);
		this.setOrderNo(data[3]);
		this.setUseYn(data[4]);
		
		this.setOptionCd("topic"); // 필수, mind_client_comm_cd 테이블의 topic은 상담주제를 나타냄
	}

}
