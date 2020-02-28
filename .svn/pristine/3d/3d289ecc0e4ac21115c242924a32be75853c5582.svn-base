<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>페이지 관리</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
var oEditors = [];

j$(document).ready(function(){

	j$("#insertBtn").click(function(){
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		j$("#pageForm").submit();
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

<h1>[페이지관리]</h1>

<form id="pageForm" action="/madm/bbsPage/modifyPageBbs" method="POST">
<input type="hidden" name="dataSeq" value="${detail.dataSeq}" />

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
<!-- 	        <tr> -->
<!-- 	            <td class="line" width="15%" align="center" bgcolor="#F5F5F5"> -->
<!-- 	            	HTML_URL -->
<!-- 	            </td> -->
<!-- 	            <td width="35%"> -->
<%-- 					${detail.htmlUrl} --%>
<!-- 				</td> -->
<!-- 				<td class="line" width="15%" align="center" bgcolor="#F5F5F5">수정자</td> -->
<!-- 	            <td width="35%" align="left"> -->
<%-- 					${empty detail.modiId ? "-" : detail.modiId} --%>
<!-- 				</td> -->
<!-- 	        </tr> -->
	        <tr>
	            <td class="line" width="" align="center" bgcolor="#F5F5F5">제목</td>
	            <td>
	            	<input type="text" name="subject" style="width:100%;" value="${detail.subject}"/>
	            </td>
	            <td class="line" width="" align="center" bgcolor="#F5F5F5">페이지키</td>
	            <td>
	            	<input type="text" name="pageKey" style="width:90%;" value="${detail.pageKey}"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="line" width="" align="center" bgcolor="#F5F5F5">HTML페이지</td>
	            <td colspan="3">
	                <textarea rows="10" cols="70" id="ir1" name="content" style="width:100%; height:500px">${detail.content}</textarea>
	            </td>
	        </tr>
		</table>

		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
		    		<input type="button" id="insertBtn" value="저장" style="height:30px; width:100px;">
		    	</td>
			</tr>
		</table>
	</td>
</tr>
</table>

</form>

</body>
</html>

