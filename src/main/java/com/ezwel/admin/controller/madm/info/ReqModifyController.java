package com.ezwel.admin.controller.madm.info;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.domain.entity.info.ReqModifyDto;
import com.ezwel.admin.service.info.ReqModifyService;

@Controller
@RequestMapping("/madm/info")
public class ReqModifyController {

	@Resource
	private ReqModifyService reqModifyService;
	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr = "정보수정요청";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value = "/reqmodify")
	public String reqModifyMain(@ModelAttribute ReqModifyDto reqModifyDto, Model model) {
		setMenu(model);
		model.addAttribute(reqModifyService.getReqModifyList(reqModifyDto));
		return "madm/info/reqmodify";
	}
}
