package com.ezwel.admin.controller.partner.bbs;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.edu.EducationInfoDto;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.edu.EducationInfoService;
import com.ezwel.admin.service.employee.EmployeeService;
import com.ezwel.admin.service.evaluation.EvaluationService;
import com.ezwel.admin.service.evaluation.dto.EvaluationDto;
import com.ezwel.admin.service.mgr.dto.CounselorInfoMgrDto;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.PCounselorMgrService;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.commonController;
import com.ezwel.core.support.util.BBSFileData;


@Controller
@RequestMapping("/partner/bbsNotice")
public class NoticeController extends commonController{
	
	@Resource
	private BBSService bbsService;
	
	@Resource
	EvaluationService evaluationService;
	
	@Resource
	CommonService commonService;
	
	@Resource
	PCounselorMgrService pCounselorMgrService;
	
	@Resource
	private CounselReservationService counselReservationService;
	
	@Resource
	EmployeeService employeeService;
	
	@Resource
	CenterService centerService;
	
	@Resource
	private EducationInfoService educationInfoService;

	private void setMenu(Model model) {
		String menuStr = "커뮤니티";
		model.addAttribute("menu", menuStr);
	}
	

	
	@RequestMapping(value = "/noticeDetailForm")
	public String bbsNoticeDetail(@ModelAttribute BBSAddDto bbsDto, Model model, HttpServletRequest request) {
		setMenu(model);
		String code= request.getParameter("noticeCd");
		bbsDto.setNoticeCd(code);
		BBSData bbsData = bbsService.getBbsSelectOne(bbsDto);
		model.addAttribute("code", bbsDto);
		model.addAttribute("vo", bbsData);

//		파일 가져오기 추가 시작
		List<BBSFileData> listFile = bbsService.getBbsSelectFiles(bbsDto);

		String filePath = "";
		String ext = "";
		for (int i = 0; i < listFile.size(); i++) {

			filePath = listFile.get(i).getFilePath();
			ext = filePath.substring(filePath.lastIndexOf(".") + 1).toLowerCase();
			if (ext.equals("jpg") || ext.equals("png") || ext.equals("gif") || ext.equals("jpeg") || ext.equals("bmp")) {
				ext = "img";
			} else {
				ext = "notImg";
			}
			model.addAttribute("imgChk" + (i + 1), ext);
			model.addAttribute("files" + (i + 1), listFile.get(i));
		}
//		파일 가져오기 추가 종료
		if(isDevice(request) == IS_PC) {
			return "partner/bbs/bbsNoticeDetail";
		}else {
			return "partner/bbs/bbsNoticeDetail_mo";
		}
		

	}
	
	/*20191126 비디앱스 수정
	 * list
	 * 커뮤니티 -> 공지사항
	 * 작업자 :김재훈*/
	@RequestMapping(value = "/list")
	public String bbs4uNotice(@ModelAttribute BBSAddDto bbsAddDto, Model model,HttpServletRequest request) {
		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		bbsAddDto.setCenterSeq(manager.getCenterSeq());
		bbsAddDto.setUserId(manager.getUserId());
		
		bbsAddDto.setBbsCd("notice");
		bbsAddDto.setReqCd1("101231");
		model.addAttribute(bbsService.getBbsPartnerList(bbsAddDto));
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		if(isDevice(request) == IS_PC) {
			return "partner/bbs/bbsNotice";
		}else {
			return "partner/bbs/bbsNotice_mo";
		}
		
	}

