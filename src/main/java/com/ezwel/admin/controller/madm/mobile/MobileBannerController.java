package com.ezwel.admin.controller.madm.mobile;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.banner.BannerService;
import com.ezwel.admin.service.banner.dto.InvBannerDto;
import com.ezwel.admin.service.banner.dto.InvChannelDto;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.BBSFileData;
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/madm/mobile/banner")
public class MobileBannerController {	
 	
	@Resource
	private BannerService bannerService;
 	
	@Resource
	private BBSService bbsService;
	
	@Resource 
	private CommonService commonService;
	
	
	private void setMenu(Model model) {
		String menuStr ="모바일관리";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value="/bnrManage")
	public String bnrManage(@ModelAttribute InvBannerDto invBannerDto, Model model) {
		invBannerDto.setMobiChannelCd("MOBI");
		model.addAttribute(bannerService.getBnrList(invBannerDto));
		model.addAttribute("cornerCd", 		invBannerDto.getCornerCd() );
		model.addAttribute("cornerList",    bannerService.getCornerList(invBannerDto));
		model.addAttribute("channelList",   bannerService.chDataList(invBannerDto));

		setMenu(model);
		return "madm/mobile/banner/bnrManage";
	}
	
	
	@RequestMapping(value="/addBnrForm")
	public String addBnrForm(@ModelAttribute InvBannerDto invBannerDto, Model model) {
		model.addAttribute("cornerList",  bannerService.getCornerList(invBannerDto));
		model.addAttribute("clientList",  commonService.getClientList());
		model.addAttribute("cornerCd", invBannerDto.getCornerCd());
		setMenu(model);
		return "madm/mobile/banner/addBnr";
	}
	
	
	@RequestMapping(value="/ajaxCornerList")
	public void ajaxCornerList(@ModelAttribute InvChannelDto invChannelDto, ModelMap model) {
		model.addAttribute("chCd",  invChannelDto.getChannelCd());
		model.addAttribute("cornerList", bannerService.ajaxCornerList(invChannelDto));
	}
	
	
	@RequestMapping(value="/addBnr")
	public String addBnr(@ModelAttribute InvBannerDto invBannerDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		invBannerDto.setRegId(manager.getUserId());
		
		invBannerDto.init(mhsq);		
		bannerService.insertBnr(invBannerDto);
		setMenu(model);
		return "redirect:/madm/mobile/banner/bnrManage?cornerCd="+invBannerDto.getCornerCd();
	}
	
	
	@RequestMapping(value="/modifyBnrDetail", method=RequestMethod.GET)
	public String bnrDetail(@ModelAttribute InvBannerDto invBannerDto, Model model) {
		
		if (StringUtils.isNotNull(invBannerDto.getBannerSeq())) {
			BBSAddDto bbsDto = new BBSAddDto();
			bbsDto.setDataSeq(invBannerDto.getBannerSeq());
			List<BBSFileData> listFile = bbsService.getBbsSelectFiles(bbsDto);
			
			String filePath = "";
			String ext = "";
			for (int i = 0; i < listFile.size(); i++) {
				if ( "100314".equals(listFile.get(i).getDataType()) ) {
					model.addAttribute("thumbFile", listFile.get(i));
				} else {
					model.addAttribute("imgChk" + (i + 1), ext);
					model.addAttribute("links" + (i + 1), listFile.get(i));
				}
			}
		}
		
		model.addAttribute("bnrDetail", bannerService.modifyBnrDetail(invBannerDto));
		model.addAttribute("clientList", bannerService.getClientList(invBannerDto));
		setMenu(model);
		return "madm/mobile/banner/modifyBnrDetail";
	}
	
	
	@RequestMapping(value="/modifyBnrDetail", method=RequestMethod.DELETE)
	public String bnrDelete(@ModelAttribute InvBannerDto invBannerDto, Model model) {
		bannerService.modifyBnrDelete(invBannerDto);
		setMenu(model);
		return "redirect:/madm/mobile/banner/bnrManage?cornerCd="+invBannerDto.getCornerCd();
	}
	
	
	@RequestMapping(value="/modifyBnrDetail", method=RequestMethod.POST)
	public String bnrUpdate(@ModelAttribute InvBannerDto invBannerDto, Model model, HttpServletRequest request,	MultipartHttpServletRequest mhsq) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		invBannerDto.setModiId(manager.getUserId());
		
		invBannerDto.init(mhsq);
		bannerService.modifyBnrUpdate(invBannerDto);
		setMenu(model);
		return "redirect:/madm/mobile/banner/bnrManage?cornerCd="+invBannerDto.getCornerCd();
	}
	

}