package com.ezwel.admin.controller.madm.client;

import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.employ.EmployData;
import com.ezwel.admin.domain.entity.pCounselorMgr.CounselReservation;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.client.dto.ClientCounselDto;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.common.ApiService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.employee.EmployeeService;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.message.queue.SmsService;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.StringUtils;

import ezwelcrypto.EzwelCrypto;
import sun.misc.BASE64Encoder;

@Controller
@RequestMapping("/madm/counsel")
public class ClientCounselController {
	
	private static Logger log = LoggerFactory.getLogger(ClientCounselController.class);

	
	@Resource
	private CounselReservationService counselReservationService;
	
	@Resource
	private ClientService clientService;
	
	@Resource
	private CenterService centerService;
	
	@Resource
	private EmployeeService employeeService;
	
	@Resource
	private GlobalsProperties globalsProperties;
	
	@Resource
	private SmsService smsService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private ApiService apiService;
	
	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr = "고객사";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value = "/counselList", method={RequestMethod.GET, RequestMethod.POST})
	//public String counselList(@ModelAttribute CounselReservationDto counselReservationDto, Model model, HttpServletRequest request) {
	public String counselList(@ModelAttribute ClientCounselDto clientCounselDto, Model model, HttpServletRequest request){
		setMenu(model);
		
		CounselReservationDto counselReservationDto = new CounselReservationDto();
		
		if (StringUtils.isNotEmpty(clientCounselDto.getCenterSeq())) {
			counselReservationDto.setCenterSeq(Integer.parseInt(clientCounselDto.getCenterSeq()));
		}
		counselReservationDto.setClientCd(clientCounselDto.getClientCd());
		counselReservationDto.setStartDt(clientCounselDto.getStartDt());
		counselReservationDto.setEndDt(clientCounselDto.getEndDt());
		counselReservationDto.setCounselNm(clientCounselDto.getCounselNm());
		counselReservationDto.setCounselorNm(clientCounselDto.getCounselorNm());
		counselReservationDto.setPageCommonCount(clientCounselDto.getPageCommonCount());
		counselReservationDto.setPageSize(clientCounselDto.getPageSize());
		counselReservationDto.setCurrentPage(clientCounselDto.getCurrentPage());
		
		if (StringUtils.isNotNull(clientCounselDto.getCounselCd())) {
			counselReservationDto.setCounselCd(Integer.parseInt(clientCounselDto.getCounselCd()));
		}

		//고객사 목록
		ClientDto clientDto = new ClientDto();
		clientDto.setStartEmploy("0");
		clientDto.setEndEmploy("0");
		List<Client> clientList = clientService.getClientList(clientDto);
		model.addAttribute("clientList", clientList);
		
		//상담센터 목록
		CenterDto centerDto = new CenterDto();
		List<CenterInfo> centerList = centerService.getCenterNameList(centerDto);
		model.addAttribute("centerList", centerList);

		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		counselReservationDto.setCounselorId(manger.getUserId());
		
		if (!StringUtils.isEmpty(request.getParameter("startDt"))) {
			counselReservationDto.setStartDt(request.getParameter("startDt").replace("/", "") );
		}
		if (!StringUtils.isEmpty(request.getParameter("endDt"))) {
			counselReservationDto.setEndDt(request.getParameter("endDt").replace("/", ""));
		}
		
		Paging<CounselReservation> listCounsel = null;
		List<CounselReservation> list = null;
		ListIterator<CounselReservation> iter = null;
		CounselReservation tmp = null;
		
		//if (request.isUserInRole("ROLE_PARTNER_CENTER")) {
			//counselReservationDto.setCenterSeq(manger.getCenterSeq());
			listCounsel = counselReservationService.getOwnerReservationFixList(counselReservationDto);
			list = listCounsel.getList();
			iter = list.listIterator();
			
			while(iter.hasNext()) {
				tmp = iter.next();
				tmp.setEncUserKey(encrypt(Integer.toString(tmp.getUserKey())));
			}
			listCounsel.setList(list);
			model.addAttribute(listCounsel);
			model.addAttribute("cmd", encrypt("100")); //결제
//		} else {
//			listCounsel = counselReservationService.getReservationFixList(counselReservationDto);
//			list = listCounsel.getList();
//			iter = list.listIterator();
//			
//			while(iter.hasNext()) {
//				tmp = iter.next();
//				tmp.setEncUserKey(encrypt(Integer.toString(tmp.getUserKey())));
//			}
//			listCounsel.setList(list);
//			
//			model.addAttribute(listCounsel);
//			model.addAttribute("cmd", encrypt("100")); //결제
//		}
		
		return "/madm/client/counsel/counselList";
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
		
		return "redirect:/madm/counsel/counselList";
	}
	
	@RequestMapping(value = "/addCounsel")
	public String addCounsel(@ModelAttribute EmployeeDto employeeDto, Model model) {
		setMenu(model);
		employeeDto.setExcelFlag("list");
		
		if(employeeDto.getSearchType().equals("view")){
			employeeDto.setExcelFlag("view");
			employeeDto.setSearchClientCd("nu");
			employeeDto.setSearchClientNm("nu");
		}
		
		Paging<EmployData> page = employeeService.getList(employeeDto);
		List<EmployData> list = page.getList();
		ListIterator<EmployData> iter = list.listIterator();
		
		while(iter.hasNext()) {
			EmployData ed = iter.next();
			if (StringUtils.isNotEmpty(ed.getUserKey())) {
				ed.setEncUserKey(encrypt(ed.getUserKey()));
			}
		}
		
		page.setList(list);
		
		model.addAttribute("emplist", employeeService.getEmplist(employeeDto));
		model.addAttribute(page);
		return "/madm/client/counsel/addCounsel";
	}
	
	private String encrypt(String s) {
		byte[] bytes = null;
		String ret = "";
		
		EzwelCrypto ezwelCrypto = new EzwelCrypto();
		BASE64Encoder encoder = new BASE64Encoder();
		

		bytes = ezwelCrypto.encrypt(s, globalsProperties.getProperty("page.add.counsel.enctyp.key").getBytes());
		ret = encoder.encode(bytes);
		
		return ret;
	}
	
	
	@RequestMapping(value="/modefyRecordStatus")
	public void modefyRecordStatus(@ModelAttribute CounselReservationDto counselReservationDto, ModelMap model) {
		model.addAttribute("updateCnt", counselReservationService.modefyRecordStatus(counselReservationDto));
	}
	
	
	@RequestMapping(value="/counselCancel")
	public void counselCancel(@RequestParam String counselCd, @RequestParam String smsYn , ModelMap model) {
//		EzHttpClient http = new EzHttpClient();
//		Map<String, Object> params = new HashMap<>();
//		params.put("counselCd", counselCd);
//		
//		String serverType = globalsProperties.getProperty("server.type");
//		if ("local".equals(serverType)) {
//			http.setUrl("http://local-api.sangdam4u.com/api/admin/cancel");
//		} else if ("dev".equals(serverType)) {
//			http.setUrl("http://dev-api.sangdam4u.com/api/admin/cancel");
//		} else if ("real".equals(serverType)) {
//			http.setUrl("http://api.sangdam4u.com/api/admin/cancel");
//		}
//		
//		UsernamePasswordCredentials credentials = new UsernamePasswordCredentials("admin", "1230987");
//		
//		http.setMothod(EzHttpClient.POST);
//		http.setContentType(EzHttpClient.CONTENT_HTML);
//		http.setAccept(EzHttpClient.CONTENT_JSON);
//		http.setParams(params);
//		http.setCredentials(credentials);
//		http.send();
//		
//		Map<String, Object> resultMap = http.getResultClass(HashMap.class);
//		System.out.println(resultMap.get("result"));
//		if ("0000".equals(resultMap.get("result"))) {
//			model.addAttribute("resultValue", "success");
//		} else {
//			model.addAttribute("resultValue", "0");
//		}
		
		Map<String, Object> params = new HashMap<>();
		params.put("counselCd", counselCd);
		params.put("smsYn", smsYn);
		params.put("regId", UserDetailsHelper.getAuthenticatedUser().getUserId());
		
		Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/cancel", false);
		if ("0000".equals(resultMap.get("result"))) {
			model.addAttribute("resultValue", "success");
		} else {
			model.addAttribute("resultValue", "0");
		}
	}
	
	@RequestMapping(value="/halfCancel")
	public void halfCancel(@RequestParam String counselCd, @RequestParam String smsYn , ModelMap model) {
		Map<String, Object> params = new HashMap<>();
		params.put("counselCd", counselCd);
		params.put("smsYn", smsYn);
		params.put("regId", UserDetailsHelper.getAuthenticatedUser().getUserId());
		
		Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/halfCancel", false);
		boolean success = (boolean) resultMap.get("success");
		if (success) {
			model.addAttribute("resultValue", "success");
		} else {
			model.addAttribute("resultValue", "0");
			model.addAttribute("msg", resultMap.get("msg"));
		}
	}
}
