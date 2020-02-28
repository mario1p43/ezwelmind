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


@Controller
@RequestMapping("/madm/bbsInquiry")
public class InquiryController {	
	
	@Resource
	private BBSService bbsService;
	
	@Resource
	private CommonService commonService;
	
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/partnerList", method=RequestMethod.GET)
	public String partnerList(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		bbsAddDto.setBbsCd("partnerInquery");
		model.addAttribute(bbsService.getInquiryList(bbsAddDto));
		return "madm/bbs/inquiry/partnerList";
	}

	@RequestMapping(value = "/partnerDetail")
	public String detailForm(String dataSeq, Model model) {
		setMenu(model);
		model.addAttribute("detail", bbsService.getInquirySelectOne(dataSeq));
		return "madm/bbs/inquiry/partnerDetail";
	}
	
	@RequestMapping(value="/serviceList", method=RequestMethod.GET)
	public String serviceList(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		bbsAddDto.setBbsCd("serviceInquery");
		model.addAttribute(bbsService.getInquiryList(bbsAddDto));
		return "madm/bbs/inquiry/serviceList";
	}
	
	@RequestMapping(value = "/serviceDetail")
	public String serviceDetail(String dataSeq, Model model) {
		setMenu(model);
		model.addAttribute("detail", bbsService.getInquirySelectOne(dataSeq));
		return "madm/bbs/inquiry/serviceDetail";
	}

}