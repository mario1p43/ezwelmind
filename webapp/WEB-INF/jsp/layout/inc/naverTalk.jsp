<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page import="com.ezwel.common.web.acl.MenuUtil" %>
				<td class="web" width="1%" style="padding-right:20px;background:url(${url:img('/admin/common/bg01.jpg')}) repeat-y;" style="min-height: 600px;">
					<table cellpadding="0" cellspacing="0" border="0" width="166px">
						<!-- Left 메뉴영역 start -->

					<jsp:include page="/WEB-INF/jsp/layout/inc/defaultLeftMenu.jsp" />
					<!-- Left 메뉴영역 END-->
					</table>
					<!-- 파트민 어드민의 경우 메뉴 하단에 네이버 톡톡 연동 start-->
					<sec:authorize access="isAuthenticated()">
						<sec:authentication var="sesUser" property="principal.user" />
						<c:if test="${sesUser.userType eq '3001'}">
							<div class="web">
								<div class="talk_banner_div" data-id="41666"></div>
								<div class="talk_banner_div" data-id="34517"></div>
							</div>
						</c:if>
					</sec:authorize>
					<!-- 파트민 어드민의 경우 메뉴 하단에 네이버 톡톡 연동 END-->
				</td>


