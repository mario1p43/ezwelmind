package com.ezwel.admin.service.bbs.dto;
import java.io.File;

import com.ezwel.core.framework.web.vo.PagingVo;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.StringUtils;

import lombok.Getter;
import lombok.Setter;

/**
 * 페이지 관리 게시판 전용 DTO
 * 
 * @author ljc727
 */
@SuppressWarnings("serial")
public class BbsPageDto extends PagingVo {
	
	private static final String SAVE_PATH = System.getProperty(FileUploadUtils.UPLOAD_DIR_IMG_PROP) + File.separator + "admin" + File.separator + 
							"download" + File.separator + getSavePathType() + File.separator;
	
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
	private String regId;
	
	@Getter @Setter
	private String regNm;

	@Getter @Setter
	private String modiId;
	
	@Getter @Setter
	private String modiNm;
	
	@Getter @Setter
	private String regDt;
	
	@Getter @Setter
	private String pageKey;
	
	@Getter
	private String htmlUrl;
	
	@Getter @Setter
	private String reqCd1;
	
	@Getter @Setter
	private String searchNm;
	
	private static String getSavePathType() {
		return System.getProperty("server.type").equals("dev") ? "htmlpageDev" : "htmlpage";
	}
	
	/**
	 * 패스구조만 set하면 htmlUrl변수에 full url 주소저장
	 * @param path 이미지 서버에 만드는 패스구조
	 * @return full Url
	 */
	public void setHtmlUrl() {
		if ( StringUtils.isNotNull(this.getPageKey())) {
			this.htmlUrl = SAVE_PATH + this.getPageKey() + ".html";			
		} else {
			throw new RuntimeException("pageKey가 없습니다.");
		}
	}
	
	/**
	 * 서버로 저장되는 path
	 * 프로퍼티 upload.dir 폴더에 download/htmlpage 로 고정
	 * @return 서버로 저장되는 path, 
	 */
	public String getHtmlPath() {
		return SAVE_PATH;
	}
	
	/**
	 * db에 인서트 하기전에 호출해서
	 * 관련 코드값을 세팅한다.
	 */
	public void addInitialize() {
		this.bbsCd = "page";
		this.reqCd1 = "100002"; // html보드 코드값
	}
	
}
