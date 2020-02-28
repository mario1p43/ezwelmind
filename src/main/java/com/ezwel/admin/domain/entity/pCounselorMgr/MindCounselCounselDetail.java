package com.ezwel.admin.domain.entity.pCounselorMgr;

import java.io.File;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.core.support.util.DateUtils;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter @Setter
public class MindCounselCounselDetail extends FileMind{

	/**
	 * 상담 일지 등록
	 */

	//인테이크코드
	private String intakeCd;

	//고객사코드
	private String clientCd;

	//유저키
	private int userKey;

	//상담유형
	private int channelType;

	//상담대상
	private int counselAges;

	//상담분야
	private String counselDiv;

	//상담방법
	private String counselType;

	//센터일련번호
	private int centerSeq;

	//회기
	private String intakeNum;

	//등록일시
	private String regDt;

	//등록ID
	private String regId;
//	인테이크

	//특이사항
	private String memo;
	private String recordMemo;

	//상담코드(신청내역일련번호)
	private String counselCd;

	//상담주제
	private String subject;

	//상담사유
	private String mainIssue;

	//상담목표
	private String goal;

	//주요개입
	private String intervention;

	//내담자반응
	private String feedback;

	//파일명
	private String fileNm;

	//파일경로
	private String filePath;

	//상태(상담일지)
	private String recordStatus;

	private String recordStatusYn;

	private String risks;

	//위험도 사유
	private String riskReason;

	//소명 사유
	private String callingIssue;

	//위험도 사유
	private String nextDt;

	//상담시간
	private String time;

	//상담시간_시
	private String time1;

	//상담시간_분
	private String time2;

	//상담사ID = USER_ID
	private String loginId;

	//상담사ID = USER_ID
	private String counselorId;

	//일지일련번호
	private String recordCd;

	//상담일시
	private String ymd;

	//최종목표
	private String finalGoal;

	//과정목표
	private String courseGoal;

	//상담계획
	private String counselPlan;
//	상담, 일지, 계획

	//소견 내용
	private String content;

	private String contNum;

	//소견유형
	private String recordType;
	private String[] recordTypeArr;

	private String recordTypeNm;

	private String recordType1;

	private String recordType2;

	private String recordType3;

	private String recordType4;

	private String recordType5;

	private String recordType6;

	//소견 내용_역사적배경
	private String content1;

	//소견 내용_내담자 내적요인
	private String content2;

	//소견 내용_상황적요인
	private String content3;

	//소견 내용_대인관계양상
	private String content4;

	//소견 내용_자원및취약점
	private String content5;

	//소견 내용_종합적이해
	private String content6;

	//소견 내용 등록여부
	private String contentYn;

	private int cnt;

	private String cntTitle;

	private String fileUpYn;

	private String modiId;
	
	private String modiDt;
	
	// 상담 연장여부
	private String extensionStatus;
	
	private String counselStatus;
	
	private String diagnosis_seq;
	
	private String qNum;
	
	private String answerNum;
	
	private String answerTxt;
	
	private String answer;

	private String answerYn;
	
	private String answer1;
	
	private String answer2;
	
	private String answer3;
	
	private String answer4;
	
	private String answer5;

	private int counselFeedBackType;
	
	private String counselFeedBack;
	
	private String checkSms;
	
	private String checkEmail;
	
	/** 상담주제 분류 1 */
	private String subjectItemCd1;
	
	/** 상담주제 분류 2 */
	private String subjectItemCd2;
	
	/** 상담주제 분류 3 */
	private String subjectItemCd3;
	
	private String q1;
	private String q2;
	private String q3;
	private String q4;
	private String q5;
	private String q6;
	private String q7;
	private String q8;
	private String q9;
	private String q10;
	private String q11;
	private String q12;
	private String q13;
	private String q14;
	
	private String endType;
	private String endReasonType;
	private String etcEndReason;
	private String endReport;

	@Override
	public String contextFilePath(String fileNm) {
		return File.separator + "partner" + File.separator + "center" + File.separator + DateUtils.getDateFormat("yyyy") + File.separator + DateUtils.getDateFormat("MM");
	}
}
