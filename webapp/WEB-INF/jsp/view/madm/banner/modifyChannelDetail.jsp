<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>채널 수정</title>
<script>
j$(document).ready(function(){
	j$("#modifyBtn").click(function(){
		if(confirm("수정하시겠습니까?")){
			j$("#modifyChannel").submit();
		}
		return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/banner/channelManage";
		return false;
	});
});
</script>
</head>
<body>
<form:form id="modifyChannel" modelAttribute="invChannelDto" action="/madm/banner/modifyChannelDetail" method="PUT">
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
	<td valign="top" align="center">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="80%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">채널 수정</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td>
					<!-- 배너 정보 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="1" width="80%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">채널코드</td>
					    	<td class="line" colspan="3">
					    		<input type="hidden" name="channelCd" value="${detail.channelCd}"/>
					    		${detail.channelCd}
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">채널명</td>
					    	<td class="line" colspan="3">
					    		<input type="text" name="channelNm" value="${detail.channelNm}" style="width: 300px;">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">채널설명</td>
					    	<td class="line" colspan="3">
					    		<input type="text" name="channelDesc" value="${detail.channelDesc}" style="width: 300px;">
					    	</td>
						</tr>
					</table>
					<!-- 배너 정보 영역 종료 -->

					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;">
						<tr align="center" height="50px">
							<td class="" colspan="2" align="center">
					    		<button id="modifyBtn" style="height:30px; width:100px;">수정</button>
					    		<span style="margin-left: 20px;"></span>
					    		<button id="cancleBtn" style="height:30px; width:100px;">취소</button>
					    	</td>
						</tr>
					</table>
					<!-- 버튼 영역 종료 -->
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form:form>

<form:form id="deleteChannel" modelAttribute="invChannelDto" action="/madm/banner/modifyChannelDetail" method="DELETE">
	<input type="hidden" name="channelCd" value="${detail.channelCd}">
</form:form>
</body>
</html>

