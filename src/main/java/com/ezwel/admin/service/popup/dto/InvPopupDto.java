package com.ezwel.admin.service.popup.dto;

import java.util.Calendar;
import java.util.GregorianCalendar;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.admin.domain.file.FileMind;

@Getter @Setter
public class InvPopupDto extends FileMind {
	
	private String popupSeq;

	private String serviceType;
	
	private String useYn;

	private String scrollUseYn;
	
	private String resizeUseYn;
	
	private String cookieUseYn;
	
	private String cookieLimitDay;
	
	private String popupTitle;
	
	private String popupUrl;
	
	private String popupWidth;
	
	private String popupHeight;
	
	private String topPosition;
	
	private String leftPosition;
	
	private String startDt;
	
	private String endDt;
	
	private String menuUrl;
	
	private String allClientYn;
	
	private String popupContent;
	
	private String popupType;
	
	private String layerYn;
	
	private String orderNo;
	
	private String autoApplyYn;
	
	private String delYn;
	
	private String regId;
	
	private String regDt;
	
	private String modiId;
	
	private String modiDt;

	private String startTime;

	private String endTime;
	
	private String clientCd;

	private String[] clientCdArr;
	
	private String isMobilePopup;	//모바일 팝업 구분용
	
	private String targetUrl;		//팝업 클릭시 이동URL
	
	@Override
	public String contextFilePath(String fileNm) {
		// 파일 저장할 폴더 주소 (dir - path 다음부터)
		GregorianCalendar today = new GregorianCalendar();
		String resultUrl = "/popup/" ; 
		
		resultUrl += today.get(Calendar.YEAR);
		resultUrl += "/";
		resultUrl += today.get(Calendar.MONTH) + 1;
		resultUrl += "/";
		
		return resultUrl;
	}
	
}
