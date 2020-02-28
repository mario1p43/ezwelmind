package com.ezwel.admin.controller.madm.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.domain.entity.client.ClientCommCd;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.client.dto.ClientSubDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.counsel.CounselOrderService;
import com.ezwel.admin.service.counsel.dto.CounselDto;
import com.ezwel.admin.service.ecrm.EcrmService;
import com.ezwel.admin.service.ecrm.dto.EcrmTaskDto;
import com.ezwel.admin.service.operations.OperationsService;
import com.ezwel.admin.service.operations.dto.OperationsDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.JsonUtils;
import com.ezwel.core.support.util.StringUtils;
import com.ezwel.core.support.util.EzwelCode.BRANCH;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/madm/client")
public class ClientController {
	
	private static Logger log = LoggerFactory.getLogger(ClientController.class);
	
	/*
	 * 고객사 등록/수정
	 */

	private static final String CLIENT_MENU_GROUP_COMM_CD = "100399";
	private static final String CLIENT_TYPE_COMM_CD = "100652";
	private static final String CLIENT_DIV_COMM_CD = "100571";
	private static final String CLIENT_BITEM_COMM_CD = "100587";
	private static final String CLIENT_CONTRACT_COMM_CD = "100648";
	private static final String CLIENT_AREA_COMM_CD = "100006";
	private static final String CLIENT_CALC_COMM_CD = "100654";
	private static final String CLIENT_USE_TYPE_COMM_CD = "100440";
	private static final String CLIENT_USE_SERVICE_COMM_CD = "100670";
	private static final String CLIENT_USE_CHANNEL_COMM_CD = "100675";

	@Resource
	private ClientService clientService;

	@Resource
	private CommonService commonService;

	@Resource
	private EcrmService ecrmService;
	
	@Resource
	private CounselOrderService counselOrderService;
	
	@Resource
	private OperationsService operationsService;
	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr = "고객사";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/clientList")
	public String getClientList(@ModelAttribute ClientDto clientDto, Model model) {
		setMenu(model);
		
		EcrmTaskDto ecrmTaskDto = new EcrmTaskDto();
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd("100395");

/*		System.out.println("@@@ : "+clientDto.getStartEmploy());
		System.out.println("### : "+clientDto.getEndEmploy());

		int startEmploy = (clientDto.getStartEmploy()  == null ? 0 : Integer.parseInt(clientDto.getStartEmploy())  );
		int endEmploy = (clientDto.getEndEmploy()  == null ? 0 : Integer.parseInt(clientDto.getStartEmploy()) );
		
		System.out.println("start : "+ startEmploy +" / end : "+endEmploy);
		clientDto.setStartEmp(startEmploy);
		clientDto.setEndEmp(endEmploy);
*/
		
		model.addAttribute("joinType", commonService.getTypeList(commonDto));
		model.addAttribute("clientList", ecrmService.getClientList(ecrmTaskDto));
		model.addAttribute(clientService.getClientList(clientDto));
		return "madm/client/clientList";
	}

