package com.ezwel.admin.controller.partner.hue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.hue.HueContactService;
import com.ezwel.admin.service.hue.dto.BBSAdd2Dto;
import com.ezwel.admin.service.security.UserDetailsHelper;

@Controller
@RequestMapping("/partner/booking")
public class HueContactController {

	@Resource
	private HueContactService hueContactService;


	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/list")
	public String bbsPublic(@ModelAttribute BBSAdd2Dto bbsDto, Model model, HttpServletRequest request) {
		setMenu(model);		
		String searchArr = request.getParameter("searchArr");
		if(searchArr == null || searchArr == ""){
		}else{

			String type = "("+searchArr+")";
			type = type.toString().replace(',', '|');
			bbsDto.setSearchArr(type);
		}
		
//		model.addAttribute(bbsService.getBbsList2(bbsDto));
		model.addAttribute(hueContactService.getContactList(bbsDto));
		
		model.addAttribute("serviceType", bbsDto.getServiceType());		
		return "partner/hue/bbsPublic";
	}

	@RequestMapping(value = "/excelDownload")
	public String excelDownload(@ModelAttribute BBSAdd2Dto bbsDto, Model model, HttpServletRequest request) {				
		setMenu(model);		
		String searchArr = request.getParameter("searchArr");
		if(searchArr == null || searchArr == ""){
		}else{

			String type = "("+searchArr+")";
			type = type.toString().replace(',', '|');
			bbsDto.setSearchArr(type);
		}
//		model.addAttribute(bbsService.getBbsList5(bbsDto));
		model.addAttribute(hueContactService.getExcelContactList(bbsDto));
		
		return "/partner/hue/bbsPublicExcel";
	}
	@RequestMapping(value = "/modifyPublicDetailForm")
	public String modifyNoticeDetail(@ModelAttribute BBSAdd2Dto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("viewMode", "detail");		
		
//		model.addAttribute("vo", bbsService.getBbsSelectOne2(bbsDto));
		model.addAttribute("vo", hueContactService.getContact(bbsDto));
		
		//model.addAttribute("files", bbsService.getBbsSelectFiles2(bbsDto));

		return "partner/hue/modifyPublicDetail";
	}


	@RequestMapping(value = "/update")
	public String updatePublic(@ModelAttribute BBSAdd2Dto bbsAddDto, Model model) {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());
		

		String dataSeq = bbsAddDto.getDataSeq();

		setMenu(model);
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
	

//		bbsService.addBbsPublicReply(bbsAddDto);
		hueContactService.addContactReply(bbsAddDto);

		return "redirect:/partner/booking/list?bbsCd=sangdam&serviceType=hue";
	}

}