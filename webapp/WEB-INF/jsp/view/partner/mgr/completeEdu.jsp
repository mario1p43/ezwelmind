<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta charset="UTF-8">
<title>교육이수현황</title>
<script type="text/javascript">

j$(document).ready(function(){
	j$('.registration').click(function(){
		location.href = "/madm/edu/insertpage";
		return false;
	});
	
	j$('.registrationBulk').click(function(){
		$("#excelForm").submit();
		return false;
	});
	
	
})
</script>
</head>
<body>

<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px"></td>
	</tr>
	
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
			    	<td align="left" class="subtitle">교육이수현황</td>
				</tr>
				
			</table>
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<table class="eduListGrid" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
				<thead>
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
				</thead>
				<tbody>
				<c:forEach var="list" items="${paging.list}" varStatus="status">
					<tr height="50px">
						<td>
						    <input type="hidden" id="eduId" name="eduId" value="${list.eduId}"/>
							${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
						</td>
						<td>${list.centerNm}</td>
						<td>${list.userNm}</td>
						<td><c:if test="${list.gender eq 'M'}">남</c:if><c:if test="${list.gender eq 'F'}">여</c:if></td>
						<td>${list.eduNm}</td>
						<td>${list.eduHour}시간</td>
						<td>${list.eduDtFm}&nbsp;/&nbsp;${list.eduDtTo}</td>
						<td>${list.eduPlace}</td>
						<td>${list.eduDiv}</td>
						<td>${list.eduType}</td>
						<td>${list.eduEtc}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<br />
				<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
				<tr>
					<td align="center">
						<ui:paging value="${paging}"
							btnFirst="${url:img('/images/btn_first.jpg')}"
							btnPrev="${url:img('/images/btn_prev.jpg')}"
							btnNext="${url:img('/images/btn_next.jpg')}"
							btnLast="${url:img('/images/btn_last.jpg')}" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>