package com.ezwel.admin.service.service.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MindAreaDto {
	private String pageTypeSeq;
	private String areaNm;
	private String areaType;
	private String areaText;
	private String areaLinkUrl;
	private String areaImgUrl;
	private String fileSeq;
	private String pageTypeNm;
	
	public MindAreaDto() {
		pageTypeSeq = null;
		areaNm = null;
		areaType = null;
		areaText = null;
		areaLinkUrl = null;
		areaImgUrl = null;
		fileSeq = null;
		pageTypeNm = null;
	}
}
