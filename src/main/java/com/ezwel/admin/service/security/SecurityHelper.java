package com.ezwel.admin.service.security;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.ezwel.core.support.util.StringUtils;

public class SecurityHelper {

	/**
	 * Spring Security
	 * @param request
	 * @param auth
	 * @auther ddakker 2014. 7. 24.
	 */
	public static void setSpringSecurityContext(HttpServletRequest request, HttpServletResponse response, Authentication auth){
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(auth);
		HttpSession session = request.getSession();
		session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
	}

	/**
	 * 
	 * @param request
	 * @return
	 * @auther ddakker 2014. 8. 1.
	 */
	public static void setTempGroupWareId(HttpServletRequest request, String tempLoginId) {
		request.getSession().setAttribute("setTempGroupWareId", tempLoginId);
	}

	/**
	 * 
	 * @param request
	 * @auther ddakker 2014. 7. 24.
	 */
	public static String getGroupWareId(HttpServletRequest request) {
		String gwUserId = "";	//

		String cookieStr = "";
		Enumeration headers = request.getHeaderNames();
	    while (headers.hasMoreElements()) {
	        String headerName    = (String)headers.nextElement();
	        if ("cookie".equals(headerName)) {
	        	cookieStr = request.getHeader(headerName);
	        	break;
	        }
	    }
	    int gwLoginInfoIdx = cookieStr.indexOf("LoginInfo");
	    if (gwLoginInfoIdx > -1) cookieStr = cookieStr.substring(gwLoginInfoIdx);

	    int gwLoginuserIDIdx = cookieStr.indexOf("userID");
	    if (gwLoginuserIDIdx > -1) cookieStr = cookieStr.substring(gwLoginuserIDIdx + 7);

	    int gwEndIdx = cookieStr.indexOf("&");
	    if (gwEndIdx > -1) gwUserId = cookieStr.substring(0, gwEndIdx);

	    String tempLoginId = (String) request.getSession().getAttribute("setTempGroupWareId");
	    if (StringUtils.isNotEmpty(tempLoginId)) {
	    	gwUserId = tempLoginId;
	    }

	    return gwUserId;
	}
}
