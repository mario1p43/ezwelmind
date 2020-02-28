<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<script>
	j$(document).ready(function(){
	});
</script>

<div style="overflow-x: hidden; overflow-y: scroll; ">
<c:forEach var="list" items="${client}" begin="0" end="0">
	<table cellpadding="5" cellspacing="0" border="1px solid silver" style="border-collapse:collapse; width:1024px; min-height: 600px;" >
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">고객사</th>
	    	<td class="line"  width="auto;" colspan="3">${list.clientNm } (${list.clientCd })</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">고객사 구분</th>
	    	<td class="line" width="40%">${list.divCd }</td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">사업분야</th>
	    	<td class="line" width="40%">${list.bitem }</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">지역</th>
	    	<td class="line" width="40%">${list.areaCd }</td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">담당자</th>
	    	<td class="line" width="40%">${list.mgrNm }</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">사이트명</th>
	    	<td class="line" width="40%">${list.siteNm }</td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">포인트명<br>/결제수단명</th>
	    	<td class="line" width="40%">${list.pointNm } / 
	    		<c:choose>
	    			<c:when test="${not empty list.payNm }">${list.payNm}</c:when>
	    			<c:otherwise>미등록</c:otherwise>
	    		</c:choose> 
	    	</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">계약방식</th>
	    	<td class="line" width="40%">${list.contractType }</td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">임직원</th>
	    	<td class="line" width="40%">${list.totEmploy }</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">정산일</th>
	    	<td class="line" width="40%">${list.calcDd }</td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">정산주기</th>
	    	<td class="line" width="40%">${list.calcType }</td>
		</tr>
		<tr  height="50px">		
			<th class="line" width="" align="center" bgcolor="#F5F5F5">이용자</th>
	    	<td class="line" colspan="3">${list.useType }</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="" align="center" bgcolor="#F5F5F5">이용서비스</th>
	    	<td class="line" colspan="3">${list.useService }</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="" align="center" bgcolor="#F5F5F5">이용채널</th>
	    	<td class="line" colspan="3">${list.useChannel }</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">개인한도</th>
	    	<td class="line" width="40%">${list.ceilingPoint }</td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">모바일<br>사용여부</th>
	    	<td class="line" width="40%">${list.mobileYn }</td>
		</tr>
		<tr  height="50px">
			<th class="line" width="" align="center" bgcolor="#F5F5F5">계약사항(메모)</th>
	    	<td class="line" colspan="3">${list.contractMemo }</td>
		</tr>
		
		<c:forEach var="jedoList" items="${client}" >
			<tr  height="50px">
				<th class="line" width="10%" align="center" bgcolor="#F5F5F5">제도회차</th>
		    	<td class="line" >${jedoList.periodNo }</td>
				<th class="line" width="10%" align="center" bgcolor="#F5F5F5">시작/종료일</th>
		    	<td class="line" >${jedoList.startDd } ~ ${jedoList.endDd }</td>
			</tr>
		</c:forEach>
		
	</table>
</c:forEach>
</div>
