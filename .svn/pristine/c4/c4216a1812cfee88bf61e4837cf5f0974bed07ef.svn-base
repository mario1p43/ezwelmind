package com.ezwel.admin.service.push.dto;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.ezwel.admin.domain.file.FileMind;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PushDto extends FileMind{

	// search
	private String searchType;
	
	private String searchValue;
	
	private String startDt;
	
	private String endDt;
	
	
	// push table
	private String pushSeq;
	
	private String title;
	
	private String content;
	
	private String linkUrl;
	
	private String pushImg;
	
	private String osType;
	
	private String msgType;
	
	private String sendDt;

	private String sendTime;

	private String allClientYn;
	
	private String regId;
	
	private String regDt;
	
	private String modiId;
	
	private String modiDt;

	private String clientCd;

	private String[] clientCdArr;
	
	private List<String> clientCdList;
	
	private String status;
	
	private String pushCnt;

	@Override
	public String contextFilePath(String fileNm) {
		// 파일 저장할 폴더 주소 (dir - path 다음부터)
		GregorianCalendar today = new GregorianCalendar();
		String resultUrl = "/push/" ; 
		
		resultUrl += today.get(Calendar.YEAR);
		resultUrl += "/";
		resultUrl += today.get(Calendar.MONTH) + 1;
		resultUrl += "/";
		
		return resultUrl;
	}
}
