<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사 업무요청 상세정보</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];


j$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir1",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true, 
            fOnBeforeUnload : function(){}, 
            fOnAppLoad : function(){
            } 
    	}, 
	    fCreator: "createSEditor2"
	});
});

j$(document).ready(function(){
	j$("#replyBtn").click(function(){
		var dataSeq = j$("#dataSeq").val();
		location.href = "/madm/ecrm/addTaskRequestForm?dataSeq=" + dataSeq;
		return false;
	});
	
	j$("#cancleBtn").click(function(){
		location.href = "/madm/ecrm/taskRequestList";
		return false;
	});
});

function modifyAlert(){
	alert("고객사관리자가 작성한 글은 수정할 수 없습니다. \n답글을 등록해주세요.");
}
</script>
</head>
<body>
<input type="hidden" id="dataSeq" name="dataSeq" value="${detail.dataSeq }">
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
	<td valign="top" align="center">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td align="left" class="subtitle">고객사 업무요청 상세정보</td>
			</tr>
			<tr>
				<td height="20px"></td>
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
					    		<comm:select name="status"  onchange="modifyAlert();" code="100563"  basicValue="---- 선택 ----" selectValue="${detail.status }" />
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">글제목</th>
					    	<td class="line" colspan="3">
					    		<input type="text" readonly="readonly" value="${detail.subject }" style="width:90%;"/>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">내용</th>
					    	<td class="line" colspan="3">
					    		<textarea rows="10" cols="30" id="ir1" style="width:100%;">${detail.content }</textarea>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" align="center" bgcolor="#F5F5F5">등록일시</th>
					    	<td class="line" >
					    		${detail.regDt }
 					    	</td>
 					    	<th class="line" align="center" bgcolor="#F5F5F5">수정일시</th>
					    	<td class="line" >
					    		${detail.modiDt }
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
			
			<c:if test="${detail.highDataSeq eq '-1' }">
				<tr>	
					<td height="10px"></td>
				</tr>
				
				<tr>
					<td> <strong> ※ </strong> <span style="color: #2E64FE;">업무요청</span>은 수정하실 수 없습니다. <span style="color: #2E64FE;">답글</span>을 이용해주세요.</td>
				</tr>
			</c:if>
			<tr>
				<td height="10px"></td>
			</tr>
				
			<tr>
				<td>	
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;">
						<tr align="center" height="50px">
							<td class="" colspan="3" align="center">
								<c:if test="${detail.highDataSeq eq '-1' }">
						    		<button id="replyBtn" style="height:30px; width:100px;">답변달기</button>
						    		<span style="margin-left: 20px;"></span>
								</c:if>
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

</body>
</html>

