package com.ezwel.admin.controller.madm.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.security.UserDetailsHelper;


@Controller
@RequestMapping("/madm/bbsFaq")
public class BBSFaqController {	
 	
	@Resource
	private BBSService bbsService;
	
	@Resource
	private CommonService commonService;
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	
	/*
	 *  FAQ 시작
	 */
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String bbsFaq(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		model.addAttribute(bbsService.getBbsList(bbsAddDto));
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		return "madm/bbs/bbsFaq";
	}
	
	
	@RequestMapping(value="/addFaq", method=RequestMethod.GET)
	public String addFaq(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("clientList", commonService.getClientList());
		return "madm/bbs/addFaq";
	}

	@RequestMapping(value="/addFaq", method=RequestMethod.POST)
	public String insertFaq(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setRegNm(manager.getUserNm());
		bbsAddDto.setRegId(manager.getUserId());
		
		bbsService.insertBbs(bbsAddDto);		
		return "redirect:/madm/bbsFaq/list?bbsCd=faq&serviceType=" + bbsAddDto.getServiceType();
	}
	
	@RequestMapping(value="/modifyFaqDetail", method=RequestMethod.GET)
	public String faqDetail(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("faqDetail", bbsService.getBbsSelectOne(bbsAddDto));
		model.addAttribute("clientList",  bbsService.getClientList(bbsAddDto));
		setMenu(model);
		return "madm/bbs/modifyFaqDetail";
	}

	@RequestMapping(value="/modifyFaqDetail", method=RequestMethod.DELETE)
	public String faqDelete(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		bbsService.deleteBbs(bbsAddDto);
		setMenu(model);
		return "redirect:/madm/bbsFaq/list?bbsCd=faq&serviceType=" + bbsAddDto.getServiceType();
	}
	
	@RequestMapping(value="/modifyFaqDetail", method=RequestMethod.PUT)
	public String faqModify(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());
		
		bbsService.updateBbs(bbsAddDto);
		setMenu(model);
		return "redirect:/madm/bbsFaq/list?bbsCd=faq&serviceType=" + bbsAddDto.getServiceType();
	}
	
	@RequestMapping(value="/getCommList", method=RequestMethod.GET)
	public void getCommClientList(@RequestParam String highCommCd, Model model) {
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd(highCommCd);
		model.addAttribute("list", commonService.getTypeList(commonDto));
	}
	
}