<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사 업무요청 답변</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];

j$(document).ready(function(){
	j$("#replyBtn").click(function(){
		if( confirm("답변을 등록하시겠습니까?") ){
			oEditors[1].exec("UPDATE_CONTENTS_FIELD", []);
			j$("#frm").submit();
		}
		return false;
	});
	
	j$("#cancleBtn").click(function(){
		location.href = "/madm/ecrm/taskRequestList";
		return false;
	});
});

j$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir1",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true, 
            fOnBeforeUnload : function(){}, 
            fOnAppLoad : function(){
            	//oEditors.getById["ir1"].exec("PASTE_HTML", []);
            } 
    	}, 
	    fCreator: "createSEditor2"
	});
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir2",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true, 
            fOnBeforeUnload : function(){}, 
            fOnAppLoad : function(){
            	//oEditors.getById["ir1"].exec("PASTE_HTML", []);
            } 
    	}, 
	    fCreator: "createSEditor2"
	});
});

</script>
</head>
<body>
<form id="frm" name="frm" action="/madm/ecrm/addTaskRequest">
<input type="hidden" name="highDataSeq" value="${detail.dataSeq }">
<input type="hidden" name="clientCd" value="${detail.clientCd}">
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
	<td valign="top" align="center">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td align="left" class="subtitle">고객사 업무요청 답변</td>
			</tr>
			<tr>
				<td>
					<!-- 배너 정보 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="1" width="80%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">요청자</th>
					    	<td class="line" width="35%">
					    		${detail.regNm }
 					    	</td>
 					    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">고객사</th>
					    	<td class="line" width="35%">
					    		${detail.clientNm }
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">요청분야</th>
					    	<td class="line" colspan="3" >
					    		${detail.reqCd1Nm } (${detail.reqCd1 })
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">진행상태</th>
					    	<td class="line" colspan="3" >
					    		<comm:select name="status"   code="100563"  basicValue="---- 선택 ----" selectValue="${detail.status }"/>
					    		<strong> &nbsp; ※ 요청상태는 원글이 수정됩니다.</strong>	
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">글제목</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="subject" value="[RE] ${detail.subject }" style="width:90%;"/>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">질문 내용</th>
					    	<td class="line" colspan="3">
					    		<textarea rows="10" cols="30" id="ir1" readonly="readonly" style="width:100%;">${detail.content }</textarea>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">답변 내용</th>
					    	<td class="line" colspan="3">
					    		<textarea rows="10" cols="30" id="ir2" name="content" style="width:100%;"></textarea>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">등록일시</th>
					    	<td class="line" >
					    		${detail.regDt }
 					    	</td>
 					    	<th class="line" align="center" bgcolor="#F5F5F5">수정일시</th>
					    	<td class="line" >
					    	 	<c:choose>
					    	 		<c:when test="${not empty detail.modiDt }">${detail.modiDt }</c:when>
					    	 		<c:otherwise>-</c:otherwise>
					    	 	</c:choose>
					    	</td>
						</tr>
						
						 <tr>
				            <td class="line" width="" align="center" bgcolor="#F5F5F5">첨부파일</td>
				            <td colspan="3">
				            	<div>
				            		<a href="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" >${files1.fileNm}</a><br>
				            		<c:if test="${imgChk1 eq 'img'}">
				            			<img src="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" width="100px" height="100px"><br>
				            		</c:if>
				            	</div>
								<br>
								<div>
				            		<a href="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" >${files2.fileNm}</a><br>
				            		<c:if test="${imgChk2 eq 'img'}">
				            			<img src="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" width="100px" height="100px"><br>
				            		</c:if>
				            	</div>
								<br>
								<div>
				            		<a href="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" >${files3.fileNm}</a><br>
				            		<c:if test="${imgChk3 eq 'img'}">
				            			<img src="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" width="100px" height="100px"><br>
				            		</c:if>
				            	</div>
								<br>
								<div>
				            		<a href="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" >${files4.fileNm}</a><br>
				            		<c:if test="${imgChk4 eq 'img'}">
				            			<img src="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" width="100px" height="100px"><br>
				            		</c:if>
				            	</div>
								<br>
								<div>
				            		<a href="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" >${files5.fileNm}</a><br>
				            		<c:if test="${imgChk5 eq 'img'}">
				            			<img src="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" width="100px" height="100px"><br>
				            		</c:if>
				            	</div>
								<br>
				            </td>
				        </tr>
						
					</table>
					<!-- 배너 정보 영역 종료 -->
				</td>
			</tr>
				
			<tr>
				<td>	
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;">
						<tr align="center" height="50px">
							<td class="" colspan="3" align="center">
					    		<button id="replyBtn" style="height:30px; width:100px;">저장</button>
					    		<span style="margin-left: 20px;"></span>
					    		<button id="cancleBtn" style="height:30px; width:100px;">리스트로</button>
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
</form>
</body>
</html>

