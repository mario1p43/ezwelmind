package com.ezwel.admin.controller.partner.hue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.hue.HueCommonService;
import com.ezwel.admin.service.hue.HueCounselService;
import com.ezwel.admin.service.hue.dto.BBSAdd2Dto;
import com.ezwel.admin.service.hue.dto.CenterCounselDto;
import com.ezwel.admin.service.security.UserDetailsHelper;

@Controller
@RequestMapping("/partner/sangdam")
public class HueSangdamController {

	@Resource
	private HueCommonService hueCommonService;

	@Resource
	private HueCounselService hueCounselService;
	
	@Resource
	private CommonService commonService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());

	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/list")
	public String bbsPublic(@ModelAttribute BBSAdd2Dto bbsDto,@ModelAttribute CenterCounselDto centerCounselDto, Model model, HttpServletRequest request) {		
		setMenu(model);		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		if(request.isUserInRole("ROLE_P_CENTER_HUE")){
			logger.debug(	"===========> 센터장");
			//bbsDto.setCheckUserId("");
		}else{
			logger.debug(	"===========> 상담사");
			bbsDto.setCheckUserId(manager.getUserId());
			centerCounselDto.setCounselorId(manager.getUserId());
			logger.debug(	"===========> "+manager.getUserId());
		}
		
		String searchArr = request.getParameter("searchArr");		
		if(searchArr == null || searchArr == ""){
		}else{

			String type = "("+searchArr+")";
			type = type.toString().replace(',', '|');
			bbsDto.setSearchArr(type);
		}
//		model.addAttribute("userList", bbsService.getUserNameList(bbsDto));					
		model.addAttribute("userList", hueCommonService.getUserNameList(bbsDto));					
		
//		model.addAttribute(bbsService.getSangdamList(bbsDto));
		model.addAttribute(hueCounselService.getCounselList(centerCounselDto));
		
		model.addAttribute("serviceType", bbsDto.getServiceType());		
		return "partner/hue/sangdamPublic";
	}
	

	@RequestMapping(value = "/excelDownload")
	public String excelDownload(@ModelAttribute CenterCounselDto centerCounselDto, Model model,HttpServletRequest request) {				
		//setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		if(request.isUserInRole("ROLE_P_CENTER_HUE")){
			logger.debug(	"===========> 센터장");
			//bbsDto.setCheckUserId("");
		}else{
			logger.debug(	"===========> 상담사");
			centerCounselDto.setUserId(manager.getUserId());
			logger.debug(	"===========> "+manager.getUserId());
		}
		
//		model.addAttribute(bbsService.getSangdamList2(bbsDto));
		model.addAttribute(hueCounselService.getExcelSangdamList(centerCounselDto));

		return "/partner/hue/sangdamMgrExcel";
	}
	

	
	@RequestMapping(value = "/modifySangdamDetailForm")
	public String modifySangdamDetailForm(@ModelAttribute CenterCounselDto centerCounselDto, Model model,HttpServletRequest request) {
		setMenu(model);		
//		String dataSeq=request.getParameter("dataSeq");
//		String pageNum=request.getParameter("pageNum");
//		bbsDto.setDataSeq(dataSeq);	
//		bbsDto.setPageNum(pageNum);
		
//		model.addAttribute("intake", bbsService.getIntake(bbsDto));	
		model.addAttribute("intake", hueCounselService.getCounsel(centerCounselDto));	
		
//		model.addAttribute("record", bbsService.getRecord(bbsDto));
//		model.addAttribute("record", hueCounselService.getRecord(bbsDto));	

		return "partner/hue/modifySangdamDetail";
	}
	
	
	@RequestMapping(value="/updateSangdamMgr")
	public String updateSangdamMgr(@ModelAttribute CenterCounselDto centerCounselDto, Model model,HttpServletRequest request,MultipartHttpServletRequest mhsq){
		setMenu(model);
		centerCounselDto.init(mhsq, true);
		
//		bbsService.updateSangdamMgr(bbsDto,mgrCertDto, request);
		hueCounselService.updateCounsel(centerCounselDto, request);
		
		return "redirect:/partner/sangdam/list";
	}
	
}