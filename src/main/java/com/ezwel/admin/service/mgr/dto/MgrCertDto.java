package com.ezwel.admin.service.mgr.dto;

import java.io.File;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.core.support.util.DateUtils;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class MgrCertDto   extends FileMind {

	/**
	 * 관리자 정보
	 */
	private static final long serialVersionUID = -6717502514446485980L;
	
	// ID
	private String userId;
	
	//자격사항 코드
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

	@Override
	public String contextFilePath(String fileNm) {
		/*if ("file1".equals(fileNm)) {
			return File.separator + "test" + File.separator + "11" + File.separator;
		} else  {
			return File.separator + "test" + File.separator + "22" + File.separator;
		}*/
		return File.separator + "partner" + File.separator + "center" + File.separator + DateUtils.getDateFormat("yyyy") + File.separator + DateUtils.getDateFormat("MM") + File.separator;
	}
	
}
