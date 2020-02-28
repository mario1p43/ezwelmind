package com.ezwel.admin.domain.entity.goods;

import java.util.List;

import com.ezwel.admin.domain.entity.category.Category;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class GoodsCd {
	
	private List<Category> category;

	private String goodsCd;

	private String serviceType;

	private String goodsNm;

	private String usedType;

	private String regId;

	private String regDt;

	private String modiId;

	private String modiDt;

}
