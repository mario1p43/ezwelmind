<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>열린상담실 관리</title>
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
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
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

		if(btnGb == '수정' ){
			alertMsg = "수정";
		}else if(btnGb == '답변등록'){
			alertMsg = "답변을 등록";
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
			$("#replyYn").val("Y");
			$("#status").val("100875");
		}

		j$.alert(alertMsg+'하시겠습니까?',function(){
			j$("#addPublic").submit();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/bbsPublic/list?bbsCd=publicCounsel&serviceType=SANGDAM4U";
		return false;
	});

});

</script>
</head>
<body>
<form id="addPublic" name="addPublic"  action="/madm/bbsPublic/update" method="post">

<input type="hidden" name="subject" value="${vo.subject}">
<input type="hidden" name="dataSeq" value="${vo.dataSeq}">
<input type="hidden" name="clientCd" value="${vo.clientCd}">
<input type="hidden" name="replyDataSeq" value="${vo.replyDataSeq}">
<input type="hidden" id="status" name="status" value="">
<input type="hidden" id="replyYn" name="replyYn" value="">
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
					공개상담 상세
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
	            <td align="left">
					${vo.regNm }
				</td>
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">등록자 아이디</th>
	            <td align="left" width="35%">
					${vo.regId }
				</td>
	        </tr>
	        <tr>
				<th class="line" align="center" bgcolor="#F5F5F5">고객사명</th>
	            <td align="left">
					${vo.clientNm }
				</td>
				<th class="line" align="center" bgcolor="#F5F5F5">고객사코드</th>
	            <td align="left">
					${vo.clientCd }
				</td>
	        </tr>
        	<tr>
				<th class="line" align="center" bgcolor="#F5F5F5">구분</th>
	            <td align="left" colspan="3">
	            	<comm:select name="reqCd1" code="100860" selectValue="${vo.reqCd1 }" />
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
					<c:if test="${not empty vo.replyDataSeq}">
						<input type="button" id="updateBtn" value="수정" style="height:30px; width:100px;">
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

