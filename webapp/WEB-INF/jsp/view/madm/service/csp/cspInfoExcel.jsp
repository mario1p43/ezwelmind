<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page import="java.util.*, java.text.*"  %>
<html>
<head>
<title></title>
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String today = formatter.format(new java.util.Date());

response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "inline; filename=cspList_"+today+".xls");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<form:form name="cspList" id="cspList" modelAttribute="cspDto" action="/madm/service/csp/cspInfoList">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td>
		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%" align="left">
			<tr>
				<td>
					<!-- 채널 정보 시작 -->
					<table class="" cellpadding="10" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr >
			                  <th rowspan="2" width="8%" >순번</th>
			                  <th rowspan="2" width="">업체코드</th>
			                  <th rowspan="2" width="">업체명</th>
			                  <th rowspan="2" width="">업체유형</th>
			                  <th colspan="4" width="">업체구분</th>
			                 
			                  <th rowspan="2" width="">담당자</th>
			                  <th rowspan="2" width="">전화번호</th>
			                  <th rowspan="2" width="">상태</th>
			                </tr>
			                <tr>
			                 <th>강좌</th><th>검사</th><th>교육</th><th>배송</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td><a href="#" class="cspDetail" value="${list.cspCd }"><strong>${list.cspCd }</strong></a></td>
								<td><a href="#" class="cspDetail" value="${list.cspCd }"><strong>${list.cspNm }</strong></a></td>
								<td>${list.cspDiv }</td>
								<td>${list.typeLecture }</td>
								<td>${list.typeTest }</td>
								<td>${list.typeEducation }</td>
								<td>${list.typeDelivery }</td>
								<td>${list.mainMgrId }</td>
								<td>${list.telNum }</td>
								<td>${list.cspStatus }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</div>
					
				</td>
			</tr>
		</table>
		<!-- 채널 영역 종료 -->
	</td>
</tr>
</table>
</form:form>

</body>
</html>