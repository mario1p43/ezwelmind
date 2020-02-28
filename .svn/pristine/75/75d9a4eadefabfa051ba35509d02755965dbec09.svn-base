package com.ezwel.admin.controller.madm.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;


@Controller
@RequestMapping("/madm/bbsInfo")
public class BBSInfoController {	
 	
	@Resource
	private BBSService bbsService;
	
	@Resource
	private CommonService commonService;
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String bbsFaq(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100384");
		
		if( bbsAddDto.getServiceType() == null ){
			bbsAddDto.setServiceType("HOME");
		}
		
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
		model.addAttribute(bbsService.getBbsInfoList(bbsAddDto));
		return "madm/bbs/info/bbsInfo";
	}
	
	
	@RequestMapping(value="/addInfo", method=RequestMethod.GET)
	public String addInfoForm(Model model) {
		
		CommonDto commonDto = new CommonDto();
		
		setMenu(model);
		commonDto.setHighCommCd("100384");
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );

		commonDto.setHighCommCd("100001");
		model.addAttribute("boardList", commonService.getTypeList(commonDto) );
		
		return "madm/bbs/info/addInfo";
	}

	@RequestMapping(value="/addInfo", method=RequestMethod.POST)
	public String addInfo(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		bbsService.insertBbsInfo(bbsAddDto);		
		return "redirect:/madm/bbsInfo/list";
	}
	
	@RequestMapping(value="/modifyInfoDetail", method=RequestMethod.GET)
	public String faqDetail(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		
		if( bbsAddDto.getServiceType() == null ){
			bbsAddDto.setServiceType("HOME");
		}
		
		model.addAttribute("detail", bbsService.getBbsInfoDetail(bbsAddDto));
		setMenu(model);
		return "madm/bbs/info/modifyInfoDetail";
	}
	
	@RequestMapping(value="/modifyInfoDetail", method=RequestMethod.PUT)
	public String faqModify(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		
		if( bbsAddDto.getServiceType() == null ){
			bbsAddDto.setServiceType("HOME");
		}
		
		bbsService.updateBbsInfo(bbsAddDto);
		setMenu(model);
		return "redirect:/madm/bbsInfo/list";
	}
	
	
	
	@RequestMapping(value="/bbsMain", method=RequestMethod.GET)
	public String bbsMain(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		return "madm/bbs/info/main";
	}
	
	
	@RequestMapping(value="/bbsSample", method=RequestMethod.GET)
	public String getBbsSample(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100384");
		
		if( bbsAddDto.getServiceType() == null ){
			bbsAddDto.setServiceType("HOME");
		}
		//
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
		model.addAttribute(bbsService.getBbsSample(bbsAddDto));
		return "madm/bbs/info/bbsSample";
	}	
}