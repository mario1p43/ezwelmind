package com.ezwel.admin.controller.madm.mobile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.banner.BannerService;
import com.ezwel.admin.service.banner.dto.InvBannerDto;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.push.PushService;
import com.ezwel.admin.service.push.dto.PushDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.user.UserService;
import com.ezwel.admin.service.user.dto.UserAddDto;
import com.ezwel.core.support.util.BBSFileData;
import com.ezwel.core.support.util.DateUtils;
import com.ezwel.core.support.util.PushUtil;
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/madm/mobile/push")
public class MobilePushController {

	@Resource
	private BannerService bannerService;

	@Resource
	private PushService pushService;

	@Resource
	private BBSService bbsService;
	
	@Resource
	private UserService userService;
	
	@Resource 
	private CommonService commonService;

	private void setMenu(Model model) {
		String menuStr ="모바일관리";
		model.addAttribute("menu", menuStr);
	}

	/* PUSH관리 */
	
	@RequestMapping(value="/pushManage")
	public String pushManage(@ModelAttribute PushDto pushDto, Model model) {
//	public String pushManage(@ModelAttribute InvBannerDto invBannerDto, Model model) {
		model.addAttribute(pushService.getPushList(pushDto));
//		model.addAttribute(bannerService.getBnrList(invBannerDto));
		setMenu(model);
		return "madm/mobile/push/pushManage";
	}

	@RequestMapping(value="/addPushForm")
	public String addPushForm(@ModelAttribute PushDto pushDto, Model model) {
		model.addAttribute("clientList",  commonService.getClientList());
		setMenu(model);
		return "madm/mobile/push/addPush";
	}
	

	@RequestMapping(value="/addPush")
	public String addPush(@ModelAttribute PushDto pushDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		pushDto.setRegId(manager.getUserId());
		
		pushDto.init(mhsq);
		if(pushDto.getSendTime().length() == 1) {
			pushDto.setSendTime("0"+pushDto.getSendTime());
		}
		pushDto.setSendDt(pushDto.getSendDt().replace("/", "")+pushDto.getSendTime());
		
		if(StringUtils.isNotEmpty(pushDto.getFileNm())){
			pushDto.setPushImg(pushDto.getFileFullPath());
		}
		
		pushDto.setPushSeq(pushService.insertPush(pushDto));
		setMenu(model);
		
		// 시간내 발송이면 즉시 발송
		if(DateUtils.getDateFormat("yyyyMMddHH").equals(pushDto.getSendDt())) {
			pushService.sendPush(pushDto);
		}
		
		return "redirect:/madm/mobile/push/pushManage";
	}


	@RequestMapping(value="/modifyPushDetail", method=RequestMethod.GET)
	public String pushDetail(@ModelAttribute PushDto pushDto, Model model) {
		
		if (StringUtils.isNotNull(pushDto.getPushSeq())) {
			BBSAddDto bbsDto = new BBSAddDto();
			bbsDto.setDataSeq(pushDto.getPushSeq());
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
		
		model.addAttribute("pushDetail", pushService.modifyPushDetail(pushDto));
		model.addAttribute("clientList", pushService.getClientList(pushDto));
		setMenu(model);
		return "madm/mobile/push/modifyPushDetail";
	}
	
	
	@RequestMapping(value="/modifyPushDetail", method=RequestMethod.DELETE)
	public String pushDelete(@ModelAttribute PushDto pushDto, Model model) {
		pushService.modifyPushDelete(pushDto);
		setMenu(model);
		return "redirect:/madm/mobile/push/pushManage";
	}
	

	@RequestMapping(value="/modifyPushDetail", method=RequestMethod.POST)
	public String pushUpdate(@ModelAttribute PushDto pushDto, Model model, HttpServletRequest request,	MultipartHttpServletRequest mhsq) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		pushDto.setModiId(manager.getUserId());
		
		pushDto.init(mhsq);
		if(pushDto.getSendTime().length() == 1) {
			pushDto.setSendTime("0"+pushDto.getSendTime());
		}
		pushDto.setSendDt(pushDto.getSendDt().replace("/", "")+pushDto.getSendTime());
		pushService.modifyPushUpdate(pushDto);
		setMenu(model);
		return "redirect:/madm/mobile/push/pushManage";
	}
	/* PUSH관리 */
	
	/* version 관리 */
	
	/* version 관리 */
}
