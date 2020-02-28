package com.ezwel.admin.service.client.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

/**
 * 고객사별 문항지 설정과 필드, 설문 항목까지 한곳에 담아둔 DTO, 추후 데이터가 많아질경우 분리해야함.
 * 
 * @author starkaby12
 *
 */
@Getter @Setter
public class ClientPollDto {

	// poll_info
	private String pollSeq;
	private String pollNm;
	private String stepCnt;
	private String programNm;
	private String topImgPath;
	private String leftLogoPath;
	private String rightLogoPath;
	private String topContents;
	private String cautionContents;
	private String agreeUseYn;
	private String agreeContents;
	private String replayUseYn;
	// poll_info
	
	// poll_field
	private String fieldSeq;
	private String infoType;
	private String fieldNm;
	private String fieldType;
	private String fieldRequiredYn;
	private String fieldRequiredMsg;
	private String fieldValue;
	private String useYn;
	private String orderNo;
	private String checkUseYn;
	private String branchUseYn;
	private String gradeUseYn;
	
	private List<ClientPollDto> fields = new ArrayList<>();
	// poll_field
	
	// client comm poll begin -- 
	private String grpSeq;
	private String grpNm;
	private String contents;
	private String qstCnt;
	private String regId;
	private String regDt;
	private String resultType;
	
	private String qstNum;
	private String question;
	private String qstDesc;
	private String maxCnt;
	
	private String qstItemNum;
	private String answerNum;
	private String answer;
	
	private String tmpltSeq;
	private String tmpltNm;
	
	private List<ClientPollDto> questions = new ArrayList<>();
	private List<ClientPollDto> answers = new ArrayList<>();
	// client comm poll end -- 
	
	private String qstSetSeq;
}
