package com.ezwel.admin.controller.partner.pCounselorMgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezwel.admin.controller.madm.main.MainController;
import com.ezwel.admin.domain.entity.client.ClientJedoPeriod;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.counsel.Counsel;
import com.ezwel.admin.domain.entity.pCounselorMgr.CounselReservation;
import com.ezwel.admin.domain.entity.user.User;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.common.ApiService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.counsel.CounselOrderService;
import com.ezwel.admin.service.counsel.CounselService;
import com.ezwel.admin.service.counsel.dto.CounselDto;
import com.ezwel.admin.service.counselor.CounselorService;
import com.ezwel.admin.service.ecrm.EcrmService;
import com.ezwel.admin.service.ecrm.dto.EcrmTaskDto;
import com.ezwel.admin.service.message.queue.SmsService;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.CounselorCalendarService;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.sms.OrderSmsPoliceService;
import com.ezwel.admin.service.sms.OrderSmsService;
import com.ezwel.admin.service.user.UserService;
import com.ezwel.common.commonController;
import com.ezwel.core.support.util.DateUtils;
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/partner/pCounselorMgr")
public class CounselController extends commonController{
	
	private static Logger log = LoggerFactory.getLogger(MainController.class);

	
	@Resource
	private CounselReservationService counselReservationService;
	
	@Resource
	private CounselorCalendarService counselorCalendarService;
	
	@Resource
	private SmsService smsService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private CounselOrderService counselOrderService;
	
	@Resource
	private CounselService counselService;
	
	@Resource
	private CenterService centerService;
	
	@Resource
	private ApiService apiService;
	
	@Resource
	private CounselorService counselorService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private ClientService clientService;
	
	@Resource
	private OrderSmsService orderSmsService;
	
	@Resource
	private OrderSmsPoliceService orderSmsPoliceService;
	
	@Resource
	private EcrmService ecrmService;
	

	private void setMenu(Model model) {
		String menuStr = "개인상담관리";
		model.addAttribute("menu", menuStr);
	}


	@RequestMapping(value="/counselFixList")
	public String getCounselFixList(@ModelAttribute CounselReservationDto counselReservationDto, Model model, HttpServletRequest request) {
		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		counselReservationDto.setCounselorId(manger.getUserId());
		counselReservationDto.setCenterSeq(manger.getCenterSeq());
		
		if (!StringUtils.isEmpty(request.getParameter("startDt"))) {
			counselReservationDto.setStartDt(request.getParameter("startDt").replace("/", "") );
		}
		if (!StringUtils.isEmpty(request.getParameter("endDt"))) {
			counselReservationDto.setEndDt(request.getParameter("endDt").replace("/", ""));
		}
		
		if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
			counselReservationDto.setCenterSeq(manger.getCenterSeq());
			model.addAttribute(counselReservationService.getOwnerReservationFixList(counselReservationDto));

		} else {
			model.addAttribute(counselReservationService.getReservationFixList(counselReservationDto));
		}
		
		//비디앱스 추가 고객사 선택
		//EcrmTaskDto ecrmTaskDto = new EcrmTaskDto();
		//model.addAttribute("clientList", ecrmService.getClientList(ecrmTaskDto));

		setMenu(model);
		
