package com.ezwel.admin.service.banner.dto;

import java.util.Calendar;
import java.util.GregorianCalendar;

import com.ezwel.admin.domain.file.FileMind;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class InvBannerDto extends FileMind {
	
	private String bannerSeq;
	
	private String channelCd;
	
	private String cornerCd;
	
	private String bannerNm;
	
	private String bannerImgUrl;
	
	private String targetLink;
	
	private String startDt;
	
	private String endDt;
	
	private String dispOrder;
	
	private String useYn;
	
	private String regId;
	
	private String regDt;
	
	private String modiId;
	
	private String modiDt;
	
	private String subject;
	
	private String comment;
	
	private String fileSeq;
	
	private String clientCd;

	private String allClientYn;
	
	private String[] clientCdArr;
	
	private String mobiChannelCd;

	@Override
	public String contextFilePath(String fileNm) {
		// 파일 저장할 폴더 주소 (dir - path 다음부터)
		GregorianCalendar today = new GregorianCalendar();
		String resultUrl = "/banner/" ; 
		
		resultUrl += today.get(Calendar.YEAR);
		resultUrl += "/";
		resultUrl += today.get(Calendar.MONTH) + 1;
		resultUrl += "/";
		
		return resultUrl;
	}

}
