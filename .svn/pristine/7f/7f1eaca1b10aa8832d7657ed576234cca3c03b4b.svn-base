package com.ezwel.admin.service.pCounselorMgr.dto;

import java.io.File;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.core.support.util.DateUtils;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class MindCounselRecordDto extends FileMind{

	private static final long serialVersionUID = -6717502514446485980L;

	//일지일련번호
//	private int recordCd;
	private String recordCd;

	//상담코드(신청내역일련번호)
//	private int counselCd;
	private String counselCd;

	//상담주제
	private String subject;

	//상담사유
	private String mainIssue;

	//상담목표
	private String goal;

	//주요개입
	private String intervention;

	//내담자반응
	private String feedback;

	//특이사항
	private String memo;
	private String recordMemo;

	//상담시간
	private String time;
	private String time2;

	//파일명
	private String fileNm;

	//파일경로
	private String filePath;

	//위험도단계
//	private int risks;
	private String risks;

	//위험도사유
	private String riskReason;

	//소명사유
	private String callingIssue;

	//다음상담일시
	private String nextDt;

	//상태
	private int status;

	//등록일시
	private String regDt;

	//등록ID
	private String regId;

	//수정일시
	private String modiDt;

	//수정ID
	private String modiId;

	@Override
	public String contextFilePath(String fileNm) {

		return File.separator + "partner" + File.separator + "center" + File.separator + DateUtils.getDateFormat("yyyy") + File.separator + DateUtils.getDateFormat("MM");
	}
}
