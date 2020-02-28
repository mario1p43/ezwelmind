<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담후기 관리</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
j$(document).ready(function(){


	j$('#updateBtn').click(function() {
		j$("#addEpilogue").attr("action","/madm/bbsEpilogue/update");
		j$.alert('수정하시겠습니까?',function(){
			j$("#addEpilogue").submit();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/bbsEpilogue/list2?bbsCd=review&serviceType=onmaum";
		return false;
	});

});

</script>
</head>
<body>

<form id="addEpilogue" name="addEpilogue"  action="/madm/bbsEpilogue/update">

<input type="hidden" name="subject" value="${vo.subject}">
<input type="hidden" name="dataSeq" value="${vo.dataSeq}">
<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
	<td height="20px">
		<input type="hidden" name="serviceType" id="serviceType" value="${serviceType }">
		<input type="hidden" name="bbsCd" id="bbsCd" value="${bbsCd }">
	<td>
<tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">
					상담후기 상세
		    	</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">제목</th>
	            <td width="85%" colspan="3">
	            	${vo.subject}
	            </td>
	        </tr>
	        <tr>
				<th class="line" align="center" bgcolor="#F5F5F5">등록자</th>
	            <td align="left" colspan="3">
					${vo.regNm }
				</td>
	        </tr>
	        <c:if test="${serviceType eq 'SANGDAM4U' }">
        	<tr>
				<th class="line" align="center" bgcolor="#F5F5F5">구분</th>
	            <td align="left" colspan="3">
	            	<comm:select name="reqCd1" code="100855" selectValue="${vo.reqCd1 }" />
				</td>
	        </tr>
	        </c:if>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">내용</th>
	            <td colspan="3">
	            	${vo.content}
<%-- 	            	<textarea rows="10" cols="10" id="ir1" name="content" style="width:99%; height:400px;" readonly="readonly">${vo.content}</textarea> --%>
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">첨부파일</th>
	            <td colspan="3">
	            	<div>
		            	<c:choose>
		            		<c:when test="${not empty files}">
		            			<c:forEach var="list" items="${files}">
					            	<a href="javascript:fileDownLoad('${list.filePath}', '${list.fileNm}');">${list.fileNm}</a><br>
		            			</c:forEach>
		            		</c:when>
		            		<c:otherwise>
		            			등록된 첨부파일이 없습니다.
		            		</c:otherwise>
		            	</c:choose>
	            	</div>
	            </td>
	       	</tr>
	        <tr>
	            <th class="line" width="" height="40px" align="center" bgcolor="#F5F5F5">노출</th>
	            <td colspan="3">
					<input type="radio" name="dispYn" value="Y" ${vo.dispYn != 'N' ? 'checked':''}> 노출
					<input type="radio" name="dispYn" value="N" ${vo.dispYn == 'N' ? 'checked':''}> 비노출
				</td>
	        </tr>
		</table>
	</td>
</tr>
<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="updateBtn" value="수정" style="height:30px; width:100px;">
		    		<span style="margin-left: 20px;"></span>
		    		<input type="button" id="cancleBtn" value="취소" style="height:30px; width:100px;">
		    	</td>
			</tr>
		</table>
	</td>
</tr>

</table>
</form>


</body>
</html>

