package com.ezwel.admin.domain.entity.bbs;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;
import com.ezwel.core.support.util.StringUtils;

public class BBSData extends PagingVo {


	/**
	 * @Key
	 * 게시글 일련번호
	 */
	@Getter @Setter
	private String dataSeq;

	/**
	 * @Key
	 * BBS코드
	 */
	@Getter @Setter
	private String bbsCd;

	/**
	 * 상위글번호(Default -1)
	 */
	@Getter @Setter
	private int highDataSeq;

	/**
	 * 답글여부
	 */
	@Getter @Setter
	private String replyYn;

	/**
	 * 글제목
	 */
	@Getter @Setter
	private String subject;

	/**
	 * 글내용
	 */
	@Getter @Setter
	private String content;

	/**
	 * 글내용(모바일용)
	 */
	@Getter @Setter
	private String mobileContent;

	/**
	 * 구분1
	 */
	@Getter @Setter
	private int reqCd1;

	/**
	 * 구분2
	 */
	@Getter @Setter
	private int reqCd2;

	/**
	 * 페이지 호출키
	 */
	@Getter @Setter
	private String pageKey;

	/**
	 * 정적 페이지 경로
	 */
	@Getter @Setter
	private String htmlUrl;

	/**
	 * 조회수
	 */
	@Getter @Setter
	private String visited;

	/**
	 * 노출여부
	 */
	@Getter @Setter
	private String dispYn;

	/**
	 * 등록ID
	 */
	@Getter @Setter
	private String regId;

	/**
	 * 등록자
	 */
	@Getter @Setter
	private String regNm;

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
	 * 수정자
	 */
	@Getter @Setter
	private String modiNm;

	/**
	 * 수정일시
	 */
	@Getter @Setter
	private String modiDt;

	/**
	 *
	 */
	@Getter @Setter
	private String reqCd1Nm;

	/**
	 *
	 */
	@Getter @Setter
	private String reqCd2Nm;

	@Getter @Setter
	private String columnistNm;

	@Getter @Setter
	private String columnistDd;

	@Getter @Setter
	private String columnistCareer;

	@Getter @Setter
	private String columnistMemo;

	@Getter @Setter
	private String columnistGrade;

	@Getter @Setter
	private String newsDd;

	@Getter
	private String interestDiv;

	@Getter @Setter
	private String interestDivEtc;

	@Getter @Setter
	private String reqEtc;

	@Getter @Setter
	private String reqType;

	@Getter @Setter
	private String regCompany;

	@Getter @Setter
	private String regDept;

	@Getter @Setter
	private String regGrade;

	@Getter @Setter
	private String regMobile;

	@Getter @Setter
	private String regEmail;

	@Getter @Setter
	private String contactDt;

	@Getter @Setter
	private String fileNm;

	@Getter @Setter
	private String filePath;

	@Getter @Setter
	private String serviceType;

	@Getter @Setter
	private String bbsType;

	@Getter @Setter
	private String bbsNm;

	@Getter @Setter
	private String comment;

	@Getter @Setter
	private String commentYn;

	@Getter @Setter
	private String bbsTypeNm;

	@Getter @Setter
	private String serviceNm;

	@Getter @Setter
	private String clientCd;

	@Getter @Setter
	private String clientNm;

	@Getter @Setter
	private String allClientYn;

	public void setInterestDiv(String interestDiv) {
		this.interestDiv = StringUtils.lastCommaRemove(interestDiv);
	}

	@Getter @Setter
	private String regTelNum;

	@Getter @Setter
	private String status;

	@Getter @Setter
	private String statusNm;

	//답변내용
	@Getter @Setter
	private String replyContent;

	//답변dataSeq
	@Getter @Setter
	private String replyDataSeq;

	//상위글여부
	@Getter @Setter
	private String highYn;

	//문의 등록 일자
	@Getter @Setter
	private String inquiryRegDt;

	//멘탈헬스 - 법인 적용 여부
	@Getter @Setter
	private String homeYn;

	//멘탈헬스 - 상담포유 적용 여부
	@Getter @Setter
	private String sangdamYn;
	
	@Getter @Setter
	private String onmaumYn;
	
	@Getter @Setter	
	private String contactNo;
	
	@Getter @Setter
	private String counNm;

	@Getter @Setter
	private String gender;

	@Getter @Setter
	private String rrn;

	@Getter @Setter
	private String education;

	@Getter @Setter
	private String department;
	
	@Getter @Setter
	private String session;

	@Getter @Setter
	private String familyCd;
	
	@Getter @Setter
	private String familyCnt;
	
	@Getter @Setter
	private String marry;
	
	@Getter @Setter
	private String mobile;

	@Getter @Setter
	private String job;

	@Getter @Setter
	private String email;

	@Getter @Setter
	private String cause;

	@Getter @Setter
	private String memo;

	@Getter @Setter
	private String memo1;
	
	@Getter @Setter
	private String memo2;

	@Getter @Setter
	private String memo3;
	
	@Getter @Setter
	private String date;

	@Getter @Setter
	private String time;

	@Getter @Setter
	private String cstatus;

	@Getter @Setter
	private String cdate;

	@Getter @Setter
	private String ctime;

