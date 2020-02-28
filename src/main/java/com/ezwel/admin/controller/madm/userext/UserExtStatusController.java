package com.ezwel.admin.controller.madm.userext;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.customermanagement.DefaultInformationVo;
import com.ezwel.admin.domain.entity.userext.UserExtStatusDto;
import com.ezwel.admin.service.customermanagement.CustomerManagementService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.userext.UserExtStatusService;

@Controller
@RequestMapping("/madm/userext")
public class UserExtStatusController {
	
	@Resource
	private UserExtStatusService userExtStatusService;
	
	@Resource
	private CustomerManagementService customerManagementService;
	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr = "연장신청";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/userextstatus")
	public String getUserExtStatusList(@ModelAttribute UserExtStatusDto userExtStatusDto, Model model) {
		setMenu(model);
		Manager manger = UserDetailsHelper.getAuthenticatedUser();

		userExtStatusDto.setCounselorId(manger.getUserId());
		userExtStatusDto.setCenterSeq(manger.getCenterSeq());
		DefaultInformationVo svcDefaultInformationVo =new DefaultInformationVo();
		svcDefaultInformationVo.setTeamCd(customerManagementService.getTeamCd(manger.getUserId()));
		model.addAttribute("userTeam",svcDefaultInformationVo);
		model.addAttribute(userExtStatusService.getUserExtStatusList(userExtStatusDto));
		
		return "madm/userext/userextstatus";
	}
}
