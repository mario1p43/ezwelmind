<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>언론보도 관리</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
var linkIdx = 2;

j$(document).ready(function(){

	j$("#addPress").validate({
		onkeyup:false,
		onclick:false,
		onfocusout:false,
		showErrors:function(errorMap, errorList){
			if (this.numberOfInvalids()) {
				alert(errorList[0].message);
			}
		},
		rules : {
			subject  	  : {required:true},
			reqCd1   	  : {required:true},
			thumbFileSeq  : {required:true},
			newsDd		  : {required:true},
			content  	  : {required:true},
			dispYn   	  : {required:true},
			mediaNm	 	  : {required:true},
			mediaDd	  	  : {required:true},
			mediaSubject  : {required:true},
			links		  : {required:true}
		},
		messages: {
			subject   		: "제목을 입력하세요",
			reqCd1    		: "구분을 선택하세요",
			thumbFileSeq 	: "썸네일을 저장하세요",
			newsDd			: "보도일을 입력하세요",
			content   		: "내용을 입력하세요",
			dispYn    		: "노출여부를 체크해주세요",
			mediaNm  		: "관련기사 언론사명을 입력해주세요",
			mediaDd   	 	: "관련기사 보도일을 입력해주세요",
			mediaSubject   	: "관련기사 제목을 입력해주세요",
			links       	: "관련기사 링크를 입력해주세요"
		},
		submitHandler: function(form) {
			var tempVal = j$("#ir1").text();
			var checkVal = "<p>&nbsp;</p>";

			if(checkVal == tempVal){
				alert("내용을 입력하세요");
				return false;
			}

			j$("#newsDd").val(replaceAll($("#newsDd").val(), ".", ""));

			form.submit();
		}
	});

	j$('#insertBtn').click(function(){
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		j$.alert('등록하겠습니까?',function(){
				j$("#addPress").submit();
			 },function(){
			 	return false;
			 }
     	);
		return false;
	});

	j$('#updateBtn').click(function() {
		j$("#addPress").attr("action","/madm/bbsPress/update");
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		j$.alert('수정하시겠습니까?',function(){
			j$("#addPress").submit();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$('#deleteBtn').click(function() {
		j$("#addPress").attr("action","/madm/bbsPress/delete");
		j$.alert('삭제하시겠습니까?',function(){
			location.href = "/madm/bbsPress/delete?dataSeq=" + j$('#dataSeq').val();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/bbsPress/list?bbsCd=press";
		return false;
	});

/* 	j$("#insertLink").click(function(){
		var linkId = 'link0'+linkIdx;

		if(linkIdx < 6){
			j$("#"+linkId).show();
		}else{
			alert("관련기사 링크는 최대 5개까지 등록 가능합니다.");
		}

		linkIdx += 1;
		return false;
	}); */

	j$('.date_timepicker_btstartDt1').datetimepicker({
		format:'Y.m.d',
		timepicker:false
	});

	j$("#btstartDt1").click(function(){
		j$('.date_timepicker_btstartDt1').datetimepicker('show');
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
<form id="addPress" name="addPress"  action="/madm/bbsPress/add" method="POST" enctype="multipart/form-data">
<c:if test="${vo ne null}">
	<input type="hidden" name="dataSeq" id="dataSeq" value="${vo.dataSeq}">
</c:if>

<input type="hidden" name="bbsCd" id="bbsCd" value="press"/>
<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr><td height="20px"><td><tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">언론보도 등록</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
		        <tr>
		            <td class="line" width="15%" align="center" bgcolor="#F5F5F5">제목</td>
		            <td width="85%" colspan="3">
		            	<input type="text" name="subject" style="width:90%;" value="" />
		            </td>
		        </tr>
		        <tr>
					<td class="line" align="center" bgcolor="#F5F5F5">등록자</td>
		            <td align="left" colspan="3">
						<sec:authentication property="principal.user.userNm"/>
					</td>
		        </tr>
		        <tr>
					<td class="line" align="center" bgcolor="#F5F5F5">보도일</td>
		            <td align="left" colspan="3">
						<input type="text" name="newsDd" id="newsDd" size="10" value="" class="date_timepicker_btstartDt1"/>
						<img id="btstartDt1" src="http://img.ezwel.com/welfare_pms/images/common/icon02.jpg"border="0" />
					</td>
		        </tr>
		        <tr>
					<td class="line" width="" align="center" bgcolor="#F5F5F5">썸네일</td>
		            <td colspan="3">
		            	<input type="file" name="thumbFile" id="file06" size="50" value="${thumbFile.filePath}" /><br>
						<input type="hidden" name="thumbFileSeq" value="${thumbFile.fileSeq}" >
						<a href="<spring:eval expression="@global['upload.http.img']" />${thumbFile.filePath}" target="_blank">${thumbFile.fileNm}</a><br>
		            </td>
		        </tr>
		        <tr>
		            <td class="line" width="" align="center" bgcolor="#F5F5F5">내용</td>
		            <td colspan="3">
		            	<textarea rows="10" cols="30" id="ir1" name="content" style="width:100%; height:400px;"></textarea>
		            </td>
		        </tr>
		        <tr>
		            <td class="line" width="" height="40px" align="center" bgcolor="#F5F5F5">노출</td>
		            <td colspan="3">
						<input type="radio" name="dispYn" value="Y" ${vo.dispYn != 'N' ? 'checked':''}> 노출
						<input type="radio" name="dispYn" value="N" ${vo.dispYn == 'N' ? 'checked':''}> 비노출
					</td>
		        </tr>

		        <tr>
		            <td class="line" width="" align="center" bgcolor="#F5F5F5">
		            	관련기사 링크 <br>
		            	<!-- <input type="button" id="insertLink" value="추가"> -->
		            </td>
		            <td colspan="3">
		            	<br>
	            		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
	            			<tr>
	            				<th colspan="2">관련기사 1</th>
	            			</tr>
	            			<tr>
	            				<td>미디어명</td>
	            				<td><input type="text" name="mediaNmArr" size="50" value=""></td>
	            			</tr>
	            			<tr>
	            				<td>기사제목</td>
	            				<td><input type="text" name="mediaSubjectArr" size="50" value=""></td>
	            			</tr>
	            			<tr>
	            				<td>보도일</td>
	            				<td>
	            					<input type="text" name="mediaDdArr" size="10" value="" class="date_timepicker_btstartDt1"/>
									<img id="btstartDt1" src="http://img.ezwel.com/welfare_pms/images/common/icon02.jpg"border="0" />
								</td>
	            			</tr>
	            			<tr>
	            				<td>링크</td>
	            				<td><input type="text" name="mediaLinkArr" size="100"  value=""/></td>
	            			</tr>
	            		</table>

	            		<div id="link02" >
	            			<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
		            			<tr>
		            				<th colspan="2">관련기사 2</th>
		            			</tr>
		            			<tr>
		            				<td>미디어명</td>
		            				<td><input type="text" name="mediaNmArr" size="50" value=""></td>
		            			</tr>
		            			<tr>
		            				<td>기사제목</td>
		            				<td><input type="text" name="mediaSubjectArr" size="100" value=""></td>
		            			</tr>
		            			<tr>
		            				<td>보도일</td>
		            				<td>
		            					<input type="text" name="mediaDdArr" size="10" value="" class="date_timepicker_btstartDt1"/>
										<img id="btstartDt1" src="http://img.ezwel.com/welfare_pms/images/common/icon02.jpg"border="0" />
									</td>
		            			</tr>
		            			<tr>
		            				<td>링크</td>
		            				<td><input type="text" name="mediaLinkArr" size="100" value=""/></td>
		            			</tr>
	            			</table>
            			</div>

            			<div id="link03" >
	            			<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
		            			<tr>
		            				<th colspan="2">관련기사 3</th>
		            			</tr>
		            			<tr>
		            				<td>미디어명</td>
		            				<td><input type="text" name="mediaNmArr" size="50" value=""></td>
		            			</tr>
		            			<tr>
		            				<td>기사제목</td>
		            				<td><input type="text" name="mediaSubjectArr" size="50" value=""></td>
		            			</tr>
		            			<tr>
		            				<td>보도일</td>
		            				<td>
		            					<input type="text" name="mediaDdArr" size="10" value="" class="date_timepicker_btstartDt1"/>
										<img id="btstartDt1" src="http://img.ezwel.com/welfare_pms/images/common/icon02.jpg"border="0" />
									</td>
		            			</tr>
		            			<tr>
		            				<td>링크</td>
		            				<td><input type="text" name="mediaLinkArr" size="100" value=""/></td>
		            			</tr>
	            			</table>
            			</div>

            			<div id="link04" >
	            			<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
		            			<tr>
		            				<th colspan="2">관련기사 4</th>
		            			</tr>
		            			<tr>
		            				<td>미디어명</td>
		            				<td><input type="text" name="mediaNmArr" size="50" value=""></td>
		            			</tr>
		            			<tr>
		            				<td>기사제목</td>
		            				<td><input type="text" name="mediaSubjectArr" size="50" value=""></td>
		            			</tr>
		            			<tr>
		            				<td>보도일</td>
		            				<td>
		            					<input type="text" name="mediaDdArr" size="10" value="" class="date_timepicker_btstartDt1"/>
										<img id="btstartDt1" src="http://img.ezwel.com/welfare_pms/images/common/icon02.jpg"border="0" />
									</td>
		            			</tr>
		            			<tr>
		            				<td>링크</td>
		            				<td><input type="text" name="mediaLinkArr" size="100" value=""/></td>
		            			</tr>
	            			</table>
            			</div>

            			<div id="link05" >
	            			<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
		            			<tr>
		            				<th colspan="2">관련기사 5</th>
		            			</tr>
		            			<tr>
		            				<td>미디어명</td>
		            				<td><input type="text" name="mediaNmArr" size="50" value=""></td>
		            			</tr>
		            			<tr>
		            				<td>기사제목</td>
		            				<td><input type="text" name="mediaSubjectArr" size="50" value=""></td>
		            			</tr>
		            			<tr>
		            				<td>보도일</td>
		            				<td>
		            					<input type="text" name="mediaDdArr" size="10" value="" class="date_timepicker_btstartDt1"/>
										<img id="btstartDt1" src="http://img.ezwel.com/welfare_pms/images/common/icon02.jpg"border="0" />
									</td>
		            			</tr>
		            			<tr>
		            				<td>링크</td>
		            				<td><input type="text" name="mediaLinkArr" size="100" value=""/></td>
		            			</tr>
	            			</table>
            			</div>
		            	<br>
		            </td>
		        </tr>

		</table>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="insertBtn" value="저장" style="height:30px; width:100px;">
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

