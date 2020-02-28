package com.ezwel.admin.controller.madm.user;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.service.user.UserUploadExcelService;

@Controller
@RequestMapping("/madm/userUploadExcel")
public class UserUploadExcelController {
	
	@Resource
	private UserUploadExcelService userUploadExcelService;
	
	
	private void setMenu(Model model) {
		String menuStr = "고객사";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/addUser", method=RequestMethod.POST)
	public String addUser(Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) throws Exception {
		String clientCd =request.getParameter("clientCd");		
		setMenu(model);
		String[] excelResult = userUploadExcelService.addUser(mhsq.getFile("excelUpload"), clientCd);		
		model.addAttribute("clientCd", clientCd);
		model.addAttribute("excelResult", excelResult[1]);
		return "madm/employee/employeeAddDetail"; 
	} 
	
	@RequestMapping(value="/sampleExcel")
	public String downloadSampleExcel(Map<String, Object> ModelMap) {
		// 고객사별로 샘플파일을 다르게 하고 싶으면...
		// 1. request clientCd 를 받는다.
		// 2. DB table 엑셀헤더를 만들고 가져온다.
		
		Map<String, Object> map = userUploadExcelService.getSampleExcel("USER_UPLOAD");
		
		map.get("ezwel_excel_value");
		
		ModelMap.put("ezwel_excel_data", map.get("ezwel_excel_data"));
		ModelMap.put("ezwel_excel_value", map.get("ezwel_excel_value"));
		
		return "excelBigGrid";
	}

}
