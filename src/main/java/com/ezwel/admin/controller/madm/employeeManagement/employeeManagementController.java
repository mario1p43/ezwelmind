package com.ezwel.admin.controller.madm.employeeManagement;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.user.User;
import com.ezwel.admin.service.common.ApiService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.common.dto.CounselCategoryDto;
import com.ezwel.admin.service.employee.EmployeeService;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.pCounselorMgr.PCounselorMgrService;
import com.ezwel.admin.service.pCounselorMgr.dto.MindCounselIntakeDto;
import com.ezwel.admin.service.user.UserService;
import com.ezwel.admin.service.user.UserUploadExcelService;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/employeeManagement")
public class employeeManagementController {
	private static Logger log = LoggerFactory.getLogger(employeeManagementController.class);
	@Resource
	private EmployeeService employeeService;
	@Resource
	private CommonService commonService;
	@Resource
	private UserUploadExcelService userUploadExcelService;
	@Resource
	private PCounselorMgrService pCounselorMgrService;
	@Resource
	private UserService userService;
	@Resource
	private ApiService apiService;
	
	private void setMenu(Model model) {
		String menuStr = "고객사";
		model.addAttribute("menu", menuStr);
	}
	
	
	@RequestMapping(value = "/list")
	public String getList(@ModelAttribute EmployeeDto employeeDto, Model model) {
		setMenu(model);
		employeeDto.setExcelFlag("list");
		
		if(employeeDto.getSearchType().equals("view")){
			employeeDto.setExcelFlag("view");
			employeeDto.setSearchClientCd("nu");
			employeeDto.setSearchClientNm("nu");
		}
		model.addAttribute("emplist", employeeService.getEmplist(employeeDto));
		model.addAttribute(employeeService.getList(employeeDto));
		return "madm/employee/employeeList";
	}

