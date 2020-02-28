package com.ezwel.admin.domain.entity.goods;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class GoodsOptionGrpData {

	private int	goodsCd;	//상품일련번호
	private int	grpCd;		//옵션그룹번호
	private String	grpNm;	//옵션 그룹명
	private String	useYn;	//사용여부
	private String	selectYn;	//선택필수
	private int grpSort;		//정렬 순서
	private String	regId;		//등록자
	private String	regDt;		//등록일시
	private String	modiId;		//수정자
	private String	modiDt;		//수정일시
}
