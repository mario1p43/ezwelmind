package com.ezwel.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.commonController;
import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.security.EzUserDetailsServiceImpl;
import com.ezwel.core.support.util.UrlUtil;

@Controller
public class CommonLoginController extends commonController {
	private static Logger log = LoggerFactory.getLogger(CommonLoginController.class);
	
	@Resource
	private GlobalsProperties globalsProperties;

	@Resource
	private EzUserDetailsServiceImpl ezUserDetailsService;

	@Resource
	private CommonService commonService;

	@RequestMapping(value="/")
	public String index(HttpServletRequest request, Model model) {
		if (UserDetailsHelper.isAuthenticated()) {
			/**
			 * cp도메인 여부체크하여서 cp도메인 로그인 성공이면 cp메인
			 * 그외에는 어드민 메인으로 
			 */
			if (globalsProperties.getProperty("cp.site.code").equals(UrlUtil.getUrlClientCd(request))) {
				String userMobile = commonService.getUserMobile();
		        
				
				commonService.setConfirmNumberIntoSession(request.getSession(),userMobile);
				return "redirect:/partner/main/confirmnumberview";
			} else {
				return "redirect:/madm/main/index";
			}
		} else {
			return "redirect:" + globalsProperties.getProperty("page.login.form.url");
		}
	}
	
	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login/form")
	public String form(Model model, HttpServletRequest request) {
		
		/**
		 * 도메인 cp사이트 여부 체크해서 cp도메인이면
		 * cp로그인 폼으로 그외에는 일반 어드민 폼으로
		 */
		if (globalsProperties.getProperty("cp.site.code").equals(
				UrlUtil.getUrlClientCd(request))) {
			
			if(isDevice(request) == IS_PC) {
				return "partner/login/loginForm";
			}else {
				return "partner/login/loginForm_mo";
			}
			
			
		} else {
			return "madm/login/loginForm";
		}
		
	}
	

	/**
	 * 
	 * @param principal
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login/success")
	public String success(HttpServletRequest request, Model model) {
		
		/**
		 * cp도메인 여부체크하여서 cp도메인 로그인 성공이면 cp메인
		 * 그외에는 어드민 메인으로 
		 */
		if (globalsProperties.getProperty("cp.site.code").equals(
				UrlUtil.getUrlClientCd(request))) {
			return "redirect:/partner/main/index";
		} else {
			return "redirect:/madm/main/index";
		}
		
	}
	
	@RequestMapping(value="/test")
	public String test(HttpServletRequest request, Model model) {
		return "redirect:/test2?tes1t=1&test2=2";
	}
	
	@RequestMapping(value="/test2")
	public String test2(HttpServletRequest request, Model model) {
		return "madm/login/loginForm";
	}

}