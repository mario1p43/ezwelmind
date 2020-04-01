package com.ezwel.admin.controller.partner.payCheck;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.controller.madm.main.MainController;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.counsel.Counsel;
import com.ezwel.admin.domain.entity.pCounselorMgr.CounselReservation;
import com.ezwel.admin.domain.entity.user.User;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.common.ApiService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.counsel.CounselOrderService;
import com.ezwel.admin.service.counsel.CounselService;
import com.ezwel.admin.service.counsel.dto.CounselDto;
import com.ezwel.admin.service.counselor.CounselorService;
import com.ezwel.admin.service.message.queue.SmsService;
import com.ezwel.admin.service.operations.dto.OperationsDto;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.CounselorCalendarService;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.user.UserService;
import com.ezwel.admin.service.user.dto.UserAddDto;
import com.ezwel.common.commonController;
import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.support.util.DateUtils;
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/partner/payCheckMgr")
public class PayCheckMgrController extends commonController {
	
	private static Logger log = LoggerFactory.getLogger(PayCheckMgrController.class);
	
	@Resource
	private PayCheckService payCheckService;
	

	private void setMenu(Model model) {
		String menuStr = "상담비 업로드";
		model.addAttribute("menu", menuStr);
	}


	@RequestMapping(value="/uploadMain")
	public String uploadMain(@ModelAttribute CounselReservationDto counselReservationDto, Model model, HttpServletRequest request) {
		setMenu(model);
		return "partner/payCheck/payCheckUpload";
	}
	
	@RequestMapping(value="/addPayCheck", method=RequestMethod.POST)
	public String addUser(Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		String[] excelResult = payCheckService.addPayCheck(mhsq.getFile("excelUpload"));		
		model.addAttribute("excelResult", excelResult[1]);
		return "partner/payCheck/payCheckUpload"; 
	} 
	
	@RequestMapping(value="/sampleExcel")
	public String downloadSampleExcel(Map<String, Object> ModelMap) {
		// 고객사별로 샘플파일을 다르게 하고 싶으면...
		// 1. request clientCd 를 받는다.
		// 2. DB table 엑셀헤더를 만들고 가져온다.
		
		Map<String, Object> map = payCheckService.getSampleExcel();
		
		map.get("ezwel_excel_value");
		
		ModelMap.put("ezwel_excel_data", map.get("ezwel_excel_data"));
		ModelMap.put("ezwel_excel_value", map.get("ezwel_excel_value"));
		
		return "excelBigGrid";
	}
	
	// 상담비정산 상세보기 팝업
	@RequestMapping(value="/showPayCheckPop", method=RequestMethod.GET)
	public String payCheckPop(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model, HttpServletRequest request) {
		model.addAttribute("searchValue", payCheckAddDto);
		model.addAttribute("insertType", payCheckAddDto.getInsertType());
		if ( payCheckAddDto.getInsertType().equals("U") ){
			payCheckAddDto = payCheckService.getPayCheckPop(payCheckAddDto);
			model.addAttribute("payCheck", payCheckAddDto);
		}
        if(isDevice(request) == IS_PC) {
            return "partner/payCheck/showPayCheckPop";
        }else {    
            return "partner/payCheck/showPayCheckPop_mo";
        }
	}
	
	// 상담비정산 insert
	@RequestMapping(value="/insertPayCheck", method=RequestMethod.GET)
	public void insertPaycheck(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model) {
		if (!StringUtils.isEmpty(payCheckAddDto.getScheduleDt())) {
			payCheckAddDto.setScheduleDt(payCheckAddDto.getScheduleDt().replaceAll("\\s", ""));
			payCheckAddDto.setScheduleDt(payCheckAddDto.getScheduleDt().replaceAll("/", ""));
			payCheckAddDto.setScheduleDt(payCheckAddDto.getScheduleDt().replace(":", ""));
		}
		model.addAttribute("resultCnt", payCheckService.insertPayCheck(payCheckAddDto));
	}
	
	// 상담비정산 update
	@RequestMapping(value="/updatePayCheck", method=RequestMethod.GET)
	public void updatePaycheck(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model) {
		if (!StringUtils.isEmpty(payCheckAddDto.getScheduleDt())) {
			payCheckAddDto.setScheduleDt(payCheckAddDto.getScheduleDt().replaceAll("\\s", ""));
			payCheckAddDto.setScheduleDt(payCheckAddDto.getScheduleDt().replaceAll("/", ""));
			payCheckAddDto.setScheduleDt(payCheckAddDto.getScheduleDt().replace(":", ""));
		}
		model.addAttribute("resultCnt", payCheckService.updatePayCheck(payCheckAddDto));
	}
	
	// 상담비정산 delete
	@RequestMapping(value="/deletePayCheck", method=RequestMethod.GET)
	public void deletePayCheck(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model) {
		model.addAttribute("resultCnt", payCheckService.deletePayCheck(payCheckAddDto));
	}
	
	// 계산서 update
	@RequestMapping(value="/updatePaycheckConfirm", method=RequestMethod.GET)
	public void updatePaycheckConfirm(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model) {
		model.addAttribute("resultCnt", payCheckService.updatePaycheckConfirm(payCheckAddDto));
	}

}