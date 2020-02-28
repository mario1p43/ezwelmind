<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>임직원관리</title>
<%
 response.setHeader("Content-Type", "application/vnd.ms-xls");
 response.setHeader("Content-Disposition", "inline; filename=employeeList.xls");
%>
<script type="text/javascript">
j$(document).ready(function(){
	
});
</script>
</head>
<body>


<form id="employeeListForm" action="/madm/employeeManagement/list" method="POST">

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
						<!-- 채널 영역 시작 -->
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<!-- 채널 정보 시작 -->
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<th >순번</th>
											<th >고객사코드</th>
											<th >고객사명</th>
											<th >유저키</th>
											<th >성명</th>
											<th >생년월일-성별</th>
											<th >ID</th>
											<th >사번</th>
											<th >사용유무</th>
											<th >재직상태</th>
											<th >휴대폰</th>
											<th >인증일시</th>
										</tr>
										</tr>
										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >${list.clientCd }</td>
											<td >${list.clientNm }</td>
											<td >${list.userKey}</td>
											<td >${list.userNm }</td>
											<td >${list.rrn }</td>
											<td >${list.userId }</td>
											<td style="mso-number-format:\@">${list.empNum }</td>
											<td >${list.useYn }</td>
											<td >${list.userStatusNm }</td>
											<td >${list.mobile }</td>
											<td >${list.ipinAuthDt }</td>
										</tr>
										</c:forEach>
									</table>
									<br>
								</td>
							</tr>
						</table>
						<!-- 채널 영역 종료 -->
					</td>
				</tr>
			</table>
</table>
</form>
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>
