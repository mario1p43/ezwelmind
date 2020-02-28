package com.ezwel.admin.domain.entity.diagnosis;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class PollUser extends PagingVo {

	/**
	 * 멘탈헬스 자가진단
	 * 설문자
	 */

	private static final long serialVersionUID = 4622763520686670298L;

	private String pollUserSeq;
	private String pollSeq;
	private String questionSetSeq;
	private String gender;
	private String age;
	private String businessDiv;
	private String businessDivEtc;
	private String grade;
	private String dept;
	private String branch;
	private String workYear;
	private String regDt;
	private String empNum;
	private String name;
	private String marryYn;
}
