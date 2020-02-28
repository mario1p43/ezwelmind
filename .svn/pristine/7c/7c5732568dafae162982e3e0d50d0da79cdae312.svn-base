<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<div align="center"  style="width:600px; min-height: 250px; vertical-align: middle;" >

<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse; vertical-align: middle;" >
	<!-- 인테이크 테이블 -->
	<tr>
		<td><h3><span style="font-weight: bold; color: blue;">ㆍ개인 한도 / 잔여한도 </span></h3></td>
	</tr>
	<tr>
		<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
			<tr align="left" height="30px" >
				<th class="line" align="center" width="25%">고객사명</th>
				<td width="auto;">
					${info.clientNm }
				</td>
			</tr>
<%-- 			<tr align="left" height="30px" >
				<th class="line" align="center" width="25%">임직원명</th>
				<td width="auto;">
					${info.userNm }
				</td>
			</tr> --%>
			<c:if test="${empty info.periodSeq}">
				<tr align="left" height="30px" >
					<th class="line" align="center" width="25%">서비스기간</th>
					<td width="auto;">
						서비스가 종료되었습니다.
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty info.periodSeq}">
				<tr align="left" height="30px" >
					<th class="line" align="center" width="25%">서비스기간</th>
					<td width="auto;">
						${info.startDd } ~ ${info.endDd }
					</td>
				</tr>
			</c:if>
			
			<tr align="left" height="30px" >
				<th class="line" align="center" width="25%">개인 한도</th>
				<td width="auto;">
					${ceiling }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">개인 잔여한도</th>
				<td >
					${privateRemainPoint }
				</td>
			</tr>
		</table>
	</tr>
	<!-- 인테이크 테이블 끝-->

	<tr>
		<td height="80px"></td>
	</tr>
</table>

</div>