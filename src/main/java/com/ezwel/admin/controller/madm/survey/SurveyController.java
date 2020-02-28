package com.ezwel.admin.controller.madm.survey;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.survey.SurveyData;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.ecrm.EcrmService;
import com.ezwel.admin.service.ecrm.dto.EcrmTaskDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.survey.SurveyService;
import com.ezwel.admin.service.survey.dto.SurveyDto;
import com.ezwel.core.support.util.Base64Utils;

@Controller
@RequestMapping("/madm/survey")
public class SurveyController {

	private static final String CATE_COMM_CD = "100886";

	@Resource
	private SurveyService surveyService;

	@Resource
	private EcrmService ecrmService;

	@Resource
	private CommonService commonService;

	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr = "수요도조사";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/surveyList")
	public String surveyList(@ModelAttribute SurveyDto surveyDto, Model model) {
		setMenu(model);
		surveyDto.setExcelFlag("list");
		EcrmTaskDto ecrmTaskDto = new EcrmTaskDto();
		CommonDto commDto = new CommonDto();

		//카테고리
		commDto.setHighCommCd(CATE_COMM_CD);
		model.addAttribute("cateList", commonService.getTypeList(commDto));
		model.addAttribute("clientList", ecrmService.getClientList(ecrmTaskDto));
		model.addAttribute(surveyService.surveyList(surveyDto));

		return "madm/survey/surveyList";
	}

	@RequestMapping(value = "/surveyListExcel")
	public String surveyListExcel(@ModelAttribute SurveyDto surveyDto, Model model) {
		setMenu(model);
		surveyDto.setExcelFlag("excel");
		model.addAttribute(surveyService.surveyList(surveyDto));

		return "madm/survey/surveyListExcel";
	}

	@RequestMapping(value = "/serviceAddList")
	public String serviceAddList(@ModelAttribute SurveyDto surveyDto, Model model) {
		setMenu(model);
		//카테고리
		model.addAttribute(surveyService.serviceList(surveyDto));
		return "madm/survey/serviceAddList";
	}

	@RequestMapping(value = "/surveyNew")
	public String surveyNew(@ModelAttribute SurveyDto surveyDto, Model model) {
		setMenu(model);

		EcrmTaskDto ecrmTaskDto = new EcrmTaskDto();
		CommonDto commDto = new CommonDto();

		//카테고리
		commDto.setHighCommCd(CATE_COMM_CD);
		model.addAttribute("cateList", commonService.getTypeList(commDto));
		model.addAttribute("clientList", ecrmService.getClientList(ecrmTaskDto));

		return "madm/survey/addSurvey";
	}

	@RequestMapping(value = "/surveyDetail")
	public String surveyDetail(@ModelAttribute SurveyDto surveyDto, Model model) {

		setMenu(model);
		EcrmTaskDto ecrmTaskDto = new EcrmTaskDto();
		CommonDto commDto = new CommonDto();

		String surSeq = Base64Utils.decode(surveyDto.getSurSeq());
		surveyDto.setSurSeq(surSeq);

		//카테고리
		commDto.setHighCommCd(CATE_COMM_CD);

		try {
			SurveyData surveyData = surveyService.surveyDetail(surveyDto);
			model.addAttribute("cateList", commonService.getTypeList(commDto));
			model.addAttribute("clientList", ecrmService.getClientList(ecrmTaskDto));
			model.addAttribute("surveyData", surveyData);
			model.addAttribute("clientCd", surveyDto.getClientCd());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "madm/survey/modifySurvey";
	}

	@RequestMapping(value = "/insertSurvey")
	public String insertSurvey(@ModelAttribute SurveyDto surveyDto, Model model) {

		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		surveyDto.setRegId(manager.getUserId());

		try {
			surveyService.insertSurvey(surveyDto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/madm/survey/surveyList";
	}

	@RequestMapping(value = "/modifySurvey")
	public String modifySurvey(@ModelAttribute SurveyDto surveyDto, Model model) {

		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		surveyDto.setModiId(manager.getUserId());
		String clientCd = surveyDto.getClientCd();

		try {
			surveyService.modifySurvey(surveyDto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/madm/survey/surveyDetail?surSeq="+ Base64Utils.encode(surveyDto.getSurSeq())+"&clientCd="+clientCd;
	}

	@RequestMapping(value = "/insertService")
	public String insertService(@ModelAttribute SurveyDto surveyDto, Model model) {
		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		surveyDto.setRegId(manager.getUserId());

		try {
			surveyService.insertService(surveyDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute(surveyService.serviceList(surveyDto));
		return "madm/survey/serviceAddList";
	}

	@RequestMapping(value = "/popup/serviceListPopup")
	public String serviceListPopup(@ModelAttribute SurveyDto surveyDto, Model model) {
		model.addAttribute(surveyService.serviceList(surveyDto));
		return "madm/survey/serviceListPopup";
	}
	
	@RequestMapping(value = "/popup/serviceChoiceListPopup")
	public String serviceChoiceListPopup(@ModelAttribute SurveyDto surveyDto, Model model) {
		model.addAttribute("userList", surveyService.serviceChoiceList(surveyDto));
		return "madm/survey/serviceChoiceListPopup";
	}
}
