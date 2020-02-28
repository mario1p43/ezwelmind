package com.ezwel.admin.domain.entity.user;

import com.ezwel.core.framework.web.vo.Vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class User extends Vo {

	private static final long serialVersionUID = 1L;
	
	
	private String userKey;			// 유저키
	private String clientCd;		// 고객사코드
	private String clientNm;		// 고객사명
	private String domainCd;		// 도메인코드
	private String userId;			// 아아디
	private String userNm;			// 성명
	private String userPwd;			// 비밀번호
	private String rrn;				// 주민번호
	private String empNum;			// 사번
	private String useYn;			// 사용여부
	private String delYn;			// 삭제여부
	private String userStatus;		// 상태코드
	private String userStatusNm;	// 상태명
	private String post;			// 우편번호
	private String addr1;			// 주소1
	private String addr2;			// 주소2
	private String email;			// 이메일
	private String emailRecvYn;		// 이메일수신여부
	private String homeTel;			// 집전번
	private String officeTel;		// 회사전번
	private String mobile;			// 모바일
	private String smsRecvYn;		// 모바일 수신여부
	private String birthDd;			// 생일
	private String birthType;		// 양력음력[1=양력, 2=음력]
	private String gender;			// 성별
	private String foreignYn;		// 외국인여부
	private String area;			// 근무지
	private String jobFamily;		// 직군
	private String jobSerial;		// 직열
	private String branchCd;		// 소속1 코드
	private String branchNm;		// 소속1 명칭
	private String deptCd;			// 소속2 코드
	private String deptNm;			// 소속1 명칭
	private String teamCd;			// 소속3 코드
	private String partCd;			// 소속3 명칭
	private String gradeCd;			// 직급 코드
	private String gradeNm;			// 직급 명칭
	private String companyJoinDd;	// 입사일
	private String joinDt;			// 가입 일시
	private String agreeDt;			// 승인 일시
	private String retireDt;		// 탈퇴 일시
	private String delDt;			// 삭제 일시
	private String pwdImsiYn;		// 임시비밀번호 여부
	private String assignType;		// 등록방식(관리자, 회원가입, 연동)
	private String ipinCi;			// 아이핀CI
	private String ipinDi;			// 아이핀DI
	private String authString;		// 인증값[I=아이핀, C=핸드폰, S=안심체크)
	private String ipinAuthDt;		// 아이핀인증일시
	private String testYn;			// 테스터여부
	private String regDt;			// 등록일시
	private String modiDt;			// 수정일시
	private String complainLevel;	// 컴플레인 레벨
	private String complainMemo;	// 특이사항
	private String menuUrI;			// 메뉴 경로
	private String agreeCd;			// 동의코드
	private String agreeYn;			// 동의여부
	private String loginType;		// 로그인타입 MIND_CLIENT.LOGIN_TYPE[I=아이디, E=사번]
	private String workYear;		// 연차
	private String enterType;		// 입사유형 신입:N, 경력:C
	private String marryYn;			// 기혼여부 
	
	private String deviceId;		// 모바일 디바이스ID 
	private String pushYn;			// 푸쉬여부
	private String autoLoginYn;		// 앱 자동로그인여부
	private String pushSound;		// 푸쉬소리여부
	
	private String counselNm;
	private String counselCd;
	private String counselEmail;
	private String jedoYn;
	private String scheduleDt;
	private String scheduleDtMonth;
	private String centerTelNum;
	private String centerNm;
	private String centerAddr1;
	private String centerAddr2;
	private String counselorNm;
	private String counselorMobile;
	private String counselType;
	private String counselMobile;
	private String counselFeedBack;
	private String siteNm; 
	
}
