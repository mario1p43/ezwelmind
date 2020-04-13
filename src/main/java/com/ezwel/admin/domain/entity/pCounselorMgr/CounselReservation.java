package com.ezwel.admin.domain.entity.pCounselorMgr;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CounselReservation extends PagingVo{

	private int counselCd;	//신청내역일련번호
	
	private int intakeCd;	//인테이크코드
	
	private String clientCd;	//고객사코드
	
	private String clientNm;	//고객사이름
	
	private int userKey;	//유저키
	
	private String encUserKey;	//유저키(암호화);
	
	private int categoryCd;	//카테고리일련번호
	
	private int centerSeq;	//센터일련번호
	
	private String centerNm;	//센터이름
	
	private int scheduleSeq;	//일정일련번호
	
	private String counselDt;	//확정일시
	
	private int counselType;	//상담방법
	
	private String channelType; // 상담분류
	
	private String counselorId; //상담사ID(상담원)
	
	private String counselPrice;	//상담비용
	
	private String addTime;	//추가시간
	
	private String addPrice;	//추가비용
	
	private int counselStatus;	//상태(상담/진단)
	
	private int intakeStatus;	//상태(상담예약상태)
	
	private String memo;	//메모
	
	private String regDt;	//등록일시
	
	private String regId;	//등록ID
	
	private String cancelDt;	//취소일시
	
	private String cancelId;	//취소ID
	
	private String holidayYn;	//휴무일여부
	
	private String ymd;	//년월일
	
	private int scheduleType;	//상담유형(상담, 검사)
	
	private String stTime;	//시작시간
	
	private String edTime;	//종료시간
		
	private String modiDt;	//수정일시
	
	private String modiId;	//수정ID
	
	private String counselNm;	//내담자명
	
	private int counselDiv;	//상담분야
	
	private String counselDivNm; // 상담분야 코드가 아닌 이름
	
	private int recordStatus;	//상태(일지작성여부)
	
	private String counselorNm;	//상담자명
	
	private String mobile;	//모바일
	
	private String ymdLine;  // YYYY-MM-DD
	
	private String extensionStatus; //연장상태
	
	private int extensionNum; //연장회차
	
	private String scheduleDt;	//상담일
	
	private String needPay; //결제필요 여부
	
	private String counselMgrNm;
	
	private String ownerNm; // 임직원 명
	
	private String useYn;		// 고객 아이디 사용유무
	
	private String userStatus;	// 고객 재직상태
	
	private String counselReservChk; // 1회기 확인
	
	private String relation;
	
	private String risk; // 사례위험도
	
	private String userNm; //임직원명
	
	private String filename1;
	private String filefath1;
	private String apprStatus1;
	
	
}
