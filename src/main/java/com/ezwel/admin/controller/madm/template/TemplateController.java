package com.ezwel.admin.controller.madm.template;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.domain.entity.template.Template;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.template.TemplateService;
import com.ezwel.admin.service.template.dto.TemplateDto;
import com.ezwel.core.support.util.StringUtils;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * 발송 SMS 템플릿 컨트롤러
 * 
 * @author starkaby12
 *
 */
@Slf4j
@Controller
@RequestMapping("/madm/template")
public class TemplateController {

	@Resource
	private ClientService clientService;
	
	@Resource
	private TemplateService templateService;
	
	/**
	 * 등록 폼
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/registForm", method=RequestMethod.GET)
	public String registForm(HttpServletRequest request, HttpServletResponse response, 
			Model model, String clientCd) {
		
		log.debug("======================== registForm ==========================");
		
		// 고객사 코드가 있을경우만 조회처리
		if(StringUtils.isNotEmpty(clientCd)) {
			List<Template> list = templateService.getList(new TemplateDto(clientCd));
			
			Map<String, Map<String, List<Template>>> bean = list.stream()
					.collect(Collectors.groupingBy(Template::getCaseNo, Collectors.groupingBy(Template::getCounselNo)));
			
			model.addAttribute("bean", bean);
		}
		
		// 클라이언트 목록 조회
		model.addAttribute("clientList", clientService.getClientList(new ClientDto()));
		model.addAttribute("clientCd", clientCd);
		
		return "madm/template/templateMM";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(HttpServletRequest request, HttpServletResponse response, 
			Model model, TemplateDto dto) {
		
		log.debug("======================== save ==========================");
		
		templateService.save(dto);
		
		return "redirect:/madm/template/registForm?clientCd="+dto.getClientCd();
	}
	
}
