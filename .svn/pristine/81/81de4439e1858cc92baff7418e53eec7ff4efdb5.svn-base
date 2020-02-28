package com.ezwel.admin.controller.madm.mypage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.mgr.MgrService;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/mypage")
public class MypageController {
	private static Logger log = LoggerFactory.getLogger(MypageController.class);
	/*
	 * 관리자 정보수정
	 */

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
		String menuStr ="";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/modifyMyinfo")
	public String modifyMgrDetail(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {
		setMenu(model);

		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mgrDto.setUserId(Base64Utils.encode(manager.getUserId()));
		MgrData mgrData = mgrService.getMgrSelectOne(mgrDto);
		
		CommonDto commDto = new CommonDto();
		commDto.setHighCommCd(mgrData.getBranchCd());
		model.addAttribute( "deptList", commonService.getTypeList(commDto) );

		commDto.setHighCommCd(mgrData.getDeptCd());
		model.addAttribute( "teamList", commonService.getTypeList(commDto) );

		model.addAttribute("vo", mgrData);
		
		if("Y".equals(manager.getImsiPwdYn())){
			model.addAttribute("redirectNo", "Y");
		}
		String alertYn = (String) request.getParameter("alertYn");
		if("Y".equals(alertYn)){
			model.addAttribute("alertMsg", " 개인정보를 변경 하였습니다. \\n임시비밀번호를 변경하였을 경우 재로그인 해주세요.");
		}
		
		return "madm/mypage/modifyMyinfo";
	}

	@RequestMapping(value = "/modify")
	public String updateMgr(@ModelAttribute MgrDto mgrDto, Model model) {

		setMenu(model);
		
		if(StringUtils.isNotNull(mgrDto.getUserPwd())){
			mgrDto.setUserPwd(encryptComponent.encode(mgrDto.getUserPwd()));
		}

		try{
			mgrService.updateMgr(mgrDto);
		}catch(Exception e){
			log.debug("Fail updateMgr : " + e);
			return "redirect:/madm/mypage/modifyMyInformation";
		}
		model.addAttribute("alertYn", "Y");
		
		return "redirect:/madm/mypage/modifyMyinfo";
	}

}
