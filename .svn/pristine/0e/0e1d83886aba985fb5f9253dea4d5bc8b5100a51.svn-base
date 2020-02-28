<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>코너 수정</title>
<script>
j$(document).ready(function(){
	j$("#modifyBtn").click(function(){
		if(confirm("수정하시겠습니까?")){
			j$("#modifyCorner").submit();
		}
		return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/banner/cornerManage";
		return false;
	});
});
</script>
</head>
<body>
<form:form id="modifyCorner" modelAttribute="invCornerDto" action="/madm/banner/modifyCornerDetail" method="PUT">
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
					    	<td align="left" class="subtitle">코너 수정</td>
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
							<th class="line" width="120px" align="center" bgcolor="#F5F5F5">코너코드</th>
					    	<td class="line" colspan="3">
					    		<input type="hidden" name="cornerCd" value="${detail.cornerCd}"/>
					    		${detail.cornerCd}
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="120px" align="center" bgcolor="#F5F5F5">채널코드</th>
					    	<td class="line" colspan="3">
					    		<input type="hidden" name="channelCd" value="${detail.channelCd}"/>
					    		${detail.channelCd}
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="120px" align="center" bgcolor="#F5F5F5">코너명</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="cornerNm" value="${detail.cornerNm }" style="width: 300px;">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="120px" align="center" bgcolor="#F5F5F5">코너설명</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="cornerDesc" value="${detail.cornerDesc }" style="width: 300px;">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="120px" align="center" bgcolor="#F5F5F5">상품전시갯수</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="dispNum" value="${detail.dispNum }" style="width: 300px;">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="120px" align="center" bgcolor="#F5F5F5">등록자</th>
					    	<td class="line">
					    		${detail.regId } 
					    	</td>
					    	<th class="line" width="120px" align="center" bgcolor="#F5F5F5">등록일</th>
					    	<td class="line">
					    		${detail.regDt }
					    	</td>
						</tr>
						<c:if test="${not empty detail.modiId}">
							<tr align="left" height="30px">
								<th class="line" width="120px" align="center" bgcolor="#F5F5F5">수정자</th>
						    	<td class="line">
						    		${detail.modiId } 
						    	</td>
						    	<th class="line" width="120px" align="center" bgcolor="#F5F5F5">수정일</th>
						    	<td class="line">
						    		${detail.modiDt }
						    	</td>
							</tr>
						</c:if>
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

<form:form id="deleteCorner" modelAttribute="invCornerDto" action="/madm/banner/modifyCornerDetail" method="DELETE">
	<input type="hidden" name="cornerCd" value="${detail.cornerCd}">
</form:form>
</body>
</html>

