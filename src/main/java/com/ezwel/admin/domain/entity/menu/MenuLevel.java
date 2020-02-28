package com.ezwel.admin.domain.entity.menu;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MenuLevel {

	/**
	 * 메뉴 마스터
	 * 메뉴레벨 테이블에서 메뉴CD 테이블 조인
	 */
	@Getter @Setter
	private MenuCd menuCdEntity;

	@Getter @Setter
	private String menuSeq;

	/**
	 * 메뉴구분
	 */
	@Getter @Setter
	private String menuType;

	/**
	 * 메뉴레벨
	 */
	@Getter @Setter
	private String levelCd;

	/**
	 * 상위메뉴레벨
	 */
	@Getter @Setter
	private String highLevelCd;

	/**
	 * 메뉴코드
	 */
	@Getter @Setter
	private String menuCd;

	/**
	 * 메뉴명
	 */
	@Getter @Setter
	private String menuNm;

	/**
	 * 메뉴이미지
	 */
	@Getter @Setter
	private String imgUrl;

	/**
	 * 메뉴이미지2
	 */
	@Getter @Setter
	private String imgUrl2;

	/**
	 * 메뉴카피
	 */
	@Getter @Setter
	private String menuTxt;

	/**
	 * 노출순서
	 */
	@Getter @Setter
	private String orderNo;

	/**
	 * 확장여부
	 */
	@Getter @Setter
	private String expandYn;

	/**
	 * 권한코드
	 */
	@Getter @Setter
	private String authCd;

	/**
	 * 노출여부
	 */
	@Getter @Setter
	private String dispYn;

	/**
	 * 사용여부
	 */
	@Getter @Setter
	private String useYn;

	/**
	 * 등록ID
	 */
	@Getter @Setter
	private String regId;

	/**
	 * 등록일시
	 */
	@Getter @Setter
	private String regDt;

	/**
	 * 수정ID
	 */
	@Getter @Setter
	private String modiId;

	/**
	 * 수정일시
	 */
	@Getter @Setter
	private String modiDt;

	/**
	 * 메뉴Url
	 */
	@Getter @Setter
	private String menuUrl;
	
	/**
	 * 고객사 - 결제수단
	 */
	@Getter @Setter
	private String payType;
	
	/**
	 * 고객사 - 사용여부
	 */
	@Getter @Setter
	private String clientUseYn;
	
	/**
	 * 고객사 - 노출여부
	 */
	@Getter @Setter
	private String clientDispYn;
	
	/**
	 * 메뉴그룹
	 */
	@Getter @Setter
	private String menuGroup;
	
	/**
	 * 고객사코드
	 */
	@Getter @Setter
	private String clientCd;

}
