<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>멘탈헬스 자가진단</title>
<script language="JavaScript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script type="text/javascript">
j$(document).ready(function(){

	j$("#userListBtn").click(function(){
		/* var pollSeq = bEnco(j$("#pollSeq").val());
		location.href = "/madm/diagnosis/userList?pollSeq="+pollSeq;
		return false; */
		history.back();
	});
});
</script>

</head>
<body>

<input type="hidden" name="pollSeq" id="pollSeq" value="${userDetail.pollSeq}" />
<input type="hidden" name="pollUserSeq" value="${userDetail.pollUserSeq}" />

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">

<tr><td height="20px"></td></tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">멘탈헬스 자가진단 상세</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">진단번호</th>
				<td width="35%">${userDetail.pollUserSeq }</td>
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">진단일시</th>
				<td width="35%">${userDetail.regDt }</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5">성별</th>
				<td>${userDetail.gender }</td>
				<th class="line" align="center" bgcolor="#F5F5F5">연령</th>
				<td>${userDetail.age }</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5">직군</th>
				<td>${userDetail.businessDiv } ${userDetail.businessDivEtc }</td>
				<th class="line" align="center" bgcolor="#F5F5F5">직급</th>
				<td>${userDetail.grade }</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5">근무지역</th>
				<td>${userDetail.branch } ${userDetail.dept }</td>
				<th class="line" align="center" bgcolor="#F5F5F5">최종입사년도<br>근속년수</th>
				<td>${userDetail.workYear }</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5">결혼여부</th>
				<td colspan="3">${userDetail.marryYn } </td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5" width="75%">문항</th>
				<th class="line" align="center" bgcolor="#F5F5F5" width="5%">점수</th>
				<th class="line" align="center" bgcolor="#F5F5F5" width="20%">답변</th>
			</tr>
			<c:set var="questionGroup" value="1" />
			<c:forEach var="list" items="${questionList}" varStatus="status">
				<c:if test ="${questionGroup != list.questionGroup}">
				<c:set var="questionGroup" value="${list.questionGroup }" />
					<tr><td height="10px" colspan="3"></td></tr>
				</c:if>
				<tr>
					<td>${list.question}</td>
					<td align="center">${answerMap[list.questionNum].answerNum}</td>
					<td align="center">${answerMap[list.questionNum].answer}</td>
				</tr>
			</c:forEach>
		</table>
	</td>
</tr>
</table>

<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-collapse:collapse;">
	<tr align="center" height="50px">
		<td class="" align="center">
			<input type="button" id="userListBtn" value="목록" style="height:30px; width:100px;">
		</td>
	</tr>
</table>

</body>
</html>