		if(isDevice(request) == IS_PC) {
			return "partner/pCounselorMgr/counselFixList";
		}else {	
			return "partner/pCounselorMgr/counselFixList_mo";
		}
	}


	@RequestMapping(value = "/counselReport")
	public String addReport(@ModelAttribute CounselReservationDto counselReservationDto, Model model) {
		setMenu(model);
		return "partner/pCounselorMgr/counselReport";
	}


	@RequestMapping(value = "/totalSchedule")
	public String totalCounselSchedule(@ModelAttribute CounselReservationDto counselReservationDto, Model model, HttpServletRequest request) {
		setMenu(model);
		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		counselReservationDto.setCenterSeq(manger.getCenterSeq());
		
		// 최초 들어올때는 오늘날짜로 매핑
		if (StringUtils.isNull(counselReservationDto.getYmd())) {
			model.addAttribute("initDay", DateUtils.getDateFormat("yyyy-MM") + "-01");
			counselReservationDto.setYmd(DateUtils.getDateFormat("yyyy-MM"));
		} else {
			model.addAttribute("initDay", counselReservationDto.getYmd() + "-01");
		}

		// 센터장일때는 센터의 모든 내역을 볼수 있음
		if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
			model.addAttribute("counselorList", 	counselReservationService.getCounselorList(counselReservationDto));
			counselReservationDto.setCenterOwnerYn("Y");
		} else {
			// 센터장이 아니면, 무조건 자기 아이디매핑
			counselReservationDto.setUserId(manger.getUserId());
		}
		
		model.addAttribute("today", DateUtils.getDateFormat("yyyy-MM-dd"));
		model.addAttribute("totalScheduleList", counselorCalendarService.getScheduleJosn(counselReservationDto).toString());
		//model.addAttribute("totalScheduleList2",counselorCalendarService.getTotalScheduleList(counselReservationDto));
		model.addAttribute("centerOwnerYn", manger.getCenterOwnerYn());
		if(isDevice(request) == IS_PC) {
			return "partner/pCounselorMgr/totalCounselCalendar";
		}else {
			return "partner/pCounselorMgr/totalCounselCalendar_mo";
		}

		
	}

	/*비디앱스 추가
	 * /totalCounselCalendar 에서 날짜별 데이터 가져오기
	 * 
	 * 
	 */
	@RequestMapping(value="/ajaxCounselCalendar", method=RequestMethod.GET)
	public ModelMap ajaxCounselCalendar(@ModelAttribute CounselReservationDto counselReservationDto, ModelMap model) {
		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		counselReservationDto.setCenterSeq(manger.getCenterSeq());
		//counselReservationDto.setYmd(DateUtils.getDateFormat("yyyyMMdd"));
		model.addAttribute("totalScheduleList2",counselorCalendarService.getTotalScheduleList(counselReservationDto));
		return model;
	}
	

	@RequestMapping(value="/ajaxModifyFix", method=RequestMethod.GET)
	public void ajaxModifyFix(@ModelAttribute CounselReservationDto counselReservationDto, ModelMap model) {
		counselReservationService.ajaxModifyFix(counselReservationDto);
	}

	
	@RequestMapping(value="/ajaxModifyCancel", method=RequestMethod.GET)
	public void ajaxModifyCancel(@ModelAttribute CounselReservationDto counselReservationDto, ModelMap model) {
		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		counselReservationDto.setCounselorId(manger.getUserId());
		counselReservationService.ajaxModifyCancel(counselReservationDto);
	}

	@RequestMapping(value="/getScheduleTimeList", method=RequestMethod.GET)
	public void getScheduleTimeList(@ModelAttribute CounselReservationDto counselReservationDto, ModelMap model) {
		List<CounselReservation> list = counselReservationService.getScheduleTimeList(counselReservationDto);
		model.addAttribute("stTimeList", list);
	}
	
	@RequestMapping(value="/getCanExtension", method=RequestMethod.GET)
	public void getCanExtension(@ModelAttribute CounselReservationDto counselReservationDto, ModelMap model) {
		CounselReservation counselReservation = counselReservationService.getCanExtension(counselReservationDto);
		String result = "";

		//100931 상담연장 승인
		//100932 상담연장 완료 
		//null
		if (StringUtils.isEmpty(counselReservation.getExtensionStatus()) || StringUtils.isEquals(counselReservation.getExtensionStatus(), "100931")) {
			result = "Y"; //연장 가능 
		} else {
			result = "N";
		}

		model.addAttribute("ret", result);
	}
	
	@RequestMapping(value="/doExtension", method=RequestMethod.POST)
	public String doExtension(@ModelAttribute CounselReservationDto counselReservationDto, ModelMap model) {
		CounselReservation counselReservation = counselReservationService.getCounselInfo(counselReservationDto);
		CounselReservationDto crDto = new CounselReservationDto();
		BeanUtils.copyProperties(counselReservationDto, crDto);
		crDto.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		crDto.setScheduleDt(counselReservationDto.getYmd() + counselReservationDto.getStTime() + "00");
		crDto.setCategoryCd(counselReservation.getCategoryCd());
		crDto.setCounselType(counselReservation.getCounselType());
		crDto.setCounselPrice(counselReservation.getCounselPrice());
		crDto.setExtensionNum(counselReservation.getExtensionNum() +  1);

		counselReservationService.updateCounsel(crDto);
		counselReservationService.insertCounselExtension(crDto);
		counselReservationService.updateCounselSchedule(crDto);
		counselReservationService.updateCounselintake(crDto);
		counselReservationService.insertCounselExtensionOrder(crDto);
		counselReservation = counselReservationService.getCounselInfo(crDto);
		
		StringBuffer message = new StringBuffer();
		
		message.append("[상담포유] 다음상담 결제 안내\n");
		message.append(counselReservation.getCounselNm() + "님, 안녕하세요? 상담포유입니다.\n\n");
		message.append(counselReservation.getCenterNm() + " 센터(" + counselReservation.getCounselorNm() + "상담사)에서 다음 상담이 " + counselReservation.getScheduleDt().substring(0, 4) + "년 " + counselReservation.getScheduleDt().substring(4, 6) + "월 " + counselReservation.getScheduleDt().substring(6, 8) + "일 ");
		message.append(counselReservation.getScheduleDt().substring(8, 10) + "시에 진행될 예정입니다. 상담을 진행하실 경우, 반드시 상담포유 사이트에서 \"연장하기\"기능을 클릭한 후 결제해주십시오. 결제하지 않을 경우 해당 상담이 자동취소될 수 있습니다.\n\n");
		message.append("문의사항은 상담포유 게시판 및 고객센터(1644-4474)로 문의주시기 바랍니다.");
		
		smsService.send(counselReservation.getMobile(), "1644-4474", message.toString());
				
		return "redirect:/partner/pCounselorMgr/counselFixList";
	}
	
	
	/**
	 * 상담사 연장신청 폼
	 * @param userKey
	 * @param counselCd
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/partnerCounselForm")
	public String partnerCounselForm(@RequestParam String userKey, String counselCd, Model model,HttpServletRequest request) {
		setMenu(model);
		
		try {
		
			User user = userService.getUserInfo(userKey);
			
			model.addAttribute("user", user);
			model.addAttribute("centerList", centerService.getCenterLocationList(new CenterDto()));
			model.addAttribute("categoryList", counselOrderService.getCounselCategoryList("100001"));
			
			if (StringUtils.isNotNull(counselCd)) {
				Counsel counsel = counselService.getCounseList(counselCd).get(0);
				model.addAttribute("intakeCd", counsel.getIntakeCd());
				model.addAttribute("counsel", counsel);
			}
		
			Map<String, Object> params = new HashMap<>();
			params.put("clientCd", user.getClientCd());
			params.put("userKey", user.getUserKey());
			Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/getPoint", false);
		
			model.addAttribute("privateRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("privateRemainPoint")) : "");
			model.addAttribute("clientRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("clientRemainPoint")) : "");
			ClientJedoPeriod clientJedoPeriod = commonService.getClientJedoPeriodEndDd(user.getClientCd());
			model.addAttribute("clientJedoPeriod", clientJedoPeriod );
			model.addAttribute("ceiling", commonService.getClientCeiling( user.getClientCd()) );
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(isDevice(request) == IS_PC) {
			return "partner/counsel/partnerCounselForm";
		}else {
			return "partner/counsel/partnerCounselForm_mo";
		}
		
		
	}
	
	/**
	 * 상담사 연장신청 폼에서 날짜 / 시간 확인 로직
	 * @param counselDto
	 * @param model
	 */
	@RequestMapping(value="/counselScheduleConfrim")
	public void counselScheduleConfrim(CounselDto counselDto, Model model) {
		model.addAttribute("resultValue", counselService.getScheduleStatus(counselDto));
		model.addAttribute("scheduleSeq", counselDto.getScheduleSeq());
	}
	
	/**
	 * 상담사 연장신청 폼에서 등록
	 * @param counselDto
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value="/addSchedule")
	public void addSchedule(CounselDto counselDto, Model model) throws Exception {
		counselDto.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		counselDto.setCounselCd("0");
		model.addAttribute("resultValue", counselService.addSchedule(counselDto));
		model.addAttribute("scheduleSeq", counselDto.getScheduleSeq());
	}
	
	
	/**
	 * 상담신청전 가격/ 현재포인트 상담 가능한지 체크 
	 * @param employeeDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getOrderInfo")
	public void isCounselPoint(@RequestParam String userKey,
			@RequestParam String clientCd,
			@RequestParam String intakeCd, Model model) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("clientCd", clientCd);
		params.put("userKey", userKey);
		params.put("intakeCd", intakeCd);
		Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/isCounselPoint", false);
		
		model.addAttribute("price", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("price")) : "");
		model.addAttribute("resultValue", resultMap.get("resultValue"));
	}
	
	
	/**
	 * 상담신청전 가격/ 현재포인트 상담 가능한지 체크 
	 * @param employeeDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/doOrder")
	public void doOrder(@RequestParam String userKey,
			@RequestParam String clientCd,
			@RequestParam String intakeCd,
			@RequestParam String scheduleSeq,
			@RequestParam String ceilingCategoryCd,
			@RequestParam String smsYn, Model model) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("userKey", userKey);
		params.put("clientCd", clientCd);
		params.put("intakeCd", intakeCd);
		params.put("scheduleSeq", scheduleSeq);
		params.put("ceilingCategoryCd", ceilingCategoryCd);
		params.put("smsYn", smsYn);
		params.put("regId", UserDetailsHelper.getAuthenticatedUser().getUserId());
		
		Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/adminOrder", false);
		model.addAttribute("resultValue", resultMap.get("resultValue"));
	}
	
	
	/**
	 * 상담사 일정 변경
	 * @param counselCd
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/counselorChange/layerPopup")
	public String counselorChange(String counselCd, Model model, HttpServletRequest request) {
		setMenu(model);
		
		Counsel counsel = counselService.getCounseList(counselCd).get(0);
		
		if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
			// 센터장일때는 상담사도 변경 가능
			model.addAttribute("counselorList", counselorService.getCounselor(counsel.getCenterSeq()));
		}
		ClientJedoPeriod clientJedoPeriod = commonService.getClientJedoPeriodEndDd(counsel.getClientCd());
		model.addAttribute("clientJedoPeriod", clientJedoPeriod );
		model.addAttribute("oriCounselor", counsel.getCounselorId());
		model.addAttribute("centerSeq", counsel.getCenterSeq());
		model.addAttribute("counselCd", counselCd);
		model.addAttribute("counsel", counsel);
		
		
		return "partner/counsel/popup/popupCounselChange";
	}
	
	
	@RequestMapping(value="/counselScheduleChange")
	public void counselScheduleChange(CounselDto counselDto, Model model) throws Exception {
		counselDto.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		counselDto.setModiId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		model.addAttribute("resultValue", counselService.doScheduleChange(counselDto));
		
		//SMS 전송여부가 체크되어 있으면 문자발송
		try {
			if ("Y".equals(counselDto.getSmsYn())) {
				String clientCd = clientService.getCounselCdClientCd(counselDto.getCounselCd());
				
				if("police".equals(clientCd)){
					orderSmsPoliceService.sendSmsCousnelDtChange(counselDto.getCounselCd());
				}else{
					orderSmsService.sendSmsCousnelDtChange(counselDto.getCounselCd());
				}
			}
		} catch (Exception e) {
		}
	}
	
	/**
	 * 연장신청 시, 해당 상담이 이전 제도에 포함되는지를 체크
	 * @param employeeDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/checkCounselExtendsJedo")
	public void checkCounselExtendsJedo(@ModelAttribute ClientDto clientDto, ModelMap model) {
		
		// 상담일자 세팅 후, 상담일자에 포함되는 제도번호 가져오기
		clientDto.setYmd(clientDto.getCounselDate().replaceAll("-", ""));
		String counselJedoSeq = clientService.getClientJedoPeriod(clientDto);
		
		// 현재일자 세팅 후, 현재일자 포함되는 제도번호 가져오기
		clientDto.setYmd(clientDto.getNowDate());
		String nowJedoSeq = clientService.getClientJedoPeriod(clientDto);
		
		model.addAttribute("counselJedoSeq", counselJedoSeq);
		model.addAttribute("nowJedoSeq", nowJedoSeq);
		
	}
	

	/**
	 * 자녀상담 횟수 조회 API
	 * 
	 * @param counselDto
	 * @param model
	 */
	@RequestMapping(value="/countByCounselToChildren", method=RequestMethod.GET)
	public void countByCounselToChildren(CounselDto counselDto, ModelMap model) {
		int counselToChildrenCount = counselService.countByCounselToChildren(counselDto);
		
		model.addAttribute("counselToChildrenCount", counselToChildrenCount);
	}
}