	@Getter @Setter
	private String cmemo;

	@Getter @Setter
	private String edDt;

	@Getter @Setter
	private String edId;

	@Getter @Setter
	private String edNm;
		
	@Getter @Setter
	private String fname;
	
	@Getter @Setter
	private String frelation;
	
	@Getter @Setter
	private String fage;
	
	@Getter @Setter
	private String fjob;
	
	@Getter @Setter
	private String fgrade;
	
	@Getter @Setter
	private String dataType;

	@Getter @Setter
	private String file1;

	@Getter @Setter
	private String file2;

	@Getter @Setter
	private String file3;

	@Getter @Setter
	private String file4;

	@Getter @Setter
	private String file5;
	
	@Getter @Setter
	private String fileP1;

	@Getter @Setter
	private String fileP2;

	@Getter @Setter
	private String fileP3;

	@Getter @Setter
	private String fileP4;

	@Getter @Setter
	private String fileP5;

	@Getter @Setter
	private String alertMsg;

	@Getter @Setter
	private String searchNm;
	
	@Getter @Setter
	private String searchMobile;
	
	@Getter @Setter
	private String startRDt;
	
	@Getter @Setter
	private String endRDt;
	
	@Getter @Setter
	private String startDt;

	@Getter @Setter
	private String endDt;
	
	@Getter @Setter
	private String startCDt;

	@Getter @Setter
	private String endCDt;
	
	@Getter @Setter
	private String genderArr;
	
	@Getter @Setter
	private String statusArr;
	
	@Getter @Setter
	private String title;
	
	
	@Getter @Setter
	private String value;
	
	@Getter @Setter
	private String intakeCd;

	@Getter @Setter
	private String counselNo;
	
	@Getter @Setter
	private String counselNm;
			
	@Getter @Setter
	private String userId;
	
	@Getter @Setter
	private String strCause;
	
	@Getter @Setter
	private String strCause1;
	@Getter @Setter
	private String strCause2;
	@Getter @Setter
	private String strCause3;
	@Getter @Setter
	private String strStatus;
	
	@Getter @Setter
	private String recordCd;
	
	@Getter @Setter
	private String userNm;

	@Getter @Setter
	private String intakeNum;
	
	@Getter @Setter
	private String pageNum;
	
	@Getter @Setter
	private String pageNum2;

	@Getter @Setter
	private String rdate;
	
	@Getter @Setter
	private String rtime;
	
	@Getter @Setter
	private String rstatus;
	
	@Getter @Setter
	private String time1;
	
	@Getter @Setter
	private String time2;

	@Getter @Setter
	private String searchCnt;
	
	@Getter @Setter
	private String searchArr;
	
	@Getter @Setter
	private String type;
	
	@Getter @Setter
	private String typeArr;		
	
	@Getter @Setter
	private String etc;	
	
	@Getter @Setter
	private String mainIssue;
	
	@Getter @Setter
	private String goal;
	
	@Getter @Setter
	private String intervention;
	
	@Getter @Setter
	private String feedback;
	
	@Getter @Setter
	private String rmemo1;
	
	@Getter @Setter
	private String rmemo2;

   @Getter @Setter
	private String rmemo3;
	
	@Getter @Setter
	private String rmemo4;
	
	@Getter @Setter
	private String rmemo5;
	
	@Getter @Setter
	private String rmemo6;
	
	@Getter @Setter
	private String rmemo7;
	
	@Getter @Setter
	private String risks;
	
	@Getter @Setter
	private String riskReason;
	
	@Getter @Setter
	private String nextDt;

	@Getter @Setter
	private String nextFlag;
	
	@Getter @Setter
	private String nextStr;
	
	
	@Getter @Setter
	private String nextTime;
	
	@Getter @Setter
	private String issue;
	
	@Getter @Setter
	private String callingIssue;
	
	@Getter @Setter
	private String fileNm1;

	@Getter @Setter
	private String filePath1;
	
	@Getter @Setter
	private String fileNm2;

	@Getter @Setter
	private String filePath2;

	@Getter @Setter
	private String mgrStatus;
	
	@Getter @Setter
	private String mainDispYn;
	
	@Getter @Setter
	private String mainStartDt;
	
	@Getter @Setter
	private String mainEndDt;
	
	//상담사 숫자
	@Getter @Setter
	private String counselorCnt;
	
	
	//메인 오늘상담 숫자
	@Getter @Setter
	private String todayCsCnt;
	
	//메인 진행중상담 숫자
	@Getter @Setter
	private String processCsCnt;
	
	//미작성 상담일지 숫자
	@Getter @Setter
	private String unWritenCsCnt;
	
	//연장 신청 숫자
	@Getter @Setter
	private String extenCsCnt;
	
	// 숫자
	@Getter @Setter
	private String waitCsCnt;
	
	//승인 대기 숫자
	@Getter @Setter
	private String waitAppCnt;
	
	// 접속권한
	@Getter @Setter
	private String authCd;

	// 상담유형
	@Getter @Setter
	private String channelType;
	
	//지역 대분류
	@Getter @Setter
	private String area1;

	//지역 중분류
	@Getter @Setter
	private String area2;
	
}
