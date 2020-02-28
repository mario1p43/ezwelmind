<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<script>
	j$(document).ready(function(){
	});
</script>

<div style="overflow-x: hidden; overflow-y: scroll; ">

<table cellpadding="5" cellspacing="0" border="1px solid silver" style="border-collapse:collapse; width:1024px; min-height: 600px;" >
	<tr align="center" height="50px">
		<th >상담유형</th>
		<th >상담분야</th>
		<th >대면상담</th>
		<th >전화상담</th>
		<th >1:1 게시판 상담</th>
	</tr>
	
	<c:forEach var="list" items="${amountlist}" varStatus="status">
		<tr align="center" height="30px">
		<c:choose>
			<c:when test="${list.highCategoryCd == 100001}">
				<td >심리</td>
			</c:when>
			<c:when test="${list.highCategoryCd == 100002}">
				<td >법률</td>
			</c:when>
			<c:when test="${list.highCategoryCd == 100003}">
				<td >재무</td>
			</c:when>
			<c:when test="${list.highCategoryCd == 100004}">
				<td >심리검사</td>
			</c:when>
		</c:choose>
			<td >${list.categoryNm}</td>
			<td ><fmt:formatNumber value="${list.price01 }" pattern="#,###" />원</td>
			<td ><fmt:formatNumber value="${list.price02 }" pattern="#,###" />원</td>
			<td ><fmt:formatNumber value="${list.price03 }" pattern="#,###" />원</td>
		</tr>
	</c:forEach>
</table>

</div>
