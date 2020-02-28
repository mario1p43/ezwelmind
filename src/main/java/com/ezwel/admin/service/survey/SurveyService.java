package com.ezwel.admin.service.survey;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.survey.SurveyData;
import com.ezwel.admin.persist.ecrm.EcrmMapper;
import com.ezwel.admin.persist.survey.SurveyMapper;
import com.ezwel.admin.service.survey.dto.SurveyDto;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class SurveyService {

	@Resource
	private SurveyMapper surveyMapper;

	@Resource
	private EcrmMapper ecrmMapper;

	public Paging<SurveyData> surveyList(SurveyDto surveyDto) {
		Paging<SurveyData> paging = new Paging<SurveyData>();
		paging.setPaging(surveyDto);

		if(surveyDto.getExcelFlag().equals("view")){
			paging.setList(surveyMapper.surveyList(surveyDto));
			surveyDto.setPageCommonFlag(true);
			paging.setTotalCount(surveyMapper.surveyList(surveyDto).get(0).getPageCommonCount());
		}else if(surveyDto.getExcelFlag().equals("list")){
			paging.setList(surveyMapper.surveyList(surveyDto));
			surveyDto.setPageCommonFlag(true);
			paging.setTotalCount(surveyMapper.surveyList(surveyDto).get(0).getPageCommonCount());

		}else if(surveyDto.getExcelFlag().equals("excel")){
			paging.setList(surveyMapper.surveyListExcel(surveyDto));
			surveyDto.setPageCommonFlag(true);
			paging.setTotalCount(surveyMapper.surveyListExcel(surveyDto).get(0).getPageCommonCount());

		}

		return paging;
	}

	public Paging<SurveyData> serviceList(SurveyDto surveyDto) {
		Paging<SurveyData> paging = new Paging<SurveyData>();
		paging.setPaging(surveyDto);

		paging.setList(surveyMapper.serviceList(surveyDto));
		surveyDto.setPageCommonFlag(true);
		paging.setTotalCount(surveyMapper.serviceList(surveyDto).get(0).getPageCommonCount());

		return paging;
	}

	public SurveyData surveyDetail(SurveyDto surveyDto) {
		return surveyMapper.surveyDetail(surveyDto);
	}

	public void insertSurvey(SurveyDto surveyDto) throws Exception {
		try{
			surveyMapper.insertSurvey(surveyDto);
			surveyMapper.insertClient(surveyDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("수요도 조사 등록시 문제가 발생 하였습니다.");
		}
	}

	public void modifySurvey(SurveyDto surveyDto) throws Exception {
		try{
			surveyMapper.modifySurvey(surveyDto);
			surveyMapper.modifyClient(surveyDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("수요도 조사 수정 문제가 발생 하였습니다.");
		}
	}

	public int insertService(SurveyDto surveyDto) {
		return surveyMapper.insertService(surveyDto);
	}
	
	public List<SurveyData> serviceChoiceList(SurveyDto surveyDto) {
		return surveyMapper.serviceChoiceList(surveyDto);
	}

}
