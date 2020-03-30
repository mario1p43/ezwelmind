package com.ezwel.admin.controller.partner.pCounselorMgr;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.CommonClientCd;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.counsel.Counsel;
import com.ezwel.admin.domain.entity.pCounselorMgr.MindCounselCounselDetail;
import com.ezwel.admin.domain.entity.pCounselorMgr.MindCounselIntake;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.counsel.CounselService;
import com.ezwel.admin.service.mgr.MgrCounselService;
import com.ezwel.admin.service.operations.OperationsService;
import com.ezwel.admin.service.operations.dto.OperationsDto;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.CounselorCalendarService;
import com.ezwel.admin.service.pCounselorMgr.PCounselorMgrService;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.pCounselorMgr.dto.MindCounselIntakeDto;
import com.ezwel.admin.service.pCounselorMgr.dto.MindCounselRecordDto;
import com.ezwel.admin.service.pCounselorMgr.dto.MindScheduleDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.commonController;
import com.ezwel.core.support.util.DateUtils;
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/partner/pCounselorMgr")
public class PCounselorMgrController extends commonController {

	@Resource
	private OperationsService operationsService;
	
	@Resource 
	private PCounselorMgrService pCounselorMgrService;

	@Resource
	private MgrCounselService mgrCounselService;
	
	@Resource
	private CounselService counselService;
	
	@Resource
	private CounselReservationService counselReservationService;
	
	@Resource
	private CounselorCalendarService counselorCalendarService;
	
	@Resource
	private CommonService commonService;
	
