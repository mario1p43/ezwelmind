package com.ezwel.common.web.acl;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ezwel.admin.common.support.bean.GetWebContextBean;
import com.ezwel.admin.domain.entity.menu.MenuVo;
import com.ezwel.admin.persist.menu.MenuMapper;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.commonController;
import com.ezwel.core.support.util.StringUtils;


public class MenuUtil extends commonController{
private static Logger log = LoggerFactory.getLogger(MenuUtil.class);

	public static String selectTopMenu(HttpServletRequest request) {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		if(isDevice(httpRequest) == IS_PC) {
			//return "<jsp:include page='/WEB-INF/jsp/layout/inc/defaultHeader.jsp' />";
			return "/WEB-INF/jsp/layout/inc/defaultHeader.jsp";
		}else {
			return "/WEB-INF/jsp/layout/inc/defaultHeader_mo.jsp";
		}
	}
	
	public static String naverTalk(HttpServletRequest request) {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		if(isDevice(httpRequest) == IS_PC) {
			//return "<jsp:include page='/WEB-INF/jsp/layout/inc/defaultHeader.jsp' />";
			return "/WEB-INF/jsp/layout/inc/naverTalk.jsp";
		}else {
			return "";
		}
	}
	

	public static String getTopMenu() {
		
		MenuMapper menuMapper = (MenuMapper)GetWebContextBean.getWebContextBean("menuMapper");
		
		HashMap<String, Object> map = null;
		
		map = setMenuSearchParam();
		
		if(map == null) {
			return "";
		}
		
		List<MenuVo> menuList = menuMapper.getTopMenu(map);
		
			if(menuList.size() > 0) {
				StringBuffer sb = new StringBuffer();
				MenuVo menuVo = new MenuVo();
				
				sb.append("<table>");
				sb.append("<tr class='headerMenu'>");
				for(int i=0; i < menuList.size(); i++){
					menuVo = menuList.get(i);
					sb.append("<td"+ ("Y".equals(menuVo.getDispYn()) ? "" : "style='display:none' ") +"><a href='"+menuVo.getMenuUrl()+"'>"+menuVo.getMenuNm()+"</a></td>");
				}
				sb.append("</tr>");
				sb.append("</table>");
				return sb.toString();
			}
		
		 return "";
	}
	
