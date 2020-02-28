package com.ezwel.admin.controller.madm.mgr;

import java.util.List;
import java.util.Map;
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

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.mgr.MgrBookArray;
import com.ezwel.admin.domain.entity.mgr.MgrCareerArray;
import com.ezwel.admin.domain.entity.mgr.MgrSub;
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
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/mgr")
public class CounselorMgrController {
	
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
		String diagnosisType = request.getParameter("sDiagnosisType");
		String diagnosisDiv = request.getParameter("sDiagnosisDiv");
		String financeDiv = request.getParameter("sFinanceDiv");
		String lawDiv = request.getParameter("sLawDiv");
		String mentalDiv = request.getParameter("sMentalDiv");
		String mentalAges = request.getParameter("sMentalAges");
		String diagnosisAges = request.getParameter("sDiagnosisAges");
		String mentalType = request.getParameter("sMentalType");
		String lawType = request.getParameter("sLawType");
		String financeType = request.getParameter("sFinanceType");
		
		String languageType = request.getParameter("sLanguageType");
		String specialType = request.getParameter("sSpecialType");
		String ages = request.getParameter("sAges");
		
		if(ages == null || ages == ""){
		}else{

			String type = "("+ages+")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setAges(type);
		}
		
		if(languageType == null || languageType == ""){
		}else{

			String type = "("+languageType+")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setLanguageType(type);
		}
		
		if(specialType == null || specialType == ""){
		}else{

			String type = "("+specialType+")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setSpecialType(type);
		}
		

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
		
		if(diagnosisType!=null && diagnosisType.trim().length()>0 ) {
			String type = "("+diagnosisType+")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setDiagnosisType(type);
		}
		
		if(diagnosisDiv !=null && diagnosisDiv.trim().length()>0 ) {
			String type = "("+diagnosisDiv +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setDiagnosisDiv(type);
		}

		if(financeDiv !=null && financeDiv.trim().length()>0 ) {
			String type = "("+financeDiv +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setFinanceDiv(type);
		}
		
		if(lawDiv !=null && lawDiv.trim().length()>0 ) {
			String type = "("+lawDiv +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setLawDiv(type);
		}

		if(mentalDiv !=null && mentalDiv.trim().length()>0 ) {
			String type = "("+mentalDiv +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setMentalDiv(type);
		}

		if(mentalAges !=null && mentalAges.trim().length()>0 ) {
			String type = "("+mentalAges +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setMentalAges(type);
		}
		
		if(diagnosisAges !=null && diagnosisAges.trim().length()>0 ) {
			String type = "("+diagnosisAges +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setDiagnosisAges(type);
		}
		

		if(mentalType !=null && mentalType.trim().length()>0 ) {
			String type = "("+mentalType +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setMentalType(type);
		}

		if(lawType !=null && lawType.trim().length()>0 ) {
			String type = "("+lawType +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setLawType(type);
		}

		if(financeType !=null && financeType.trim().length()>0 ) {
			String type = "("+financeType +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setFinanceType(type);
		}
		counselorInfoMgrDto.setMgrStatus(mgrStatus);
		counselorInfoMgrDto.setWorkType(workType);
		
		
		model.addAttribute("centerSeq", request.getParameter("centerSeq"));
		model.addAttribute("centerList", centerService.getCenterNameList(centerDto));

		
		model.addAttribute(counselorInfoMgrService.counselorMgrList(counselorInfoMgrDto));
		
		return "madm/mgr/counselorMgrList";
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
		model.addAttribute("centerList", centerService.getCenterNameList(centerDto));
		
