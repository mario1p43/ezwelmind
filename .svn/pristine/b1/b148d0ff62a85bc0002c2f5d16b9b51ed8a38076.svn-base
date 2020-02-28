<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>1:1문의내역 관리</title>
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
            fOnAppLoad : function(){}
  		 },
	    fCreator: "createSEditor2"
	});
});

j$(document).ready(function(){

	j$('#updateBtn').click(function() {
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		var btnGb = $('#updateBtn').val();
		var alertMsg = "";
		var status = "";

		if(btnGb == '답변등록'){
			alertMsg = "답변 등록 후 수정하실 수 없습니다. 등록 하시겠습니까? ";
		}

		//답변 내용체크
		var cont = $("#ir1").val();
		cont = cont.replace(/(<([^>]+)>)/ig,"");
		cont = cont.replace("&nbsp;", "");

		var nStrCheck = cont.indexOf("&nbsp;");
        while (nStrCheck != -1) {
        	cont = cont.replace("&nbsp;", "");
            nStrCheck  = cont.indexOf("&nbsp;");
        }
		//답변 내용체크

		if(cont.length == 0){
			alert("답변내용을 입력하세요.");
			j$("#ir1").focus();
			return false;
		}else{
			var replyDataSeq = $("#replyDataSeq").val();
			if(replyDataSeq.length == 0){
				$("#replyYn").val("Y");
			}

			$("#status").val("100875");
		}

		j$.alert(alertMsg,function(){
			j$("#addInquiry").submit();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/bbsInquiry/list?bbsCd=faqPersonal&serviceType=SANGDAM4U";
		return false;
	});
});
</script>
</head>
<body>
<form id="addInquiry" name="addInquiry"  action="/madm/bbsInquiry/update" method="post">

<input type="hidden" name="subject" value="${vo.subject}">
<input type="hidden" name="dataSeq" value="${vo.dataSeq}">
<input type="hidden" name="clientCd" value="${vo.clientCd}">
<input type="hidden" name="replyDataSeq" id="replyDataSeq" value="${vo.replyDataSeq}">
<input type="hidden" id="status" name="status" value="">
<input type="hidden" id="replyYn" name="replyYn" value="">
<input type="hidden" name="regContent" value="${vo.content}">
<input type="hidden" name="regNm" value="${vo.regNm}"/>
<input type="hidden" name="regEmail" value="${vo.regEmail}"/>
<input type="hidden" name="regMobile" value="${vo.regMobile}"/>
<input type="hidden" name="inquiryRegDt" value="${vo.inquiryRegDt}"/>

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
					1:1문의 답변 등록
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
					${vo.regNm } (${vo.clientNm })
				</td>
	        </tr>
	        <tr>
				<th class="line" align="center" bgcolor="#F5F5F5">연락처</th>
	            <td align="left" colspan="3">
					${vo.regMobile }
				</td>
	        </tr>
	        <tr>
				<th class="line" align="center" bgcolor="#F5F5F5">Email</th>
	            <td align="left" colspan="3">
					${vo.regEmail }
				</td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">내용</th>
	            <td colspan="3">
	            	${vo.content}
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="" height="40px" align="center" bgcolor="#F5F5F5">노출</th>
	            <td colspan="3">
					<input type="radio" name="dispYn" value="Y" ${vo.dispYn != 'N' ? 'checked':''}> 노출
					<input type="radio" name="dispYn" value="N" ${vo.dispYn == 'N' ? 'checked':''}> 비노출
				</td>
	        </tr>
	        <tr>
	            <th class="line" width="" align="center" bgcolor="#F5F5F5">답변 내용</th>
	            <td colspan="3">
	            	<textarea rows="10" cols="10" id="ir1" name="content" style="width:99%; height:400px;">${vo.replyContent}</textarea>
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
					<c:if test="${empty vo.replyDataSeq}">
						<input type="button" id="updateBtn" value="답변등록" style="height:30px; width:100px;">
					</c:if>
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

