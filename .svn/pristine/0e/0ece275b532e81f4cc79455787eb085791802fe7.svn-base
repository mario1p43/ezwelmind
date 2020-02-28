package com.ezwel.admin.service.menu.dto;
import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;


@SuppressWarnings("serial")
@Getter @Setter
public class MenuDto extends PagingVo {

	private String menuSeq;

	private String menuCd;

	private String levelCd;

	private String highLevelCd;

	private String menuNm;

	private String orderNo;

	private String[] menuData;


	private String imgUrl;

	private String imgUrl2;

	private String menuTxt;

	private String expandYn;

	private String dispYn;

	private String authCd;

	private String useYn;

	private String menuGroup;

	private String clientCd;

	private String payType;

	private String modiId;

	private boolean clientUpdate;

	private String clientNm;

	private String depth;

	private String clientMenuNm;
	private String clientMenuCd;
	private String clientMenuUrl;
	private String clientUseYn;
	private String clientDispYn;
	private String payType1;
	private String payType2;
	private String payType3;


	public void setMenuCd(String menuCd) {
		try {
			this.menuCd = Integer.parseInt(menuCd) + "";
		} catch (NumberFormatException e){
			this.menuCd = "0";
		}

	}

	/**
	 * jsp에서 제이슨 파싱으로 으로 변경예정..
	 * @param data [0] = 레벨 [1] = 상위레벨 [2] = 메뉴명 [3] = 정렬순서
	 * 			   [4] = 메뉴코드 [5] = 이미지 [6] = 이미지2 [7] = 메뉴카피 [8] = 확장여부
	 * 			   [9] = 권한코드 [10] = 노출여부 [11] = 확장여부 [12] = 뎁스
	 */
	public void setValue(String[] data) {
		this.setLevelCd(data[0]);
		this.setHighLevelCd(data[1]);
		this.setMenuNm(data[2]);
		this.setOrderNo(data[3]);
		this.setMenuCd(data[4]);
		this.setImgUrl(data[5]);
		this.setImgUrl2(data[6]);
		this.setMenuTxt(data[7]);
		this.setExpandYn(data[8]);
		this.setAuthCd(data[9]);
		this.setDispYn(data[10]);
		this.setUseYn(data[11]);
		this.setDepth(data[12]);
	}

	/**
	 * 그룹메뉴 최초등록일때 샘플값 매핑
	 */
	public void setSampleData() {
		this.setMenuSeq("1");
		this.setLevelCd("1");
		this.setMenuCd("1");
		this.setHighLevelCd("0");
		this.setMenuNm("sample");
		this.setOrderNo("1");
		this.setExpandYn("Y");
		this.setDispYn("Y");
		this.setUseYn("Y");
		this.setImgUrl("");
		this.setImgUrl2("");
		this.setMenuTxt("");
		this.setAuthCd("");
	}
}
