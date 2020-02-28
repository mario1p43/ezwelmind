package com.ezwel.admin.domain.entity.customermanagement;

import java.util.Calendar;
import java.util.GregorianCalendar;

import com.ezwel.admin.domain.file.FileMind;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CustomerManagementVo extends FileMind{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3173494373564334080L;

	private String clientCd;
	
	private String rrn;
	
	private String gender;
	
	private String counselNm;
	
	private String cause;
	
	private String email;
	
	private String education;
	
	private String session;
	
	private String job;

	private String relation;
	
	private String mobile;
	
	private String counselType;
	
	private String channelType;
	
	private String intakeNum;
	
	private String counselCd;
	
	private String recordCd;
	
	private String goal;
	
	private String memo;
	private String memoTt;
	
	private String counselDivNm;

	private String docType;
	
	private String status;
	
	private String chkInfo;
	
	private int centerSeq;
	
	private int intakeCd;
	
	private String regId;
	
	private String filename1;
	private String filename2;
	private String filename3;
	private String filefath1;
	private String filefath2;
	private String filefath3;
	
	private String apprStatus1;
	private String apprStatus2;
	private String apprStatus3;
	
	private String regId1;
	private String regId2;
	private String regId3;
	
	private String regDt1;
	private String regDt2;
	private String regDt3;
		
	@Override
	public String contextFilePath(String fileNm) {
		GregorianCalendar today = new GregorianCalendar();
		String resultUrl = "/customer/" ; 
		
		resultUrl += today.get(Calendar.YEAR);
		resultUrl += "/";
		resultUrl += today.get(Calendar.MONTH) + 1;
		resultUrl += "/";
		
		return resultUrl;
	}
	
}
