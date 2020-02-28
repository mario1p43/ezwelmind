<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담신청관리</title>
<style>td { mso-number-format:\@; } </style> 
<%
 response.setHeader("Content-Type", "application/vnd.ms-xls");
 response.setHeader("Content-Disposition", "inline; filename=samplefile.xls");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<form:form id="searchMgr" name="searchMgr" modelAttribute="counselorMgrDto" action="/hue/mgr/counselMgrList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="80%">
<tr>
	<td height="20px"></td>
</tr>




<tr><td height="20px"></td></tr>

			<tr>
				<td>
					<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
							<tr align="center">								
								   <th >순번</th>
				                  <th >이름</th>
				                  <th >휴대폰번호</th>
				                  <th >성별</th>
				                  <th >상담신청일</th>
				                  <th >상담희망일</th>
								  <th >상담예약일</th>								  
								  <th >상태</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
			                  	<td width=""><strong>${list.counNm}</strong></td>
								<td align="center">${list.mobile}</td>
								<c:choose>
									<c:when test="${list.gender eq 'M'}">
										<td><span class="fontBlue">남</span></td>										
									</c:when>
									<c:otherwise>
										<td><span class="fontBlue">여</span></td>										
									</c:otherwise>
								</c:choose>
								<td>${fn:replace(list.regDt,'.0','')}</td>
								<td>${list.date}&nbsp;${ list.time }
								<c:if test="${not empty list.time}">시</c:if>
								</td>
								<td>${list.cdate}&nbsp;${ list.ctime }
								<c:if test="${not empty list.ctime}">시</c:if></td>
								<td align="center">								
									<c:choose>
									<c:when test="${list.cstatus eq '1'}">
										신청완료										
									</c:when>
									<c:when test="${list.cstatus eq '2'}">
										신청취소										
									</c:when>
									<c:when test="${list.cstatus eq '3'}">
										일정확정										
									</c:when>
									<c:when test="${list.cstatus eq '4'}">
										상담완료										
									</c:when>									
								</c:choose>								
								</td>
							</tr>
						</c:forEach>												
						</tbody>
					</table>
					<br />
					
				</td>
			</tr>
		
</tr>
</table>
</form:form>
</body>
</html>

