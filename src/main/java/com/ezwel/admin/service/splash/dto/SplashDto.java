package com.ezwel.admin.service.splash.dto;

import java.util.Calendar;
import java.util.GregorianCalendar;

import com.ezwel.admin.domain.file.FileMind;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SplashDto extends FileMind {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3424879042224699326L;

	/**
	 * splash관리 일련번호
	 */
	private String splashSeq;

	/**
	 * splash관리 제목
	 */
	private String title;

	/**
	 * splash관리 내용
	 */
	private String content;

	/**
	 * splash관리 시작일
	 */
	private String startDt;

	/**
	 * splash관리 종료일
	 */
	private String endDt;

	/**
	 * splash관리 사용유무
	 */
	private String useYn;

	/**
	 * splash관리 IOS이미지 320x480
	 */
	private String iosImg1;

	/**
	 * splash관리 IOS이미지 640x96
	 */
	private String iosImg2;

	/**
	 * splash관리 IOS이미지 640x1136
	 */
	private String iosImg3;

	/**
	 * splash관리 안드로이드 이미지 320x480
	 */
	private String androidImg1;

	/**
	 * splash관리 안드로이드 이미지 480x800
	 */
	private String androidImg2;

	/**
	 * splash관리 안드로이드 이미지 720x1280
	 */
	private String androidImg3;

	/**
	 * splash관리 안드로이드 이미지 1200x1920
	 */
	private String androidImg4;

	/**
	 * splash관리 등록ID
	 */
	private String regId;

	/**
	 * splash관리 등록일시
	 */
	private String regDt;

	/**
	 * splash관리 수정ID
	 */
	private String modiId;

	/**
	 * splash관리 수정일시
	 */
	private String modiDt;


	@Override
	public String contextFilePath(String fileNm) {
		// 파일 저장할 폴더 주소 (dir - path 다음부터)
		GregorianCalendar today = new GregorianCalendar();
		String resultUrl = "/splash/" ; 
		
		resultUrl += today.get(Calendar.YEAR);
		resultUrl += "/";
		resultUrl += today.get(Calendar.MONTH) + 1;
		resultUrl += "/";
		
		return resultUrl;
	}
}
