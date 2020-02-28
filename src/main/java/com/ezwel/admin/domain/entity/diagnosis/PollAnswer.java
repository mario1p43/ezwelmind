package com.ezwel.admin.domain.entity.diagnosis;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class PollAnswer {
	/*
	 * 멘탈헬스 자가진단
	 * 답변
	 */

	private String answerSeq;
	private String pollSeq;
	private String pollUserSeq;
	private String questionNum;
	private String answerNum;
	private String answer;

}
