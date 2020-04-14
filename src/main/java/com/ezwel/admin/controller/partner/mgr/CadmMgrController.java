package com.ezwel.admin.controller.partner.mgr;

import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.mgr.MgrBookArray;
import com.ezwel.admin.domain.entity.mgr.MgrCareerArray;
import com.ezwel.admin.service.mgr.CounselorInfoMgrService;
import com.ezwel.admin.service.mgr.MgrCounselService;
import com.ezwel.admin.service.mgr.MgrService;
import com.ezwel.admin.service.mgr.dto.CounselorInfoMgrDto;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.mgr.dto.MgrSubDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/partner/mgr")
public class CadmMgrController {
	private static Logger log = LoggerFactory.getLogger(CadmMgrController.class);
	@Resource
	private MgrService mgrService;

	@Resource
	private MgrCounselService mgrCounselService;
	
	@Resource
	private CounselorInfoMgrService counselorInfoMgrService;
	
	@Resource
	EncryptComponent encryptComponent;
	
	private void setMenu(Model model) {
		String menuStr = "상담사관리";
		model.addAttribute("menu", menuStr);
	}


	@RequestMapping(value = "/modifyMyInformation")
	public String myImformation(@ModelAttribute MgrSubDto mgrSubDto,@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, @ModelAttribute MgrCertDto mgrCertDto, Model model, HttpServletRequest request ) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		setMenu(model);
		model.addAttribute("loginId", manager.getUserId());

		mgrSubDto.setUserId(manager.getUserId());
		mgrCertDto.setUserId(manager.getUserId());
		counselorInfoMgrDto.setUserId(manager.getUserId());
		
		
		model.addAttribute("mgr", counselorInfoMgrService.getCounselorInfoMgrDetail(counselorInfoMgrDto));
		
		//상담 외 프로그램
		counselorInfoMgrDto.setCenterSeq(manager.getCenterSeq());
		counselorInfoMgrDto.setHighCommCd("102015");
		model.addAttribute("extraExamInfo", counselorInfoMgrService.getExtraList(counselorInfoMgrDto));
		
		
		model.addAttribute("mgrCert", mgrCounselService.getMgrCertList(mgrCertDto));
		model.addAttribute("mgrCertCnt", mgrCounselService.getMgrCertList(mgrCertDto).size());
		model.addAttribute("mgrCareer", mgrCounselService.getMgrCareer(counselorInfoMgrDto.getUserId()));
		model.addAttribute("mgrBook", mgrCounselService.getMgrBook(counselorInfoMgrDto.getUserId()));
		
		if("Y".equals(manager.getImsiPwdYn())){
			model.addAttribute("redirectNo", "Y");
		}
		
		String alertYn = (String) request.getParameter("alertYn");
		if("Y".equals(alertYn)){
			model.addAttribute("alertMsg", " 개인정보를 변경 하였습니다. \\n임시비밀번호를 변경하였을 경우 재로그인 해주세요.");
		}
		
		return "partner/mgr/modifyMyInformation";
	}

	
	
	@RequestMapping(value="/update")
	public String updateMyInformation(@ModelAttribute MgrDto mgrDto, @ModelAttribute MgrSubDto mgrSubDto, @ModelAttribute MgrCertDto mgrCertDto,@ModelAttribute MgrCareerArray mgrCareerArray, @ModelAttribute MgrBookArray mgrBookArray, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception{
		setMenu(model);
		mgrCertDto.init(mhsq, true);
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mgrDto.setUserId(manager.getUserId());
		mgrSubDto.setUserId(manager.getUserId());
		mgrDto.setCenterOwnerYn(manager.getCenterOwnerYn());
		if(request.getParameter("delPhoto").equals("")){
		}else{
			mgrSubDto.setFileNm(" ");
			mgrSubDto.setFilePath(" ");
		}
				
		if(StringUtils.isNotNull(mgrDto.getUserPwd())){
			mgrDto.setUserPwd(encryptComponent.encode(mgrDto.getUserPwd()));
			int result = mgrCounselService.updateMgrPwd(mgrDto);
			if(result == 1){
				model.addAttribute("resultVal", "success");
			}else{
				model.addAttribute("resultVal", "fail");
			}
		}
		
		mgrCounselService.modifyCounselMgrImsi(mgrDto, mgrSubDto, mgrCertDto, request);
		mgrCounselService.modifyCounselMgrCareerImsi(mgrDto, mgrCareerArray);
		mgrCounselService.modifyCounselMgrBookImsi(mgrDto, mgrBookArray);
				
		model.addAttribute("alertYn", "Y");
		
		return "redirect:/partner/mgr/modifyMyInformation";
	}

}
