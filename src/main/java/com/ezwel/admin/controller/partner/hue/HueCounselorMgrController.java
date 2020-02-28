package com.ezwel.admin.controller.partner.hue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.mgr.CounselorInfoMgrService;
import com.ezwel.admin.service.mgr.MgrCounselService;
import com.ezwel.admin.service.mgr.MgrService;
import com.ezwel.admin.service.mgr.dto.CounselorInfoMgrDto;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.mgr.dto.MgrSubDto;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/partner/mgrHue")
public class HueCounselorMgrController {
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private CounselorInfoMgrService counselorInfoMgrService;
	
	@Resource
	private CenterService centerService;
	
	@Resource
	private MgrService mgrService;
	
	@Resource
	private MgrCounselService mgrCounselService;
	
	@Resource
	EncryptComponent encryptComponent;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());
	
	private void setMenu(Model model) {
		String menuStr = "상담센터";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/counselorMgrList")
	public String counselorMgrList(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=======화면목록 디버깅======");
		}
		setMenu(model);
		CenterDto centerDto = new CenterDto();
		String channelType = request.getParameter("sChannelType");
		String mgrStatus = request.getParameter("sMgrStatus");
		String workType = request.getParameter("sWorkType");
		String suserGender= request.getParameter("suserGender");
		if(channelType == null || channelType == ""){
		}else{

			String type = "("+channelType+")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setChannelType(type);
		}
		if(mgrStatus == null || mgrStatus == ""){
		}else{

			String type2 = mgrStatus;
			type2 = type2.toString().replace(",", "','");
			type2 = "'"+type2+"'";
			counselorInfoMgrDto.setSMStatus(type2);
		}

		if(workType == null || workType == ""){
		}else{

			String type3 = workType;
			type3 = type3.toString().replace(",", "','");
			type3 = "'"+type3+"'";
			counselorInfoMgrDto.setSWType(type3);
		}
			if(!StringUtils.isEmpty(request.getParameter("startDt"))){
				counselorInfoMgrDto.setStartDt(request.getParameter("startDt").replace("/", "") );
			}
			if(!StringUtils.isEmpty(request.getParameter("endDt"))){
				counselorInfoMgrDto.setEndDt(request.getParameter("endDt").replace("/", ""));
			}
					
		counselorInfoMgrDto.setMgrStatus(mgrStatus);
		counselorInfoMgrDto.setWorkType(workType);
		
		
		model.addAttribute("centerNm", request.getParameter("centerNm"));
		model.addAttribute("centerList", centerService.getCenterNameList2(centerDto));		
		model.addAttribute(counselorInfoMgrService.counselorMgrList2(counselorInfoMgrDto));
		
		return "partner/hue/counselorMgrList";
	}
	
	
	@RequestMapping(value="/counselorMgrAdd")
	public String counselorMgrAdd(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Model model){
		if (logger.isDebugEnabled()){
			logger.debug("======추가 화면단=====");
		}
		CenterDto centerDto = new CenterDto();
		setMenu(model);
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100732");
		model.addAttribute("certList", commonService.getTypeList(commonDto) );
		model.addAttribute("centerList", centerService.getCenterNameList2(centerDto));
		
		return "partner/hue/counselorMgrAdd";
	}
	
	
	@RequestMapping(value="/insertCounselorMgr")
	public String insertCounselorMgr(@ModelAttribute MgrDto mgrDto, 
									@ModelAttribute MgrSubDto mgrSubDto, 
									@ModelAttribute MgrCertDto mgrCertDto, 
									Model model, 
									HttpServletRequest request,
									MultipartHttpServletRequest mhsq)
	{
		
		setMenu(model);
		mgrCertDto.init(mhsq);
		mgrCounselService.addCounselMgr2(mgrDto, mgrSubDto, mgrCertDto, request);
		
		return "redirect:/partner/mgrHue/counselorMgrList";
	}
	
	
	@RequestMapping(value="/updateCounselorMgr")
	public String updateCounselorMgr(@ModelAttribute MgrDto mgrDto, @ModelAttribute MgrSubDto mgrSubDto, @ModelAttribute MgrCertDto mgrCertDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq){
		setMenu(model);
		mgrCertDto.init(mhsq, true);
		
		
		if(request.getParameter("delPhoto").equals("")){
		}else{
			mgrSubDto.setFileNm(" ");
			mgrSubDto.setFilePath(" ");
		}
		mgrDto.setCenterOwnerYn(request.getParameter("ownerYn"));
		mgrCounselService.modifyCounselMgr2(mgrDto, mgrSubDto, mgrCertDto, request);
		
		return "redirect:/partner/mgrHue/counselorMgrList";
	}
	
	@RequestMapping(value="/getCounselorMgrDetail")
	public String getCounselorMgrDetail(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, @ModelAttribute MgrCertDto mgrCertDto, Model model){
		if (logger.isDebugEnabled()){
			logger.debug("=====수정 상세 디버깅=====");
		}
		
		setMenu(model);
		model.addAttribute("mgr", counselorInfoMgrService.getCounselorInfoMgrDetail2(counselorInfoMgrDto));

		mgrCertDto.setUserId(counselorInfoMgrDto.getUserId());
		
		model.addAttribute("mgrCert", mgrCounselService.getMgrCertList2(mgrCertDto));
		model.addAttribute("mgrCertCnt", mgrCounselService.getMgrCertList2(mgrCertDto).size());
		
		return "/partner/hue/counselorMgrModify";
	}
	
	@RequestMapping(value="/starMgr")
	public String starMgr(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=====스타관리 디버깅=====");
		}
		int c = 0;
		setMenu(model);
		CenterDto centerDto = new CenterDto();
		model.addAttribute("centerList", centerService.getCenterNameList(centerDto));
		
		String yn = request.getParameter("centerNm") == null ? "" : request.getParameter("centerNm");
		
		
		if(yn.equals("")){
		}else{
			model.addAttribute(counselorInfoMgrService.counselorMgrStarList(counselorInfoMgrDto));
			c = 1;
		}
		model.addAttribute("show", c);
		
		return "/partner/mgr/counselorStartList";
	}
	
	//대기 -> 승인
	@RequestMapping(value="/counselorInfoMgrStatus")
	public void counselorInfoMgrStatus(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=====승인 중지=====");
		}
		
		String[] id = request.getParameter("userId").split(",");

		if(request.getParameter("mgrStatus").equals("Y")){
			mgrDto.setMgrStatus("Y");
			mgrDto.setUseYn("Y");
		}
		
		
		for(int i = 0; i<id.length; i++ ){
			logger.debug("############## "+id[i]);
			mgrDto.setUserId(id[i]);
			counselorInfoMgrService.counselorInfoMgrStatus(mgrDto);
		}
	}
	
	
	@RequestMapping(value = "/excelDownload")
	public String excelDownload(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Model model, HttpServletRequest request) {
		
		String channelType = request.getParameter("channelType");
		String mgrStatus = request.getParameter("mgrStatus");
		String workType = request.getParameter("workType");
		String authCd = request.getParameter("authCd");
		if(channelType == null || channelType == ""){
		}else{

			String type = "("+channelType+")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setChannelType(type);
		}
		if(mgrStatus == null || mgrStatus == ""){
		}else{

			String type2 = mgrStatus;
			type2 = type2.toString().replace(",", "','");
			type2 = "'"+type2+"'";
			counselorInfoMgrDto.setSMStatus(type2);
		}
		if(workType == null || workType == ""){
		}else{

			String type3 = workType;
			type3 = type3.toString().replace(",", "','");
			type3 = "'"+type3+"'";
			counselorInfoMgrDto.setSWType(type3);
		}
		
		counselorInfoMgrDto.setAuthCd(authCd);
		if(!StringUtils.isEmpty(request.getParameter("startDt"))){
			counselorInfoMgrDto.setStartDt(request.getParameter("startDt").replace("/", "") );
		}
		if(!StringUtils.isEmpty(request.getParameter("endDt"))){
			counselorInfoMgrDto.setEndDt(request.getParameter("endDt").replace("/", ""));
		}
		
		counselorInfoMgrDto.setCenterNm(request.getParameter("centerNm"));
		counselorInfoMgrDto.setUserId(request.getParameter("userId"));
		counselorInfoMgrDto.setUserNm(request.getParameter("userNm"));
		counselorInfoMgrDto.setUserMnm(request.getParameter("userMnm"));
		
		counselorInfoMgrDto.setUserRrn(request.getParameter("userRrn"));
		counselorInfoMgrDto.setUserGender(request.getParameter("userGender"));
		
		
		model.addAttribute(counselorInfoMgrService.getCounselMgrExcelDownload2(counselorInfoMgrDto));
		
		return "/partner/hue/counselorMgrExcel";
	}
	
	@RequestMapping(value="/ajaxCert", method=RequestMethod.GET)
	public void ajaxCert(Model model) {
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100732");
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
	}
	
	@RequestMapping(value="/ajaxStar", method=RequestMethod.GET)
	public void ajaxStar(Model model, HttpServletRequest request) {
		MgrSubDto mgrSubDto = new MgrSubDto();
		
		mgrSubDto.setUserId(request.getParameter("userId"));
		mgrSubDto.setMgrEvalGrade(Integer.parseInt(request.getParameter("mgrEvalGrade")));
		
		counselorInfoMgrService.mgrEvalGrade(mgrSubDto);
	}
	
	
	
}
