package com.ezwel.admin.controller.partner.payCheck;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.controller.madm.main.MainController;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.common.ApiService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.counsel.CounselOrderService;
import com.ezwel.admin.service.counsel.CounselService;
import com.ezwel.admin.service.counselor.CounselorService;
import com.ezwel.admin.service.evaluation.dto.EvaluationDto;
import com.ezwel.admin.service.message.queue.SmsService;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.CounselorCalendarService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.user.UserService;
import com.ezwel.common.commonController;
import com.ezwel.core.support.util.StringUtils;
import com.ibm.icu.text.NumberFormat;


@Controller
@RequestMapping("/partner/payCheck")
public class PayCheckController extends commonController{
	
	private static Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Resource
	private CenterService centerService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private PayCheckService payCheckService;
	

	private void setMenu(Model model) {
		String menuStr = "상담비 정산";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value = "/updateCheckYnOwner")
	public void updateCheckYnOwner(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		payCheckAddDto.setUserId(manager.getUserId());
		payCheckService.updateCheckYnOwner(payCheckAddDto);
	}
	
	@RequestMapping(value = "/updateCheckYn")
	public void updateCheckYn(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		payCheckAddDto.setUserId(manager.getUserId());
		payCheckService.updateCheckYn(payCheckAddDto);
	}
	
	@RequestMapping(value = "/updateCheckYnManager")
	public void updateCheckYnManger(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		payCheckAddDto.setUserId(manager.getUserId());
		payCheckService.updateCheckYnManager(payCheckAddDto);
	}

	@RequestMapping(value="/payCheckList")
	public String payCheckList(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model, HttpServletRequest request) {
		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		
		if (!StringUtils.isEmpty(request.getParameter("startDt"))) {
			payCheckAddDto.setStartDt(payCheckAddDto.getStartDt().replace("/", "") );
		}
		if (!StringUtils.isEmpty(request.getParameter("endDt"))) {
			payCheckAddDto.setEndDt(payCheckAddDto.getEndDt().replace("/", ""));
		}
		
		String auth = "";
		if (request.isUserInRole("ROLE_PARTNER_ADMIN")) {
			payCheckAddDto.setCenterSeq(null);
			auth = "admin";
		}else if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
			payCheckAddDto.setCenterSeq(Integer.toString(manger.getCenterSeq()));
			auth = "center";
		}else {
			payCheckAddDto.setCounselorId(manger.getUserId());
		}
		model.addAttribute("auth",  auth);
		model.addAttribute("clientList",  commonService.getClientList());
		model.addAttribute("centerList", centerService.getCenterNameList(new CenterDto()));
		
		// 비용합계 및 돈 콤마
		String priceSum = payCheckService.getPayCheckPriceSum(payCheckAddDto);
		NumberFormat nf = NumberFormat.getNumberInstance();
        priceSum = nf.format(Integer.parseInt(priceSum)).toString();
		model.addAttribute("priceSum", priceSum);
		
		model.addAttribute(payCheckService.getPayCheckList(payCheckAddDto));
		model.addAttribute("payCheckAddDto",  payCheckAddDto);
		
		model.addAttribute("payCheckConfirm",  payCheckService.getPayCheckConfirm(payCheckAddDto));
		
		setMenu(model);
		if(isDevice(request) == IS_PC) {
			return "partner/payCheck/payCheckList";
		}else {
			return "partner/payCheck/payCheckList_mo";
		}
		
	}
	
	// 엑셀다운
	@RequestMapping(value = "/excelDownPayCheck")
	public String excelDownPayCheck(@ModelAttribute PayCheckAddDto payCheckAddDto, Model model, HttpServletRequest request) {
		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		if (request.isUserInRole("ROLE_PARTNER_ADMIN")) {
			payCheckAddDto.setCenterSeq(null);
		}else if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
			payCheckAddDto.setCenterSeq(Integer.toString(manger.getCenterSeq()));
		}else {
			payCheckAddDto.setCounselorId(manger.getUserId());
		}
		model.addAttribute(payCheckService.getPayCheckListExcel(payCheckAddDto));
		return "partner/payCheck/paycheckListExcel";
	}
	
}
