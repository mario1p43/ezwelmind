package com.ezwel.admin.persist.evaluation;

import java.util.List;

import com.ezwel.admin.domain.entity.evaluation.Evaluation;
import com.ezwel.admin.service.evaluation.dto.EvaluationDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface EvaluationMapper {

	public List<Evaluation> getSurveyAnsList(EvaluationDto evalDto);
	
	public List<Evaluation> getPtnSurveyAnsList(EvaluationDto evalDto);
	
	public List<Evaluation> getSurveyAnsListExcel(EvaluationDto evalDto);

	public List<Evaluation> getSurveyItemList(EvaluationDto evalDto);
	
	public Evaluation getSurveyAnsAverage(EvaluationDto evalDto);
	
	public Evaluation getPtnSurveyAnsAverage(EvaluationDto evalDto);
	
	public String getEvalSeq(EvaluationDto evalDto);

	public List<Evaluation> getSurveyAnsDetail(EvaluationDto evalDto);
	
	public int insertHappyCall(EvaluationDto evalDto);
	
	public void deleteHappyCall(EvaluationDto evalDto);
	
	public void updateHappayCallYn(EvaluationDto evalDto);
	
	public void updateHappyCallShow(EvaluationDto evalDto);
	
}
