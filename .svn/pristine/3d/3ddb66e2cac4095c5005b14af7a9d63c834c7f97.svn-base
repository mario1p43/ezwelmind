<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<html>
<head>
<title></title>
<%
 response.setHeader("Content-Type", "application/vnd.ms-xls");
 response.setHeader("Content-Disposition", "inline; filename=samplefile.xls");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td>
		<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<th >순번</th>
				<th >고객사코드</th>
				<th >카테고리</th>
				<th >서비스명</th>
				<th >노출기간</th>
				<th >사용유무</th>
				<th >선택횟수</th>
			</tr>
			</tr>
			<c:choose>
				<c:when test="${paging.totalCount >= 1}">
					<c:forEach var="list" items="${paging.list}" varStatus="status">
					<tr align="center" height="30px">
						<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
						<td >${list.clientCd }</td>
						<td ><comm:commNmOut option="commCd" code="${list.surCate } "/></td>
						<td ><a href="#" class="detail" value="${list.surSeq }" >${list.svcNm}</a></td>
						<c:if test="${not empty list.surStDt }">
							<td >${list.surStDt } ~ ${list.surEdDt }</td>
						</c:if>
						<c:if test="${empty list.surStDt }">
							<td ></td>
						</c:if>
						<td >${list.useYn }</td>
						<td >${list.chooseCnt }</td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</td>
</tr>
</table>
</body>
</html>