package com.ezwel.admin.service.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.core.security.EzUserDetails;

public class UserDetailsHelper {
	private static Logger log = LoggerFactory.getLogger(UserDetailsHelper.class);

		/**
		 * 
		 * @return Object -
		 * @auther ddakker 2014. 6. 12.
		 */
		public static Manager getAuthenticatedUser() {
			SecurityContext context = SecurityContextHolder.getContext();
			Authentication authentication = context.getAuthentication();

			if (authentication == null) {
				return null;
			}
			EzUserDetails details = (EzUserDetails) authentication.getPrincipal();

			return (Manager) details.getUser();
		}

		/**
		 * 
		 *
		 * @return
		 * @auther ddakker 2014. 6. 12.
		 */
		public static List<String> getAuthorities() {
			List<String> listAuth = new ArrayList<String>();

			SecurityContext context = SecurityContextHolder.getContext();
			Authentication authentication = context.getAuthentication();

			if (authentication == null) {
				return null;
			}

			for( GrantedAuthority authoritie : authentication.getAuthorities() ){
				listAuth.add(authoritie.getAuthority());
			}

			return listAuth;
		}

		public String AuthentName() {
			String aa="fff";
			return aa;
		}
		
		/**
		 * 
		 * 
		 * @auther ddakker 2014. 6. 12.
		 */
		public static Boolean isAuthenticated() {
			SecurityContext context = SecurityContextHolder.getContext();
			Authentication authentication = context.getAuthentication();

			if (authentication == null) {
				return Boolean.FALSE;
			}

			String username = authentication.getName();
			if (username.equals("anonymousUser")) {
				return Boolean.FALSE;
			}

			return authentication.getPrincipal()!=null;
		}
}
