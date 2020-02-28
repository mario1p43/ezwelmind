package com.ezwel.admin.controller.madm.mgr;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.mgr.MgrService;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/mgr")
public class MgrController {
	/*
	 * 관리자 정보 관리
	 */
	private static final String MGR_BRANCD_COMM_CD = "100316";

	@Resource
	private MgrService mgrService;

	@Resource
	private CommonService commonService;

	@Resource
	EncryptComponent encryptComponent;

	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value="/mgrList")
	public String getMgrList(@ModelAttribute MgrDto mgrDto, Model model) {
		setMenu(model);
		model.addAttribute(mgrService.getMgrList(mgrDto));
		return "madm/mgr/mgrList";
	}

	@RequestMapping(value = "/addMgr")
	public String addMgr(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {

		CommonDto commDto = new CommonDto();
		commDto.setHighCommCd(MGR_BRANCD_COMM_CD);

		model.addAttribute("branchList", commonService.getTypeList(commDto));
		model.addAttribute("serviceType", Base64Utils.decode( StringUtils.defaultString(request.getParameter("serviceType"))));
		setMenu(model);
		return "madm/mgr/addMgr";
	}

	@RequestMapping(value = "/add")
	public String insertMgr(@ModelAttribute MgrDto mgrDto, Model model) {

		setMenu(model);
//		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		// 관리자 등록
		if(StringUtils.isNotNull(mgrDto.getUserPwd())){
			mgrDto.setUserPwd(encryptComponent.encode(mgrDto.getUserPwd()));
		}
		model.addAttribute("insertCnt", mgrService.insertMgr(mgrDto));
		return "redirect:/madm/mgr/mgrList";
	}

	@RequestMapping(value = "/modifyMgr")
	public String modifyMgrDetail(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {
		setMenu(model);
		model.addAttribute("serviceType", Base64Utils.decode( StringUtils.defaultString(request.getParameter("serviceType"))));
		MgrData mgrData = mgrService.getMgrSelectOne(mgrDto);

		CommonDto commDto = new CommonDto();
		commDto.setHighCommCd(mgrData.getBranchCd());
		model.addAttribute( "deptList", commonService.getTypeList(commDto) );

		commDto.setHighCommCd(mgrData.getDeptCd());
		model.addAttribute( "teamList", commonService.getTypeList(commDto) );

		model.addAttribute("vo", mgrData);
		return "madm/mgr/modifyMgr";
	}

	@RequestMapping(value = "/modify")
	public String updateMgr(@ModelAttribute MgrDto mgrDto, Model model) {

		setMenu(model);

		if(StringUtils.isNotNull(mgrDto.getUserPwd())){
			mgrDto.setUserPwd(encryptComponent.encode(mgrDto.getUserPwd()));
		}
		
		mgrService.updateMgr(mgrDto);

		return "redirect:/madm/mgr/mgrList";
	}

	@RequestMapping(value="/getMgrDeptList")
	public void getMgrDeptList(String highCommCd, Model model) {
		CommonDto commDto = new CommonDto();
		commDto.setHighCommCd(highCommCd);

		model.addAttribute( "mgrDeptList", commonService.getTypeList(commDto) );
	}

	@RequestMapping(value="/getMgrTeamList")
	public void getMgrTeamList(String highCommCd, Model model) {
		CommonDto commDto = new CommonDto();
		commDto.setHighCommCd(highCommCd);

		model.addAttribute( "mgrTeamList", commonService.getTypeList(commDto) );
	}
}