		return "madm/mgr/counselorMgrAdd";
	}
	
	
	@RequestMapping(value="/insertCounselorMgr")
	public String insertCounselorMgr(@ModelAttribute MgrDto mgrDto,@ModelAttribute MgrSubDto mgrSubDto,@ModelAttribute MgrCertDto mgrCertDto,@ModelAttribute MgrCareerArray mgrCareerArray, @ModelAttribute MgrBookArray mgrBookArray,Model model,HttpServletRequest request,MultipartHttpServletRequest mhsq)
	{
		
		setMenu(model);
		mgrCertDto.init(mhsq);
		mgrCounselService.addCounselMgr(mgrDto, mgrSubDto, mgrCertDto, request);
		mgrCounselService.modifyCounselMgrCareer(mgrDto, mgrCareerArray);
		mgrCounselService.modifyCounselMgrBook(mgrDto, mgrBookArray);
		
		
		return "redirect:/madm/mgr/counselorMgrList";
	}
	
	
	@RequestMapping(value="/updateCounselorMgr")
	public String updateCounselorMgr(@ModelAttribute MgrDto mgrDto, @ModelAttribute MgrSubDto mgrSubDto, @ModelAttribute MgrCertDto mgrCertDto, @ModelAttribute MgrCareerArray mgrCareerArray, @ModelAttribute MgrBookArray mgrBookArray, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq){
		setMenu(model);
		mgrCertDto.init(mhsq, true);
		
		
		if(request.getParameter("delPhoto").equals("")){
		}else{
			mgrSubDto.setFileNm(" ");
			mgrSubDto.setFilePath(" ");
		}
		mgrCertDto.init(mhsq, true);
		mgrDto.setCenterOwnerYn(request.getParameter("ownerYn"));
		mgrCounselService.modifyCounselMgr(mgrDto, mgrSubDto, mgrCertDto, request);
		mgrCounselService.modifyCounselMgrCareer(mgrDto, mgrCareerArray);
		mgrCounselService.modifyCounselMgrBook(mgrDto, mgrBookArray);
		
		
		
		return "redirect:/madm/mgr/counselorMgrList";
	}
	
	@RequestMapping(value="/getCounselorMgrDetail")
	public String getCounselorMgrDetail(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, @ModelAttribute MgrCertDto mgrCertDto, Model model){
		if (logger.isDebugEnabled()){
			logger.debug("=====수정 상세 디버깅=====");
		}
		
		setMenu(model);
		model.addAttribute("mgr", counselorInfoMgrService.getCounselorInfoMgrDetail(counselorInfoMgrDto));

		mgrCertDto.setUserId(counselorInfoMgrDto.getUserId());
		
		model.addAttribute("mgrCert", mgrCounselService.getMgrCertList(mgrCertDto));
		model.addAttribute("mgrCertCnt", mgrCounselService.getMgrCertList(mgrCertDto).size());
		model.addAttribute("mgrCareer", mgrCounselService.getMgrCareer(counselorInfoMgrDto.getUserId()));
		model.addAttribute("mgrBook", mgrCounselService.getMgrBook(counselorInfoMgrDto.getUserId()));
		
		counselorInfoMgrDto.setUserId(counselorInfoMgrDto.getUserId());
		counselorInfoMgrDto.setHighCommCd("102015");
		model.addAttribute("extraExamInfo", counselorInfoMgrService.getExtraList(counselorInfoMgrDto));
		
		
		
		return "/madm/mgr/counselorMgrModify";
	}
	
	/*비디앱스 2020.01.01 
	 * 나의정보 관리 / 상담사 정보 관리
	 * 임시 상태값 승인 확인 페이지 */
	@RequestMapping(value="/getCounselorMgrDetailApprove")
	public String getCounselorMgrDetailApprove(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, @ModelAttribute MgrCertDto mgrCertDto, Model model){
		if (logger.isDebugEnabled()){
			logger.debug("=====수정 상세 디버깅=====");
		}
		
		setMenu(model);
		model.addAttribute("mgrBefore", counselorInfoMgrService.getCounselorInfoMgrDetail(counselorInfoMgrDto));
		
		model.addAttribute("mgr", counselorInfoMgrService.getCounselorInfoMgrDetailImsi(counselorInfoMgrDto));

		mgrCertDto.setUserId(counselorInfoMgrDto.getUserId());
		
		
		model.addAttribute("mgrCert", mgrCounselService.getMgrCertList(mgrCertDto));
		model.addAttribute("mgrCertCnt", mgrCounselService.getMgrCertList(mgrCertDto).size());
		model.addAttribute("mgrCareer", mgrCounselService.getMgrCareer(counselorInfoMgrDto.getUserId()));
		model.addAttribute("mgrBook", mgrCounselService.getMgrBook(counselorInfoMgrDto.getUserId()));
		
		
		

		counselorInfoMgrDto.setUserId(counselorInfoMgrDto.getUserId());
		counselorInfoMgrDto.setHighCommCd("102015");
		model.addAttribute("extraExamInfo", counselorInfoMgrService.getExtraList(counselorInfoMgrDto));
		
		
		
		
		/*다시 수정 가능하게 만듬*/
		MgrDto mgrDto=new MgrDto();
		mgrDto.setModiId(counselorInfoMgrDto.getUserId());
		int result = mgrCounselService.userImsiModiRefuse(mgrDto);
		
		return "/madm/mgr/counselorMgrModifyApprove";
	}
	
	
	/*비디앱스 2020.01.01 
	 * 나의정보 관리 / 상담사 정보 관리
	 * 임시 상태값 거절  */
	@RequestMapping(value="/userImsiModiRefuse")
	public void updateMgrPwd(MgrDto mgrDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mgrDto.setModiId(manager.getUserId());
		int result = mgrCounselService.userImsiModiRefuse(mgrDto);
		
		if(result == 1){
			model.addAttribute("resultVal", "success");
		}else{
			model.addAttribute("resultVal", "fail");
		}
	}
	
	// 별 등급 관리
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
		
		return "/madm/mgr/counselorStartList";
	}
	
	//대기 -> 승인, 승인 -> 대기, 대기 -> 반려
	@RequestMapping(value="/counselorInfoMgrStatus")
	public void counselorInfoMgrStatus(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=====승인 중지=====");
		}
		
		String id = request.getParameter("userId");				// 상담사 ID
		String mgrStatus = request.getParameter("mgrStatus");	// 상담사 상태
		
		if(StringUtils.isNotBlank(id)) {
			if(StringUtils.equals(mgrStatus, "Y")){			// 승인
				mgrDto.setMgrStatus("Y");
				mgrDto.setUseYn("Y");
			}else if(StringUtils.equals(mgrStatus, "S")){	// 대기 
				mgrDto.setUseYn("Y");
			}else if(StringUtils.equals(mgrStatus, "R")){	// 반려
				mgrDto.setUseYn("Y");
				String changeReason = request.getParameter("changeReason"); 	// 반려사유 세팅
				mgrDto.setChangeReason(changeReason);
			} else if(StringUtils.equals(mgrStatus, "N")){			// 중지
				mgrDto.setMgrStatus("N");
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
	
	
	@RequestMapping(value = "/excelDownload")
	public String excelDownload(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Model model, HttpServletRequest request) {
		
		CenterDto centerDto = new CenterDto();
		String channelType = request.getParameter("sChannelType");
		String mgrStatus = request.getParameter("sMgrStatus");
		String workType = request.getParameter("sWorkType");
		String diagnosisType = request.getParameter("sDiagnosisType");
		String diagnosisDiv = request.getParameter("sDiagnosisDiv");
		String financeDiv = request.getParameter("sFinanceDiv");
		String lawDiv = request.getParameter("sLawDiv");
		String mentalDiv = request.getParameter("sMentalDiv");
		String mentalAges = request.getParameter("sMentalAges");
		String diagnosisAges = request.getParameter("sDiagnosisAges");
		String mentalType = request.getParameter("sMentalType");
		String lawType = request.getParameter("sLawType");
		String financeType = request.getParameter("sFinanceType");
		
		

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
		
		if(diagnosisType!=null && diagnosisType.trim().length()>0 ) {
			String type = "("+diagnosisType+")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setDiagnosisType(type);
		}
		
		if(diagnosisDiv !=null && diagnosisDiv.trim().length()>0 ) {
			String type = "("+diagnosisDiv +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setDiagnosisDiv(type);
		}

		if(financeDiv !=null && financeDiv.trim().length()>0 ) {
			String type = "("+financeDiv +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setFinanceDiv(type);
		}
		
		if(lawDiv !=null && lawDiv.trim().length()>0 ) {
			String type = "("+lawDiv +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setLawDiv(type);
		}

		if(mentalDiv !=null && mentalDiv.trim().length()>0 ) {
			String type = "("+mentalDiv +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setMentalDiv(type);
		}

		if(mentalAges !=null && mentalAges.trim().length()>0 ) {
			String type = "("+mentalAges +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setMentalAges(type);
		}
		
		if(diagnosisAges !=null && diagnosisAges.trim().length()>0 ) {
			String type = "("+diagnosisAges +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setDiagnosisAges(type);
		}
		

		if(mentalType !=null && mentalType.trim().length()>0 ) {
			String type = "("+mentalType +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setMentalType(type);
		}

		if(lawType !=null && lawType.trim().length()>0 ) {
			String type = "("+lawType +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setLawType(type);
		}

		if(financeType !=null && financeType.trim().length()>0 ) {
			String type = "("+financeType +")";
			type = type.toString().replace(',', '|');
			counselorInfoMgrDto.setFinanceType(type);
		}
		counselorInfoMgrDto.setMgrStatus(mgrStatus);
		counselorInfoMgrDto.setWorkType(workType);
		
		
		counselorInfoMgrDto.setCenterNm(request.getParameter("centerNm"));
		counselorInfoMgrDto.setUserId(request.getParameter("userId"));
		counselorInfoMgrDto.setStartDt(request.getParameter("startDt"));
		counselorInfoMgrDto.setEndDt(request.getParameter("endDt"));
		
		model.addAttribute(counselorInfoMgrService.getCounselMgrExcelDownload(counselorInfoMgrDto));
		
		return "madm/mgr/counselorMgrExcel";
	}
	
	@RequestMapping(value="/ajaxCert", method=RequestMethod.GET)
	public void ajaxCert(Model model) {
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100732");
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
	}
	
	// 별 등급 적용
	@RequestMapping(value="/ajaxStar", method=RequestMethod.GET)
	public void ajaxStar(Model model, HttpServletRequest request) {
		MgrSubDto mgrSubDto = new MgrSubDto();
		
		mgrSubDto.setUserId(request.getParameter("userId"));
		mgrSubDto.setMgrEvalGrade(Integer.parseInt(request.getParameter("mgrEvalGrade")));
		
		counselorInfoMgrService.mgrEvalGrade(mgrSubDto);
	}
	@RequestMapping(value="/checkId", method=RequestMethod.GET)
	public void checkId(@ModelAttribute MgrDto mgrDto, Model model) {
	
		model.addAttribute("mgr", counselorInfoMgrService.checkId(mgrDto) );
	}
	
	@RequestMapping(value="/counselorList")
	public String counselorList(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Model model, HttpServletRequest request){

		setMenu(model);
		model.addAttribute("centerList", centerService.getCenterNameListNP());
		model.addAttribute(counselorInfoMgrService.counselorList(counselorInfoMgrDto) );
		
		return "madm/mgr/counselorList";
	}
	
	@RequestMapping(value = "/counselorList/excelDownload")
	public String counselorListExcel(@ModelAttribute CounselorInfoMgrDto counselorInfoMgrDto, Map<String, Object> ModelMap) {
		
		List<MgrSub> excelList = counselorInfoMgrService.counselorListExcel(counselorInfoMgrDto);
		
		String dataHeader = "userId,아이디//userNm,성명//rrn,생년월일//centerNm,소속//authCd,권한//education,학력//university,출신교//department,학과//career,경력//cert,자격//etcCert,기타 자격//useYn,사용여부";
		
		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", excelList);
		
		return "excelBigGrid";
	}
	
}
