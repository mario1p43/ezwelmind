package com.ezwel.admin.domain.entity.service;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@Getter @Setter
public class CspData  extends PagingVo {
	private int cspCd;			//제휴사일련번호
	private String cspNm;		//제휴사명
	private String cspDiv;		//제휴사유형
	private String ownerNm;		//대표자명
	private String post;		//우편번호
	private String addr1;		//주소
	private String addr2;		//주소상세
	private String bsnsNum;		//사업자번호
	private String bcond;		//업태
	private String bitem;		//종목
	private String email;		//이메일
	private String telNum;		//전화번호
	private String telNum1;		//전화번호
	private String telNum2;		//전화번호
	private String telNum3;		//전화번호
	private String faxNum;		//팩스번호
	private String faxNum1;		//팩스번호
	private String faxNum2;		//팩스번호
	private String faxNum3;		//팩스번호
	private String dutyYn;		//과세여부
	private String bankCd;		//은행명
	private String bankNum;		//계좌번호
	private String bankOrder;	//예금주
	private String fileNm1;		//파일명
	private String filePath1;	//파일경로
	private String fileNm2;		//파일명2
	private String filePath2;	//파일경로2
	private String fileNm3;		//파일명3
	private String filePath3;	//파일경로3
	private String dispYn;		//노출여부
	private String cspStatus;	//상태
	private String regDt;		//등록일시
	private String regId;		//등록ID
	private String modiDt;		//수정일시
	private String modiId;		//수정ID

	private String cspType;		//제휴사구분
	private String homepage;	//홈페이지
	private String taxYn;		//세금계산서발행여부
	private String receiptYn;	//현금영수증 발행여부
	private String receiptType;	//현금영수증 발행 종류
	private String receiptAgent; //현금영수증 발행주체
	private String memo;		//메모
	private String aspNm;
	private String freeDlvrAmt; //무료배송기준금액
	
	private String typeLecture;		//업체구분(온라인강좌)
	private String typeTest;		//업체구분(온라인심리검사)
	private String typeEducation;	//업체구분(집단교육)
	private String typeDelivery;	//업체구분(실물배송)
	private String mainMgrId;		//대표관리자ID
	
	private String mainMgrNm;		//대표관리자이름
	private String mainMgrDeptNm;	//대표관리자부서
	private String mainMgrEmail;	//대표관리자이메일
	private String mainMgrMobile;	//대표관리자핸드폰번호
	private String mainMgrPwd;
	
	private String firstUrl;	//ASP 접속 페이지 주소
	private String orderUrl;	//ASP 주문 페이지 주소
	private String cancelUrl;	//ASP 취소 페이지 주소
	private String checkUrl;	//ASP 주문정보 위변조 체크 주소
	private String seedKey;		//ASP 데이터 통신용 암호화/복호화 KEY 
}
