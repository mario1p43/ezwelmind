package com.ezwel.admin.service.bbs.dto;
import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@SuppressWarnings("squid:S1068")
public class BBSAddDto extends PagingVo {

	private static final long serialVersionUID = -4941932446248141972L;
	@Getter @Setter	
	private String tableNm;
	
	@Getter @Setter
	private String dataSeq;

	@Getter @Setter
	private String bbsCd;

	@Getter @Setter
	private String subject;

	@Getter @Setter
	private String content;

	@Getter @Setter
	private String reqCd1;
	
	@Getter @Setter
	private String reqCd1_1;

	@Getter @Setter
	private String reqCd2;

	@Getter @Setter
	private String dispYn;

	@Getter @Setter
	private String regId;

	@Getter @Setter
	private String regNm;

	@Getter @Setter
	private String regDt;

	@Getter @Setter
	private String modiId;

	@Getter @Setter
	private String modiNm;

	@Getter @Setter
	private String modiDt;

	@Getter @Setter
	private String regEmail;

	@Getter @Setter
	private String regMobile;

	@Getter @Setter
	private String visited;

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
	private String alertMsg;

	@Getter @Setter
	private String searchNm;

	@Getter @Setter
	private String highCommCd;

	@Getter @Setter
	private String newsDd;

	@Getter @Setter
	private String columnistNm;

	@Getter
	private String columnistDd;

	@Getter @Setter
	private String columnistCareer;

	@Getter @Setter
	private String columnistMemo;

	@Getter @Setter
	private String columnistGrade;

	// 썸네일 이미지 seq
	@Getter @Setter
	private String thumbFileSeq;

	// 관련기사 링크
	@Getter @Setter
	private String mediaNm;

	@Getter @Setter
	private String mediaDd;

	@Getter @Setter
	private String mediaSubject;

	@Getter @Setter
	private String mediaLink;

	@Getter @Setter
	private String[] mediaNmArr;

	@Getter @Setter
	private String[] mediaDdArr;

	@Getter @Setter
	private String[] mediaSubjectArr;

	@Getter @Setter
	private String[] mediaLinkArr;

	@Getter @Setter
	private String serviceType;

	@Getter @Setter
	private String bbsType;

	@Getter @Setter
	private String bbsNm;

	@Getter @Setter
	private String comment;

	@Getter @Setter
	private String replyYn;

	@Getter @Setter
	private String commentYn;

	@Getter @Setter
	private String clientCd;

	@Getter @Setter
	private String clientCdTarget;

	@Getter @Setter
	private String pageKey;

	@Getter @Setter
	private String allClientYn;

	public void setColumnistDd(String columnistDd) {
		this.columnistDd = columnistDd.replaceAll("/", "");
	}

	@Getter @Setter
	private String searchCo;

	@Getter @Setter
	private String reqType;

	@Getter @Setter
	private String[] clientCdArr;

	//상위일련번호
	@Getter @Setter
	private String highDataSeq;

	//처리상태
	@Getter @Setter
	private String status;

	//답변dataSeq
	@Getter @Setter
	private String replyDataSeq;

	//상위글여부
	@Getter @Setter
	private String highYn;

	//검색조건 등록자/수정자 구분
	@Getter @Setter
	private String searchRegNmType;

	@Getter @Setter
	private String domainCd;

	//문의글 내용
	@Getter @Setter
	private String regContent;

	//문의 등록 일자
	@Getter @Setter
	private String inquiryRegDt;
	
	// 메인 노출여부
	@Getter @Setter
	private String mainDispYn;
	
	// 메인 시작일시
	@Getter @Setter
	private String mainStartDt;
	
	// 메인 종료일시
	@Getter @Setter
	private String mainEndDt;
	
	// 접속권한
	@Getter @Setter
	private String sAuthCd;

	// 상담유형
	@Getter @Setter
	private String channelType;
	
	@Getter @Setter
	private String area1;
	
	@Getter @Setter
	private String area2;
	
	@Getter @Setter
	private String userId;
	
	@Getter @Setter
	private int centerSeq;
	
	@Getter @Setter
	private String noticeCd;
	

}
