<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"	pageEncoding="UTF-8"%>
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
			                  <th  width="8%" >순번</th>
			                  <th  width="">제휴사명</th>
			                  <th  width="">담당자</th>
			                  <th  width="">아이디</th>
			                  <th  width="">휴대전화</th>
			                  <th  width="">전화번호</th>
			                  <th  width="">등록일</th>
			                  <th  width="">상태</th>
			                </tr>
			            </thead>

						<tbody>
 						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td>${list.cspNm }</td>
								<td><a href="#" class="cspDetail" value="${list.userId }"><strong>${list.userNm }</strong></a></td>
								<td><a href="#" class="cspDetail" value="${list.userId }"><strong>${list.userId }</strong></a></td>
								<td>${list.mobile }</td>
								<td>${list.telNum }</td>
								<td>${list.regDt }</td>
								<td>${list.mgrStatus }</td>
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