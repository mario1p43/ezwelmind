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
			alert("임시비밀번호를 변경해야 이용 가능합니다. \n임시비밀번호를 변경하였을 경우 재로그인 해주세요.");
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

</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="sesUser" property="principal.user" />
</sec:authorize>
<div class="web">
	<div class="top" style="height:40px; width:100%; position:relative; background:#004B85;">
		<div class="top_container">
			
			<c:if test="${sesUser.userType eq '2001'}">
				<div class="admin_system">EZWELLNESS Admin System</div>
			</c:if>
			<c:if test="${sesUser.userType eq '3001'}">
				<div class="admin_system">EZWELLNESS Partner Admin System</div>
			</c:if>
						
			<!-- <a style=">EZWELLNESS Partner Admin System</a> -->
			<div class="user_info_container">
				
				<div class="t_text">
					Today : <spring:eval expression="T(com.ezwel.core.support.util.DateUtils).getDateFormat('yyyy년 MM월 dd일')" /> <spring:eval expression="T(com.ezwel.core.support.util.DateUtils).getDayOfWeekKor()" />요일
				</div>
				
				<sec:authorize access="isAnonymous()">
					<td class="white03" style="padding-top:3px;"><span class="loginBtn" style="font-style:white; text-decoration: none;cursor:pointer;">로그인</span></td>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<div class="t_text">
						<input type="hidden" id="redirectNo" 	value="${redirectNo }" />
						<input type="hidden" id="chkImsiPwdYn"  value="${sesUser.imsiPwdYn }">
						<input type="hidden" id="userType"   	value="${sesUser.userType}">
					</div>
					<div class="t_text">이름 : ${sesUser.userNm}</div>
					<div class="t_text">아이디 : ${sesUser.userId}</div>
					<div class="t_text">이메일 :${sesUser.email}</div>
					<div class="t_text">모바일 : ${sesUser.mobile}</div>
					<div class="t_text">정보 권한 : ${sesUser.userTypeNm}</div>
					<span style="position:relative; right:0;">
						<c:if test="${sesUser.userType eq '2001'}">
							<a href="/madm/mypage/modifyMyinfo" class="b_text mr16 text_deco_none" style="color:#fff;">개인정보관리</a>
						</c:if>
						<c:if test="${sesUser.userType eq '3001'}">
							<a href="/partner/mgr/modifyMyInformation" class="b_text mr16 text_deco_none" style="color:#fff;">개인정보관리</a>
						</c:if>
						

						<c:if test="${sesUser.userType eq '2001'}">
							<a href="/madm/login/logout" class="b_text mr24 text_deco_none" style="color:#fff;">로그아웃</a>
						</c:if>
						<c:if test="${sesUser.userType eq '3001'}">
							<a href="/partner/login/logout" class="b_text mr24 text_deco_none" style="color:#fff;">로그아웃</a>
						</c:if>
					</span>
				</sec:authorize>
			</div>
		</div>
	</div>
	<table class="header_menu">
		<tr>
			<td>
			<c:if test="${sesUser.userType eq '2001'}">
				<a href="/madm/main/index"><img src="${url:img('/admin/head/img02.jpg')}" border="0" /></a>
			</c:if>
			<c:if test="${sesUser.userType eq '3001'}">
				<a href="/partner/main/index"><img></a>
			</c:if>
			</td>
			<td>
				<%=MenuUtil.getTopMenu() %>						
			</td>
		</tr>
	</table>
</div>


