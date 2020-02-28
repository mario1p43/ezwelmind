package com.ezwel.admin.controller.madm.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.security.UserDetailsHelper;

@Controller
@RequestMapping("/madm/bbsEpilogue")
public class BBSEpilogueController {

	@Resource
	private BBSService bbsService;

	@Resource
	private CommonService commonService;


	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/list")
	public String bbsEpilogue(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);

		model.addAttribute(bbsService.getBbsList(bbsDto));
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("alertMsg", bbsDto.getAlertMsg());
		return "madm/bbs/bbsEpilogue";
	}

	@RequestMapping(value = "/list2")
	public String bbsEpilogue2(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);

		model.addAttribute(bbsService.getBbsList(bbsDto));
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("alertMsg", bbsDto.getAlertMsg());
		return "madm/bbs/bbsEpilogue2";
	}

	
	@RequestMapping(value = "/modifyEpilogueDetailForm")
	public String modifyNoticeDetail(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("viewMode", "detail");
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("vo", bbsService.getBbsSelectOne(bbsDto));
		model.addAttribute("files", bbsService.getBbsSelectFiles(bbsDto));

		return "madm/bbs/modifyEpilogueDetail";

	}
	@RequestMapping(value = "/modifyEpilogueDetailForm2")
	public String modifyNoticeDetail2(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("viewMode", "detail");
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("vo", bbsService.getBbsSelectOne(bbsDto));
		model.addAttribute("files", bbsService.getBbsSelectFiles(bbsDto));

		return "madm/bbs/modifyEpilogueDetail2";

	}
	@RequestMapping(value = "/update")
	public String updateEpilogue(@ModelAttribute BBSAddDto bbsAddDto, Model model) {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());

		setMenu(model);
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("bbsCd", bbsAddDto.getBbsCd());

		// 게시판 update
		bbsService.addBbsPublicReply(bbsAddDto);

		return "redirect:/madm/bbsEpilogue/modifyEpilogueDetailForm?dataSeq=" + bbsAddDto.getDataSeq();
	}
}