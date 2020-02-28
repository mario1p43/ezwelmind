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
					<th width="5%" >No</th>			
					<th width="15%" >센터명</th>			
					<th width="7%" >상담사명</th>			
					<th width="5%" >성별</th>			
					<th width="10%" >교육명</th>			
					<th width="5%" >이수시간</th>			
					<th width="10%" >교육일자</th>			
					<th width="15%" >교육장소</th>			
					<th width="5%" >교육구분</th>			
					<th width=5%" >교육형태</th>			
					<th width="23%" >비고</th>		
			</tr>
			</tr>
			<c:choose>
				<c:when test="${paging.totalCount >= 1}">
					<c:forEach var="list" items="${paging.list}" varStatus="status">
					<tr height="50px">
						<td>
						    <input type="hidden" id="eduId" name="eduId" value="${list.eduId}"/>
							${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
						</td>
						<td>${list.centerNm}</td>
						<td>${list.userNm}</td>
						<td>${list.gender}</td>
						<td>${list.eduNm}</td>
						<td>${list.eduHour}</td>
						<td>${list.eduDtFm}-${list.eduDtTo}</td>
						<td>${list.eduPlace}</td>
						<td>${list.eduDiv}</td>
						<td>${list.eduType}</td>
						<td>${list.eduEtc}</td>
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