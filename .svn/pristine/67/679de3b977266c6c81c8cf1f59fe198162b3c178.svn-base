<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>선택 사용자</title>
<script type="text/javascript">

j$(document).ready(function(){
});

</script>
</head>
<body>

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">♥ 선택 사용자</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr>
					<th>순번</th>
					<th>사번/아이디</th>
					<th>고객명</th>
				</tr>
				<c:forEach var="list" items="${userList}" varStatus="idx">
					<tr align="center">
						<td>${idx.index + 1}</td>
						<td>${list.userId }</td>
						<td>${list.userNm }</td>
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>

	<tr>
		<td height="10px"></td>
	</tr>

	<tr>
		<td>
		</td>
	</tr>
</table>

</body>
</html>
