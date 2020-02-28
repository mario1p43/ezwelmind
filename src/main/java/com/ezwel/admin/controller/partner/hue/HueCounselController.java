package com.ezwel.admin.controller.partner.hue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.hue.HueCommonService;
import com.ezwel.admin.service.hue.HueCounselService;
import com.ezwel.admin.service.hue.dto.BBSAdd2Dto;
import com.ezwel.admin.service.hue.dto.CenterCounselDto;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.security.UserDetailsHelper;

@Controller
@RequestMapping("/partner/counsel")
public class HueCounselController {

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
	public String bbsPublic(@ModelAttribute BBSAdd2Dto bbsDto,CenterCounselDto centerCounselDto, Model model, HttpServletRequest request) {
		setMenu(model);		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
				
		if(request.isUserInRole("ROLE_P_CENTER_HUE")){
			logger.debug(	"===========> 센터장");
			//bbsDto.setCheckUserId("");
		}else{
			logger.debug(	"===========> 상담사");
			bbsDto.setCheckUserId(manager.getUserId());
			logger.debug(	"===========> "+manager.getUserId());
		}
		model.addAttribute("chkUserId", request.isUserInRole("ROLE_P_CENTER_HUE"));
		model.addAttribute("chkUserId2", manager.getUserId());
		
//		model.addAttribute("userList", bbsService.getUserNameList(bbsDto));
		model.addAttribute("userList", hueCommonService.getUserNameList(bbsDto));						
		
//		model.addAttribute(bbsService.getBbsList3(bbsDto));
		model.addAttribute(hueCounselService.getCounselList(centerCounselDto));
		
		model.addAttribute("serviceType", bbsDto.getServiceType());		
		return "partner/hue/counselList";
	}
	@RequestMapping(value="/counselorMgrAdd")
	public String counselMgrAdd(@ModelAttribute BBSAdd2Dto bbsDto, Model model){
		
		setMenu(model);
//		model.addAttribute("userList", bbsService.getUserNameList(bbsDto));	
		model.addAttribute("userList", hueCommonService.getUserNameList(bbsDto));				
				
		return "partner/hue/counselMgrAdd";
	}
	
	@RequestMapping(value="/insertCounselMgr")
	public String insertCounselMgr(CenterCounselDto centerCounselDto, @ModelAttribute MgrCertDto mgrCertDto, Model model,HttpServletRequest request,MultipartHttpServletRequest mhsq)
	{
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		centerCounselDto.setRegId(manager.getUserId());
		
		setMenu(model);
		mgrCertDto.init(mhsq);
//		bbsService.addCounselMgr(bbsDto, mgrCertDto, request);
		hueCounselService.addCounselMgr(centerCounselDto,mgrCertDto, request);
		
		return "redirect:/partner/counsel/list";
	}
	
	@RequestMapping(value="/updateCounselMgr")
	public String updateCounselMgr(BBSAdd2Dto bbsDto,CenterCounselDto centerCounselDto, @ModelAttribute MgrCertDto mgrCertDto, Model model,HttpServletRequest request,MultipartHttpServletRequest mhsq)
	{
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		bbsDto.setRegId(manager.getUserId());
		setMenu(model);
		mgrCertDto.init(mhsq);
		
//		bbsService.updateCounselMgr(bbsDto,mgrCertDto, request);
		model.addAttribute(hueCounselService.updateCounselMgr(bbsDto, centerCounselDto, mgrCertDto, request));
		
		return "redirect:/partner/counsel/list";
	}
	
	@RequestMapping(value="/updateCounselMgr2")
	public String updateCounselMgr2(BBSAdd2Dto bbsDto,CenterCounselDto centerCounselDto, @ModelAttribute MgrCertDto mgrCertDto, Model model,HttpServletRequest request,MultipartHttpServletRequest mhsq)
	{
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		bbsDto.setRegId(manager.getUserId());
				
		setMenu(model);
		mgrCertDto.init(mhsq);
//		bbsService.updateCounselMgr2(bbsDto,mgrCertDto, request);
		hueCounselService.updateCounselMgr2(bbsDto, centerCounselDto);
		
		return "redirect:/partner/counsel/list";
	}
	
	@RequestMapping(value = "/excelDownload")
	public String excelDownload(@ModelAttribute CenterCounselDto centerCounselDto, Model model,HttpServletRequest request) {				
		setMenu(model);		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		if(request.isUserInRole("ROLE_P_CENTER_HUE")){
			logger.debug(	"===========> 센터장");
			//bbsDto.setCheckUserId("");
		}else{
			logger.debug(	"===========> 상담사");
			centerCounselDto.setUserId(manager.getUserId());
			logger.debug(	"===========> "+manager.getUserId());
		}
		
//		model.addAttribute(bbsService.getBbsList4(bbsDto));
		model.addAttribute(hueCounselService.getExcelCounselList(centerCounselDto));
		
		return "/partner/hue/counselMgrExcel";
	}
	

	@RequestMapping(value = "/modifyCounselDetailForm")
	public String modifyCounselDetail(@ModelAttribute BBSAdd2Dto bbsDto, @ModelAttribute CenterCounselDto centerCounselDto, Model model,HttpServletRequest request) {
		//dataSeq
		setMenu(model);		
		String dataSeq=request.getParameter("dataSeq");
		bbsDto.setDataSeq(dataSeq);		
		
//		model.addAttribute("userList", bbsService.getUserNameList(bbsDto));
		model.addAttribute("userList", hueCommonService.getUserNameList(bbsDto));
		
//		model.addAttribute("familyList", bbsService.getFamilyList(bbsDto));
		model.addAttribute("familyList", hueCommonService.getFamilyList(bbsDto));
		
//		model.addAttribute("familyCnt", bbsService.getFamilyList(bbsDto).size());
		model.addAttribute("familyCnt", hueCommonService.getFamilyList(bbsDto).size());
		
//		model.addAttribute("vo", bbsService.getCounsel(bbsDto));
		model.addAttribute("vo", hueCounselService.getCounsel(centerCounselDto));
		
		return "partner/hue/modifyCounselDetail";
	}
	
	
	
	@RequestMapping(value="/checkUser", method=RequestMethod.GET)
	public void checkUser(@ModelAttribute BBSAdd2Dto bbsDto, Model model) {
		
//		model.addAttribute("mgr", bbsService.getUserNameList2(bbsDto));
		model.addAttribute("mgr", hueCommonService.getUserNameList2(bbsDto));

	}

}