	/**
	 * Client 데이터를 json으로 처리
	 *
	 * @param model
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value = "/clientJsonList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody Object getClientJsonList(@ModelAttribute ClientDto clientDto) throws JsonProcessingException {
		int startEmploy = (clientDto.getStartEmploy()  == "" ? 0 : Integer.parseInt(clientDto.getStartEmploy())  );
		int endEmploy = (clientDto.getEndEmploy()  == "" ? 0 : Integer.parseInt(clientDto.getEndEmploy()) );
		clientDto.setStartEmp(startEmploy);
		clientDto.setEndEmp(endEmploy);
		
		List<Client> clientList = clientService.getClientList(clientDto);

		String result = "";
		if (clientList != null) {
			result = JsonUtils.jsonIBSheetToString(clientList);
		}

		return result;
	}

	@RequestMapping(value = "/addClient")
	public String addClient(@ModelAttribute ClientDto clientDto, Model model) {

		setMenu(model);

		CommonDto commDto = new CommonDto();

		commDto.setHighCommCd(CLIENT_TYPE_COMM_CD);
		model.addAttribute("clientTypeList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_DIV_COMM_CD);
		model.addAttribute("divCdList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_BITEM_COMM_CD);
		model.addAttribute("bitemList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_CONTRACT_COMM_CD);
		model.addAttribute("contractTypeList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_AREA_COMM_CD);
		model.addAttribute("areaCdList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_CALC_COMM_CD);
		model.addAttribute("calcTypeList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_USE_TYPE_COMM_CD);
		model.addAttribute("useTypeList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_USE_SERVICE_COMM_CD);
		model.addAttribute("useServiceList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_USE_CHANNEL_COMM_CD);
		model.addAttribute("useChannelList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_MENU_GROUP_COMM_CD);
		model.addAttribute("menuGroupList", commonService.getTypeList(commDto));
		
		model.addAttribute("mgrList", clientService.getmgrList("2001", BRANCH.Ezwellness.code));

		return "madm/client/addClient";
	}

	@RequestMapping(value = "/add")
	public String makeClient(@ModelAttribute ClientDto clientDto, Model model, MultipartHttpServletRequest mhsq) {

		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		clientDto.setRegId(manager.getUserId());

		Iterator<String> itr =  mhsq.getFileNames();
		if(itr.hasNext()) {
			clientDto.init(mhsq);
		}
		
		clientDto.setPost(clientDto.getZip1()+"-"+clientDto.getZip2());
		
		try {
			clientService.makeClient(clientDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/madm/client/modifyClient?clientCd=" + Base64Utils.encode(clientDto.getClientCd());
	}

	@RequestMapping(value = "/modifyClient")
	public String modifyClient(@ModelAttribute ClientDto clientDto, Model model) {

		setMenu(model);

		CommonDto commDto = new CommonDto();

		commDto.setHighCommCd(CLIENT_TYPE_COMM_CD);
		model.addAttribute("clientTypeList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_DIV_COMM_CD);
		model.addAttribute("divCdList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_BITEM_COMM_CD);
		model.addAttribute("bitemList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_CONTRACT_COMM_CD);
		model.addAttribute("contractTypeList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_AREA_COMM_CD);
		model.addAttribute("areaCdList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_CALC_COMM_CD);
		model.addAttribute("calcTypeList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_USE_TYPE_COMM_CD);
		model.addAttribute("useTypeList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_USE_SERVICE_COMM_CD);
		model.addAttribute("useServiceList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_USE_CHANNEL_COMM_CD);
		model.addAttribute("useChannelList", commonService.getTypeList(commDto));

		commDto.setHighCommCd(CLIENT_MENU_GROUP_COMM_CD);
		model.addAttribute("menuGroupList", commonService.getTypeList(commDto));

		Client clientData = clientService.getClientSelectOne(clientDto);
		model.addAttribute("vo", clientData);
		
		model.addAttribute("mgrList", clientService.getmgrList("2001", BRANCH.Ezwellness.code));

		return "madm/client/modifyClient";
	}

	@RequestMapping(value = "/modify")
	public String updateClient(@ModelAttribute ClientDto clientDto, Model model, MultipartHttpServletRequest mhsq) {

		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		clientDto.setModiId(manager.getUserId());

		Iterator<String> itr =  mhsq.getFileNames();
		if(itr.hasNext()) {
			clientDto.init(mhsq);
		}
		
		clientDto.setPost(clientDto.getZip1()+"-"+clientDto.getZip2());

		try {
			clientService.updateClient(clientDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/madm/client/modifyClient?clientCd=" + Base64Utils.encode(clientDto.getClientCd());
	}

	@RequestMapping(value = "/commCdList")
	public String commCdList(@ModelAttribute ClientDto clientDto, Model model) {
		setMenu(model);
		model.addAttribute("clientList", commonService.getClientList());

		if(!StringUtils.isEmpty(clientDto.getClientCd())){
			model.addAttribute("commCdList", 	clientService.getCommCdList(clientDto));
			model.addAttribute("popCommCdList", clientService.getPopCommCdList(clientDto));
		}
		return "madm/client/commCdList";
	}
	
	@RequestMapping(value="/getCommClientList", method=RequestMethod.GET)
	public void getCommClientList(@RequestParam String highCommCd,@RequestParam String clientCd, Model model) {
		HashMap<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("code", highCommCd);
		paramMap.put("clientCd", clientCd);

		List<ClientCommCd> list = clientService.getCommClientList(paramMap);

		model.addAttribute("list", list);
	}


	@RequestMapping(value = "/insertClientCommCd")
	public String insertClientCommCd(@ModelAttribute ClientDto clientDto, Model model) {
		
		return "redirect:/madm/client/commCdList";
	}
	
	
	/**
	 * 고객사 개인정보관리 선택 구성 페이지
	 * @param clientDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/memberPrivate")
	public String memberPrivate(@RequestParam String clientCd, Model model) {
		setMenu(model);
		model.addAttribute("myPrivateList", clientService.getClientMyPrivateList(clientCd));
		return "madm/client/memberPrivate";
	}
	
	/**
	 * CLIENT_SUB 등록
	 * @param clientDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/addClientSub")
	public void addClientSub(@ModelAttribute ClientSubDto clientSubDto, Model model) {
		model.addAttribute("resultValue", clientService.addClientSub(clientSubDto));
	}
	
	/**
	 * CLIENT_SUB 삭제
	 * @param clientDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/deleteClientSub")
	public void deleteClientSub(@ModelAttribute ClientSubDto clientSubDto, Model model) {
		model.addAttribute("resultValue", clientService.deleteClientSub(clientSubDto));
	}
	
	/**
	 * client_sub 업데이트
	 * @param clientSubDto
	 */
	@RequestMapping(value = "/updateClientSub")
	public void updateClientSub(ClientSubDto clientSubDto, Model model) {
		model.addAttribute("resultValue", clientService.updateClientSub(clientSubDto));
	}
	
	
	/**
	 * 고객사 개인정보관리 선택 구성 페이지
	 * @param clientDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/intakeSetting")
	public String intakeSetting(@RequestParam String clientCd, Model model) {
		setMenu(model);
		
		CounselDto counselDto = new CounselDto();
		counselDto.setClientCd(clientCd);
		counselDto.setHighCategoryCd("100001");
		model.addAttribute("category_100001", counselOrderService.getCounselCategoryClientList(counselDto));
		counselDto.setHighCategoryCd("100002");
		model.addAttribute("category_100002", counselOrderService.getCounselCategoryClientList(counselDto));
		counselDto.setHighCategoryCd("100003");
		model.addAttribute("category_100003", counselOrderService.getCounselCategoryClientList(counselDto));
		
		return "madm/client/intakeSetting";
	}
	
	/**
	 * client_sub 업데이트
	 * @param clientSubDto
	 */
	@RequestMapping(value = "/getChannelInfo")
	public void getChannelInfo(ClientSubDto clientSubDto, Model model) {
		model.addAttribute("resultValue", clientService.getClientSub(clientSubDto));
	}
	
	
	/**
	 * client_sub 업데이트
	 * @param clientSubDto
	 */
	@RequestMapping(value = "/clientLoginList")
	public String getClientLoginList(@ModelAttribute ClientDto clientDto, Model model) {
		setMenu(model);
		model.addAttribute("clientList", commonService.getClientList());
		model.addAttribute("paging", clientService.getClientPagingList(clientDto));
		
		return "madm/client/clientLoginList";
	}
	
