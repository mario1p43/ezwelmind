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
@RequestMapping("/madm/bbsPublic")
public class BBSPublicController {

	@Resource
	private BBSService bbsService;

	@Resource
	private CommonService commonService;


	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/list")
	public String bbsPublic(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);

		model.addAttribute(bbsService.getBbsList(bbsDto));
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("alertMsg", bbsDto.getAlertMsg());
		return "madm/bbs/bbsPublic";
	}
	@RequestMapping(value = "/list2")
	public String bbsPublic2(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);

		model.addAttribute(bbsService.getBbsList(bbsDto));
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("alertMsg", bbsDto.getAlertMsg());
		return "madm/bbs/bbsPublic2";
	}	

	@RequestMapping(value = "/modifyPublicDetailForm")
	public String modifyNoticeDetail(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("viewMode", "detail");
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("vo", bbsService.getBbsSelectOne(bbsDto));
		model.addAttribute("files", bbsService.getBbsSelectFiles(bbsDto));

		return "madm/bbs/modifyPublicDetail";
	}

	@RequestMapping(value = "/modifyPublicDetailForm2")
	public String modifyNoticeDetail2(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("viewMode", "detail");
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("vo", bbsService.getBbsSelectOne(bbsDto));
		model.addAttribute("files", bbsService.getBbsSelectFiles(bbsDto));

		return "madm/bbs/modifyPublicDetail2";
	}

	@RequestMapping(value = "/update")
	public String updatePublic(@ModelAttribute BBSAddDto bbsAddDto, Model model) {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());

		bbsAddDto.setRegId(manager.getUserId());
		bbsAddDto.setRegNm(manager.getUserNm());

		String dataSeq = bbsAddDto.getDataSeq();

		setMenu(model);
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("bbsCd", bbsAddDto.getBbsCd());

		// 게시판 update
		bbsService.addBbsPublicReply(bbsAddDto);

		return "redirect:/madm/bbsPublic/modifyPublicDetailForm?dataSeq=" + dataSeq;
	}

	@RequestMapping(value = "/update2")
	public String updatePublic2(@ModelAttribute BBSAddDto bbsAddDto, Model model) {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());

		bbsAddDto.setRegId(manager.getUserId());
		bbsAddDto.setRegNm(manager.getUserNm());

		String dataSeq = bbsAddDto.getDataSeq();

		setMenu(model);
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("bbsCd", bbsAddDto.getBbsCd());

		// 게시판 update
		bbsService.addBbsPublicReply2(bbsAddDto);

		return "redirect:/madm/bbsPublic/modifyPublicDetailForm2?dataSeq=" + dataSeq;
	}
}