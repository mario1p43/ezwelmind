package com.ezwel.admin.controller.madm.bbs;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
@RequestMapping("/madm/bbsInquiry")
public class BBSInquiryController {

	@Resource
	private BBSService bbsService;

	@Resource
	private CommonService commonService;


	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/list")
	public String bbsInquiry(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);

		model.addAttribute(bbsService.getBbsList(bbsDto));
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("alertMsg", bbsDto.getAlertMsg());
		return "madm/bbs/bbsInquiry";
	}

	@RequestMapping(value = "/testInquiry")
	public String testInquiry(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);

//		model.addAttribute(bbsService.getBbsList(bbsDto));
//		model.addAttribute("serviceType", bbsDto.getServiceType());
//		model.addAttribute("bbsCd", bbsDto.getBbsCd());
//		model.addAttribute("alertMsg", bbsDto.getAlertMsg());
		return "madm/bbs/testInquiry";
	}

	@RequestMapping(value = "/modifyInquiryDetailForm")
	public String modifyInquiryDetail(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("viewMode", "detail");
		model.addAttribute("vo", bbsService.getBbsSelectOne(bbsDto));
		model.addAttribute("files", bbsService.getBbsSelectFiles(bbsDto));

		return "madm/bbs/modifyInquiryDetail";
	}

	@RequestMapping(value = "/update")
	public String updateInquiry(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request) {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		String regNm = bbsAddDto.getRegNm();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());

		bbsAddDto.setRegId(manager.getUserId());
		bbsAddDto.setRegNm(manager.getUserNm());

		String dataSeq = bbsAddDto.getDataSeq();

		setMenu(model);
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("bbsCd", bbsAddDto.getBbsCd());

		// 게시판 update
		bbsService.addBbsInquiryReply(bbsAddDto, regNm);

		return "redirect:/madm/bbsInquiry/modifyInquiryDetailForm?dataSeq=" + dataSeq;
	}

}