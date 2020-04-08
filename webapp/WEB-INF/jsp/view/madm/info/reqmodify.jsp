<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정요청</title>
<script type="text/javascript">

j$(document).ready(function(){
	j$('.counselorListDetail').click(function(){
		var userId = j$(this).attr("value");
		location.href = "/madm/mgr/getCounselorMgrDetailApproveImsi?userId="+userId;
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
			    	<td align="left" class="subtitle">정보수정요청</td>
				</tr>
				
			</table>
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
				<thead>
				<tr align="center" height="50px">
					<th width="5%" >순번</th>			
					<th width="15%" >센터명</th>			
					<th width="7%" >상담사명</th>			
					<th width="5%" >나이</th>			
					<th width="5%" >성별</th>			
					<th width="10%" >전화번호</th>			
					<th width="5%" >지역구분</th>			
					<th width="10%" >접속권한</th>			
					<th width="10%" >근무형태</th>			
					<th width="10%" >상태값</th>
					<th width="10%" >변경요청자</th>			
					<th width="10%" >변경요청일</th>			
					
				</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${paging.list}" varStatus="status">
					<tr height="50px">
						<td>
							${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
						</td>
						<td>${list.centerNm}</td>
						<td><a href="#" class="counselorListDetail" value="${list.userId}"><strong>${list.userNm}</strong></a></td>
						<td>${list.rrn}</td>
						<td>${list.gender}</td>
						<td>${list.mobile}</td>
						<td>${list.area}</td>
						<td>${list.authCd}</td>
						<td>${list.workType}</td>
						<td>변경 대기</td>
						<td>${list.modiId}</td>
						<td>${list.modiDt}</td>
						
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