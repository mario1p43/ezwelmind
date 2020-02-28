<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사 현황</title>
<script type="text/javascript">
$(document).ready(function(){	
	$(".showClient").click(function(){
		var clientCd = $(this).attr("clientCd");
		$.divPop("showClient", "고객사 상세정보", "/madm/client/showClientPop?clientCd="+clientCd);
		return false;
	});

	$(".showAmount").click(function(){
		var clientCd = $(this).attr("clientCd");
		$.divPop("showClient", "고객사 상세정보", "/madm/client/showAmountPop?searchClientNm="+clientCd);
		return false;
	});
	
	$("#searchBtn").click(function(){
		j$("#frm").submit();
		return false;
	});
	
});

//고객사 검색하기
function clientReload(){
	var clientNm = $("#clientNm").val();
	j$("[name='clientCd']").find("option").filter(function(index) {
		return clientNm === $(this).text();
	}).prop("selected", "selected");
}
</script>

</head>

<body>
<form:form id="frm" modelAttribute="clientDto" action="/madm/client/clientStatusList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">고객사 현황</td>
				<td align="right"></td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 검색 영역 시작 -->
		<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>고객사 선택</strong></td>
		    	<td width="40%" align="left">
			    	<select id="clientCd" name="clientCd" style="height: 20px;">
			    		<option value="">---- 선택 ----</option>	
			    		<c:forEach var="list" items="${clientList}">
		    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq clientDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
		    			</c:forEach>
		    		</select>
		    		<input type="text" id="clientNm" name="clientNm" value="${clientDto.clientNm}" onkeyup="clientReload();" style="width:350px;" placeholder="고객사명을 입력 또는 선택하세요.">
		    	</td>
			</tr>
		</table>
		<!-- 검색 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="10px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr>
				<td align="center" colspan="4">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
				    		<td id="btn01"><a href="javascript:void(0);"><span id="searchBtn">검 색</span></a></td>
		    			</tr>
		    		</table>
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<!-- 채널 정보 시작 -->
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr>
			                  <th width="">고객사코드</th>
			                  <th width="">고객사명</th>
			                  <th width="">운영 담당자</th>
			                  <th width="">상담 담당자</th>
			                  <th width="">제도회차</th>
			                  <th width="">제도 시작/종료일</th>
			                  <th width="">개인한도</th>
			                  <th width="">고객사 구분</th>
			                  <th width="">계약방식</th>
			                  <th width="">직원수</th>
			                  <th width="">지역</th>
			                  <th width="">모바일 사용여부</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${jedoList}" varStatus="status">
							<tr>
								<td>${list.clientCd }</td>
								<td class="showClient" clientCd="${list.clientCd }">
									<a href="javascript:void(0);"><span style="font-weight: bold; color: blue;">${list.clientNm }</span></a>
								</td>
								<td>${list.mgrNm }</td>
								<td>${list.counselMgrNm }</td>
								<td>${list.periodNo }</td>
								<td>${list.startDd } ~ ${list.endDd }</td>
								
								<td class="showAmount" clientCd="${list.clientCd }">
									<a href="javascript:void(0);"><span style="font-weight: bold; color: blue;">${list.ceilingPoint }</span></a>
								</td>
								
								<td>${list.divCd }, ${list.bitem }</td>
								<td>${list.contractType }</td>
								<td>${list.totEmploy }</td>
								<td>${list.areaCd }</td>
								<td>${list.mobileYn }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<br>
					<!-- 채널 정보 종료 -->
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

