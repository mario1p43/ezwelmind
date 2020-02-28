<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page import="com.ezwel.common.web.acl.MenuUtil" %>
<div class="web" >
	<table cellpadding="0" cellspacing="0" border="0" width="100%" style="background: white;">
		<tr>
			<td height="1px" bgcolor="#999999"></td>
		</tr>
		<tr>
			<td height="50px" class="gray02" align="center">Copyright(c) EzwelMind corp. All rights Reserved.</td>
		</tr>
	</table>
</div>
<%=MenuUtil.getFooterMenu(request) %>


<script>
	<!-- 액션 수행후 팝업 (insert, update)-->
	<c:if test="${!empty alertMsg}">
		alert('${alertMsg}');
	</c:if>
</script>