	/**
	 * 고객사 로그인 이미지/문구 관리 
	 * @param model-
	 * @return
	 */
	@RequestMapping(value="/modifyClientLogin", method=RequestMethod.GET)
	public String modifyClientLogin(@ModelAttribute ClientDto clientDto, Model model) {
		setMenu(model);
		model.addAttribute("clientDetail", clientService.getClientDetail(clientDto));
		return "madm/client/clientLoginDetail";
	}
	
	@RequestMapping(value = "/modifyClientLoginAct", method=RequestMethod.POST)
	public String modifyClientLoginAct(@ModelAttribute ClientDto clientDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {

		try {
			Manager manager = UserDetailsHelper.getAuthenticatedUser();
			clientDto.setModiId(manager.getUserId());
			
			if(StringUtils.isNotNull(mhsq.getFile("fileNm").getOriginalFilename())){
				clientDto.init(mhsq);
			}
			clientService.modifyClientLogin(clientDto);
		} catch (Exception e) {
			log.error("e = " + e.getMessage());
		}
		return "redirect:/madm/client/modifyClientLogin?clientCd="+clientDto.getClientCd();
	}
	
	@RequestMapping(value = "/gradeCdList")
	public String gradeCdList(@ModelAttribute ClientDto clientDto, Model model) {
		setMenu(model);
		
		model.addAttribute("clientList", commonService.getClientList());
		clientDto.setHighCommCd("100006");

		if(!StringUtils.isEmpty(clientDto.getClientCd())){
			model.addAttribute("commCdList", 	clientService.getCommCdList(clientDto));
		}
		
		return "madm/client/gradeCdList";
	}
	
	@RequestMapping(value = "/modifyGradeCd", method=RequestMethod.POST)
	public void modifyGradeCd(@ModelAttribute ClientDto clientDto) {
		String modiType = clientDto.getModiType();
		if("insert".equals(modiType)){
			clientService.insertGradeCd(clientDto);
		}else if("update".equals(modiType)){
			clientService.modifyGradeCd(clientDto);
		}
	}
	
	@RequestMapping(value = "/ajaxModifyGradeCdUseYn", method=RequestMethod.POST)
	public void ajaxModifyGradeCdUseYn(@ModelAttribute ClientDto clientDto) {
		clientService.ajaxModifyGradeCdUseYn(clientDto);
	}
	
	@RequestMapping(value = "/clientStatusList")
	public String clientStatusList(@ModelAttribute ClientDto clientDto, Model model) {
		setMenu(model);
	    model.addAttribute("clientList", commonService.getClientList());
		model.addAttribute("jedoList", clientService.getClientStatusList(clientDto));
		return "madm/client/clientStatusList";
	}
	
	@RequestMapping(value="/showClientPop", method=RequestMethod.GET)
	public String showCenterPop(@ModelAttribute ClientDto clientDto, Model model) {
		model.addAttribute("client", clientService.getClientStatusList(clientDto));
		return "madm/client/showClientPop";
	}

	@RequestMapping(value="/showAmountPop", method=RequestMethod.GET)
	public String showAmountPop(@ModelAttribute OperationsDto operationsDto, Model model) {
		model.addAttribute("amountlist" , operationsService.getAmountList(operationsDto));
		return "madm/client/showAmountPop";
	}
}
