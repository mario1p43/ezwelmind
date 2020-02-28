package com.ezwel.admin.domain.entity.bbs;

import lombok.Getter;
import lombok.Setter;

public class BBSComment {
	
	/**
	 * @Key
	 * 코멘트 일련번호
	 */
	@Getter @Setter
	private int commentSeq;
	
	/**
	 * @FKey
	 * 게시글 인련번호
	 */
	@Getter @Setter
	private int dataSeq;
	
	/**
	 * @FKey
	 * BBS코드
	 */
	@Getter @Setter
	private int bbsCd;
	
	/**
	 * 코멘트
	 */
	@Getter @Setter
	private String comment;
	
	/**
	 * 등록자
	 */
	@Getter @Setter
	private String regNm;
	
	/**
	 * 등록 IP
	 */
	@Getter @Setter
	private String regIp;
	
	/**
	 * 등록일시
	 */
	@Getter @Setter
	private String regDt;
	
}
