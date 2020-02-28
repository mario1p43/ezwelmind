package com.ezwel.admin.controller.madm.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.service.client.ClientPollService;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.client.dto.ClientPollDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.diagnosis.DiagnosisService;
import com.ezwel.admin.service.diagnosis.dto.DiagnosisDto;
import com.ezwel.admin.service.user.UserUploadExcelService;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/clientPoll")
public class ClientPollController {
	
	@Resource
	private ClientPollService clientPollService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private DiagnosisService diagnosisService;
	
	@Resource
	private UserUploadExcelService userUploadExcelService;
	
	private void setMenu(Model model) {
		String menuStr ="고객사";
		model.addAttribute("menu", menuStr);
	}
	
	
	/**
	 * 고객사 개인정보관리 선택 구성 페이지
	 * @param clientDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/onlinePollSet")
	public String onlinePollSet(@ModelAttribute ClientDto clientDto, Model model) {
		setMenu(model);
		
		model.addAttribute("clientList", commonService.getClientList());
		model.addAttribute("onlinePollList", clientPollService.getClientOnlinePollList(clientDto.getClientCd()));
		model.addAttribute("clientDto", clientDto);
		
		return "madm/client/poll/onlinePollSet";
	}
	
	/**
	 * 온라인진단 셋팅 페이지
	 * @param clientDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/onlinePoll")
	public String onlinePoll(@ModelAttribute DiagnosisDto diagnosisDto, Model model) {
		setMenu(model);
		model.addAttribute(diagnosisService.getDiagnosisInfoList(diagnosisDto));
		return "madm/diagnosis/infoList";
	}
	
	/**
	 * 온라인 진단자 등록페이지
	 * @return 온라인 진단자 등록 페이지 jsp
	 */
	@RequestMapping(value = "/onlineTargetAddDetail")
	public String onlineTargeteAddDetail(String clientCd, Model model) {
		setMenu(model);
		model.addAttribute("clientCd", clientCd);
		return "madm/client/poll/onlineTargetAddDetail";
	}
	
	/**
	 * 온라인 진단자 web 등록
	 * @param jsonData
	 * @param model
	 */
	@RequestMapping(value="/addOnlineUser", method=RequestMethod.POST)
	public void addOnlineUser(@RequestBody ArrayList<Map<String, String>> jsonData, Model model) {
		model.addAttribute("resultCnt", Integer.toString(userUploadExcelService.addTarget(jsonData)));
	}
	
	/**
	 * 온라인 진단자 excel 등록
	 * @param model
	 * @param request
	 * @param mhsq
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/uploadExcel/addUser", method=RequestMethod.POST)
	public String addUser(Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) throws Exception {
		String clientCd =request.getParameter("clientCd");		
		setMenu(model);
		String[] excelResult = userUploadExcelService.addTarget(mhsq.getFile("excelUpload"), clientCd);		
		model.addAttribute("clientCd", clientCd);
		model.addAttribute("excelResult", excelResult[1]);
		return "madm/client/poll/onlineTargetAddDetail";
	}
	
	@RequestMapping(value="/sampleExcel")
	public String downloadSampleExcel(Map<String, Object> ModelMap) {
		Map<String, Object> map = userUploadExcelService.getSampleExcel("ONLINE_TARGET_UPLOAD");
		
		map.get("ezwel_excel_value");
		
		ModelMap.put("ezwel_excel_data", map.get("ezwel_excel_data"));
		ModelMap.put("ezwel_excel_value", map.get("ezwel_excel_value"));
		
		return "excelBigGrid";
	}
	
	/**
	 * 진단자 정보 설정
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/diagnoser")
	public String diagnoser(HttpServletRequest request, HttpServletResponse response, 
			Model model, ClientPollDto dto) {
		
		ClientPollDto bean = clientPollService.getPollDetailInfo(dto);
		List<ClientPollDto> tmpltList = clientPollService.getUsePollQstTmpltList(dto);
		
		model.addAttribute("bean", bean);
		model.addAttribute("tmpltList", tmpltList);
		
		if(bean != null && bean.getFields() != null) {
			Map<String, List<ClientPollDto>> fields = bean.getFields().stream()
														.collect(Collectors.groupingBy(ClientPollDto::getInfoType));
			
			model.addAttribute("fields", fields);
		}
		
		return "madm/client/poll/diagnoserMM";
	}
	
	/**
	 * 진단자 정보 저장
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param dto
	 * @return
	 */
	@RequestMapping("/diagnoser/save")
	public String diagnoserSave(HttpServletRequest request, HttpServletResponse response, 
			Model model, ClientPollDto dto) {
		
		clientPollService.modifyPollDetailInfo(dto);
		
		return "redirect:/madm/clientPoll/diagnoser?pollSeq="+dto.getPollSeq();
	}
	
	/**
	 * 그룹 목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param dto
	 * @return
	 */
	@RequestMapping("/pollGroup")
	public String pollGroup(HttpServletRequest request, HttpServletResponse response, 
			Model model, ClientPollDto dto) {
		
		List<ClientPollDto> list = clientPollService.getPollQstTmpltList(dto);
		List<ClientPollDto> grpList = clientPollService.getPollCommQstGrpList(dto);
		
		model.addAttribute("list", list);
		model.addAttribute("grpList", grpList);
		
		return "madm/client/poll/pollGroupListVM";
	}
	
	/**
	 * 템플릿 저장 
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param dto
	 * @return
	 */
	@RequestMapping("/pollGroup/save")
	public String pollGroupSave(HttpServletRequest request, HttpServletResponse response, 
			Model model, ClientPollDto dto) {
		
		// 템플릿 번호가 없음
		if(StringUtils.nvl(dto.getTmpltSeq(), "").equals("")) {
			clientPollService.registPollQstTmplt(dto);
		} else {
			clientPollService.modifyPollQstTmplt(dto);
		}
		
		return "redirect:/madm/clientPoll/pollGroup";
	}
	
	/**
	 * 진단자 정보 설정
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/commPollList")
	public String commPollList(HttpServletRequest request, HttpServletResponse response, 
			Model model, ClientPollDto dto) {
		
		List<ClientPollDto> list = clientPollService.getPollCommQstGrpList(dto);
		
		model.addAttribute("list", list);
		
		return "madm/client/poll/commPollListVM";
	}
	
	/**
	 * 진단자 정보 설정
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/commPollAddForm")
	public String commPollAddForm(HttpServletRequest request, HttpServletResponse response, 
			Model model) {
		return "madm/client/poll/commPollMM";
	}
	
	/**
	 * 진단자 정보 설정
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/commPollModifyForm")
	public String commPollModifyForm(HttpServletRequest request, HttpServletResponse response, 
			Model model, ClientPollDto dto) {
		
		ClientPollDto bean = clientPollService.getPollCommQstGrp(dto);
		
		model.addAttribute("bean", bean);
		
		return "madm/client/poll/commPollMM";
	}
	
	/**
	 * 그룹 저장
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param dto
	 * @return
	 */
	@RequestMapping(value="/commPoll/save", method=RequestMethod.POST)
	public String commPollSave(HttpServletRequest request, HttpServletResponse response, 
			Model model, ClientPollDto dto) {
	
		// 그룹일련번호가 없음
		if(StringUtils.nvl(dto.getGrpSeq(), "").equals("")) {
			clientPollService.registPollCommQstGrp(dto);
		} else {
			clientPollService.modifyPollCommQstGrp(dto);
		}
		
		return "redirect:/madm/clientPoll/commPollModifyForm?grpSeq=" + dto.getGrpSeq();
	}
	
}
