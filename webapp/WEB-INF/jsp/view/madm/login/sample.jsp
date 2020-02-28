<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
	<head>
		<title></title>
		<script>
			//alert(j$.cookie("idKey"))
		</script>
	</head>
	<body>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<button>관리자만 보일거임</button>
		</sec:authorize>
		 
		<sec:authorize access="hasAnyRole('ROLE_MIDDLE_ADMIN')">
			<button>중간 관리자 및 상위 계층 권한자 보일거임</button>
		</sec:authorize>
		 
		<sec:authorize access="hasAnyRole('ROLE_USER')">
			<button>사용자 및 상위 계층 권한자 보일거임</button>
		</sec:authorize>
		 
		<sec:authorize access="hasAnyRole('ROLE_MIDDLE_ADMIN, ROLE_USER')">
			<button>사용자랑 중간관리자 및 상위 계층 권한자 보일거임</button>
		</sec:authorize>
		
		<br/>
		사용자 아이디: <b><sec:authentication property="principal.user.userId"/></b>
		사용자 이름: <b><sec:authentication property="principal.user.userNm"/></b>
	</body>
</html>


