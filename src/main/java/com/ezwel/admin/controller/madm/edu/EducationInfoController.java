package com.ezwel.admin.controller.madm.edu;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.edu.EducationInfoDto;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.edu.EducationInfoService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.survey.dto.SurveyDto;

@Controller
@RequestMapping("/madm/edu")
public class EducationInfoController {

	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="EducationInfo";
		model.addAttribute("menu", menuStr);
	}
	
	@Resource
	private EducationInfoService educationInfoService;
	
	@RequestMapping(value="/archivestatus")
	public String educationList(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		setMenu(model);
		model.addAttribute(educationInfoService.getEducationInfoList(educationInfoDto));
		return "madm/edu/archivestatus";
	}
	
	@RequestMapping(value = "/archivestatusExcel")
	public String archivestatusExcel(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		setMenu(model);
		
		//EducationInfoDto.setExcelFlag("excel");
		model.addAttribute(educationInfoService.getEducationInfoListExcel(educationInfoDto));

		return "madm/edu/archivestatusExcel";
	}

	@RequestMapping(value = "/sampleArchivestatusExcel")
	public String sampleArchivestatusExcel(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		setMenu(model);
		
		//EducationInfoDto.setExcelFlag("excel");
		model.addAttribute(educationInfoService.getEducationInfoList(educationInfoDto));

		return "madm/edu/sampleArchivestatusExcel";
	}
	
	@RequestMapping(value="/sampleExcel")
	public String downloadSampleExcel(Map<String, Object> ModelMap) {
		// 고객사별로 샘플파일을 다르게 하고 싶으면...
		// 1. request clientCd 를 받는다.
		// 2. DB table 엑셀헤더를 만들고 가져온다.
		
		Map<String, Object> map = educationInfoService.getSampleExcel();
		
		map.get("ezwel_excel_value");
		
		ModelMap.put("ezwel_excel_data", map.get("ezwel_excel_data"));
		ModelMap.put("ezwel_excel_value", map.get("ezwel_excel_value"));
		
		return "excelBigGrid";
	}
	
	
	
	@RequestMapping(value="/addPayCheck", method=RequestMethod.POST)
	public String addUser(@ModelAttribute EducationInfoDto educationInfoDto,Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		String[] excelResult = educationInfoService.addPayCheck(mhsq.getFile("excelUpload"));	
		model.addAttribute(educationInfoService.getEducationInfoList(educationInfoDto));
		model.addAttribute("excelResult", excelResult[1]);
		return "madm/edu/archivestatus"; 
	} 
	
	
	@RequestMapping(value="/insertpage")
	public String redirectInsertPage(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		setMenu(model);
		model.addAttribute("centerList", educationInfoService.getCenterList(educationInfoDto));
		model.addAttribute("param", educationInfoDto);
		return "madm/edu/insertpage";
	}
	
	@RequestMapping(value="/ajaxCounselor", method=RequestMethod.GET)
	public void ajaxCounselor(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		model.addAttribute("counselorList", educationInfoService.getCounserlorList(educationInfoDto));
	}
	
	@RequestMapping(value="/addEduInfo")
	public String addEduInfo(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		educationInfoService.addEduInfo(educationInfoDto);
		return "redirect:/madm/edu/archivestatus";
	}
	
	@RequestMapping(value="/updateEduInfo")
	public String updateEduInfo(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		educationInfoService.updateEduInfo(educationInfoDto);
		return "redirect:/madm/edu/archivestatus";
	}
	
	@RequestMapping(value = "/deleteEduInfo")
	public String deleteEduInfo(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		educationInfoService.deleteEduInfo(educationInfoDto);
		setMenu(model);
		model.addAttribute(educationInfoService.getEducationInfoList(educationInfoDto));
		return "madm/edu/archivestatus";
	}
	
	@RequestMapping(value="/detailviewpage")
	public String detailViewPage(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
		setMenu(model);
		model.addAttribute("eduDetail", educationInfoService.getEducationInfo(educationInfoDto));
		return "madm/edu/detailviewpage";
	}
	
	@RequestMapping(value="/addeduinfobulk")
	public String addEduInfoBulk(Model model, MultipartHttpServletRequest mhsq){
		educationInfoService.addEduInfoBulk(mhsq.getFile("excelUpload"));
		return "redirect:/madm/edu/archivestatus";
	}
	
	
}
