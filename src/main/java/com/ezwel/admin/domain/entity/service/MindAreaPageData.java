package com.ezwel.admin.domain.entity.service;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MindAreaPageData extends PagingVo{
	private static final long serialVersionUID = -241064630156872681L;
	//private String areaSeq;
	private String pageTypeSeq;
	private String pageTypeNm;
	private String areaNm;
	private String areaType;
	private String areaText;
	private String areaLinkUrl;
	private String areaImgUrl;
	private String fileSeq;
	private String price;
	private String dcPrice;
	private String showDc;
}
