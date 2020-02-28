package com.ezwel.admin.controller.madm.banner;

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
import com.ezwel.admin.service.banner.dto.InvCornerDto;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.BBSFileData;
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/madm/banner")
public class BannerController {	
 	
	@Resource
	private BannerService bannerService;
 	
	@Resource
	private BBSService bbsService;
	
	@Resource 
	private CommonService commonService;
	
	
	private void setMenu(Model model) {
		String menuStr ="프로모션";
		model.addAttribute("menu", menuStr);
	}

	
	@RequestMapping(value="/bnrMain")
	public String bbsNotice(@ModelAttribute InvBannerDto invBannerDto, Model model) {
		model.addAttribute("chDetailList", bannerService.chDataList(invBannerDto));
		setMenu(model);
		return "madm/banner/bnrMain";
	}
	
	
	@RequestMapping(value="/insertChannel")
	public String insertChannel(@ModelAttribute InvChannelDto invChannelDto, Model model) {
		bannerService.insertChannel(invChannelDto);
		setMenu(model);
		return "redirect:/madm/banner/bnrMain";
	}
	
	
	@RequestMapping(value="/bnrManage")
	public String bnrManage(@ModelAttribute InvBannerDto invBannerDto, Model model) {

		model.addAttribute(bannerService.getBnrList(invBannerDto));
		model.addAttribute("cornerCd", 		invBannerDto.getCornerCd() );
		model.addAttribute("cornerList",    bannerService.getCornerList(invBannerDto));
		model.addAttribute("channelList",   bannerService.chDataList(invBannerDto));

		setMenu(model);
		return "madm/banner/bnrManage";
	}
	
	
	@RequestMapping(value="/addBnrForm")
	public String addBnrForm(@ModelAttribute InvBannerDto invBannerDto, Model model) {
		model.addAttribute("cornerList",  bannerService.getCornerList(invBannerDto));
		model.addAttribute("clientList",  commonService.getClientList());
		setMenu(model);
		return "madm/banner/addBnr";
	}
	
	
	@RequestMapping(value="/ajaxCornerList")
	public void ajaxCornerList(@ModelAttribute InvChannelDto invChannelDto, ModelMap model) {
		model.addAttribute("chCd",  invChannelDto.getChannelCd());
		model.addAttribute("cornerList", bannerService.ajaxCornerList(invChannelDto));
	}
	
	
	@RequestMapping(value="/insertCorner")
	public String insertCorner(@ModelAttribute InvCornerDto ivnCornerDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		ivnCornerDto.setRegId(manager.getUserId());
		
		bannerService.insertCorner(ivnCornerDto);
		setMenu(model);
		return "redirect:/madm/banner/cornerManage";
	}
	
	
	@RequestMapping(value="/addBnr")
	public String addBnr(@ModelAttribute InvBannerDto invBannerDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		invBannerDto.setRegId(manager.getUserId());
		
		invBannerDto.init(mhsq);
		bannerService.insertBnr(invBannerDto);
		setMenu(model);
		return "redirect:/madm/banner/bnrManage";
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
		return "madm/banner/modifyBnrDetail";
	}
	
	
	@RequestMapping(value="/modifyBnrDetail", method=RequestMethod.DELETE)
	public String bnrDelete(@ModelAttribute InvBannerDto invBannerDto, Model model) {
		bannerService.modifyBnrDelete(invBannerDto);
		setMenu(model);
		return "redirect:/madm/banner/bnrManage";
	}
	
	
	@RequestMapping(value="/modifyBnrDetail", method=RequestMethod.POST)
	public String bnrUpdate(@ModelAttribute InvBannerDto invBannerDto, Model model, MultipartHttpServletRequest request,	MultipartHttpServletRequest mhsq) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		invBannerDto.setModiId(manager.getUserId());
		
		if(StringUtils.isNotNull(request.getFile("fileNm").getOriginalFilename())){
			invBannerDto.init(mhsq);
		}
		
		bannerService.modifyBnrUpdate(invBannerDto);
		setMenu(model);
		return "redirect:/madm/banner/bnrManage";
	}
	
	
	/* 채널관리 */
	
	@RequestMapping(value="/channelManage")
	public String channelManage(@ModelAttribute InvChannelDto invChannelDto, Model model) {
		model.addAttribute(bannerService.getChannelList(invChannelDto));
		setMenu(model);
		return "madm/banner/channelManage";
	}
	
	@RequestMapping(value="/modifyChannelDetail", method=RequestMethod.GET)
	public String channelDetail(@ModelAttribute InvChannelDto invChannelDto, Model model) {
		model.addAttribute("detail", bannerService.getChannelDetail(invChannelDto));
		setMenu(model);
		return "madm/banner/modifyChannelDetail";
	}
	
	
	@RequestMapping(value="/modifyChannelDetail", method=RequestMethod.DELETE)
	public String channelDelete(@ModelAttribute InvChannelDto invChannelDto, Model model) {
		bannerService.modifyChannelDelete(invChannelDto);
		setMenu(model);
		return "redirect:/madm/banner/channelManage";
	}
	
	
	@RequestMapping(value="/modifyChannelDetail", method=RequestMethod.PUT)
	public String channelUpdate(@ModelAttribute InvChannelDto invChannelDto, Model model) {
		bannerService.modifyChannelUpdate(invChannelDto);
		setMenu(model);
		return "redirect:/madm/banner/channelManage";
	}
	/* 채널관리 */
	
	
	/* 코너관리 */
	
	@RequestMapping(value="/cornerManage")
	public String cornerManage(@ModelAttribute InvCornerDto invCornorDto, Model model) {
		model.addAttribute(bannerService.getCornerMgrList(invCornorDto));
		setMenu(model);
		return "madm/banner/cornerManage";
	}
	
	@RequestMapping(value="/modifyCornerDetail", method=RequestMethod.GET)
	public String cornerDetail(@ModelAttribute InvCornerDto invCornorDto, Model model) {
		model.addAttribute("detail", bannerService.getCornerDetail(invCornorDto));
		setMenu(model);
		return "madm/banner/modifyCornerDetail";
	}
	
	
	@RequestMapping(value="/modifyCornerDetail", method=RequestMethod.DELETE)
	public String cornerDelete(@ModelAttribute InvCornerDto invCornorDto, Model model) {
		bannerService.modifyCornerDelete(invCornorDto);
		setMenu(model);
		return "redirect:/madm/banner/cornerManage";
	}
	
	
	@RequestMapping(value="/modifyCornerDetail", method=RequestMethod.PUT)
	public String cornerUpdate(@ModelAttribute InvCornerDto invCornorDto, Model model) {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		invCornorDto.setModiId(manager.getUserId());
		
		bannerService.modifyCornerUpdate(invCornorDto);
		setMenu(model);
		return "redirect:/madm/banner/cornerManage";
	}
	/* 코너관리 */

}