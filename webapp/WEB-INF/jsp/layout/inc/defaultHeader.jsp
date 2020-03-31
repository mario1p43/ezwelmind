<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ezwel.common.web.acl.MenuUtil" %>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<script type="text/javascript">
j$(document).ready(function(){
	
	var chkImsiPwdYn	= $("#chkImsiPwdYn").val();
	var userType 		= $("#userType").val();
	var redirectNo		= $("#redirectNo").val();
	
	if(redirectNo != "Y"){
		if(chkImsiPwdYn == "Y"){
			alert("임시비밀번호를 변경해야 이용 가능합니다.");
			if(userType == "2001"){
				location.href = "/madm/mypage/modifyMyinfo";
			}else{
				location.href = "/partner/mgr/modifyMyInformation";
			}
		}
	}
	
	//파트너 어드민 네이버 톡톡 연동 
	//initTalkBannerConfig();
	//addTalkbannerLoadEvent(initTalkBannerConfig);
	//requestTalkBannerInfo();
	//addTalkbannerLoadEvent(requestTalkBannerInfo);
	
});
</script>
<style>
<!--
	.headerMenu > td {
		font-size: 11pt;
		width: 100px;
	}
-->
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="sesUser" property="principal.user" />
</sec:authorize>
<div class="web">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<c:if test="${sesUser.userType eq '2001'}">
		<td width="1%" style="background:url(${url:img('/admin/head/bg06.jpg')}) repeat-x;"><img src="${url:img('/admin/head/img01.jpg')}" /></td>
		</c:if>
		<c:if test="${sesUser.userType eq '3001'}">
		<td width="1%" style="background:url(${url:img('/admin/head/bg06.jpg')}) repeat-x;"><img src="${url:img('/admin/head/img01_partner.jpg')}" /></td>
		</c:if>
		<td width="99%" align="right" style="background:url(${url:img('/admin/head/bg06.jpg')}) repeat-x;">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="white03">
						Today : <spring:eval expression="T(com.ezwel.core.support.util.DateUtils).getDateFormat('yyyy년 MM월 dd일')" /> <spring:eval expression="T(com.ezwel.core.support.util.DateUtils).getDayOfWeekKor()" />요일</td>
						

<%--	관리자정보 수정 임시주석처리
 					<td width="5px"></td>
					<td><img src="${url:img('/admin/head/button03.jpg')}" /></td>
 --%>
 
 					<td width="5px"></td>

					<sec:authorize access="isAnonymous()">
						<td class="white03" style="padding-top:3px;"><span class="loginBtn" style="font-style:white; text-decoration: none;cursor:pointer;">로그인</span></td>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
							<td width="5px">
								<input type="hidden" id="redirectNo" 	value="${redirectNo }" />
								<input type="hidden" id="chkImsiPwdYn"  value="${sesUser.imsiPwdYn }">
								<input type="hidden" id="userType"   	value="${sesUser.userType}">
							</td>
							<td class="white03 pr10">이름 : ${sesUser.userNm}</td>
							<td class="white03 pr10">아이디 : ${sesUser.userId}</td>
							<td class="white03 pr10">이메일 : ${sesUser.email}</td>
							<td class="white03 pr10">모바일 : ${sesUser.mobile}</td>
							<td class="white03 pr10" >정보 권한 : ${sesUser.userTypeNm}				
							</td>			
							<td style="padding-left:3px;">
							<c:if test="${sesUser.userType eq '2001'}">
								<a href="/madm/mypage/modifyMyinfo"><img src="${url:img('/admin/head/button03.jpg')}" /></a>
							</c:if>
							<c:if test="${sesUser.userType eq '3001'}">
								<a href="/partner/mgr/modifyMyInformation"><img src="${url:img('/admin/head/button03.jpg')}" /></a>
							</c:if>
							</td>
					<%--
						<spring:eval var="authList" expression="T(com.ezwel.admin.service.security.UserDetailsHelper).getAuthorities()"></spring:eval>
							<td style="padding-left:3px;">
								<select>
									<c:forEach var="authStr" items="${authList}">
										<option>${authStr}</option>
									</c:forEach>
								</select>
							</td>
					 --%>
							<td style="padding-left:3px;">
							<c:if test="${sesUser.userType eq '2001'}">
								<a href="/madm/login/logout"><img src="${url:img('/admin/head/button04.jpg')}" /></a>
							</c:if>
							<c:if test="${sesUser.userType eq '3001'}">
								<a href="/partner/login/logout"><img src="${url:img('/admin/head/button04.jpg')}" /></a>
							</c:if>
							</td>
					</sec:authorize>
					<td width="20px"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="70px" style="background:url(${url:img('/admin/head/bg04.jpg')}) repeat-x;">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					<c:if test="${sesUser.userType eq '2001'}">
						<a href="/madm/main/index"><img src="${url:img('/admin/head/img02.jpg')}" border="0" /></a>
					</c:if>
					<c:if test="${sesUser.userType eq '3001'}">
						<a href="/partner/main/index"><img src="${url:img('/admin/head/img02_partner.jpg')}" border="0" /></a>
					</c:if>
					</td>
					<td>
						<%=MenuUtil.getTopMenu() %>						
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="5px" style="background:url(${url:img('/admin/head/bg05.jpg')}) repeat-x;"><img src="${url:img('/admin/head/bg05.jpg')}" border="0" /></td>
	</tr>
</table>
</div>


