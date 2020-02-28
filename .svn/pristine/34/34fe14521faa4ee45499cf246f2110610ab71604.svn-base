<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<html>
<head>
<title>제휴문의 상세정보</title>
</head>
<body>

<input type="hidden" name="dataSeq" value="${detail.dataSeq}" />

<table cellpadding="0" cellspacing="0" border="0" width="80%" height="100%">

<tr><td height="20px"></td></tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">제휴문의 상세정보</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">회사(기관명)</th>
	            <td width="35%">${detail.regCompany }</td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">담당자</th>
	            <td width="35%">${detail.regNm }</td>
	        </tr>
	        <tr>
	            <th class="line" align="center" bgcolor="#F5F5F5">연락처</th>
	            <td>${detail.regMobile }</td>
	            <th class="line" align="center" bgcolor="#F5F5F5">e-mail</th>
	            <td>${detail.regEmail }</td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">문의내용</th>
	            <td colspan="3" style="min-height: 200px;">
	            	<br>${fn:replace(detail.content,newLineChar,'<br>')}<br>
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">첨부파일</th>
	            <td colspan="3" >
	            	<c:choose>
	            		<c:when test="${not empty detail.fileNm}">
			            	<a href="javascript:fileDownLoad('${detail.filePath}', '${detail.fileNm}');">${detail.fileNm}</a>
	            		</c:when>
	            		<c:otherwise>
	            			없음.
	            		</c:otherwise>
	            	</c:choose>
	            </td>
	        </tr>
		</table>
	</td>
</tr>

</table>

</body>
</html>

