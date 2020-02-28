package com.ezwel.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.commonController;
import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.security.EzUserDetailsServiceImpl;
import com.ezwel.core.support.util.UrlUtil;

@Controller
public class CommonLoginController extends commonController{
	private static Logger log = LoggerFactory.getLogger(CommonLoginController.class);
	
	@Resource
	private GlobalsProperties globalsProperties;

	@Resource
	private EzUserDetailsServiceImpl ezUserDetailsService;

	@RequestMapping(value="/")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		if (UserDetailsHelper.isAuthenticated()) {
			/**
			 * cp도메인 여부체크하여서 cp도메인 로그인 성공이면 cp메인
			 * 그외에는 어드민 메인으로 
			 */
			
			if (globalsProperties.getProperty("cp.site.code").equals(UrlUtil.getUrlClientCd(request))) {
				return "redirect:/partner/main/index";
			} else {
				return "redirect:/madm/main/index";
			}
		} else {
			return "redirect:" + globalsProperties.getProperty("page.login.form.url");
		}
	}
	
	
/*	@Scheduled(fixedDelay = 6000)
	public void simplePrintln()throws Exception{
		System.out.println("스케줄링 테스트");
	}  
	*/
	
	
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
		
		 String login = request.getParameter("login");
		 if(login.equals("partner")) {
			 if(isDevice(request) ==IS_PC) {
				 return "partner/login/loginForm";
			 }else {
				 return "partner/login/loginForm_mo";
			 }
			 
		 }else {
			 return "madm/login/loginForm";
		 }
		
		//TODO: 테스트 동안만 열어두는 것임
/*		if (globalsProperties.getProperty("cp.site.code").equals(
				UrlUtil.getUrlClientCd(request))) {
			return "partner/login/loginForm";
		} else {
			return "madm/login/loginForm";
		}*/
		
	}
	
	
	@RequestMapping(value="/login/test")
	public String formTest(Model model, HttpServletRequest request) {
		
		/**
		 * 도메인 cp사이트 여부 체크해서 cp도메인이면
		 * cp로그인 폼으로 그외에는 일반 어드민 폼으로
		 */
		//TODO: 테스트 동안만 열어두는 것임
		
		return "madm/login/loginForm";


		
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

		//TODO: 테스트 동안만 열어두는 것임
/*		if (globalsProperties.getProperty("cp.site.code").equals(
				UrlUtil.getUrlClientCd(request))) {*/
			model.addAttribute("alertMsg", "로그인에 성공했습니다.");
			return "redirect:/partner/main/index";
/*		} else {
			return "redirect:/madm/main/index";
		}*/
		
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