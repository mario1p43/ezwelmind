package com.ezwel.admin.domain.entity.mgr;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MgrCert extends PagingVo{

	/**
	 * 관리자자격사항 테이블
	 */
	
	//아이디
	private String userId;
	
	//자격사항코드
	private int certCd;
	
	//기타자격사항
	private String etc;
	
	//파일명
	private String fileNm;
	
	//파일경로
	private String filePath;
	
	//정렬순서
	private int orderNo;
	private String orgNm;
	private String certNm;
	private String grade;
	private String certYear;
	
}
