<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
	<head>
		<sec:authentication var="sesUser" property="principal.user" />
		<c:if test="${sesUser.userType eq '2001'}">
		<title>마인드어드민 > <decorator:title default=""/></title>
		</c:if>
		<c:if test="${sesUser.userType eq '3001'}">
		<title>파트너어드민 > <decorator:title default=""/></title>
		</c:if>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="robots" content="noindex" />
		<link rel="shortcut icon" href="${url:img('/home/images/layout/favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${url:img('/home/images/layout/apple-touch-icon.png')}">
		<decorator:head />
	</head>
	<body>
		<decorator:body />
		<%@ include file="/WEB-INF/jsp/layout/inc/staticAfter.jspf"%>
	</body>
</html>