package com.ezwel.admin.controller.madm.usermanager;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.domain.entity.client.ClientJedoPeriod;
import com.ezwel.admin.domain.entity.pCounselorMgr.MindCounselIntake;
import com.ezwel.admin.domain.entity.sales.Sales;
import com.ezwel.admin.domain.entity.user.User;
import com.ezwel.admin.domain.entity.usermanager.UserManager;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.common.ApiService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.employee.EmployeeService;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.operations.OperationsService;
import com.ezwel.admin.service.operations.dto.OperationsDto;
import com.ezwel.admin.service.pCounselorMgr.PCounselorMgrService;
import com.ezwel.admin.service.pCounselorMgr.dto.MindCounselIntakeDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.user.UserService;
import com.ezwel.admin.service.usermanager.UserManagerService;
import com.ezwel.admin.service.usermanager.dto.UserManagerDto;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.DateUtils;
import com.ezwel.core.support.util.EzwelCode.BRANCH;
import com.ezwel.admin.common.support.connect.MindPrismApiConnect;
import com.ezwel.admin.common.support.connect.MindPrismApiException;
import com.ezwel.admin.common.support.connect.MindPrismVO;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/userManager")
public class UserManagerController { 

	@Resource
	private UserManagerService userManagerService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private EmployeeService employeeService;
	
	@Resource
	private PCounselorMgrService pCounselorMgrService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private ApiService apiService;

	@Resource
	private ClientService clientService;
	
