package com.ezwel.admin.domain.entity.pCounselorMgr;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter @Setter
public class MindCounselIntake extends PagingVo{

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
	private String counselDiv;
	
	//상담분야명
	private String counselDivNm;
	
	//상담방법
	private String counselType;

	//센터일련번호
	private int centerSeq;

	//학력
	private String education;

	//학년
	private String session;

	//모바일
	private String mobile;

	//인테이크 모바일
	private String intakeMobile;

	//이메일
	private String email;

	//상담사유 OR 주제
	private String cause;

	//자유기술
	private String memo;

	//직업
	private String job;

	//상태
	private int status;

	//회기
	private String intakeNum;

	//등록일시
	private String regDt;

	//등록ID
	private String regId;

	//상담코드(신청내역일련번호)
	private String counselCd;

	//유저네임
	private String userNm;

	//상담사명
	private String counselorNm;

	//상담사ID
	private String counselorId;

	//고객명
	private String clientNm;

	//상태(상담일지)
	private String recordStatus;

	private String risks;

	//상담시간
	private String time;

	private String loginId;

	private String ymd;

	//상담일자
	private String scheduleDt;
	
	// 연장회차
	private String extensionNum;
	
	// 상담유형명
	private String channelNm;
	
	private String qNum;
	
	private String point;
	
	private String answerNum;
	
	private String counselMgrNm;
	
	private String scheduleDtOverdue;
	
	
	
	private String filename1; 
	private String filename2;
    private String filename3;
    private String filename4;
    private String filename5;
    private String filefath1;
    private String filefath2;
    private String filefath3;
    private String filefath4;
    private String filefath5;
}
