package com.ezwel.admin.controller.madm.jedo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.JedoInfoService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.security.UserDetailsHelper;


@Controller
@RequestMapping("/madm/jedoInfo")
public class JedoInfoController {	
 	
	@Resource
	private JedoInfoService jedoInfoService;
	
	@Resource
	private CommonService commonService;
	
	private void setMenu(Model model) {
		String menuStr ="고객사";
		model.addAttribute("menu", menuStr);
	}
	

//	제도안내 ↓
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String jedoList(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		
		bbsAddDto.setServiceType("SANGDAM4U");
		bbsAddDto.setBbsCd("jedo");
		
		model.addAttribute(jedoInfoService.getBbsList(bbsAddDto));
		model.addAttribute("clientList", commonService.getClientList());

		setMenu(model);
		return "madm/bbs/jedo/jedoInfo";
	}
	
	@RequestMapping(value="/addJedo", method=RequestMethod.GET)
	public String addInfoForm(Model model) {
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100401");
		model.addAttribute("clientList" , commonService.getClientList());
		model.addAttribute("pageKeyList", commonService.getTypeList(commonDto) );
		setMenu(model);
		return "madm/bbs/jedo/addJedo";
	}

	@RequestMapping(value="/addJedo", method=RequestMethod.POST)
	public String addInfo(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		bbsAddDto.setRegId(manager.getUserId());
		bbsAddDto.setRegNm(manager.getUserNm());
		
		jedoInfoService.insertBbs(bbsAddDto);
		setMenu(model);
		return "redirect:/madm/jedoInfo/list";
	}
	
	@RequestMapping(value="/modifyJedoDetail", method=RequestMethod.GET)
	public String jedoDetail(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		model.addAttribute("detail", jedoInfoService.getBbsSelectOne(bbsAddDto));
		setMenu(model);
		return "madm/bbs/jedo/modifyJedoDetail";
	}
	
	@RequestMapping(value="/modifyJedoDetail", method=RequestMethod.PUT)
	public String jedoModify(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		bbsAddDto.setModiId(manager.getUserId());
		bbsAddDto.setModiNm(manager.getUserNm());
		jedoInfoService.updateBbs(bbsAddDto);
		setMenu(model);
		return "redirect:/madm/jedoInfo/list";
	}
//	제도안내 ↑
	
//	제도안내 고객사 카피 기능 ↓
	@RequestMapping(value="/clientCopy", method=RequestMethod.GET)
	public String clientCopy(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		model.addAttribute("clientList", commonService.getClientList());
		setMenu(model);
		return "madm/bbs/jedo/clientCopy";
	}
	
	@RequestMapping(value="/clientCopy", method=RequestMethod.POST)
	public String insertClientCopy(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		jedoInfoService.insertClientCopy(bbsAddDto);
		setMenu(model);
		return "redirect:/madm/jedoInfo/clientCopy";
	}
//	제도안내 고객사 카피 기능 ↑
	
//	제도안내 고객사 삭제 기능 ↓
	@RequestMapping(value="/clientDelete", method=RequestMethod.GET)
	public String clientDelete(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		model.addAttribute("clientList", commonService.getClientList());
		model.addAttribute("jedoClientList", jedoInfoService.getJedoClientList(bbsAddDto));
		setMenu(model);
		return "madm/bbs/jedo/clientDelete";
	}
	
	@RequestMapping(value="/clientDeltete", method=RequestMethod.DELETE)
	public String insertClientDelete(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		return "redirect:/madm/jedoInfo/clientDelete";
	}
//	제도안내 고객사 삭제 기능 ↑
}