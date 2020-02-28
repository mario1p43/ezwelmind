package com.ezwel.admin.common.support.bean;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.util.Assert;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class GetWebContextBean {
	private static Logger log = LoggerFactory.getLogger(GetWebContextBean.class);
	
	public static Object getWebContextBean(String beanName) {
		return getWebContextBean(beanName, Object.class);
	}
	
	public static <T> T getWebContextBean(String beanName, Class<T> clz) {
		//스프링 빈 가져오기 & casting
		T sBean = null;
		try {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			 
			//HttpSession 객체 가져오기
			HttpSession session = request.getSession();
			 
			//ServletContext 객체 가져오기
			ServletContext context = session.getServletContext();
			 
			//Spring Context 가져오기
			WebApplicationContext wContext = WebApplicationContextUtils.getWebApplicationContext(context);
			 
			sBean = wContext.getBean(beanName, clz);
		} catch (BeansException e) {
			log.error("===== getBean Error", e);
		}
		Assert.notNull(sBean);
		
		return sBean;
	}
	
	
}