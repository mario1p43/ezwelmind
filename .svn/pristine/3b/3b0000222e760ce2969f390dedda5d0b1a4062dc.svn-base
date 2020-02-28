package com.ezwel.admin.service.template.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TemplateDto {
	
	// 템플릿 번호
	private String tmpltSeq;
	
	// 고객사 코드
	private String clientCd;
	
	// 케이스 번호
	private String caseNo;
	
	// 상담 번호 
	private String counselNo;
	
	// 사용 여부
	private String useYn;
	
	// SMS 내용
	private String smsMsg;

	// @Gabege
	private List<TemplateDto> templates = new ArrayList<>();
	
	public TemplateDto() { }
	
	public TemplateDto(String clientCd) {
		this.clientCd = clientCd;
	} 
}
