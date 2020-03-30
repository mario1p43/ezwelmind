package com.ezwel.admin.controller.madm.common;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.poi.util.StringUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.domain.entity.client.ClientJedoPeriod;
import com.ezwel.admin.domain.entity.common.CommonClientCd;
import com.ezwel.admin.domain.entity.counselCategory.CounselCategory;
import com.ezwel.admin.domain.entity.pCounselorMgr.MindCounselIntake;
import com.ezwel.admin.service.banner.BannerService;
import com.ezwel.admin.service.banner.dto.InvBannerDto;
import com.ezwel.admin.service.banner.dto.InvChannelDto;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.common.ApiService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CounselCategoryDto;
import com.ezwel.admin.service.counsel.CounselService;
import com.ezwel.admin.service.diagnosis.DiagnosisService;
import com.ezwel.admin.service.diagnosis.dto.DiagnosisDto;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.menu.dto.MenuCodeDto;
import com.ezwel.admin.service.operations.OperationsService;
import com.ezwel.admin.service.operations.dto.OperationsDto;
import com.ezwel.admin.service.pCounselorMgr.PCounselorMgrService;
import com.ezwel.admin.service.pCounselorMgr.dto.MindCounselIntakeDto;
import com.ezwel.admin.service.popup.PopupService;
import com.ezwel.admin.service.user.UserService;
import com.ezwel.admin.service.usermanager.dto.UserManagerDto;
import com.ezwel.common.commonController;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.StringUtils;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class CommonController extends commonController {	
 	
	@Resource
	private CommonService commonService;
	
	@Resource
	private BannerService bannerService;
	
	@Resource
	private ClientService clientService;
	
	@Resource
	private PopupService popupService;

	@Resource
	private CounselService counselService;
	
	@Resource 
	private UserService userService;
	
	@Resource 
	private PCounselorMgrService pCounselorMgrService;
	
	@Resource
	private DiagnosisService diagnosisService;
	
	@Resource
	private ApiService apiService;
	
	@Resource
	private OperationsService operationsService;
	
	
	@RequestMapping(value="/madm/layerPopup/addChannelPopup", method=RequestMethod.GET)
	public String addChannelPopup(Model model) {
		/*model.addAttribute("channelCd", invChannelParam.getChannelCd());*/
		return "madm/common/addChannelPopup";
	}
	
	
	@RequestMapping(value="/madm/layerPopup/addCorner", method=RequestMethod.GET)
	public String addCorner(@ModelAttribute InvChannelDto invChannelDto, Model model) {
		InvBannerDto invBannerDto = new InvBannerDto();
		
		model.addAttribute("chCd", invChannelDto.getChannelCd());
		model.addAttribute("channelList",  bannerService.chDataList(invBannerDto));

		return "madm/common/addCorner";
	}

	@RequestMapping(value="/madm/common/bbs/ajaxModifyBbsDisp", method=RequestMethod.GET)
	public void ajaxModifyBbsDisp(@ModelAttribute BBSAddDto bbsAddDto, ModelMap model) {
		commonService.ajaxModifyBbsDisp(bbsAddDto);
	}
	
	
	/**
	 * 고객사 리스트 팝업
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/madm/layerPopup/clientListPopup")
	public String getClientList(@ModelAttribute ClientDto clientDto, ModelMap model) {
		model.addAttribute("clientList", clientService.getClientList(clientDto));
		return "madm/common/clientListPopup";
	}
	
	/**
	 * 메뉴 URL 고객사리스트
	 * @param String
	 * @return json String
	 */
	@RequestMapping(value="/madm/common/menuURLtoClientList", method=RequestMethod.POST)
	public ResponseEntity<List<Client>> getMenuURLtoClientList(MenuCodeDto dto) {
		List<Client> clientList = null;
		try {
			dto.setMenuUrl(URLDecoder.decode(dto.getMenuUrl(),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		clientList = clientService.getMenuURLtoClientList(dto.getMenuUrl());
		if(clientList.size() == 0) {
			List<NameValuePair> params = null;
			try {
				params = URLEncodedUtils.parse(new URI(dto.getMenuUrl()), "UTF-8");
			} catch (URISyntaxException e) {
				e.printStackTrace();
			}
			if(params.size() != 0) {
				HashMap<String, String> map = new HashMap<String, String>();
				for (NameValuePair param : params) {
					map.put(param.getName(), param.getValue());
				}
				int menuCnt = clientService.getMenuCdCnt(map.get("menuCd"));
				System.out.println("menuCnt : " + menuCnt);
				if(menuCnt > 0) {
					clientList = clientService.getBBSClient(Base64Utils.decode(map.get("dataSeq")));
				}
			}
		}
		
		ResponseEntity<List<Client>> entity = null;
		if (clientList != null) {
			entity = new ResponseEntity<>(clientList, HttpStatus.OK);
		}
		return entity;
	}
	
	/**
	 * 이용자관리 메모
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/madm/layerPopup/memoView")
	public String getMemo(ModelMap model, HttpServletRequest request) {
		String intakeCd = request.getParameter("intakeCd");
		model.addAttribute("counsel", counselService.getCounselMemo(intakeCd));
		return "madm/usermanager/userMemoPopup";
	}
	
	/**
	 * 만족도조사 상세보기
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/madm/layerPopup/counselDetail")
	public String getDetail(ModelMap model, HttpServletRequest request) {
		String counselCd = request.getParameter("counselCd");
		model.addAttribute("counsel", userService.getUserSurveyInfo(counselCd));
		return "madm/evaluation/counselDetailPopup";
	}
	
	/**
	 * 인테이크 정보 상세보기
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/madm/layerPopup/intakeDetail")
	public String getIntakeDetail(ModelMap model, HttpServletRequest request) {
		MindCounselIntakeDto mindCounselIntakeDto = new MindCounselIntakeDto();
		String counselCd = request.getParameter("counselCd");
		
		mindCounselIntakeDto.setCounselCd(counselCd);
		
		MindCounselIntake intake_detail = pCounselorMgrService.intakeDetail(mindCounselIntakeDto);
		
		if(StringUtils.isNotNull(intake_detail.getMemo())) {
			intake_detail.setMemo(intake_detail.getMemo().replaceAll("\r\n", "<br>"));
		}
		model.addAttribute("intake_detail", intake_detail);
		
		MindCounselIntake baseInfoDetail = pCounselorMgrService.baseInfoDetail(mindCounselIntakeDto);
		model.addAttribute("baseInfo_detail", baseInfoDetail);
		
		// 20190426 사용자 제도정보, 잔여포인트정보 begin -- 
		OperationsDto operationsDto = new OperationsDto();
		operationsDto.setSearchClientCd(baseInfoDetail.getClientCd());
		operationsDto.setUseYn("Y");
		
		List<ClientJedoPeriod> jedoList = operationsService.getClientJedoList(operationsDto);
		
		ClientJedoPeriod jedo = jedoList.stream().findFirst().orElse(null);
		
		model.addAttribute("jedo", jedo);
		
		// 파라미터
		Map<String, Object> params = new HashMap<>();
		params.put("clientCd", baseInfoDetail.getClientCd());
		params.put("userKey", baseInfoDetail.getUserKey());
		
		// api call
		Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/getPoint", false);
		
		// 개인 잔여 한도
		model.addAttribute("privateRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("privateRemainPoint")) : "");
		
		// 개인 한도
		model.addAttribute("ceiling", commonService.getClientCeiling(baseInfoDetail.getClientCd()));
		// 20190426 사용자 제도정보, 잔여포인트정보 end --
		
		if(isDevice(request) == IS_PC) {
			return "madm/common/intakeDetailPopup";
		} else {
			return "madm/common/intakeDetailPopup_mo";
		}
	}
	
	@RequestMapping(value="/madm/common/getCommClientList", method=RequestMethod.GET)
	public void getCommClientList(@RequestParam String highCommCd, @RequestParam String clientCd, Model model) {
		HashMap<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("code", highCommCd);
		paramMap.put("clientCd", clientCd);

		List<CommonClientCd> list = commonService.getCommClientList(paramMap);

		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/madm/common/getCategoryList", method=RequestMethod.GET)
	public void getCategoryList(@RequestParam String highCommCd, @RequestParam String clientCd, Model model) {
		CounselCategoryDto cDto = new CounselCategoryDto();
		cDto.setHighCategoryCd(highCommCd);
		List<CounselCategory> list = commonService.getCounselCategory(cDto);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/madm/layerPopup/diagnosis/{pollSeq}", method=RequestMethod.GET)
	public String pollModi(@PathVariable String pollSeq, Model model) {
		
		if(!"new".equals(pollSeq)){
			DiagnosisDto diDto = new DiagnosisDto();
			
			//base64 디코딩
			diDto.setPollSeq(Base64Utils.decode( StringUtils.defaultString(pollSeq) ));
			model.addAttribute("pollDetail", diagnosisService.getDiagnosisDetail(diDto));
		}
		
		return "madm/common/pollModi";
	}

	@RequestMapping(value="/madm/common/userManager/ajaxModifyIntakeDisp", method=RequestMethod.GET)
	public void ajaxModifyIntakeDisp(@ModelAttribute UserManagerDto userManagerDto, ModelMap model) {
		commonService.ajaxModifyIntakeDisp(userManagerDto);
	}
	
	/**
	 * 인테이크 사전정보 조회(팝업)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/madm/layerPopup/counselDiagnosis/{intakeCd}/{counselCd}")
	public String counselDiagnosis(@PathVariable String intakeCd,@PathVariable String counselCd, ModelMap model, HttpServletRequest request) {

		MindCounselIntakeDto mindCounselIntakeDto = new MindCounselIntakeDto();
		mindCounselIntakeDto.setCounselCd(counselCd);
		
		model.addAttribute("intake_detail", pCounselorMgrService.intakeDetail(mindCounselIntakeDto));	
		model.addAttribute("counselDiagnosis", pCounselorMgrService.getCounselDiagnosis(intakeCd));     //상담일지 체크
		
		return "partner/pCounselorMgr/counselDiagnosis";
	}
	
	/**
	 * 인테이크 사전정보 조회(팝업)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/madm/common/employeeManagement/ajaxModifyUseYn")
	public void ajaxModifyUseYn(EmployeeDto employeeDto, ModelMap model) {
		commonService.ajaxModifyUseYn(employeeDto);
	}
	
	/**
	 * 개인한도 조회 팝업
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/madm/layerPopup/limitDetail")
	public String limitDetail(@ModelAttribute UserManagerDto userManagerDto, HttpServletRequest request, ModelMap model) {
		
		try {
			Map<String, Object> params = new HashMap<>();
			params.put("clientCd", userManagerDto.getClientCd());
			params.put("userKey", userManagerDto.getUserKey());
			Map<String, Object> resultMap = apiService.doApi(params, "/api/admin/getPoint", false);
		
			model.addAttribute("privateRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("privateRemainPoint")) : "");
			model.addAttribute("clientRemainPoint", MapUtils.isNotEmpty(resultMap) ? apiService.toPointFormat((String) resultMap.get("clientRemainPoint")) : "");
			model.addAttribute("ceiling", commonService.getClientCeiling(userManagerDto.getClientCd()));
			model.addAttribute("info", 	operationsService.getUserNowJedoInfo(params));
		} catch (Exception e) {
			log.error("Fail - limitDetail", e);
		}
		
		
		
		
		return "madm/common/limitDetailPopup";
	}
}