	public static String getFooterMenu(ServletRequest request) {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		if(isDevice(httpRequest) == IS_PC) {

		}else {
			StringBuffer sb = new StringBuffer();
						
			sb.append("<div class='mobile_nav'>");
			sb.append("<ul>");
			sb.append("<li><a href='/partner/main/index'><img src='/resources/img/home_icon.png'><p>홈</p></a></li>");
			sb.append("<li><a href='/partner/pCounselorMgr/totalSchedule'><img src='/resources/img/consulting_icon.png'><p>개인상담관리</p></a></li>");
			sb.append("<li><a href='/partner/pCounselorMgr/counselFixList'><img src='/resources/img/re_list_icon.png'><p>예약확정현황</p></a></li>");
			sb.append("<li><a href='/partner/bbsNotice/list?bbsCd=notice&serviceType=PARTNER'><img src='/resources/img/comunity_icon.png'><p>커뮤니티</p></a></li>");
			sb.append("<li><a href='/partner/payCheck/payCheckList'><img src='/resources/img/calculate_icon.png'><p>정산</p></a></li>");
			sb.append("</ul>");
			sb.append("</div>");
			
			
			return sb.toString();
		}
		return "";
	}
	
	
	public static String getLeftMenu(ServletRequest request) {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		if(isDevice(httpRequest) == IS_PC) {
			String levelCd = "";
			String menuUrl = httpRequest.getRequestURI();
			String menuQueryString = StringUtils.chkNull(httpRequest.getQueryString(), "");
			
			List<String> authList = UserDetailsHelper.getAuthorities();
			String userType = UserDetailsHelper.getAuthenticatedUser().getUserType();
			MenuMapper menuMapper = (MenuMapper)GetWebContextBean.getWebContextBean("menuMapper");
			
			ArrayList<String> highLevelCdList = new ArrayList<String>();
			List<MenuVo> menuList = null;
			HashMap<String, Object> map = null;
			StringBuffer sb = new StringBuffer();
			
			Cookie[] cookies = httpRequest.getCookies();
			
			if(cookies != null) {
				for(int i=0; i < cookies.length; i++) {
					System.out.println("cookies : " + cookies[i].getName());
					if("SANGDAM4U_ADMIN_MENULEVELCD".equals(cookies[i].getName())) {
						levelCd = cookies[i].getValue();
					}
				}
			}
			
			//param setting
			map = setMenuSearchParam();
			
			// 현재 URL로 menuCd 가져와서 최상위 levelCd 셋팅하기
			if(!"".equals(menuQueryString)) {
				menuUrl += "?" + menuQueryString;
			}
			map.put("menuUrl", menuUrl);
			menuList = menuMapper.getLeftMenu(map);
			map.remove("menuUrl");
			
			if(menuList.size() > 0) {
				while(!"0".equals(menuList.get(0).getHighLevelCd())) {
					map.put("levelCd", menuList.get(0).getHighLevelCd());
					menuList = menuMapper.getLeftMenu(map);
				}
				levelCd = menuList.get(0).getLevelCd();
			}
			map.put("levelCd", levelCd);
			map.put("authCdList", authList);
			
			
			//depth 4 까지 메뉴검색
			for(int i=0; i < 4; i++) {
				menuList = menuMapper.getLeftMenu(map);
				highLevelCdList.clear();
				for(int j=0; j < menuList.size(); j++) {
					highLevelCdList.add(menuList.get(j).getLevelCd());
				}
				
				map.put("highLevelCdList", highLevelCdList);
			}
			
			/*
			 *  Html 만들기
			 */
			String title1depth = "";
			ArrayList<MenuVo> list2depth = new ArrayList<MenuVo>();
			ArrayList<MenuVo> list3depth = new ArrayList<MenuVo>();
			ArrayList<MenuVo> list4depth = new ArrayList<MenuVo>();
			MenuVo menuVo= null;
			
			for(int i=0; i < menuList.size(); i++) {
				menuVo = menuList.get(i);
				// 1depth 
				if("1".equals(menuVo.getDepth())) {
					title1depth = menuVo.getMenuNm();
				}else if("2".equals(menuVo.getDepth())) {
					list2depth.add(menuVo);
				}else if("3".equals(menuVo.getDepth())) {
					list3depth.add(menuVo);
				}else if("4".equals(menuVo.getDepth())) {
					list4depth.add(menuVo);
				}
			}
			
			String levelCd2 = "";
			String levelCd3 = "";
			
			for(int i=0; i < list2depth.size(); i++) {
				menuVo = list2depth.get(i);
				levelCd2 = menuVo.getLevelCd();
				
				// 2가지 형태의 LEFT 메뉴가 존재한다.
				// 온마음 추가 - jerrykim
				// 모바일관리 추가 - hundeok yoon
				if("법인홈페이지".equals(menuVo.getMenuNm()) || "상담포유".equals(menuVo.getMenuNm()) || "온마음".equals(menuVo.getMenuNm()) || "휴센터".equals(menuVo.getMenuNm()) || "모바일관리".equals(menuVo.getMenuNm())){
					// class='menu'
					sb.append("<tr class='side_menu'>");
					//   height='50px' align='center' style=\"background:url(//img.ezwelmind.co.kr/admin/common/bg02.jpg) repeat-x;\" class='white02'
					sb.append("<td>");
					//   href='javascript:void(0);'><strong style='color: white;' </strong>
					sb.append("		<a>"+menuVo.getMenuNm()+"</a>");
					sb.append("</td>");
					sb.append("</<tr>");
					sb.append("<tr>");
					// height='10px'
					sb.append("<td></td>");
					sb.append("</tr>");
					sb.append("<tr>");
					// valign='top' style='padding-left:15px;'
					sb.append("<td>");
					sb.append("<table>");
					
					// 3depth
					for(int j=0; j < list3depth.size(); j++) {
						menuVo = list3depth.get(j);
						
						if(levelCd2.equals(menuVo.getHighLevelCd())) {
							levelCd3 = menuVo.getLevelCd();
							sb.append("<tr "+ ("Y".equals(menuVo.getDispYn()) ? "" : "style='display:none' ") +"><td class='submenu01'><a href='"+menuVo.getMenuUrl()+"' >"+menuVo.getMenuNm()+"</a></td></tr>");
							// 4depth
							for(int k=0; k < list4depth.size(); k++) {
								menuVo = list4depth.get(k);
								if(levelCd3.equals(menuVo.getHighLevelCd())) {
									sb.append("<tr "+ ("Y".equals(menuVo.getDispYn()) ? "" : "style='display:none' ") +"><td class='submenu01_01'><a href='"+menuVo.getMenuUrl()+"' >"+menuVo.getMenuNm()+"</a></td></tr>");
								}
							}
							sb.append("<tr><td height='10px'><td></td></tr>");
						}
					}
					sb.append("<input type='hidden' name='left_menu_levelCd' id='left_menu_levelCd' value='"+levelCd+"'>");
					sb.append("</table>");
					sb.append("</td>");
					sb.append("</tr>");
					
				}else{
					// 기본형
					if(i == 0){
						sb.append("<tr class='side_menu'>");  /*class='menu'*/  
						sb.append("<td>");  /*height='50px' align='center' style=\"background:url(//img.ezwelmind.co.kr/admin/common/bg02.jpg) repeat-x;\" class='white02'
*/						sb.append("		<a href='javascript:void(0);'>"+title1depth+"</a>"); /*<strong style='color: white;'> </strong>*/
						sb.append("</td>");
						sb.append("</tr>");
						
						sb.append("<tr>");
						sb.append("<td></td>");  /*height='10px'*/
						sb.append("</tr>");`
						
						sb.append("<tr>");
						sb.append("<td>");  /*valign='top' style='padding-left:15px;'*/
						sb.append("<table>");
					}
					
					if(levelCd.equals(menuVo.getHighLevelCd())) {
						levelCd2 = menuVo.getLevelCd();
						sb.append("<tr "+ ("Y".equals(menuVo.getDispYn()) ? "" : "style='display:none' ") +"><td class='submenu01'><a href='"+menuVo.getMenuUrl()+"' >"+menuVo.getMenuNm()+"</a></td></tr>");
						// 3depth
						for(int k=0; k < list3depth.size(); k++) {
							menuVo = list3depth.get(k);
							if(levelCd2.equals(menuVo.getHighLevelCd())) {
								sb.append("<tr "+ ("Y".equals(menuVo.getDispYn()) ? "" : "style='display:none' ") +"><td class='submenu01_01'><a href='"+menuVo.getMenuUrl()+"' >"+menuVo.getMenuNm()+"</a></td></tr>");
							}
						}
						sb.append("<tr><td height='10px'><td></td></tr>");
					}
					
					if(i == list2depth.size()-1) {
						sb.append("<input type='hidden' name='left_menu_levelCd' id='left_menu_levelCd' value='"+levelCd+"'>");
						sb.append("</table>");
						sb.append("</td>");
						sb.append("</tr>");
					}
				}
			}
			return sb.toString();
		}
		//if(isDevice(httpRequest) == IS_PC) {
			
		/*}*/
		return "";
	}
	
	
	/*********************************
	 * 사용자별 메뉴검색을 위한 셋팅
	 ********************************/
	public static HashMap<String, Object> setMenuSearchParam() {
		List<String> authList = UserDetailsHelper.getAuthorities();
		String userType = UserDetailsHelper.getAuthenticatedUser().getUserType();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(authList.size() < 1) {
			return null;
		}
		
		// 로그인별 메뉴검색 하드코딩
		if("2001".equals(userType)) {
			map.put("authList",authList);
			map.put("menuLevelGroup","AdminMaster");
			map.put("menuCdGroup","madm");
		}else if("3001".equals(userType)) {
			map.put("authList",authList);
			map.put("menuLevelGroup","PartnerMaster");
			map.put("menuCdGroup","partner");
		}else{
			map.put("authList",authList);
			map.put("menuLevelGroup","AdminMaster");
			map.put("menuCdGroup","madm");
		}
		return map;
	}
}
