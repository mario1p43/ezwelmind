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
<!-- <div class="mobile_nav">
	<ul>
		<li><a href='/partner/main/index'><img src="/resources/img/home_icon.png"><p>홈</p></a></li>
		<li><a href='/partner/pCounselorMgr/totalSchedule'><img src="/resources/img/consulting_icon.png"><p>개인상담관리</p></a></li>
		<li><a href='/partner/pCounselorMgr/counselFixList'><img src="/resources/img/re_list_icon.png"><p>예약확정현황</p></a></li>
		<li><a href='/partner/bbsNotice/list?bbsCd=notice&serviceType=PARTNER'><img src="/resources/img/comunity_icon.png"><p>커뮤니티</p></a></li>
		<li><a href='/partner/payCheck/payCheckList'><img src="/resources/img/calculate_icon.png"><p>정산</p></a></li>
	</ul>
</div> -->
<%=MenuUtil.getFooterMenu(request) %>
<script>
	<!-- 액션 수행후 팝업 (insert, update)-->
	<c:if test="${!empty alertMsg}">
		alert('${alertMsg}');
	</c:if>
</script>