	/*20191126 비디앱스 수정
	 * list
	 * 커뮤니티 -> 모집공고
	 * 작업자 :김재훈*/
	@RequestMapping(value = "/list2")
	public String bbs4uNotice2(@ModelAttribute BBSAddDto bbsAddDto, Model model,HttpServletRequest request) {
		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		bbsAddDto.setCenterSeq(manager.getCenterSeq());
		bbsAddDto.setUserId(manager.getUserId());
		
		bbsAddDto.setBbsCd("notice");
		bbsAddDto.setReqCd1("101232");
		
		model.addAttribute(bbsService.getBbsList(bbsAddDto));
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		if(isDevice(request) == IS_PC) {
			return "partner/bbs/bbsNotice2";
		}else {
			return "partner/bbs/bbsNotice2_mo";
		}
		
	}
	
	
	/*20191126 비디앱스 추가
	 * documents
	 * 커뮤니티 -> 서류 및 양식
	 * 작업자 :김재훈*/
	@RequestMapping(value = "/documents")
	public String documents(@ModelAttribute BBSAddDto bbsAddDto, Model model,HttpServletRequest request) {
		setMenu(model);
		bbsAddDto.setBbsCd("notice");
		bbsAddDto.setReqCd1("101230");
		model.addAttribute(bbsService.getBbsList(bbsAddDto));
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		if(isDevice(request) == IS_PC) {
			return "partner/bbs/bbsDocument";	
		}else {
			return "partner/bbs/bbsDocument_mo";
		}
		
	}
	
	
	/*20191126 비디앱스 추가
	 * 작업자 :김재훈*/
	@RequestMapping(value = "/counselScheduleAdd")
	public String counselScheduleAdd(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		bbsAddDto.setBbsCd("notice");
		model.addAttribute(bbsService.getBbsList(bbsAddDto));
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		return "partner/bbs/bbsNotice2";
	}
	
	/*비디앱스
	 * 20191126
	 * educationCompStatus
	 * 상담사관리 -> 이지웰니스 교육이수현황
	 *작업자:김재훈 */
	@RequestMapping(value="/educationCompStatus")
	public String educationCompStatus(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		bbsAddDto.setBbsCd("notice");
		model.addAttribute(bbsService.getBbsList(bbsAddDto));
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		return "partner/bbs/bbsNotice2";
	}
	
	/*비디앱스
	 * 20191126
	 * viewSatisfaction
	 * 상담사관리 -> 만족도 보기
	 *작업자:김재훈 */
	@RequestMapping(value="/viewSatisfaction")
	public String viewSatisfaction(@ModelAttribute EvaluationDto evalDto, Model model, HttpServletRequest request) {
			setMenu(model);
			CounselReservationDto counselReservationDto = new CounselReservationDto();
			Manager manger = UserDetailsHelper.getAuthenticatedUser();
			
			evalDto.setCenterSeq(manger.getCenterSeq());
			counselReservationDto.setCenterSeq(manger.getCenterSeq());
			
			// 센터장일때는 센터의 모든 내역을 볼수 있음
			if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
				model.addAttribute("counselorList", 	counselReservationService.getCounselorList(counselReservationDto));
			} else {
				evalDto.setCounselorId(manger.getUserId());
			}
			
		    model.addAttribute(evaluationService.getPtnSurveyAnsList(evalDto));
		    
		    evalDto.setEvalSeq("1");
		    model.addAttribute("itemAvg",evaluationService.getSurveyAnsAverage(evalDto));
		    evalDto.setEvalSeq("6");
		    model.addAttribute("itemAvg2",evaluationService.getSurveyAnsAverage(evalDto));
		    
		return "partner/mgr/viewSatisfaction";
	}
	
	
	/*비디앱스
	 * 20191126
	 * viewSatisfaction
	 * 상담사관리 -> 교육이수현황
	 *작업자:김재훈 */
	@RequestMapping(value="/completeEdu")
	public String completeEdu(@ModelAttribute EducationInfoDto educationInfoDto, Model model) {
			setMenu(model);
			Manager manger = UserDetailsHelper.getAuthenticatedUser();
			educationInfoDto.setCenterSeq(manger.getCenterSeq());
			model.addAttribute(educationInfoService.getEducationInfoPartnerList(educationInfoDto));
		    
		return "partner/mgr/completeEdu";
	}
	
}
