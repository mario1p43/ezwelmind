package com.ezwel.admin.service.mgr.dto;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.core.support.util.DateUtils;
import com.ezwel.core.support.util.StringUtils;
@Getter @Setter
@SuppressWarnings("squid:S1068")
public class MgrSubDto  extends FileMind {

	/**
	 * 관리자 정보
	 */
	private static final long serialVersionUID = -6717502514446485980L;

	//관리자 ID
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
	
	//사진파일
	private String fileNm;
	
	//사진경로
	private String filePath;
	
	//사진파일
	private String picFileNm;
	
	//사진경로
	private String picFilePath;
	
	//센터구분
	private String centerType;
	
	//근무형태
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
	
	//상담사 별 등급
	private int mgrEvalGrade;
	
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
	
	// 인증용 핸드폰 
	private String mobileSms;
	
	// 주요 강점 및 핵심역량
	private String coreVal;
	
	private String specialHearing;
	
	//상담선호 선호접근 주관식(기타)
	private String preferredTypeEtc;

	@Override
	public String contextFilePath(String fileNm) {
		/*if ("file1".equals(fileNm)) {
			return File.separator + "test" + File.separator + "11" + File.separator;
		} else  {
			return File.separator + "test" + File.separator + "22" + File.separator;
		}*/
		return File.separator + "partner" + File.separator + "center" + File.separator + DateUtils.getDateFormat("yyyy") + File.separator + DateUtils.getDateFormat("MM")+ File.separator;
	}


}
