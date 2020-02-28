<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담사관리</title>
<%
 response.setHeader("Content-Type", "application/vnd.ms-xls");
 response.setHeader("Content-Disposition", "inline; filename=samplefile.xls");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<form:form id="searchMgr" name="searchMgr" modelAttribute="counselorMgrDto" action="/partner/mgrHue/counselorMgrList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="80%">
<tr>
	<td height="20px"></td>
</tr>




<tr><td height="20px"></td></tr>

			<tr>
				<td>
					<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
							<tr>								
								<th width="7%" >순번</th>								
								<th width="10%">이름</th>
								<th width="10%" >아이디</th>
								<th width="3%">성별</th>
								<th width="12%" >생년월일</th>								
								<th width="14%">휴대폰번호</th>
								<th width="10%">접속권한</th>																
								<th width="10%">상태</th>
								<th width="14%">등록일/수정일</th>
								<th width="10%">등록/수정자</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td>${list.userNm}</td>
								<td>${list.userId}</td>
								<td>${list.gender}</td>
								<td>${list.rrn}</td>
								<td>${list.mobile}</td>								
								<td>${list.authCd }</td>
								<td>${list.mgrStatus}</td>																
								<td>${list.modiDt}</td>
								<td>${list.workType}</td>
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

