package com.ezwel.admin.service.pCounselorMgr.dto;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@Getter @Setter
@SuppressWarnings("serial")
public class MindCounselIntakeDto extends PagingVo{

	/**
	 * 상담인테이크
	 */

	//인테이크코드
//	private int intakeCd;
	private String intakeCd;

	//고객사코드
	private String clientCd;

	//유저키
	private int userKey;

	//상위인테이크코드
	private int highIntakeCd;

	//임직원과의 관계
//	private int relation;
	private String relation;

	//임직원과의 관계 기타
	private String relationEtc;

	//내담자명
	private String counselNm;

	//성별
	private String gender;

	//생년월일(주민등록상)
	private String rrn;

	//연령구분
	private int ageDiv;

	//상담유형
	private int channelType;

	//상담대상
	private int counselAges;

	//상담분야
//	private int counselDiv;
	private String counselDiv;

	//상담방법
//	private int counselType;
	private String counselType;

	//센터일련번호
	private int centerSeq;

	//학력
//	private int education;
	private String education;

	//학년
//	private int session;
	private String session;

	//모바일
	private String mobile;

	//이메일
	private String email;

	//상담사유 OR 주제
	private String cause;

	//자유기술
	private String memo;

	//직업
//	private int job;
	private String job;

	//상태
	private int status;

	//회기
//	private int intakeNum;
	private String intakeNum;

	//등록일시
	private String regDt;

	//등록ID
	private String regId;

	//상담코드(신청내역일련번호)
//	private int counselCd;
	private String counselCd;

	//유저네임
	private String userNm;

	//상담사ID
	private String counselorId;

	//상담사명
	private String counselorNm;

	//고객명
	private String clientNm;

	//상태(상담일지)
//	private int recordStatus;
	private String recordStatus;

//	private int risks;
	private String risks;

	//상담시간
	private String time;

	private String loginId;

	//일지일련번호
	private String recordCd;

	//상담일시
	private String ymd;

	//답변 여부
	private String answerYn;

	//답변1
	private String answer1;

	//답변2
	private String answer2;

	//답변3
	private String answer3;

	//답변4
	private String answer4;

	//답변5
	private String answer5;

	//상담날짜
	private String scheduleDt;
	
}
