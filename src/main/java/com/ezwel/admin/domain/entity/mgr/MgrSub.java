package com.ezwel.admin.domain.entity.mgr;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class MgrSub extends PagingVo{

	/**
	 * 관리자 세부정보
	 */
	
	//아이디(PK)
	private String userId;
	
	//성별
	private String gender;
	
	//학력
	private String education;
	
	//대학교
	private String university;
	
	//학과
	private String department;
	private String eduStatus;
	private String eduYear;
	
	//학력
	private String education2;
	
	//대학교
	private String university2;
	
	//학과
	private String department2;
	private String eduStatus2;
	private String eduYear2;
	
	//학력
	private String education3;
	
	//대학교
	private String university3;
	
	//학과
	private String department3;
	private String eduStatus3;
	private String eduYear3;
	
	
	//경력
	private String career;
	
	//소개
	private String memo;
	
	//파일명
	private String fileNm;
	
	//파일경로
	private String filePath;

	//센터구분
	private String centerType;
	
	//근무형태(S:상주 P:파트)
	private String workType;
	
	//상담유형
	private String channelType;
	
	//심리상담대상
	private String mentalAges;
	
	//심리상담분야
	private String mentalDiv;
	
	//심리상담기타분야
	private String mentalDivEtc;
	
	//심리상담방법
	private String mentalType;
	
	//법률상담분야
	private String lawDiv;
	
	//법률상담방법
	private String lawType;
	
	//재무상담분야
	private String financeDiv;
	
	//재무상담방법
	private String financeType;
	
	//심리검사상담대상
	private String diagnosisAges;
	
	//심리검사상담분야
	private String diagnosisDiv;
	
	//심리검사기타상담분야
	private String diagnosisDivEtc;
	
	//심리검사상담방법
	private String diagnosisType;

	//등록일시
	private String regDt;
	
	//수정일시
	private String modiDt;
	
	//수정아이디
	private String modiId;
	
	//유저이름
	private String userNm;
	
	//이메일
	private String email;
	
	//모바일
	private String mobile;

	//모바일
	private String mobile1;

	//모바일
	private String mobile2;
	
	//모바일
	private String mobile3;
	
	//생년월일
	private String rrn;
	
	//상태
	private String mgrStatus;
	
	//상태 코드
	private String mgrStatusCd;
	
	//사용여부
	private String useYn;
	
	//상담센터장여부
	private String centerOwnerYn;
	
	//센터명
	private String centerNm;
	
	//상담센터일련번호
	private int centerSeq;
	
	//상담사 별 등급
	private int mgrEvalGrade;
	
	//접속권한
	private String authCd;
	
	private String memo1;
	
	private String price;
	
	private String[] sMgrStatue;

	// 자격
	private String cert;
	
	// 기타 자격
	private String etcCert;
	
	// 상담센터 지역구분
	private String area1;
	// 상담센터 지역구분
	private String area2;
	// 상담센터 주소
	private String addr1;
	// 상담센터 주소
	private String addr2;
	private String etc;
	

	//외국어상담
	private String languageType;
	
	//특수주제상담
	private String specialType;
	
	//직장관련상담
	private String jobType;
	
	//개인관련상담
	private String personalType;
	
	//가족관련상담
	private String familyType;
	
	//충격/트라우마상담
	private String traumaType;
	
	//대상별상담
	private String targetType;
	
	//법률상담
	private String lawCounselType;
	
	//재무상담
	private String financeCounselType;
	
	//상담선호
	private String preferredType;
	
	//상담성향
	private String tendencyType;
	

	
	//sms용 모바일
	private String mobilesms1;
	
	//sms용 모바일
	private String mobilesms2;		
	
	//sms용 모바일
	private String mobilesms3;
	
	//수정 가능여부
	private String modiYn;
	
	//주요 강점 및 핵심역량
	private String coreVal;
	
	//심리적응급처치(위기개입)
	private String specialHeal;
}