	//정보수정
	@RequestMapping(value = "modify")
	public void modify(@ModelAttribute EmployeeDto employeeDto, Model model) {
		
		String Nm = employeeDto.getUserNm();
		
		//ajax 한글 깨짐 디코딩
		try {
			Nm = URLDecoder.decode(Nm, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		employeeDto.setUserNm(Nm);
		
		model.addAttribute("result", employeeService.modify(employeeDto));
	}
	
	
	//비밀번호 초기화
	@RequestMapping(value = "/initpwd")
	public void initpwd(@ModelAttribute EmployeeDto employeeDto, Model model) {
		//pwd MD5 암호화
		employeeDto.setUserPwd(employeeDto.getEmpNum());
		model.addAttribute("result", employeeService.initpwd(employeeDto));
	}
	
	//엑셀 다운로드
	@RequestMapping(value = "/excel")
	public String excel(@ModelAttribute EmployeeDto employeeDto, Model model) {
		setMenu(model);
		employeeDto.setExcelFlag("excel");
		model.addAttribute(employeeService.getList(employeeDto));
		return "madm/employee/employeeListExcel";
	}
	
	@RequestMapping(value = "/getStatus")
	public void getStatus(@ModelAttribute EmployeeDto employeeDto, Model model) {
		model.addAttribute("statuslist", employeeService.getStatus(employeeDto));
	}
	
	@RequestMapping(value = "/checkClientCd")
	public void checkClientCd(@ModelAttribute EmployeeDto employeeDto, Model model) {
		model.addAttribute("countCd", employeeService.checkClientCd(employeeDto));
	}

	//임직원 상세보기
	@RequestMapping(value = "/detail")
	public String getdetail(@ModelAttribute EmployeeDto employeeDto, Model model) {
		setMenu(model);
		//임직원관리
		model.addAttribute("vo",employeeService.getDetail(employeeDto));
		
		//동의정보
		model.addAttribute("agree",employeeService.getAgree(employeeDto));

		if(!StringUtils.isEmpty(employeeDto.getCounselCd())){
			//인테이크관리
			MindCounselIntakeDto mindCounselIntakeDto = new MindCounselIntakeDto();
			mindCounselIntakeDto.setCounselCd(employeeDto.getCounselCd());
			
			model.addAttribute("intake_detail", pCounselorMgrService.intakeDetail(mindCounselIntakeDto));
			model.addAttribute("intakeCd", employeeDto.getIntakeCd());
		}
		
		String userKey = employeeDto.getUserKey();
		User user = userService.getUserInfo(userKey);
		
		Map<String, Object> params = new HashMap<>();
		params.put("clientCd", user.getClientCd());
		params.put("userKey", userKey);
		Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/getPoint", false);
		
		model.addAttribute("privateRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("privateRemainPoint")) : "");
		model.addAttribute("clientRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("clientRemainPoint")) : "");
		model.addAttribute("ceiling", commonService.getClientCeiling(user.getClientCd()));
		
		return "madm/employee/employeeDetail";
	}
	
	
	@RequestMapping(value = "/getCategory")
	public void getCategory(@ModelAttribute EmployeeDto employeeDto, Model model) {
		//관심카테고리(100527~100530)
		model.addAttribute("inter",employeeService.getInterest(employeeDto));
	}
	
	
	/**
	 * 임직원 등록페이지
	 * @return 임직원 등록 페이지 jsp
	 */
	@RequestMapping(value = "/employeeAddDetail")
	public String employeeAddDetail(String clientCd, Model model) {
		setMenu(model);
		model.addAttribute("clientCd", clientCd);
		return "madm/employee/employeeAddDetail";
	}
	
	/**
	 * 주문&상담일지 수작업페이지
	 * @return view jsp
	 */
	@RequestMapping(value = "/orderHandwork", method = {RequestMethod.GET})
	public String orderHandwork(Model model) {
		setMenu(model);
		setCommonCode(model);
		return "madm/employee/orderHandwork";
	}
	
	
	/**
	 * 주문&상담일지 수작업 프로세스
	 * @return view jsp
	 * @throws Exception 
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/orderHandwork", method = {RequestMethod.POST})
	public String insertOrderHandwork(Model model, MultipartHttpServletRequest mhsq){
		setMenu(model);
		String[] excelResult = null;
		try {
			excelResult = employeeService.addOrderAndCounsel(mhsq.getFile("excelUpload"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		setCommonCode(model);
		log.debug("==========================   excelResult : ", excelResult.length);
		log.debug("==========================   excelResult : ", excelResult[0]);
		model.addAttribute("excelResult", excelResult[1]);		
		return "madm/employee/orderHandwork";				
	}
	
	/**
	 * 주문&상담일지 수작업 Download Excel-Sample-File 
	 * @return excelBigGrid 
	 */
	@RequestMapping(value="/sampleExcel")
	public String downloadSampleExcel(Map<String, Object> ModelMap) {
		// 고객사별로 샘플파일을 다르게 하고 싶으면...
		// 1. request clientCd 를 받는다.
		// 2. DB table 엑셀헤더를 만들고 가져온다.
		
		Map<String, Object> map = userUploadExcelService.getSampleExcel("ORDER_HANDWORK_UPLOAD");
		
		ModelMap.put("ezwel_excel_data", map.get("ezwel_excel_data"));
		ModelMap.put("ezwel_excel_value", map.get("ezwel_excel_value"));
		
		return "excelBigGrid";
	}	

	public void setCommonCode(Model model) {
		CommonDto commonDto = new CommonDto();
		CounselCategoryDto counselCategoryDto = new CounselCategoryDto();
		// 상담대상
		commonDto.setHighCommCd("100440");
		model.addAttribute("counselingTarget", commonService.getTypeList(commonDto));
		// 학력 
		commonDto.setHighCommCd("100597");
		model.addAttribute("education", commonService.getTypeList(commonDto));
		// 학년
		commonDto.setHighCommCd("100614");
		model.addAttribute("schoolyear", commonService.getTypeList(commonDto));
		// 직업
		commonDto.setHighCommCd("100627");
		model.addAttribute("job", commonService.getTypeList(commonDto));
		// 상담분야 
		counselCategoryDto.setHighCategoryCd("0");
		model.addAttribute("counseling", commonService.getCounselCategory(counselCategoryDto));		
		// 상담유형
		counselCategoryDto.setHighCategoryCd("100001");
		model.addAttribute("consultationType", commonService.getCounselCategory(counselCategoryDto));
		// 상담방법
		commonDto.setHighCommCd("100432");
		model.addAttribute("consultationMethods", commonService.getTypeList(commonDto));		
		// 결제수단
		commonDto.setHighCommCd("100391");
		model.addAttribute("methodOfPayment", commonService.getTypeList(commonDto));
		// 일지상태
		commonDto.setHighCommCd("100691");
		model.addAttribute("journalState", commonService.getTypeList(commonDto));
		// 상담상태
		commonDto.setHighCommCd("100519");
		model.addAttribute("consultationState", commonService.getTypeList(commonDto));
		// 연장상태
		commonDto.setHighCommCd("100930");
		model.addAttribute("extendedState", commonService.getTypeList(commonDto));
	}
}
