package com.ezwel.admin.persist.diagnosis;

import java.util.ArrayList;
import java.util.List;

import com.ezwel.admin.domain.entity.diagnosis.PollAnswer;
import com.ezwel.admin.domain.entity.diagnosis.PollExcel;
import com.ezwel.admin.domain.entity.diagnosis.PollInfo;
import com.ezwel.admin.domain.entity.diagnosis.PollQuestion;
import com.ezwel.admin.domain.entity.diagnosis.PollUser;
import com.ezwel.admin.service.diagnosis.dto.DiagnosisDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface DiagnosisMapper {

	public List<PollInfo> getDiagnosisInfoList(DiagnosisDto diagnosisInfoDto);

	public List<PollUser> getDiagnosisUserList(DiagnosisDto diagnosisUserDto);

	public PollUser getDiagnosisUserDetail(DiagnosisDto diagnosisAnswerDto);

	public List<PollQuestion> getDiagnosisQuestionList(DiagnosisDto diagnosisAnswerDto);

	public List<PollAnswer> getDiagnosisAnswerList(DiagnosisDto diagnosisAnswerDto);
	
	public ArrayList<PollExcel> getDiagnosisExcelDownload(DiagnosisDto dto);
	
	public int getQuestionListCount(DiagnosisDto dto);
	
	public int updateDateAndTime(PollInfo pollInfo);

	public PollInfo getDiagnosisDetail(DiagnosisDto diDto);
	
	public int pollModify(DiagnosisDto diDto);
	
	public int checkClientCd(DiagnosisDto diDto);
	
	public int insertDiagnosis(DiagnosisDto diDto);
	
}
