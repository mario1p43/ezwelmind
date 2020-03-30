<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>상세조회</title>

<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.notice-wrapper{padding:0 5vw}
	.notice-wrapper .content-wrapper{display:flow-root;margin-top:5vw}
	.notice-wrapper .content-wrapper
	.notice-wrapper .border-bottom{border-bottom:1px solid #C4C4C4}
</style>

</head>
<body>
	<div class="notice-wrapper">
		<div class="content-wrapper border-bottom">
			<div class="notice-title">${vo.subject}</div>
			<div class="notice-date">${vo.regDt}</div>
		</div>
		<div class="content-wrapper border-bottom">
			${fn:replace(vo.content,newLineChar,'<br>')}
		</div>
		<div class="content-wrapper border-bottom">
			<c:choose>
				<c:when test="${not empty files1.filePath}">
						<a href="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" class="attach_file" target="_blank">${files1.fileNm}</a><br>
					<c:if test="${not empty files2.filePath}">
						<a href="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" class="attach_file"  target="_blank">${files2.fileNm}</a><br>
					</c:if>
					<c:if test="${not empty files3.filePath}">
						<a href="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" class="attach_file"  target="_blank">${files3.fileNm}</a><br>
					</c:if>
					<c:if test="${not empty files4.filePath}">
						<a href="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" class="attach_file"  target="_blank">${files4.fileNm}</a><br>
					</c:if>
					<c:if test="${not empty files5.filePath}">
						<a href="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" class="attach_file" target="_blank">${files5.fileNm}</a><br>
					</c:if>
				</c:when>
				<c:otherwise>등록된 첨부 파일이 없습니다.</c:otherwise>
			</c:choose>
		</div>
		<div class="content-wrapper">
			<button id="modifyBtn" style="height:30px; width:100px;" onclick="history.back()" type="button">목록</button>
		</div>
	</div>
<%-- <table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr><td height="20px"></td></tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">
		    	<c:choose>
	 		    	<c:when test="${code.noticeCd eq 3 }">
			    	서류 및 양식 
			    	</c:when>
			    	<c:when test="${code.noticeCd eq 2 }">
			    	모집공고
			    	</c:when>
			    	<c:otherwise>
			    	공지사항
			    	</c:otherwise>
		    	
		    	</c:choose>

		    	</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
	        <tr>
	            <th class="line" width="10%" align="center" bgcolor="#F5F5F5" style="min-height: 50px;">제목</th>
	            <td>
	            	${vo.subject}
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">내용</th>
	            <td style="min-height: 200px;">
	            	${fn:replace(vo.content,newLineChar,'<br>')}
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5" style="min-height: 50px;">등록일</th>
	            <td>
	            	${vo.regDt}
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5" style="min-height: 50px;">첨부파일</th>
	            <td colspan="3">
	            	<c:choose>
	                    <c:when test="${not empty files1.filePath}">
	                       		<a href="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" class="attach_file" target="_blank">${files1.fileNm}</a><br>
		           			<c:if test="${not empty files2.filePath}">
		                       	<a href="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" class="attach_file"  target="_blank">${files2.fileNm}</a><br>
		           			</c:if>
		           			<c:if test="${not empty files3.filePath}">
		                       	<a href="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" class="attach_file"  target="_blank">${files3.fileNm}</a><br>
		           			</c:if>
		                    <c:if test="${not empty files4.filePath}">
						        <a href="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" class="attach_file"  target="_blank">${files4.fileNm}</a><br>
				            </c:if>
				            <c:if test="${not empty files5.filePath}">
						        <a href="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" class="attach_file" target="_blank">${files5.fileNm}</a><br>
			                </c:if>
		               	</c:when>
	           			<c:otherwise>
	           				등록된 첨부 파일이 없습니다. 
	           			</c:otherwise>
	           		</c:choose>
	            </td>
	        </tr>
		</table>
	</td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr>
				<td align="center" colspan="4">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
				    		<button id="modifyBtn" style="height:30px; width:100px;" onclick="history.back()" type="button">목록</button>
		    			</tr>
		    		</table>
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

</table> --%>


</body>
</html>