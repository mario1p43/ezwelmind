package com.ezwel.admin.domain.entity.navigator;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NavigatorData {
	//네비 일련변호(PK)
		private int naviSeq;
		
		//상위일련번호
		private int highNaviSeq;
		
		//명칭
		private String naviTitle;
		private String title;
		
		//사용여부
		private int naviStatus;
		
		//노출순위
		private int naviSort;
		
		//상품링크여부
		private String naviCheck;
		
		
		//target
		//관리 일련번호
		private int targetSeq;
		
		//상품유형
		private int targetType;
		
		//상품코드
		private int targetCd;
		
		//상품명
		private String targetNm;
		
		//상품Url
		private String targetUrl;
		
		//상태코드
		private int targetStatus;
		
		
		private String upTitle;
}
