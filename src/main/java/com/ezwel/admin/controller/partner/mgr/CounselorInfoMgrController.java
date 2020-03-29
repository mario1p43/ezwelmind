package com.ezwel.admin.controller.partner.mgr;

import java.util.StringTokenizer;

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

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.mgr.MgrBookArray;
import com.ezwel.admin.domain.entity.mgr.MgrCareer;
import com.ezwel.admin.domain.entity.mgr.MgrCareerArray;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.mgr.CounselorInfoMgrService;
import com.ezwel.admin.service.mgr.MgrCounselService;
import com.ezwel.admin.service.mgr.MgrService;
import com.ezwel.admin.service.mgr.dto.CounselorInfoMgrDto;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.mgr.dto.MgrSubDto;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.CounselorCalendarService;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.commonController;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.DateUtils;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/partner/mgr")
public class CounselorInfoMgrController extends commonController {

	@Resource
	private MgrService mgrService;
	
	@Resource
	private CounselorInfoMgrService counselorInfoMgrService;
	
	@Resource
	private CounselReservationService counselReservationService;
	
	@Resource
	private CounselorCalendarService counselorCalendarService;
	
	@Resource
	private MgrCounselService mgrCounselService;
	
	@Resource
	private CommonService commonService;

	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());

	private void setMenu(Model model) {
		String menuStr = "센터관리";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value="/counselorInfoMgrList")
	public String counselorInfoMgrList(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=======화면목록 디버깅======");
		}
		setMenu(model);
		String channelType = request.getParameter("searchChannelType");
		String mgrStatus = request.getParameter("searchMgrStatus");
		String workType = request.getParameter("searchWorkType");
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
		counselorInfoMgrDto.setMgrStatus(request.getParameter("searchMgrStatus"));
		counselorInfoMgrDto.setWorkType(request.getParameter("searchWorkType"));
		
		//세션정보조회
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		counselorInfoMgrDto.setCenterSeq(manager.getCenterSeq());
		if(!StringUtils.isEmpty(request.getParameter("startDt"))){
			counselorInfoMgrDto.setStartDt(request.getParameter("startDt").replace("/", "") );
		}
		if(!StringUtils.isEmpty(request.getParameter("endDt"))){
			counselorInfoMgrDto.setEndDt(request.getParameter("endDt").replace("/", ""));
		}
		

		model.addAttribute(counselorInfoMgrService.counselorInfoMgrList(counselorInfoMgrDto));

		if(isDevice(request) == IS_PC) {
			return "partner/mgr/counselorInfoMgrList";
		}else {	
			return "partner/mgr/counselorInfoMgrList_mo";
		}
		
	}

	//승인/중지
	@RequestMapping(value="/counselorInfoMgrStatus")
	public void counselorInfoMgrStatus(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=====승인 중지=====");
		}
		
		String id = request.getParameter("userId");
		String mgrStatus = request.getParameter("mgrStatus");
		
		if(StringUtils.isNotBlank(id)) {
			if(StringUtils.equals(mgrStatus, "Y")){
				mgrDto.setMgrStatus("Y");
				mgrDto.setUseYn("Y");
			}
			StringTokenizer st = new StringTokenizer(id, ",");
			while (st.hasMoreTokens()) {
				String str = st.nextToken();
				logger.debug("############## "+str);
				mgrDto.setUserId(str);
				counselorInfoMgrService.counselorInfoMgrStatus(mgrDto);
			}
		}
	}

	//대기 -> 승인 :: hue
	@RequestMapping(value="/counselorInfoMgrStatus2")
	public void counselorInfoMgrStatus2(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=====승인 중지=====");
		}
		
		String id = request.getParameter("userId");
		String mgrStatus = request.getParameter("mgrStatus");
		
		if(StringUtils.isNotBlank(id)) {
			if(StringUtils.equals(mgrStatus, "Y")){
				mgrDto.setMgrStatus("Y");
				mgrDto.setUseYn("Y");
			}
			StringTokenizer st = new StringTokenizer(id, ",");
			while (st.hasMoreTokens()) {
				String str = st.nextToken();
				logger.debug("############## "+str);
				mgrDto.setUserId(str);
				counselorInfoMgrService.counselorInfoMgrStatus2(mgrDto);
			}
		}
	}
	
	
	
	
	@RequestMapping(value="/counselorInfoMgrAdd")
	public String counselorInfoMgrAdd(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("======추가 화면단=====");
		}
		setMenu(model);
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100732");
		model.addAttribute("certList", commonService.getTypeList(commonDto) );
		
		if(isDevice(request) == IS_PC) {
			return "partner/mgr/counselorInfoMgrAdd";
		}else {	
			return "partner/mgr/counselorInfoMgrAdd_mo";
		}
	}

	

	

	@RequestMapping(value="/insertCounselorInfoMgr")
	public String insertCounselorInfoMgr(@ModelAttribute MgrDto mgrDto, @ModelAttribute MgrSubDto mgrSubDto, @ModelAttribute MgrCertDto mgrCertDto, @ModelAttribute MgrCareerArray mgrCareerArray, @ModelAttribute MgrBookArray mgrBookArray,  Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq){
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		setMenu(model);
		mgrCertDto.init(mhsq);
		mgrDto.setCenterSeq(manager.getCenterSeq());

		mgrCounselService.addCounselMgr(mgrDto, mgrSubDto, mgrCertDto, request);
		mgrCounselService.modifyCounselMgrCareer(mgrDto, mgrCareerArray);
		mgrCounselService.modifyCounselMgrBook(mgrDto, mgrBookArray);
		
		return "redirect:/partner/mgr/counselorInfoMgrList";
	}
	
	@RequestMapping(value="/updateCounselorInfoMgr")
	public String updateCounselorInfoMgr(@ModelAttribute MgrDto mgrDto, @ModelAttribute MgrSubDto mgrSubDto, @ModelAttribute MgrCertDto mgrCertDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq){
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mgrDto.setCenterOwnerYn(manager.getCenterOwnerYn());	
	
		if(request.getParameter("delPhoto").equals("")){
		}else{
			mgrSubDto.setFileNm(" ");
			mgrSubDto.setFilePath(" ");
		}
		setMenu(model);
		mgrCertDto.init(mhsq, true);
		mgrCounselService.modifyCounselMgr(mgrDto, mgrSubDto, mgrCertDto, request);
		
		return "redirect:/partner/mgr/counselorInfoMgrList";
	}

	/*비디앱스 2020.01.01 
	 * 나의정보 관리 / 상담사 정보 관리
	 * 임시 상태값 저장 */
	@RequestMapping(value="/updateCounselorInfoMgrImsi",method = {RequestMethod.POST,RequestMethod.GET})
	public String updateCounselorInfoMgrImsi(@ModelAttribute MgrDto mgrDto, @ModelAttribute MgrSubDto mgrSubDto, @ModelAttribute MgrCertDto mgrCertDto, @ModelAttribute MgrCareerArray mgrCareerArray, @ModelAttribute MgrBookArray mgrBookArray, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq){
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mgrDto.setCenterOwnerYn(manager.getCenterOwnerYn());	
	
		if(request.getParameter("delPhoto").equals("")){
		}else{
			mgrSubDto.setFileNm(" ");
			mgrSubDto.setFilePath(" ");
		}
		setMenu(model);
		mgrCertDto.init(mhsq, true);
		mgrCounselService.modifyCounselMgrImsi(mgrDto, mgrSubDto, mgrCertDto, request);
		mgrCounselService.modifyCounselMgrCareerImsi(mgrDto, mgrCareerArray);
		mgrCounselService.modifyCounselMgrBook(mgrDto, mgrBookArray);
		
		return "redirect:/partner/mgr/counselorInfoMgrList";
	}
	
	
	//상담사 정보 관리
	@RequestMapping(value="/getCounselorInfoMgrDetail")
	public String getCounselorInfoMgrDetail(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, @ModelAttribute MgrCertDto mgrCertDto, Model model){
		if (logger.isDebugEnabled()){
			logger.debug("=====수정 상세 디버깅=====");
		}
		
		setMenu(model);
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("loginId", manager.getUserId());
		
		setMenu(model);
		model.addAttribute("mgr", counselorInfoMgrService.getCounselorInfoMgrDetail(counselorInfoMgrDto));

		mgrCertDto.setUserId(counselorInfoMgrDto.getUserId());
		
		model.addAttribute("mgrCert", mgrCounselService.getMgrCertList(mgrCertDto));
		model.addAttribute("mgrCertCnt", mgrCounselService.getMgrCertList(mgrCertDto).size());
		model.addAttribute("mgrCareer", mgrCounselService.getMgrCareer(counselorInfoMgrDto.getUserId()));
		model.addAttribute("mgrBook", mgrCounselService.getMgrBook(counselorInfoMgrDto.getUserId()));
		
		counselorInfoMgrDto.setCenterSeq(manager.getCenterSeq());
		counselorInfoMgrDto.setHighCommCd("102015");
		model.addAttribute("extraExamInfo", counselorInfoMgrService.getExtraList(counselorInfoMgrDto));
		
		
		return "/partner/mgr/counselorInfoMgrModify";
	}
	
	//개인정보 관리
	@RequestMapping(value="/viewMyInformation")
	public String myImformation(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, @ModelAttribute MgrCertDto mgrCertDto, Model model){
		if (logger.isDebugEnabled()){
			logger.debug("=====수정 상세 디버깅=====");
		}
		
		setMenu(model);
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		model.addAttribute("loginId", manager.getUserId());
		
		counselorInfoMgrDto.setUserId(manager.getUserId());
		setMenu(model);
		model.addAttribute("mgr", counselorInfoMgrService.getCounselorInfoMgrDetail(counselorInfoMgrDto));

		mgrCertDto.setUserId(manager.getUserId());
		
		//상담 외 프로그램
		counselorInfoMgrDto.setCenterSeq(manager.getCenterSeq());
		counselorInfoMgrDto.setHighCommCd("102015");
		model.addAttribute("extraExamInfo", counselorInfoMgrService.getExtraList(counselorInfoMgrDto));
		
		
		model.addAttribute("mgrCert", mgrCounselService.getMgrCertList(mgrCertDto));
		model.addAttribute("mgrCertCnt", mgrCounselService.getMgrCertList(mgrCertDto).size());
		model.addAttribute("mgrCareer", mgrCounselService.getMgrCareer(counselorInfoMgrDto.getUserId()));
		model.addAttribute("mgrBook", mgrCounselService.getMgrBook(counselorInfoMgrDto.getUserId()));
		
		
		return "/partner/mgr/viewMyInformation";
	}
	
	
	
	/*
	 * 비디앱스 20191216추가
	 * 작업자: 김재훈
	 * */
	@RequestMapping(value="/getCounselorInfoMgrDetailCheck")
	public String getCounselorInfoMgrDetailCheck(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, @ModelAttribute MgrCertDto mgrCertDto, Model model){
		if (logger.isDebugEnabled()){
			logger.debug("=====수정 상세 디버깅=====");
		}
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("loginId", manager.getUserId());
		
		setMenu(model);
		model.addAttribute("mgr", counselorInfoMgrService.getCounselorInfoMgrDetail(counselorInfoMgrDto));

		mgrCertDto.setUserId(counselorInfoMgrDto.getUserId());
		
		model.addAttribute("mgrCert", mgrCounselService.getMgrCertList(mgrCertDto));
		model.addAttribute("mgrCertCnt", mgrCounselService.getMgrCertList(mgrCertDto).size());
		model.addAttribute("mgrCareer", mgrCounselService.getMgrCareer(counselorInfoMgrDto.getUserId()));
		model.addAttribute("mgrBook", mgrCounselService.getMgrBook(counselorInfoMgrDto.getUserId()));

		
		
		counselorInfoMgrDto.setCenterSeq(manager.getCenterSeq());
		counselorInfoMgrDto.setHighCommCd("102015");
		model.addAttribute("extraExamInfo", counselorInfoMgrService.getExtraList(counselorInfoMgrDto));
		
		
		return "/partner/mgr/counselorInfoMgrCheck";
	}
	
	
	@RequestMapping(value="/checkId", method=RequestMethod.GET)
	public void checkId(@ModelAttribute MgrDto mgrDto, Model model) {
	
		model.addAttribute("mgr", counselorInfoMgrService.checkId(mgrDto) );
	}
	
	@RequestMapping(value="/ajaxCert", method=RequestMethod.GET)
	public void ajaxCert(Model model) {
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100732");
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
	}
	
	//센터인포 기타 값 수정하기
	@RequestMapping(value="/ajaxExtra")
	public void ajaxExtra(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto,Model model) {

		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("102005");
		commonDto.setCenterSeq(counselorInfoMgrDto.getCenterSeq());
		model.addAttribute("serviceList", commonService.getExtraList(commonDto) );
	}	
	
	
}
