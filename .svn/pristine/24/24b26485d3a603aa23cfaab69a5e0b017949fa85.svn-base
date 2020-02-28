package com.ezwel.admin.controller.madm.popup;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.popup.InvPopup;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.popup.PopupService;
import com.ezwel.admin.service.popup.dto.InvPopupDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.JsonUtils;
import com.fasterxml.jackson.core.JsonProcessingException;


@Controller
@RequestMapping("/madm/popupManage")
public class PopupController {	
	
	@Resource
	CommonService commonService;
	
	@Resource
	PopupService popupService;
	
	@Resource
	ClientService clientService;
 	
	private void setMenu(Model model) {
		String menuStr ="프로모션";
		model.addAttribute("menu", menuStr);
	}

	
	@RequestMapping(value="/popupMain")
	public String bnrManage(@ModelAttribute InvPopupDto invPopupDto, Model model) {
		CommonDto commonDto = new CommonDto();
		
		setMenu(model);
		commonDto.setHighCommCd("100384");
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
		model.addAttribute(popupService.getPopupList(invPopupDto));
		return "madm/popup/popupManage";
	}
	
	@RequestMapping(value="/addPopupForm")
	public String addPopupForm(Model model) {
		CommonDto commonDto = new CommonDto();
		
		setMenu(model);
		commonDto.setHighCommCd("100384");
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
		model.addAttribute("clientList",  commonService.getClientList());
		return "madm/popup/addPopup";
	}

	@RequestMapping(value="/addPopup")
	public String addPopup(@ModelAttribute InvPopupDto invPopupDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		invPopupDto.setRegId(manager.getUserId());
		
		popupService.insertPopup(invPopupDto);
		model.addAttribute("popupDetail", popupService.modifyPopupDetail(invPopupDto));
		
		setMenu(model);
		return "redirect:/madm/popupManage/popupMain";
	}
	
	@RequestMapping(value="/modifyPopupDetail", method=RequestMethod.GET)
	public String popupDetail(@ModelAttribute InvPopupDto invPopupDto, Model model) {
		model.addAttribute("popupDetail", popupService.modifyPopupDetail(invPopupDto));
		model.addAttribute("clientList",  popupService.getClientList(invPopupDto));
		setMenu(model);
		return "madm/popup/modifyPopupDetail";
	}
	
	@RequestMapping(value="/modifyPopupDetail", method=RequestMethod.DELETE)
	public String popupDelete(@ModelAttribute InvPopupDto invPopupDto, Model model) {
		popupService.modifyPopupDelete(invPopupDto);
		setMenu(model);
		return "redirect:/madm/popupManage/popupMain";
	}
	
	@RequestMapping(value="/modifyPopupDetail", method=RequestMethod.POST)
	public String popupUpdate(@ModelAttribute InvPopupDto invPopupDto, Model model, HttpServletRequest request,	MultipartHttpServletRequest mhsq) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		invPopupDto.setModiId(manager.getUserId());
		
		popupService.modifyPopupUpdate(invPopupDto);
		
		setMenu(model);
		return "redirect:/madm/popupManage/popupMain";
	}
	
//	고객사 정보 조회/저장 (IBSheet7) 시작 - sample(clientController -> clientJsonList)
	@RequestMapping(value="/insertClientCd", method=RequestMethod.POST)
	public void insertClientCd(@ModelAttribute InvPopupDto invPopupDto, Model model) {
		String popupSeq = invPopupDto.getPopupSeq();
		
		if(!invPopupDto.getClientCd().isEmpty()){
			for(String str : invPopupDto.getClientCd().split(",")){
				if(!str.isEmpty()){
					popupService.insertClientCd(popupSeq, str);
				}
			}
		}
	}
	
	@RequestMapping(value="/modifyClientCd", method=RequestMethod.POST)
	public void modifyClientCd(@ModelAttribute InvPopupDto invPopupDto, Model model) {
		String popupSeq = invPopupDto.getPopupSeq();
		popupService.deleteClientCd(popupSeq);
		
		if(!invPopupDto.getClientCd().isEmpty()){
			for(String str : invPopupDto.getClientCd().split(",")){
				if(!str.isEmpty()){
					popupService.insertClientCd(popupSeq, str);
				}
			}
		}
	}
	
	/**
	 * Client 데이터를 json으로 처리
	 *
	 * @param model
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/clientJsonList", produces="text/plain;charset=UTF-8")
	public @ResponseBody Object getClientJsonList(@ModelAttribute InvPopupDto invPopupDto) throws JsonProcessingException {
		List<InvPopup> clientList = popupService.getClientList(invPopupDto);

		String result = "";
		if (clientList != null) {
			result = JsonUtils.jsonIBSheetToString(clientList);
		}

		return result;
	}	
//	고객사 정보 조회/저장 (IBSheet7) 종료
	
}