package com.ezwel.admin.persist.survey;

import java.util.List;

import com.ezwel.admin.domain.entity.survey.SurveyData;
import com.ezwel.admin.service.survey.dto.SurveyDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface SurveyMapper {

	public List<SurveyData> surveyList(SurveyDto surveyDto);

	public List<SurveyData> surveyListExcel(SurveyDto surveyDto);

	public List<SurveyData> serviceList(SurveyDto surveyDto);

	public SurveyData surveyDetail(SurveyDto surveyDto);

	public int insertSurvey(SurveyDto surveyDto);

	public int modifySurvey(SurveyDto surveyDto);

	public int insertService(SurveyDto surveyDto);

	public int insertClient(SurveyDto surveyDto);

	public int modifyClient(SurveyDto surveyDto);
	
	public List<SurveyData> serviceChoiceList(SurveyDto surveyDto);
}
