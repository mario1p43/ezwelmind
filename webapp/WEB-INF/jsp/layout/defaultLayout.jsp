<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page import="com.ezwel.common.web.acl.MenuUtil" %>
<!DOCTYPE html>
<html lang="ko">
<script>
var millisecondsToWait = 1800000;
setTimeout(function() {
   $(".popupBox").css("display","block");
	$(".popupBox").slideDown(3000);
}, millisecondsToWait);

function closeBtnLogoutPop(){
	$(".popupBox").css("display","none");
}
</script>

	<head>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="sesUser" property="principal.user" />
			<c:if test="${sesUser.userType eq '2001'}">
			<title>마인드어드민 > <decorator:title default=""/></title>
			</c:if>
			<c:if test="${sesUser.userType eq '3001'}">
			<title>파트너어드민 > <decorator:title default=""/></title>
			</c:if>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<title>어드민 > <decorator:title default=""/></title>
		</sec:authorize>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="robots" content="noindex" />
		<link rel="shortcut icon" href="${url:img('/home/images/layout/favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${url:img('/home/images/layout/apple-touch-icon.png')}">
		<link href="${url:img('/css_js/admin_css.css')}" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
		<%@ include file="/WEB-INF/jsp/layout/inc/staticBefore.jspf"%>

		<decorator:head />
	</head>
	<style>
	.popupBox{
		display: none;
		background:white;
		position: fixed;
		right: 1px;
	    bottom: 52px;
	    border: 1px solid gray;
	    font-size: 15px;
	    text-align: center;
	}
	.closeBtnPopupLogout{
	    position: absolute;
	    right: 10px;
	    top: 10px;
	    cursor: pointer;
	    font-weight: bold;
	}
	.mainPopupLogout{
		padding:30px;
		width: 200px;
    	height: 100px;
	}
	</style>
	<div class="popupBox">
		<div class="closeBtnPopupLogout" onclick="closeBtnLogoutPop()">X</div>
		<div class="mainPopupLogout">5분후에 로그아웃 됩니다.</div>
		
	</div>
	
	<body onload='<decorator:getProperty property="body.onload" />' > <!--bgcolor="#FFFFFF" topmargin="0" leftmargin="0" rightmargin="0"-->
		<!-- Head 영역 START-->
					
		<jsp:include page="<%=MenuUtil.selectTopMenu(request) %>" />
		<!-- Head 영역 START-->

		<table class="main_section" width="100%" height="100%"> <!-- cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" -->
			<tr class="main_wrap"> <!-- valign="top" -->
			<c:choose>
				<c:when test="${not empty menu}">

				<jsp:include page="<%=MenuUtil.naverTalk(request) %>" />
				
					<td class="main_content"> <!--  width="99%" style="background:url(${url:img('/admin/common/bg03.jpg')}) repeat-x;" -->
					<!-- 메인 영역 start -->
					<table width="100%">
						<tr>
							<td><decorator:body /></td>
						</tr>
						<tr>
							<td ></td><!-- height="30px" -->
						</tr>
					</table>
					<!-- 메인 영역 END-->
				</td>
				</c:when>
				<c:otherwise>
					<td class="main_droppage"> <!--  valign="top" style="padding-left:15px; min-height: 600px;" -->
					<!-- 메인 영역 start -->
					<table width="100%">
						<tr>
							<td><decorator:body /></td>
						</tr>
						<tr>
							<td></td> <!--  height="30px" -->
						</tr>
					</table>
					<!-- 메인 영역 END-->
				</td>
				</c:otherwise>
			</c:choose>
			</tr>
		</table>
		<div ></div><!-- class="clear_both h50" -->
		<%@ include file="/WEB-INF/jsp/layout/inc/staticAfter.jspf"%>
	</body>
	<footer>
		<!-- footer 영역 start -->
		<jsp:include page="/WEB-INF/jsp/layout/inc/defaultFooter.jsp" />
		<!-- footer 영역 END-->
	</footer>

</html>