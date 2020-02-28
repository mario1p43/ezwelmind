<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>공지사항 관리</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];

j$(document).ready(function(){

	j$("#addColumn").validate({
		onkeyup:false,
		onclick:false,
		onfocusout:false,
		showErrors:function(errorMap, errorList){
			if (this.numberOfInvalids()) {
				alert(errorList[0].message);
			}
		},
		rules : {
			notice  : {required:true},
			subject : {required:true},
			content : {required:true},
			dispYn  : {required:true}
		},
		messages: {
			notice  : "구분을 선택하세요",
			subject : "제목을 입력하세요",
			content : "내용을 입력하세요",
			dispYn  : "노출여부를 체크해주세요"
		},
		submitHandler: function(form) {
			var tempVal = j$("#ir1").text();
			var checkVal = "<p>&nbsp;</p>";

			if(checkVal == tempVal){
				alert("내용을 입력하세요");
				return false;
			}
			form.submit();
		}
	});

	j$('#insertBtn').click(function(){
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		j$.alert('등록하겠습니까?',function(){
				j$("#addColumn").submit();
			 },function(){
			 	return false;
			 }
     	);
		return false;
	});

	j$('#updateBtn').click(function() {
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		j$.alert('수정하시겠습니까?',function(){
			j$("#addColumn").attr("action","/madm/bbsColumn/update");
			j$("#addColumn").submit();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$('#deleteBtn').click(function() {
		j$("#addColumn").attr("action","/madm/bbsColumn/delete");
		j$.alert('삭제하시겠습니까?',function(){
			location.href = "/madm/bbsColumn/delete?dataSeq=" + j$('#dataSeq').val();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/bbsColumn/list?bbsCd=notice";
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
            fOnAppLoad : function(){}
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
  		 },
	    fCreator: "createSEditor2"
	});
});
</script>
</head>
<body>

<form id="addColumn" name="addColumn"  action="/madm/bbsColumn/add" method="POST" enctype="multipart/form-data">
<c:if test="${vo ne null}">
	<input type="hidden" name="dataSeq" id="dataSeq" value="${vo.dataSeq}">
</c:if>

<input type="hidden" name="bbsCd" id="bbsCd" value="column"/>
<input type="hidden" name="dataType" value="100005">
<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
	<td height="20px">
		<input type="hidden" name="serviceType" id="serviceType" value="${serviceType }">
	<td>
<tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">
			    	<c:choose>
						<c:when test="${viewMode eq 'add'}">
							웹진/칼럼 등록
						</c:when>
						<c:otherwise>
							웹진/칼럼 상세
						</c:otherwise>
					</c:choose>
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
		            	<input type="text" name="subject" style="width:90%;" value="${vo.subject}" />
		            </td>
		        </tr>
		        <tr>
					<th class="line" align="center" bgcolor="#F5F5F5">등록자</th>
		            <td align="left" colspan="3">
						<c:choose>
							<c:when test="${viewMode eq 'add'}">
				            	<sec:authentication property="principal.user.userNm"/>
							</c:when>
							<c:otherwise>
								${vo.regNm }
							</c:otherwise>
						</c:choose>
					</td>
		        </tr>
		        <tr>
		            <th class="line" width="" align="center" bgcolor="#F5F5F5">전체 고객사<br>적용여부</th>
		            <td colspan="3">
						<input type="radio" name="allClientYn" value="Y" ${vo.allClientYn != 'N' ? 'checked':''}> 노출
						<input type="radio" name="allClientYn" value="N" ${vo.allClientYn == 'N' ? 'checked':''}> 비노출
		            </td>
		        </tr>
		        <tr>
		            <th class="line" width="" align="center" bgcolor="#F5F5F5">내용</th>
		            <td colspan="3">
		            	<textarea rows="10" cols="30" id="ir1" name="content" style="width:100%; height:400px;">${vo.content}</textarea>
		            </td>
		        </tr>
		        <tr>
		            <th class="line" width="" height="40px" align="center" bgcolor="#F5F5F5">노출여부</th>
		            <td colspan="3">
						<input type="radio" name="dispYn" value="Y" ${vo.dispYn != 'N' ? 'checked':''}> 노출
						<input type="radio" name="dispYn" value="N" ${vo.dispYn == 'N' ? 'checked':''}> 비노출
					</td>
		        </tr>

		        <tr>
		            <th class="line" width="" align="center" bgcolor="#F5F5F5">첨부파일</th>
		            <td colspan="3">
		            	<div>
		            		<a href="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" >${files1.fileNm}</a><br>
		            		<c:if test="${imgChk1 eq 'img'}">
		            			<img src="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" width="100px" height="100px"><br>
		            		</c:if>
		            		<input type="file" name="file" id="file01" size="50"    /><br>
		            		<input type="hidden" name="file1" value="${files1.fileSeq}" >
		            	</div>
						<br>
						<div>
		            		<a href="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" >${files2.fileNm}</a><br>
		            		<c:if test="${imgChk2 eq 'img'}">
		            			<img src="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" width="100px" height="100px"><br>
		            		</c:if>
		            		<input type="file" name="file" id="file02" size="50"    /><br>
		            		<input type="hidden" name="file2" value="${files2.fileSeq}" >

		            	</div>
						<br>
						<div>
		            		<a href="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" >${files3.fileNm}</a><br>
		            		<c:if test="${imgChk3 eq 'img'}">
		            			<img src="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" width="100px" height="100px"><br>
		            		</c:if>
		            		<input type="file" name="file" id="file03" size="50"    /><br>
		            		<input type="hidden" name="file3" value="${files3.fileSeq}" >
		            	</div>
						<br>
						<div>
		            		<a href="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" >${files4.fileNm}</a><br>
		            		<c:if test="${imgChk4 eq 'img'}">
		            			<img src="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" width="100px" height="100px"><br>
		            		</c:if>
		            		<input type="file" name="file" id="file04" size="50"    /><br>
		            		<input type="hidden" name="file4" value="${files4.fileSeq}" >
		            	</div>
						<br>
						<div>
		            		<a href="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" >${files5.fileNm}</a><br>
		            		<c:if test="${imgChk5 eq 'img'}">
		            			<img src="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" width="100px" height="100px"><br>
		            		</c:if>
		            		<input type="file" name="file" id="file05" size="50"    /><br>
		            		<input type="hidden" name="file5" value="${files5.fileSeq}" >
		            	</div>
						<br>
		            </td>
		        </tr>

		</table>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
		    		<c:choose>
						<c:when test="${viewMode eq 'add'}">
							<input type="button" id="insertBtn" value="저장" style="height:30px; width:100px;">
						</c:when>
						<c:otherwise>
							<input type="button" id="updateBtn" value="수정" style="height:30px; width:100px;">
							<input type="button" id="deleteBtn" value="삭제" style="height:30px; width:100px;">
						</c:otherwise>
					</c:choose>
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

