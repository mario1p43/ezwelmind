package com.ezwel.admin.controller.madm.evaluation;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.evaluation.Evaluation;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.employee.EmployeeService;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.evaluation.EvaluationService;
import com.ezwel.admin.service.evaluation.dto.EvaluationDto;
import com.ezwel.admin.service.pCounselorMgr.PCounselorMgrService;
import com.ezwel.admin.service.pCounselorMgr.dto.MindCounselIntakeDto;
import com.ezwel.admin.service.security.UserDetailsHelper;

@Controller
@RequestMapping("/madm/evaluation")
public class EvaluationController {
	private static Logger log = LoggerFactory.getLogger(EvaluationController.class);
	
	@Resource
	EvaluationService evaluationService;
	
	@Resource
	CommonService commonService;
	
	@Resource
	PCounselorMgrService pCounselorMgrService;
	
	@Resource
	EmployeeService employeeService;
	
	@Resource
	CenterService centerService;
	
	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/surveyList")
	public String modifyMgrDetail(@ModelAttribute EvaluationDto evalDto, Model model, HttpServletRequest request) {
		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		evalDto.setEvalSeq("6");
	    model.addAttribute("itemList", evaluationService.getSurveyItemList(evalDto));
	    model.addAttribute(evaluationService.getSurveyAnsList(evalDto));
	    model.addAttribute("itemAvg", evaluationService.getSurveyAnsAverage(evalDto));
	    
	    model.addAttribute("clientList", commonService.getClientList());
	    CenterDto centerDto = new CenterDto();
	    model.addAttribute("centerList", centerService.getCenterNameList(centerDto));
		return "madm/evaluation/surveyList";
	}
	
	@RequestMapping(value = "/updateHappyCallShow")
	public void updateHappyCallShow(@ModelAttribute EvaluationDto evalDto, Model model, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		evalDto.setUserId(manager.getUserId());
		evaluationService.updateHappyCallShow(evalDto);
		
	}
	
	

	@RequestMapping(value = "/excelDownload")
	public String excelDownload(@ModelAttribute EvaluationDto evalDto, Map<String, Object> ModelMap) {
		evalDto.setEvalSeq("6");
		List<Evaluation> excelList =evaluationService.getSurveyExcelList(evalDto);
		
		String dataHeader = "clientNm,고객사명//clientCd,고객사코드//userNm,임직원명//relation,관계//counselNm,내담자명//"
				+ "counselCd,신청코드//centerNm,상담센터//counselorNm,상담사//"
				+ "item01Ans,상담을 진행 하셨습니까?//item02Ans,진행하신 상담에 대해 전반적으로 만족하십니까?//item03Ans,서비스를 이용하면서 느낀점을 자유롭게 기술해주세요.//"
				+ "item04Ans,상담을 진행하지 못한 이유에 대해서 간단히 적어 주시기 바랍니다.//item05Ans,다음 상담에 대한 일정 조율을 희망하십니까?//item06Ans,연락처를 입력해주세요.//counselDt,상담일시//regDt,조사일시";
		
		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", excelList);
		
		return "excelBigGrid";
	}
	

	@RequestMapping(value = "/excelDownSurveyEndList")
	public String excelDownSurveyEndList(@ModelAttribute EvaluationDto evalDto, Map<String, Object> ModelMap) {
		evalDto.setEvalSeq("1");
		List<Evaluation> excelList =evaluationService.getSurveyExcelList(evalDto);
		String dataHeader = "clientNm,고객사명//clientCd,고객사코드//userNm,임직원명//relation,관계//counselNm,내담자명//"
				+ "counselCd,신청코드//centerNm,상담센터//counselorNm,상담사//"
				+ "item01Ans,상담서비스에 대해서 만족하십니까?	//item02Ans,상담의 연결과정(상담신청,결제과정)에 대해서 만족하십니까?//item03Ans,상담자는 전문성을 갖추고 충분히 신뢰감동을 주었습니까?	//"
				+ "item04Ans,상담기관의 시설에 대해 만족하십니까 (전화상담 및 1:1게시판상담을 이용한 경우,해당전화시스템 및 게시판기능을 사용하는 것이 만족 스러웠습니까?	//item05Ans,동일한 서비스를 동료에게 추천할 의향이 있습니까?//item06Ans,서비스후 소감을 자유롭게 적어주십시요.//counselDt,상담일시//regDt,조사일시";
		
		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", excelList);
		
		return "excelBigGrid";
	}
	
	@RequestMapping(value="/happyCall")
	public String happyCall(@ModelAttribute EvaluationDto evalDto, Model model) {
		setMenu(model);

		evalDto.setEvalSeq(evaluationService.getEvalSeq(evalDto));
	    model.addAttribute("ansDetail", evaluationService.getSurveyAnsDetail(evalDto));
	    
		EmployeeDto employeeDto = new EmployeeDto();
		employeeDto.setUserKey(evalDto.getUserKey());
		MindCounselIntakeDto mindCounselIntakeDto = new MindCounselIntakeDto();
		mindCounselIntakeDto.setUserKey(Integer.parseInt(evalDto.getUserKey()));
		mindCounselIntakeDto.setCounselCd(evalDto.getCounselCd());

		model.addAttribute("targetSeq",evalDto.getOrderNum());
		model.addAttribute("counselCd",evalDto.getCounselCd());
		model.addAttribute("intakeCd",evalDto.getIntakeCd());
		model.addAttribute("empDetail",employeeService.getDetail(employeeDto));
		model.addAttribute("intakeDetail", pCounselorMgrService.intakeDetail(mindCounselIntakeDto));

		return "madm/evaluation/happyCall";
	}

	@RequestMapping(value="/happyCall", method=RequestMethod.POST)
	public String insertHappyCall(@ModelAttribute EvaluationDto evalDto, Model model, HttpServletRequest request) {
		
		String itemAnsMerge = "";

		for (int i = 1; i <= evalDto.getCountNum(); i++) {
			if (i == 1) {
				itemAnsMerge += request.getParameter("lv_sel_" + i);
			} else {
				itemAnsMerge += "," + request.getParameter("lv_sel_" + i);
			}
		}

		evalDto.setItemAnsMerge(itemAnsMerge);
		
		evaluationService.insertHappyCall(evalDto);
		
		String returnUrl = "redirect:/madm/evaluation/happyCall?orderNum="+evalDto.getTargetSeq()+"&userKey="+evalDto.getUserKey()+"&counselCd="+evalDto.getCounselCd();
		return returnUrl;
	}
	
	@RequestMapping(value="/getCounselorList", method=RequestMethod.GET)
	public void getCommClientList(@RequestParam String centerSeq, Model model) {
		model.addAttribute("list", centerService.getCounselorListInCenter(centerSeq));
	}

	@RequestMapping(value = "/surveyEndList")
	public String surveyEndList(@ModelAttribute EvaluationDto evalDto, Model model, HttpServletRequest request) {
		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		evalDto.setEvalSeq("1");
	    model.addAttribute("itemList", evaluationService.getSurveyItemList(evalDto));
	    model.addAttribute(evaluationService.getSurveyAnsList(evalDto));
	    model.addAttribute("itemAvg", evaluationService.getSurveyAnsAverage(evalDto));
	    
	    model.addAttribute("clientList", commonService.getClientList());
	    CenterDto centerDto = new CenterDto();
	    model.addAttribute("centerList", centerService.getCenterNameList(centerDto));
		return "madm/evaluation/surveyEndList";
	}
}
