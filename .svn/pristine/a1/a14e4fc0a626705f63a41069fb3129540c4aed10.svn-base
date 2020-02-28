package com.ezwel.admin.controller.madm.contactUs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/bbsEnterEducation")
public class EnterEducationController {
	
	@Resource
	private BBSService bbsService;
	
	@Resource
	private CommonService commonService;
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/educationList", method=RequestMethod.GET)
	public String seminarList(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		bbsAddDto.setBbsCd("educationInquery");
		model.addAttribute(bbsService.getInquiryList(bbsAddDto));
		return "madm/contactUs/educationList";
	}

	@RequestMapping(value = "/educationDetail")
	public String educationDetail(String dataSeq, Model model) {
		setMenu(model);
		model.addAttribute("detail", bbsService.getInquirySelectOne(dataSeq));
		return "madm/contactUs/educationDetail";
	}
}
