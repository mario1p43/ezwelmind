package com.ezwel.admin.controller.madm.client;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezwel.admin.domain.entity.client.ClientCommCd;
import com.ezwel.admin.service.client.ClientDivisionService;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.client.dto.ClientDivisionDto;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.core.support.util.JsonUtils;

@Controller
@RequestMapping("/madm/counselTopic/")
public class ClientCounselTopicController {
	
	@Resource
	private ClientService clientService;
	
	@Resource
	private ClientDivisionService clientDivisionService;
	
	
	private void setMenu(Model model) {
		String menuStr ="고객사";
		model.addAttribute("menu", menuStr);
	}
	
	
	/**
	 * 부서관리 메인페이지
	 * @param clinetCd
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/topicMain")
	public String menuManager(String clientCd, Model model) {
		setMenu(model);
		
 		model.addAttribute("clientList", clientService.getClientList(new ClientDto()));
		model.addAttribute("clientCd", clientCd);
		
		return "madm/client/topic/topicMain";
	}
	
	/**
	 * 부서관리 데이터 트리를 얻음
	 * @param menuGroup
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/topicMain/init")
	public ModelAndView getMenuList(String clientCd, Model model) {
		ModelAndView mv = new ModelAndView();
		
		ClientDto clientDto = new ClientDto();
		clientDto.setClientCd(clientCd);
		clientDto.setOptionCd("topic");
		List<ClientCommCd> divisionList = clientService.getCommCdList(clientDto);

		mv.addObject("divisionMaxCd", clientService.getMaxClientCommCd(clientCd));
		
		if (divisionList.size() != 0)
			mv.addObject("josonData", JsonUtils.convertorTreeMap(divisionList, "102000", "commCd", "highCommCd", "commNm", "orderNo"));
		else
			mv.addObject("josonData", "");
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	/**
	 * 메뉴 저장하기 늘르면 실행
	 * @param menuDto
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add")
	public String addMenuTree(@ModelAttribute ClientDivisionDto clientDivisionDto) throws Exception {
		clientDivisionService.addTopicTree(clientDivisionDto);
		return "redirect:/madm/counselTopic/topicMain?clientCd=" + clientDivisionDto.getClientCd();
	}
}
