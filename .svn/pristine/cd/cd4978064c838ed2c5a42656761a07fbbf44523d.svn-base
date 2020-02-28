package com.ezwel.admin.controller.madm.bbs;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BbsPageDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/madm/bbsPage")
public class BBSPageController {	
 	
	@Resource
	private BBSService bbsService;
	
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	
	
	@RequestMapping(value="/pageList")
	public String getPageList(@ModelAttribute BbsPageDto bbsPageDto, Model model) {
		setMenu(model);
		model.addAttribute(bbsService.getPageList(bbsPageDto));
		return "madm/bbs/pagebbs/pageList";
	}
	
	
	@RequestMapping(value="/pageDetail")
	public String getPageDetail(String dataSeq, Model model) {
		setMenu(model);
		model.addAttribute("detail", bbsService.getPageDetail(dataSeq));
		return "madm/bbs/pagebbs/pageDetail";
		
		
	}
	
	
	@RequestMapping(value="/modifyPageBbs")
	public String modifyPageBbs(@ModelAttribute BbsPageDto bbsPageDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		setMenu(model);
		
		if (StringUtils.isNull(bbsPageDto.getDataSeq())) {
			bbsPageDto.setRegNm(manager.getUserNm());
			bbsPageDto.setRegId(manager.getUserId());
			bbsService.addPageDetail(bbsPageDto);
		} else {
			bbsPageDto.setModiNm(manager.getUserNm());
			bbsPageDto.setModiId(manager.getUserId());
			bbsService.modifyPageDetail(bbsPageDto);					
		}
		
		return "redirect:/madm/bbsPage/pageList";
	}
	
	
}