<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제휴문의 상세보기</title>

</head>
<body>

<input type="hidden" name="dataSeq" value="" />

<table cellpadding="0" cellspacing="0" border="0" width="80%" height="100%">

<tr><td height="20px"></td></tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">개인(상담사)</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">성명</th>
	            <td width="35%">${detail.manager}</td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">나이/성별</th>
	            <td width="35%">${detail.age}/${detail.gender}</td>
	        </tr>
	        <tr>
	            <th class="line" align="center" bgcolor="#F5F5F5">연락처</th>
	            <td>${detail.telNum}</td>
	            <th class="line" align="center" bgcolor="#F5F5F5">이메일</th>
	            <td>${detail.email}</td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">활동지역</th>
	            <td colspan="3">
	            	${detail.area1}  ${detail.area2}
	            </td>
	        </tr>
	  
	        
	        
	        
	        <tr>
	            <th class="line" align="center" bgcolor="#F5F5F5">상담가능대상</th>
	            <td>${detail.consultTarget}</td>
	            <th class="line" align="center" bgcolor="#F5F5F5">전문분야</th>
	            <td>
	            	${detail.consultDiv}
	            	<c:if test="${not empty detail.consultDivEtc}">
	            		&nbsp;&nbsp;기타:${detail.consultDivEtc}
	            	</c:if>
				</td>
	        </tr>
	        
	        
			<tr>
	            <th class="line" align="center" bgcolor="#F5F5F5">상담형태</th>
	            <td colspan="3">
	            	${detail.consultType}
	            	<c:if test="${not empty detail.consultTypeEtc}">
	            		&nbsp;&nbsp;기타:${detail.consultTypeEtc}
	            	</c:if> 
	            </td>
	        </tr>
		</table>
	</td>
</tr>
	        
<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
				        <!-- for each -->
	        <c:forEach var="cert" items="${ certList }">
	        	
				<tr>
		            <th class="line" width="30%" align="center" bgcolor="#F5F5F5">${cert.commNm}</th>
		            <td colspan="3">
		            	<c:choose>
		            		<c:when test="${cert.certCd eq '100279' }">
		            			보유 : ${cert.cert1 }
		            		</c:when>
		            		<c:otherwise>
								1급 보유 : ${cert.cert1}   &nbsp;&nbsp;  2급 보유 : ${cert.cert2}
		            		</c:otherwise>
		            	</c:choose>
		            </td>
		        </tr>
	        </c:forEach>
		</table>
	</td>
</tr>

</table>



</body>
</html>

