<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<div style="overflow-x: hidden; overflow-y: scroll; height:400px; width:850px;">
<table cellpadding="5" cellspacing="0" border="1" style="border-collapse:collapse;" width="80%" align="center"  bordercolor="#DDDDDD">
	<colgroup>
		<col width="35%"></col>
		<col width="auto;"></col>
	</colgroup>
	<tr align="left" height="30px">
		<th class="line" width="47px" align="center" bgcolor="#F5F5F5">센터명</th>
    	<th class="line" align="center" bgcolor="#F5F5F5">지역</th>
	</tr>
	<c:forEach var="list" items="${centerList }" >
		<tr>
			<td align="center">${list.centerNm }</td>
			<td>${list.area1Nm } &nbsp; ${list.area2Nm }</td>
		</tr>
	</c:forEach>
</table>
</div>
