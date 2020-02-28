package com.ezwel.admin.service.service.dto;

import java.util.Calendar;
import java.util.GregorianCalendar;

import com.ezwel.admin.domain.file.FileMind;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CspDto extends FileMind{

	private String cspCd;		//제휴사일련번호
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
	private String faxNum;		//팩스번호
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
	private String aspNm;	//외부ASP이름

	private String cspType;		//제휴사구분
	private String homepage;	//홈페이지
	private String taxYn;		//세금계산서발행여부
	private String receiptYn;	//현금영수증 발행여부
	private String receiptType;	//현금영수증 발행 종류
	private String receiptAgent; //현금영수증 발행주체
	private String memo;		//메모
	
	private String mainMgrId;	//대표관리자ID
	
	private String typeLecture;		//업체구분(온라인강좌)
	private String typeTest;		//업체구분(온라인심리검사)
	private String typeEducation;	//업체구분(집단교육)
	private String typeDelivery;	//업체구분(실물배송)
	
	private String[] sCspDiv;	//검색 제휴사유형
	private String[] sCspStatus;	//검색 상태
	
	private String freeDlvrAmt; //무료 배송 기준 금액
	
	private String firstUrl;	//ASP 접속 페이지 주소
	private String orderUrl;	//ASP 주문 페이지 주소
	private String cancelUrl;	//ASP 취소 페이지 주소
	private String checkUrl;	//ASP 주문정보 위변조 체크 주소
	private String seedKey;		//ASP 데이터 통신용 암호화/복호화 KEY 
	
	@Override
	public String contextFilePath(String fileNm) {
		// 파일 저장할 폴더 주소 (dir - path 다음부터)
		GregorianCalendar today = new GregorianCalendar();
		String resultUrl = "/csp/" ; 
		
		resultUrl += today.get(Calendar.YEAR);
		resultUrl += "/";
		resultUrl += today.get(Calendar.MONTH) + 1;
		resultUrl += "/";
		
		return resultUrl;
	}
}
