package com.ezwel.admin.service.diagnosis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.diagnosis.PollAnswer;
import com.ezwel.admin.domain.entity.diagnosis.PollExcel;
import com.ezwel.admin.domain.entity.diagnosis.PollInfo;
import com.ezwel.admin.domain.entity.diagnosis.PollQuestion;
import com.ezwel.admin.domain.entity.diagnosis.PollUser;
import com.ezwel.admin.persist.diagnosis.DiagnosisMapper;
import com.ezwel.admin.service.diagnosis.dto.DiagnosisDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class DiagnosisService {
	/*
	 * 멘탈헬스 자가진단
	 */

	@Resource
	private DiagnosisMapper diagnosisMapper;

	/**
	 *
	 * @param diagnosisInfoDto
	 * @return
	 */
	public Paging<PollInfo> getDiagnosisInfoList(DiagnosisDto diagnosisInfoDto) {
		Paging<PollInfo> paging = new Paging<PollInfo>();
		paging.setPaging(diagnosisInfoDto);
		paging.setList(diagnosisMapper.getDiagnosisInfoList(diagnosisInfoDto));
		diagnosisInfoDto.setPageCommonFlag(true);
		paging.setTotalCount(diagnosisMapper.getDiagnosisInfoList(diagnosisInfoDto).get(0).getPageCommonCount());

		return paging;
	}

	/**
	 *
	 * @param diagnosisUserDto
	 * @return
	 */
	public Paging<PollUser> getDiagnosisUserList(DiagnosisDto diagnosisUserDto) {
		Paging<PollUser> paging = new Paging<PollUser>();
		paging.setPaging(diagnosisUserDto);
		paging.setList(diagnosisMapper.getDiagnosisUserList(diagnosisUserDto));
		diagnosisUserDto.setPageCommonFlag(true);
		paging.setTotalCount(diagnosisMapper.getDiagnosisUserList(diagnosisUserDto).get(0).getPageCommonCount());

		return paging;
	}

	public PollUser getDiagnosisUserDetail(DiagnosisDto diagnosisAnswerDto) {

		return diagnosisMapper.getDiagnosisUserDetail(diagnosisAnswerDto);
	}

	public List<PollQuestion> getDiagnosisQuestionList(DiagnosisDto diagnosisAnswerDto) {

		return diagnosisMapper.getDiagnosisQuestionList(diagnosisAnswerDto);
	}

	public HashMap<String, PollAnswer> getDiagnosisAnswerMap(DiagnosisDto diagnosisAnswerDto) {

		HashMap<String, PollAnswer> diagnosisMap = new HashMap<String, PollAnswer>();
		List<PollAnswer> diagnosisList = new ArrayList<PollAnswer>();

		diagnosisList = diagnosisMapper.getDiagnosisAnswerList(diagnosisAnswerDto);
		if(diagnosisList != null) {
			for (PollAnswer answerTmp : diagnosisList) {
				diagnosisMap.put(answerTmp.getQuestionNum(), answerTmp);
			}
		}

		return diagnosisMap;
	}
	
	public ArrayList<PollExcel> getDiagnosisExcelDownload(DiagnosisDto dto) {
		return diagnosisMapper.getDiagnosisExcelDownload(dto);
	}
	
	public int getQuestionListCount(DiagnosisDto dto){
		return diagnosisMapper.getQuestionListCount(dto);
	}
	
	public int updateDateAndTime(PollInfo pollInfo) {
		return diagnosisMapper.updateDateAndTime(pollInfo);
	}
	
	public PollInfo getDiagnosisDetail(DiagnosisDto diDto){
		return diagnosisMapper.getDiagnosisDetail(diDto);
	}
	
	public int pollModify(DiagnosisDto diDto){
		return diagnosisMapper.pollModify(diDto);
	}
	
	public int checkClientCd(DiagnosisDto diDto){
		return diagnosisMapper.checkClientCd(diDto);
	}
	
	public int insertDiagnosis(DiagnosisDto diDto){
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		diDto.setQuestionSetSeq("1");
		diDto.setStepCnt("3");
		diDto.setRegId(manager.getUserId());
		
		String startDt = diDto.getStartDt().replaceAll("-", "") + diDto.getStartTime().replaceAll(":", "");
		String endDt = diDto.getEndDt().replaceAll("-", "") + diDto.getEndTime().replaceAll(":", "");
		
		diDto.setStartDt(startDt);
		diDto.setEndDt(endDt);
		
		return diagnosisMapper.insertDiagnosis(diDto);
	}
}