	private static final int COUNSEL_FEEDBACK_TYPE_COMM_CD = 101024;
	

	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());

	private void setMenu(Model model) {
		String menuStr = "개인상담관리";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value="/pCounselorDateList")
	public String pCounselorDateList(@ModelAttribute MindCounselIntakeDto mindCounselIntakeDto, Model model, HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=====개인상담일지 디버깅======");
		}
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mindCounselIntakeDto.setCenterSeq(manager.getCenterSeq());
		String recordStatus = request.getParameter("rStatusNm");
		if(recordStatus == null || recordStatus == ""){
		}else{

			String type = "("+recordStatus+")";
			type = type.toString().replace(',', '|');
			mindCounselIntakeDto.setRecordStatus(type);
		}

		if(!request.isUserInRole("ROLE_PARTNER_CENTER")){
			mindCounselIntakeDto.setLoginId(manager.getUserId());
		}
		setMenu(model);
		model.addAttribute(pCounselorMgrService.pCounselorDateList(mindCounselIntakeDto));
		
		if(isDevice(request) == IS_PC) {
			return "partner/pCounselorMgr/pCounselorDateList";
		}else {	
			return "partner/pCounselorMgr/pCounselorDateList_mo";
		}
	}

	@RequestMapping(value="/pCounselorDateDetail")
	public String pCounselorDateDetail(@ModelAttribute MindCounselIntakeDto mindCounselIntakeDto, MindCounselCounselDetail mindCounselCounselDetail,  Model model,HttpServletRequest request){
		if (logger.isDebugEnabled()){
			logger.debug("=====개인상담일지 등록/수정 디버깅======");
		}
		setMenu(model);

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

//		if(manager.getCenterOwnerYn().equals("N")){
			mindCounselIntakeDto.setLoginId(manager.getUserId());
//		}

		//일단 상담이력 주석
//		model.addAttribute(pCounselorMgrService.pCounselorDateDetail(mindCounselIntakeDto));

		MindCounselIntake intake_detail = pCounselorMgrService.intakeDetail(mindCounselIntakeDto);
			
		model.addAttribute("intake_detail", intake_detail);
		model.addAttribute("baseInfo_detail", pCounselorMgrService.baseInfoDetail(mindCounselIntakeDto));
		model.addAttribute("intakeCd", mindCounselIntakeDto.getCounselCd());

		//고객사 제도기간 조회
		OperationsDto operationsDto = new OperationsDto();
		operationsDto.setSearchClientCd(intake_detail.getClientCd());
		model.addAttribute("jedoDateInfo", 	operationsService.getClientJedoDateInfo(operationsDto));
		
		//일지 등록 부분 조회
		MindCounselCounselDetail recordList =  pCounselorMgrService.pCounselorRecordDtl(mindCounselCounselDetail);

		boolean isNotSaveSubjectItem = false;
		
		if(recordList != null){
			if(recordList.getRecordCd() == null || recordList.getRecordCd().equals("")){
				mindCounselCounselDetail.setRecordCd("");
			}else{
				mindCounselCounselDetail.setRecordCd(recordList.getRecordCd());
			}
			// 상담시간(상담에 소요된 시간) 값이 없으면 오류가 발생하여 추가
			if(recordList.getTime() == null || recordList.getTime().equals("")){
				recordList.setTime("0000");
			}
			
			// 첫회기 상담주제와 주호소문제를 끌어옴
			MindCounselCounselDetail firstRecordData = pCounselorMgrService.pCounselFirstRecordDetail(recordList);
			
			if(firstRecordData != null) {
				recordList.setSubjectItemCd1(firstRecordData.getSubjectItemCd1());
				recordList.setSubjectItemCd2(firstRecordData.getSubjectItemCd2());
				recordList.setSubjectItemCd3(firstRecordData.getSubjectItemCd3());
				recordList.setMainIssue(firstRecordData.getMainIssue());
				
				// 회기는 등록을 했으나 데이터가 없을 경우
				if(firstRecordData.getSubjectItemCd1() == null || firstRecordData.getSubjectItemCd2() == null) {
					isNotSaveSubjectItem = true;
				}
			} else {
				isNotSaveSubjectItem = true;
			}
		}

		model.addAttribute("isNotSaveSubjectItem", isNotSaveSubjectItem);
		model.addAttribute("record_cnt", pCounselorMgrService.pCounselorRecordCnt(mindCounselCounselDetail));     //상담일지 체크
		model.addAttribute("record_detail", recordList);
		model.addAttribute("record_txt", pCounselorMgrService.pCounselorRecordTxtList(mindCounselCounselDetail)); //상담소견 목록
		//일지 등록 부분 조회

//		if("100002".equals(intake_detail.getChannelType())){
//			법률상담 일 경우 법률피드백 조회
			mindCounselCounselDetail.setCounselFeedBackType(COUNSEL_FEEDBACK_TYPE_COMM_CD);
			model.addAttribute("counsel_feedback", pCounselorMgrService.pCounselorRecordFeedBack(mindCounselCounselDetail)); //상담소견 목록
//		}
			if(isDevice(request) == IS_PC) {
				return "partner/pCounselorMgr/pCounselorDateInsert";
			}else {	
				return "partner/pCounselorMgr/pCounselorDateInsert_mo";
			}
		
	}

	@RequestMapping(value="/pCounselorDtlInsert")
	public String pCounselorDateInsert(@ModelAttribute MindCounselCounselDetail mindCounselCounselDetail,
			@ModelAttribute MindCounselRecordDto mindCounselRecordDto,	Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq){
		if (logger.isDebugEnabled()){
			logger.debug("=====개인상담일지 목표 및 계획 디버깅======");
		}
		setMenu(model);

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		mindCounselCounselDetail.setModiId(manager.getUserId());
		mindCounselCounselDetail.setRegId(manager.getUserId());

		mindCounselCounselDetail.init(mhsq, true);

		try {
			//첨부파일 세팅 start
			Set<String> set = mindCounselCounselDetail.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			while (iter.hasNext()) {
				String key = iter.next();

				if (mindCounselCounselDetail.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					if(key.equals("file")){
						mindCounselCounselDetail.setFileNm(mindCounselCounselDetail.getMultiMap().get(key).getFileNm());
						mindCounselCounselDetail.setFilePath(mindCounselCounselDetail.getMultiMap().get(key).getFileFullPath());
					}
				}
			}
			//첨부파일 세팅 end

			pCounselorMgrService.pCounselorDateInsert(mindCounselCounselDetail);

			model.addAttribute("counselCd", mindCounselCounselDetail.getCounselCd());
			model.addAttribute("userKey", mindCounselCounselDetail.getUserKey());

		} catch (Exception e) {
			e.printStackTrace();
		}

		if("100931".equals( mindCounselCounselDetail.getExtensionStatus()) ){
			// 연장하기 일 경우 예약확정현황 페이지로 이동
			return "redirect:/partner/pCounselorMgr/counselFixList";
		}else{
			return "redirect:/partner/pCounselorMgr/pCounselorDateDetail";
		}
	}

	@RequestMapping(value = "/pCounselSchedule")
	public String pCounselSchedule(@ModelAttribute MindScheduleDto mindScheduleDto, Model model ,HttpServletRequest request) throws Exception {
		setMenu(model);

		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mindScheduleDto.setCenterSeq(manager.getCenterSeq());
		mindScheduleDto.setMgrOwnerYn(manager.getCenterOwnerYn());
		mindScheduleDto.setMgrId(manager.getUserId());


		
		//***************************************************************************************************** 
		// 센터장일 경우 센터의 상담사 조회 및 수정이 가능하다.
		//*****************************************************************************************************
		String selectId = ""; 
		
		if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
			CounselReservationDto counselReservationDto = new CounselReservationDto();
			counselReservationDto.setCenterSeq(manager.getCenterSeq());
			model.addAttribute("counselorList", counselReservationService.getCounselorList(counselReservationDto));
			
			selectId = StringUtils.isNotNull(mindScheduleDto.getSelectId()) ? mindScheduleDto.getSelectId() : manager.getUserId();
			
			counselReservationDto.setUserId(selectId);
			if (!counselorCalendarService.isManagerSameGroup(counselReservationDto)) {
				/* 센터장이 다른상담사를 조회했는데, 같은센터 상담사가 아닐때*/
				throw new Exception("같은 상담센터 소속이 아닙니다.");
			}
			
		} else {
			// 센터장이 아니면, 무조건 자기 아이디매핑
			selectId = manager.getUserId();
		}
		
		mindScheduleDto.setUserId(selectId);
		model.addAttribute("selectId", selectId);
		//*****************************************************************************************************
		

		String thisMonth = request.getParameter("thisMonth") == null ? DateUtils.toDateStringYMD().substring(0, 6) : request.getParameter("thisMonth");
		mindScheduleDto.setYmd(thisMonth);

		model.addAttribute("iYear", request.getParameter("iYear"));
		model.addAttribute("iMonth", request.getParameter("iMonth"));

		model.addAttribute(mindScheduleDto);
		model.addAttribute("scheduleMap", pCounselorMgrService.getMonthScheduleMap(mindScheduleDto));
		
		
		if(isDevice(request) == IS_PC) {
			return "partner/pCounselorMgr/pCounselSchedule";
		}else {
			return "partner/pCounselorMgr/pCounselSchedule_mo";
		}
	}

	
	@RequestMapping(value="/updadeSchedule")
	public String updadeSchedule(@ModelAttribute MindScheduleDto mindScheduleDto, Model model ,HttpServletRequest request) throws Exception {

		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mindScheduleDto.setCenterSeq(manager.getCenterSeq());
		mindScheduleDto.setMgrOwnerYn(manager.getCenterOwnerYn());
		mindScheduleDto.setMgrId(manager.getUserId());

		
		//***************************************************************************************************** 
		// 센터장일 경우 센터의 상담사 조회 및 수정이 가능하다.
		//*****************************************************************************************************
		mindScheduleDto.setUserId(mindScheduleDto.getSelectId());
		if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
			// 센터장은 자신의 센터직원까지는 수정가능
			CounselReservationDto counselReservationDto = new CounselReservationDto();
			counselReservationDto.setCenterSeq(manager.getCenterSeq());
			counselReservationDto.setUserId(mindScheduleDto.getSelectId());
			if (!counselorCalendarService.isManagerSameGroup(counselReservationDto)) {
				throw new Exception("같은 상담센터 소속이 아닙니다.");
			}
			
		} else {
			// 센터장이 아닐때는 자신의 아이디가 아니면 무조건 에러
			if ( !(mindScheduleDto.getSelectId()).equals(manager.getUserId()) ) {
				throw new Exception("자신의 일정만 수정이 가능합니다.");
			}
		}
		//*****************************************************************************************************

		pCounselorMgrService.updateSchedule(mindScheduleDto, request);

		return "redirect:/partner/pCounselorMgr/pCounselSchedule?selectId=" + mindScheduleDto.getSelectId();
	}


	/**
	 * 신청코드 입력하여서, 일지 노출여부를 판단한다.
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/pCounselorDateInput")
	public String pCounselorDateInput( Model model, HttpServletRequest request) {

		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		

		MindCounselIntakeDto mindCounselIntakeDto = new MindCounselIntakeDto();
		mindCounselIntakeDto.setCenterSeq(manager.getCenterSeq());
		/** 
		 * 날짜가 지나야만 상담일지를 작성할수 있지만 테스트를 편하게 하기위해서 
		 * 신청코드 123뒤에 123#1230987  붙이면, 날짜가 지나지 않아도 테스트 가능 
		 * */
		mindCounselIntakeDto.setCounselCd(request.getParameter("beforeCounselCd").split("#")[0]);
		
		
		if (!request.isUserInRole("ROLE_PARTNER_CENTER")) {
			/** 자신의 id를 매핑하여, 상담일지를 자기의 것만 찾게 한다. 센터장은 제외 */
			mindCounselIntakeDto.setCounselorId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		}
		
		int counselCnt = pCounselorMgrService.selectPCounselorDateInput(mindCounselIntakeDto);
		if (counselCnt == 1) {
			/* 입력한 신청코드가 있음*/
			Counsel counsel = counselService.getCounseList(mindCounselIntakeDto.getCounselCd()).get(0);
			mindCounselIntakeDto.setCounselType(counsel.getCounselType()); // 상담타입을 매핑, 게시판이면 날짜 조건 없음
			
			
			//--------테스트 편의를 위해 ------------//
			if (request.getParameter("beforeCounselCd").indexOf("#1230987") > 0) {
				mindCounselIntakeDto.setCounselType("100435"); // 임의로 게시판상담 코드를 넣너주면 날짜체크 안함
			}
			//--------테스트 편의를 위해 ------------//
			
			
			// 고객한테 받은 신청코드를 조회해서 상담을 했다는것을 업데이트함.
			int result = pCounselorMgrService.updatePCounselorDateInput(mindCounselIntakeDto);
			if (result == 1) {
				model.addAttribute(pCounselorMgrService.pCounselorDateList(mindCounselIntakeDto));
			} else {
				model.addAttribute("checkNo", "상담 완료후에 입력해주세요.");
				model.addAttribute("paging", "");
			}
		} else {
			model.addAttribute("checkNo", "신청코드를 확인해주세요.");
			model.addAttribute("paging", "");
		}

		return "partner/pCounselorMgr/pCounselorDateList";

	}

	
	
	@RequestMapping(value="/pCounselBbsAddForm")
	public String pCounselBbsAddForm(@ModelAttribute MindCounselIntakeDto mindCounselIntakeDto, Model model, HttpServletRequest request){
		setMenu(model); 
		MindCounselCounselDetail detail = pCounselorMgrService.getReplyInfo(mindCounselIntakeDto);
		model.addAttribute("counselInfo", 	pCounselorMgrService.getCounselInfo(mindCounselIntakeDto));
		model.addAttribute("replyInfo", 	detail);

		String alertYn = (String) request.getParameter("alertYn");
		if("Y".equals(alertYn)){
			model.addAttribute("alertYn", alertYn);
		}
		return "partner/pCounselorMgr/pCounselBbsAddForm";
	}
	
	@RequestMapping(value="/pCounselBbsAdd")
	public String pCounselBbsAdd(@ModelAttribute MindCounselIntakeDto mindCounselIntakeDto, Model model, HttpServletRequest request){
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		mindCounselIntakeDto.setRegId(manager.getUserId());
		int addCnt = pCounselorMgrService.addCounselBbsAdd(mindCounselIntakeDto);
		model.addAttribute("intakeCd", mindCounselIntakeDto.getIntakeCd());
		
		if( "Y".equals(mindCounselIntakeDto.getAnswerYn()) ){
			if(addCnt > 0 ){
				model.addAttribute("alertYn", "Y");
			}
		}
		
		return "redirect:/partner/pCounselorMgr/pCounselBbsAddForm";
	}
	
	
	/**
	 * 게시판 상담일때 상담일지가 있는지 확인함.
	 * @param mindCounselIntakeDto
	 * @param model
	 */
	@RequestMapping(value="/pCounselBbs/confirm")
	public void getBookCenter(MindCounselIntakeDto mindCounselIntakeDto, ModelMap model) {
		MindCounselCounselDetail detail = pCounselorMgrService.getReplyInfo(mindCounselIntakeDto);
		if (detail != null) {
			model.addAttribute("resultYn", 	detail.getAnswerYn());
		} else {
			model.addAttribute("resultYn", 	"N");
		}
	}
	
	/**
	 * 코드 목록 조회 (파트너어드민용)
	 * 
	 * @param highCommCd
	 * @param clientCd
	 * @param model
	 */
	@RequestMapping(value="/getCommClientList", method=RequestMethod.GET)
	public void getCommClientList(@RequestParam String highCommCd, @RequestParam String clientCd, Model model) {
		HashMap<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("code", highCommCd);
		paramMap.put("clientCd", clientCd);

		List<CommonClientCd> list = commonService.getCommClientList(paramMap);

		model.addAttribute("list", list);
	}
}
