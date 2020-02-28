package com.ezwel.admin.domain.entity.diagnosis;

import com.ezwel.core.framework.web.vo.Vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PollExcel extends Vo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8195167395555617033L;
	private String pollUserSeq;
	private String pollSeq;
	private String empNum;
	private String name;
	private String gender;
	private String age;
	private String businessDiv;
	private String businessDivEtc;
	private String grade;
	private String branch;
	private String dept;
	private String workYear;
	private String regDt;
	private String answerSeq;
	private String questionNum;
	private String answerNum;
	private String marryYn;
	private String answer;
}
