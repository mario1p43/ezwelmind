<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제휴문의 상세보기</title>

<script type="text/javascript">
j$(document).ready(function(){


});

</script>
</head>
<body>

<input type="hidden" name="dataSeq" value="" />

<table cellpadding="0" cellspacing="0" border="0" width="80%" height="100%">

<tr><td height="20px"></td></tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">상담기관(센터)</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">기관명</th>
	            <td width="35%">${detail.reqNm}</td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">담당자</th>
	            <td width="35%">${detail.manager}</td>
	        </tr>
	        <tr>
	            <th class="line" align="center" bgcolor="#F5F5F5">기관전화</th>
	            <td>${detail.telNum}</td>
	            <th class="line" align="center" bgcolor="#F5F5F5">핸드폰</th>
	            <td>${detail.mobile}</td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">기관주소</th>
	            <td colspan="3">
	            	${detail.post} ${detail.addr1} ${detail.addr2}
	            </td>
	        </tr>
	        <tr>
	            <th class="line" align="center" bgcolor="#F5F5F5">e-mail</th>
	            <td>${detail.email}</td>
	            <th class="line" align="center" bgcolor="#F5F5F5">홈페이지</th>
	            <td>${detail.homepage}</td>
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
	            <td>${detail.consultType} 
	            	<c:if test="${not empty detail.consultTypeEtc}">
	            		&nbsp;&nbsp;기타:${detail.consultTypeEtc}
	            	</c:if>
	            </td>
	            <th class="line" align="center" bgcolor="#F5F5F5">기업상담(EAP)진행경험</th>
	            <td>${detail.consultExpYn}</td>
	        </tr>
	        
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">기관상담진행 세부경력</th>
	            <td colspan="3">
	            	${detail.consultExp}
	            </td>
	        </tr>
	</table>
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
		            		<c:when test="${cert.certCd eq '100281' }">
		            			${cert.etc }
		            		</c:when>
		            		<c:otherwise>
								1급 상주 : ${cert.certCnt1}   &nbsp;&nbsp;  1급 파트타임 : ${cert.certPartCnt1}
								<c:if test="${cert.certCd ne '100279' }">
									<br> 2급 상주 : ${cert.certCnt2}   &nbsp;&nbsp;  2급 파트타임 : ${cert.certPartCnt2}
								</c:if>
		            		</c:otherwise>
		            	</c:choose>
		            	

		            </td>
		        </tr>
	        </c:forEach>
		</table>
	</td>
</tr>
	        
<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">총인원</th>
	            <td>${detail.totMember}</td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">개인상담실</th>
	            <td>${detail.infraPersonalCnt}</td>
	        </tr>
	        <tr>
	            <th class="line" align="center" bgcolor="#F5F5F5">놀이치료실</th>
	            <td>${detail.infraPlayRoomCnt}</td>
	            <th class="line" align="center" bgcolor="#F5F5F5">대기실</th>
	            <td>${detail.infraWaitRoomYn}</td>
	        </tr>
	        <tr>
	            <th class="line" align="center" bgcolor="#F5F5F5">집단(교육)실</th>
	            <td>${detail.infraEduRoomYn}</td>
	            <th class="line" align="center" bgcolor="#F5F5F5">기타</th>
	            <td>${detail.infraEtc}</td>
	        </tr>
	        
			<tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">파일첨부</th>
	            <td colspan="3">
	            	<a href="javascript:fileDownLoad('${detail.filePath}', '${detail.fileNm}');">${detail.fileNm}</a>
	            </td>
	        </tr>
		</table>
	</td>
</tr>
	        
	        
</table>



</body>
</html>