	@Resource
	private OperationsService operationsService;
	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="이용자관리";
		model.addAttribute("menu", menuStr);
	}


	@RequestMapping(value="/getServiceUserList")
	public String userCallUpdate(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		setMenu(model);
		
		if( StringUtils.isNotNull(userManagerDto.getStartMonth()) ){
			if( StringUtils.isNotNull(userManagerDto.getYear()) ){
				userManagerDto.setSearchStMonth(userManagerDto.getYear() + userManagerDto.getStartMonth());
			}else{
				userManagerDto.setSearchStMonth(DateUtils.getDateFormat("yyyy") + userManagerDto.getStartMonth());
			}
		}

		if( StringUtils.isNotNull(userManagerDto.getEndMonth()) ){
			if( StringUtils.isNotNull(userManagerDto.getYear()) ){
				userManagerDto.setSearchEdMonth(userManagerDto.getYear() + userManagerDto.getEndMonth());
			}else{
				userManagerDto.setSearchEdMonth(DateUtils.getDateFormat("yyyy") + userManagerDto.getEndMonth());
			}
		}
		
		model.addAttribute("clientList", commonService.getClientList());
		model.addAttribute("paging", userManagerService.getUserManagerUseList(userManagerDto));
		
		return "madm/usermanager/serviceUserList";
	}
	
	
	
	@RequestMapping(value="/userAddMain")
	public String userAddMain(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		setMenu(model);

		model.addAttribute("paging", userManagerService.getUserManagerUseList(userManagerDto));
		return "madm/usermanager/userAddMain";
	}
	
	@RequestMapping(value = "/excelDownload")
	public String excelDownload(@ModelAttribute UserManagerDto userManagerDto, Map<String, Object> ModelMap) {
		
		if( StringUtils.isNotNull(userManagerDto.getStartMonth()) ){
			if( StringUtils.isNotNull(userManagerDto.getYear()) ){
				userManagerDto.setSearchStMonth(userManagerDto.getYear() + userManagerDto.getStartMonth());
			}else{
				userManagerDto.setSearchStMonth(DateUtils.getDateFormat("yyyy") + userManagerDto.getStartMonth());
			}
		}

		if( StringUtils.isNotNull(userManagerDto.getEndMonth()) ){
			if( StringUtils.isNotNull(userManagerDto.getYear()) ){
				userManagerDto.setSearchEdMonth(userManagerDto.getYear() + userManagerDto.getEndMonth());
			}else{
				userManagerDto.setSearchEdMonth(DateUtils.getDateFormat("yyyy") + userManagerDto.getEndMonth());
			}
		}
		
		List<UserManager> excelList = userManagerService.getServiceUserListExcelDownload(userManagerDto);
		
		String dataHeader = "orderNum,주문번호//clientCd,고객사코드//clientNm,고객사명//userId,유저아이디//userKey,유저키//"
				+ "counselCd,신청코드//orderDt,주문일//scheduleDt,상담일//userNm,직원명//mobile,모바일//age,직원나이//userAge,연령대//userGender,직원성별//counselNm,신청자//"
				+ "relation,상담대상//orderAmt,결제금액//rrn,생년월일//gender,성별//job,직업//"
				+ "counselDiv,상담유형//cause,상담주제//memo,메모//counselType,상담방법//centerSeq,센터명//"
				+ "counselorId,상담사아이디//counselorNm,상담사//payType,결제방법//orderStatus,상태값//statusNm,상담현황//cancelDt,취소날짜//extensionNum,회차//"
				+ "branchCd,소속1//deptCd,소속2//teamCd,소속3//partCd,소속4//gradeCd,직급//record,일지작성여부//"
				+ "risk,위험도//riskReason,위험도사유//marryYn,결혼유무//siteType,주문채널타입";
		
		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", excelList);
		
		return "excelBigGrid";
	}
	
	@RequestMapping(value="/getNewServiceUserList")
	public String newServiceUserList(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		setMenu(model);
		String year = DateUtils.getDateFormat("yyyy");
		
		model.addAttribute("clientList", commonService.getClientList());
		model.addAttribute("year", year);
		
		return "madm/usermanager/newServiceUserList";
	}
	
	@RequestMapping(value="/ajaxNewServiceUserList")
	public void ajaxNewServiceUserList(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		
		if(StringUtils.isNotNull(userManagerDto.getPeriodSeq()) && !"null".equals(userManagerDto.getPeriodSeq()) ){
			List<ClientJedoPeriod> clientJedoPeriod = commonService.getClientJedoPeriodList(userManagerDto.getClientCd(), userManagerDto.getPeriodSeq());
			
			userManagerDto.setStartDd(clientJedoPeriod.get(0).getStartDd());
			userManagerDto.setEndDd(clientJedoPeriod.get(0).getEndDd());
		}
		
		if(StringUtils.isNull(userManagerDto.getClientCd()) || "null".equals(userManagerDto.getClientCd()) ){
			userManagerDto.setClientCd(null);
		}else{
			model.addAttribute("clientJedoList", 			commonService.getClientJedoPeriodList(userManagerDto.getClientCd(), null));
		}
		
		if(StringUtils.isNull(userManagerDto.getYear()) || "null".equals(userManagerDto.getYear()) ){
			String year = DateUtils.getDateFormat("yyyy");
			userManagerDto.setYear(year);
			model.addAttribute("year", year);
		}
		
		model.addAttribute("serviceUseDetail", 		userManagerService.getNewServiceUserDetail(userManagerDto));
		model.addAttribute("newEmpNumber", 		userManagerService.getNewEmpNumber(userManagerDto));
		model.addAttribute("reuseEmpNumber", 	userManagerService.getReuseEmpNumber(userManagerDto));
		model.addAttribute("counselNumber", 		userManagerService.getCounselNumber(userManagerDto));
		
		model.addAttribute("orderChannel", 			userManagerService.getOrderChannel(userManagerDto));
		
	}

	@RequestMapping(value="/ajaxOnlineServiceUserList")
	public void ajaxOnlineServiceUserList(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		
		if(StringUtils.isNotNull(userManagerDto.getPeriodSeq()) && !"null".equals(userManagerDto.getPeriodSeq()) && !"undefined".equals(userManagerDto.getPeriodSeq()) ){
			List<ClientJedoPeriod> clientJedoPeriod = commonService.getClientJedoPeriodList(userManagerDto.getClientCd(), userManagerDto.getPeriodSeq());
			
			userManagerDto.setStartDd(clientJedoPeriod.get(0).getStartDd());
			userManagerDto.setEndDd(clientJedoPeriod.get(0).getEndDd());
		}
		
		if(StringUtils.isNull(userManagerDto.getClientCd()) || "null".equals(userManagerDto.getClientCd()) ){
			userManagerDto.setClientCd(null);
		}else{
			model.addAttribute("clientJedoList", 			commonService.getClientJedoPeriodList(userManagerDto.getClientCd(), null));
		}
		
		if(StringUtils.isNull(userManagerDto.getYear()) || "null".equals(userManagerDto.getYear()) ){
			String year = DateUtils.getDateFormat("yyyy");
			userManagerDto.setYear(year);
			//model.addAttribute("year", year);
		}

		model.addAttribute("onlineNewEmpDetail",	 	userManagerService.getOnlineNewEmpDetail(userManagerDto));
		model.addAttribute("onlineReuseEmpList", 		userManagerService.getOnlineReuseEmpList(userManagerDto));
		model.addAttribute("onlineCounselNumber", 	userManagerService.getOnlieCounselNumber(userManagerDto));
		
	}
	
	@RequestMapping(value="/getOnlineServiceUserList")
	public String getOnlineServiceUserList(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		setMenu(model);

		model.addAttribute("clientList", commonService.getClientList());

//		진행현황 카운트
//		model.addAttribute("onlineCnt", userManagerService.getOnlineServiceCnt(userManagerDto));
		model.addAttribute("paging", userManagerService.getOnlineServiceUserList(userManagerDto));
		
		return "madm/usermanager/OnlineServiceUserList";
	}
	
	@RequestMapping(value = "/excelOnlineServiceUserList")
	public String excelOnlineServiceUserList(@ModelAttribute UserManagerDto userManagerDto, Map<String, Object> ModelMap) {
		ArrayList<HashMap<String,String>> mapList = new ArrayList<HashMap<String,String>>();
		HashMap<String,String> map = new HashMap<String,String>();
		HashMap<String,String> addListMap = null;
		int listcnt = 0;
		int questionListCnt = 11;
		
		List<UserManager> excelList = userManagerService.excelOnlineServiceUserList(userManagerDto);

		StringBuffer headerSb = new StringBuffer();
		headerSb.append("mdcRegSeq,일련번호//clientCd, 고객사코드//userKey,유저키//userNm,임직원명//userBirth,생년월일//gender,성별//age,나이//email,메일//branchCd,소속1//deptCd,소속2//teamCd,소속3//partCd,소속4//gradeCd,직급//userRegDt,이용일시//");
		
		for(int i=0; i < excelList.size(); i++) {
			listcnt++;
			if(!("1".equals(excelList.get(i).getMdcSeq()) && "0".equals(excelList.get(i).getAreaSeq()))){
				map.put("mdcRegSeq", excelList.get(i).getMdcRegSeq());
				map.put("clientCd", excelList.get(i).getClientCd());
				map.put("userKey", excelList.get(i).getUserKey());
				map.put("userNm", excelList.get(i).getUserNm());
				map.put("userBirth", excelList.get(i).getUserBirth());
				map.put("gender", excelList.get(i).getGender());
				map.put("age", excelList.get(i).getAge());
				map.put("email", excelList.get(i).getEmail());
				map.put("branchCd", excelList.get(i).getBranchCd());
				map.put("deptCd", excelList.get(i).getDeptCd());
				map.put("teamCd", excelList.get(i).getTeamCd());
				map.put("partCd", excelList.get(i).getPartCd());
				map.put("gradeCd", excelList.get(i).getGradeCd());
				map.put("userRegDt", excelList.get(i).getUserRegDt());
				map.put(excelList.get(i).getMdcSeq()+"-"+excelList.get(i).getAreaSeq(), excelList.get(i).getResultPoint());
				
				if(i < questionListCnt){
					headerSb.append(excelList.get(i).getMdcSeq()+"-"+excelList.get(i).getAreaSeq() +","+excelList.get(i).getMdcSeq()+"-"+excelList.get(i).getAreaSeq()+"//");
				}
			}
			
			if(listcnt % questionListCnt == 0){
				addListMap = new HashMap<String,String>();
				addListMap.putAll(map);
				mapList.add(addListMap);
			}
		}
		
		ModelMap.put("ezwel_excel_data", headerSb.toString());
		ModelMap.put("ezwel_excel_value", mapList);
		
		return "excelBigGrid";
	}
	
	@RequestMapping(value="/getOnlineServiceUserStatus")
	public String getOnlineServiceUserStatus(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		setMenu(model);

		model.addAttribute("clientList", commonService.getClientList());
		userManagerDto.setStandDispType("100940"); 		// 100940 남 
		model.addAttribute("kossStandM", 	userManagerService.getKossStand(userManagerDto));
		
		userManagerDto.setStandDispType("100941"); 		// 100941 여 
		model.addAttribute("kossStandF",		userManagerService.getKossStand(userManagerDto));
		
		if( StringUtils.isNotEmpty(userManagerDto.getClientCd()) ){
			model.addAttribute("userList",		userManagerService.getOnlineServiceUserStatus(userManagerDto));
			userManagerDto.setUserSex("M");
			model.addAttribute("kossDetailM", 	userManagerService.getKossDetail(userManagerDto));
			userManagerDto.setUserSex("F");
			model.addAttribute("kossDetailF", 	userManagerService.getKossDetail(userManagerDto));
		}

		model.addAttribute("year", DateUtils.getDateFormat("yyyy"));
		
		return "madm/usermanager/OnlineServiceUserStatus";
	}
	
	@RequestMapping(value = "/excelOnlineServiceUserStatus")
	public String excelOnlineServiceUserStatus(@ModelAttribute UserManagerDto userManagerDto, Map<String, Object> ModelMap) {
		
		List<UserManager> excelList = userManagerService.getOnlineServiceUserStatus(userManagerDto);
		
		String dataHeader = "clientCd,고객사코드//userKey,유저키//userNm,임직원명//count,이용횟수//userRegDt,이용일시//";
		
		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", excelList);
		
		return "excelBigGrid";
	}
	
	@RequestMapping(value="/getServiceUserListV2", method={RequestMethod.GET, RequestMethod.POST})
	public String getServiceUserListV2(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		setMenu(model);

		model.addAttribute("clientList", commonService.getClientList());
		model.addAttribute("centerList", commonService.getCenterList());
		
		model.addAttribute("mgrList", clientService.getmgrList("2001", BRANCH.Ezwellness.code));
		
		if(!StringUtils.isEmpty(userManagerDto.getSearchYn())){
			Paging<UserManager> paging = userManagerService.getServiceUserListV2(userManagerDto);
			
			
			if(paging != null) {
				// 내마음보고서 API 연동
				for(UserManager userManager : paging.getList()) {
					
					if("101047".equals(userManager.getCounselType())) {
						MindPrismVO mindPrismVO = new MindPrismVO();
						
						mindPrismVO.setName(userManager.getCounselNm());
						mindPrismVO.setTel(userManager.getMobile());
						mindPrismVO.setEmail(userManager.getEmail());
						
						try {
							String status = MindPrismApiConnect.getStatus(mindPrismVO);
							
							userManager.setMindPrismStatus(status);
						} catch (MindPrismApiException e) {
							userManager.setMindPrismStatus("통신오류");
						}
					}
					
				}
			}
			
			model.addAttribute("paging", paging);
		}
		
		return "madm/usermanager/serviceUserListV2";
	}

	@RequestMapping(value="/getServiceUserDetail")
	public String getServiceUserDetail(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		setMenu(model);

		List<UserManager> detailList = userManagerService.getServiceUserDetail(userManagerDto);
		
		EmployeeDto employeeDto = new EmployeeDto();
		employeeDto.setUserKey(userManagerDto.getUserKey());
		MindCounselIntakeDto mindCounselIntakeDto = new MindCounselIntakeDto();
		mindCounselIntakeDto.setUserKey(Integer.parseInt(userManagerDto.getUserKey()));
		mindCounselIntakeDto.setCounselCd(userManagerDto.getCounselCd());
		
		model.addAttribute("empDetail",employeeService.getDetail(employeeDto));
		
		MindCounselIntake intake_detail = pCounselorMgrService.intakeDetail(mindCounselIntakeDto);
		if(StringUtils.isNotNull(intake_detail.getMemo())) {
			intake_detail.setMemo(intake_detail.getMemo().replaceAll("\r\n", "<br>"));
		}
		
		// 마인드프리즘 상태 조회
		if(detailList != null) {
			for(UserManager userManager : detailList) {
				if("101047".equals(intake_detail.getCounselType())) {
					MindPrismVO mindPrismVO = new MindPrismVO();
					
					mindPrismVO.setName(intake_detail.getCounselNm());
					mindPrismVO.setTel(intake_detail.getMobile());
					mindPrismVO.setEmail(intake_detail.getEmail());
					
					try {
						String status = MindPrismApiConnect.getStatus(mindPrismVO);
						
						userManager.setMindPrismStatus(status);
					} catch (MindPrismApiException e) {
						userManager.setMindPrismStatus("통신오류");
					}
				}
			}
		}
		
		model.addAttribute("intakeDetail", intake_detail);
		model.addAttribute("detailList", detailList);
		
		
		String userKey = userManagerDto.getUserKey();
		User user = userService.getUserInfo(userKey);
		
		Map<String, Object> params = new HashMap<>();
		params.put("clientCd", user.getClientCd());
		params.put("userKey", userKey);
		Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/getPoint", false);
		
		model.addAttribute("privateRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("privateRemainPoint")) : "");
		model.addAttribute("clientRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("clientRemainPoint")) : "");
		model.addAttribute("givenPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("givenPoint")) : "");
		model.addAttribute("ceiling", commonService.getClientCeiling(user.getClientCd()));
		model.addAttribute("user", user);
		
		/* 20190212 관리자 제도기간 추가 요청 #2158 */
		OperationsDto operationsDto = new OperationsDto();
		operationsDto.setSearchClientCd(user.getClientCd());
		
		model.addAttribute("jedoList", 		operationsService.getClientJedoList(operationsDto));
		model.addAttribute("jedoDateInfo", 	operationsService.getClientJedoDateInfo(operationsDto));
		
		boolean isAdmin = false;
		
		List<String> list = UserDetailsHelper.getAuthorities();
		
		if(list.contains("ROLE_MADM_SADMIN")) isAdmin = true;
		String userId=UserDetailsHelper.getAuthenticatedUser().getUserId();
		if(!isAdmin) {
			if(userId.equals("test_admin") || userId.equals("grace88") || userId.equals("lina") || userId.equals("mj.kang")) isAdmin = true;
		}
		model.addAttribute("isAdmin", isAdmin);
		return "madm/usermanager/serviceUserDetail";
	}
	
	@RequestMapping(value = "/excelDownloadV2")
	public String excelDownloadV2(@ModelAttribute UserManagerDto userManagerDto, Map<String, Object> ModelMap) {
		
		List<UserManager> excelList = userManagerService.getServiceUserListExcelDownloadV2(userManagerDto);
		
		String dataHeader = "orderNum,주문번호//clientCd,고객사코드//clientNm,고객사명//userId,유저아이디//userKey,유저키//"
				+ "counselCd,신청코드//orderDt,주문일//scheduleDt,상담일//userNm,직원명//mobile,모바일//age,직원나이//userAge,연령대//userGender,직원성별//counselNm,신청자//"
				+ "relation,상담대상//orderAmt,결제금액//rrn,생년월일//gender,성별//job,직업//"
				+ "counselDiv,상담유형//cause,상담주제//memo,메모//counselType,상담방법//centerNm,센터명//centerSeq,센터코드//"
				+ "counselorId,상담사아이디//counselorNm,상담사//payType,결제방법//orderStatus,상태값//statusNm,상담현황//cancelDt,취소날짜//extensionNum,회차//"
				+ "branchCd,소속1//deptCd,소속2//teamCd,소속3//partCd,소속4//gradeCd,직급//record,일지작성여부//recordStatusNm,일지상태//"
				+ "risk,위험도//riskReason,위험도사유//marryYn,결혼유무//siteType,주문채널타입";
		
		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", excelList);
		
		return "excelBigGrid";
	}
	
	@RequestMapping(value = "/excelDownloadV3")
	public String excelDownloadV3(@ModelAttribute UserManagerDto userManagerDto, Map<String, Object> ModelMap) {
		
		List<UserManager> excelList = userManagerService.getServiceUserListExcelDownloadV3(userManagerDto);
		
		String dataHeader = "orderNum,주문번호//clientCd,고객사코드//clientNm,고객사명//userId,유저아이디//userKey,유저키//"
				+ "counselCd,신청코드//orderDt,주문일//scheduleDt,상담일//userNm,직원명//mobile,모바일//age,직원나이//userAge,연령대//userGender,직원성별//counselNm,신청자//"
				+ "relation,상담대상//orderAmt,결제금액//rrn,생년월일//gender,성별//job,직업//"
				+ "counselDiv,상담유형//cause,상담주제//memo,메모//counselType,상담방법//centerNm,센터명//centerSeq,센터코드//"
				+ "counselorId,상담사아이디//counselorNm,상담사//payType,결제방법//orderStatus,상태값//statusNm,상담현황//cancelDt,취소날짜//extensionNum,회차//"
				+ "branchCd,소속1//deptCd,소속2//teamCd,소속3//partCd,소속4//gradeCd,직급//record,일지작성여부//recordStatusNm,일지상태//"
				+ "risk,위험도//riskReason,위험도사유//marryYn,결혼유무//siteType,주문채널타입//"
				+ "finalGoal,전체상담의 목표//counselPlan,상담계획//mainIssue,주호소문제//subjectItemCd1,상담대주제//subjectItemCd2,상담중주제//subjectItemCd3,상담소주제//goal,본회기의 상담목표//intervention,주요 개입 및 접근방법//content6,상담내용//content4,상담사소견//content5,이후계획//"
				+ "counselMemo,기타특이사항//counselFeedBack,상담사가 내담자에게 전하는 메시지(법률상담)//";

		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", excelList);
		
		return "excelBigGrid";
	}
	
	/**
	 * 고객사 매출데이터 
	 * 
	 * @param userManagerDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getClientSalesData")
	public String getClientSalesData(@ModelAttribute UserManagerDto userManagerDto, Model model) {
		setMenu(model);
		String year = DateUtils.getDateFormat("yyyy");
		
		String[] accessUsers = {"test_admin", "park861108"};
		boolean isModify = Arrays.stream(accessUsers).anyMatch(x-> x.equals(UserDetailsHelper.getAuthenticatedUser().getUserId()));
		List<ClientJedoPeriod> clientJedoList = commonService.getClientJedoPeriodList(userManagerDto.getClientCd(), null);
		
		model.addAttribute("clientList", commonService.getClientList());
		model.addAttribute("clientJedoList", clientJedoList);
		model.addAttribute("year", year);
		model.addAttribute("isModify", isModify);
		
		// search data valid
		if(!StringUtils.nvl(userManagerDto.getClientCd(), "").equals("")
				&& !StringUtils.nvl(userManagerDto.getSearchYear(), "").equals("")) {
			List<Sales> list = userManagerService.getSalesData(userManagerDto);
			Map<String, String> bean = userManagerService.getCounselStaticsData(userManagerDto);

			// 제도기간중 포함되는 날짜가 있는지 search
			List<ClientJedoPeriod> compriseYearList = clientJedoList.stream().filter(x-> {
				
				int startYear = Integer.parseInt(x.getStartDd().substring(0, 4)); // start date
				int endYear = Integer.parseInt(x.getEndDd().substring(0, 4)); // end date
				int searchYear = Integer.parseInt(userManagerDto.getSearchYear()); // search date
				
				for(int i = startYear; i <= endYear; i++) { // search 
					if(i == searchYear) {
						return true;
					}
				}
				
				return false;
			}).collect(Collectors.toList()); // end stream 
			
			model.addAttribute("list", list);
			model.addAttribute("bean", bean);
			model.addAttribute("compriseYearList", compriseYearList); // comprise data 
		}
		
		return "madm/usermanager/clientSalesData";
	}
	
	/**
	 * 고객사 매출데이터 저장
	 * 
	 * @param userManagerDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/saveClientSalesData", method=RequestMethod.POST)
	public String saveClientSalesData(UserManagerDto userManagerDto, Model model) {

		List<ClientJedoPeriod> clientJedoList = commonService.getClientJedoPeriodList(userManagerDto.getClientCd(), null);
		
		if(clientJedoList.size() > 0) {
			ClientJedoPeriod lastJedo = clientJedoList.get(clientJedoList.size() - 1); // last object
			
			userManagerDto.setPeriodSeq(lastJedo.getPeriodSeq());
		}
		
		int result = userManagerService.registSalesData(userManagerDto);
		
		return "redirect:/madm/userManager/getClientSalesData?clientCd="+userManagerDto.getClientCd()+"&searchYear="+userManagerDto.getSearchYear()+"&success="+result;
	}
	
	/**
	 * 고객사 매출데이터 다운로드
	 * 
	 * @param userManagerDto
	 * @param ModelMap
	 * @return
	 */
	@RequestMapping(value = "/downloadClientSalesData")
	public String downloadClientSalesData(@ModelAttribute UserManagerDto userManagerDto, Map<String, Object> ModelMap) {
		
		List<Sales> list = userManagerService.getSalesData(userManagerDto);
		
		String dataHeader = "clientCd,고객사코드//salesType,연도//salesNm,구분//unitPrice,단가//janUserCnt,1월//febUserCnt,2월//"
				+ "marUserCnt,3월//aprUserCnt,4월//mayUserCnt,5월//junUserCnt,6월//julUserCnt,7월//augUserCnt,8월//"
				+ "sepUserCnt,9월//octUserCnt,10월//novUserCnt,11월//decUserCnt,12월//";;

		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", list);
		
		return "excelBigGrid";
	}
}
