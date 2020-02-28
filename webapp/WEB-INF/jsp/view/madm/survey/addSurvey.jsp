<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>수요도 조사</title>
<script type="text/javascript">
j$(document).ready(function(){

	//달력
	j$('.date_timepicker_start').datetimepicker({
		format:'Ymd',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_end').val()?j$('.date_timepicker_end').val():false
			})
		},
		timepicker:false
	});

	j$("#surStDt").click(function(){
		j$('.date_timepicker_start').datetimepicker('show');
	});

	j$('.date_timepicker_end').datetimepicker({
		format:'Ymd',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_start').val()?j$('.date_timepicker_start').val():false
			})
		},
		timepicker:false
	});

	j$("#surEdDt").click(function(){
		j$('.date_timepicker_end').datetimepicker('show');
	});
	//달력

	j$("#addSurvey").validate({
		onkeyup:false,
		onclick:false,
		onfocusout:false,
		showErrors:function(errorMap, errorList){
			if (this.numberOfInvalids()) {
				alert(errorList[0].message);
			}
		},
		rules : {
			clientCd			: {required:true},
			svcCate				: {required:true},
			svcNm				: {required:true},
			surStDt				: {required:true},
			surEdDt				: {required:true}
		},
		messages: {
			clientCd			: "고객사코드를 선택하세요",
			svcCate				: "카테고리를 선택하세요",
			svcNm				: "서비스를 선택하세요",
			surStDt				: "시작일을 선택하세요",
			surEdDt				: "종료일을 선택하세요"
		},
		submitHandler: function(form) {

			if( j$("input:radio[name=surCate]:checked").length == 0 ) {
				 j$.alert("카테고리를 선택하세요");
				 return;
			}

			j$.alert('등록하겠습니까?',function(){
					form.submit();
				 },function(){
				 	return false;
				 }
		 	);
		}
	});

	j$('#insertBtn').click(function(){
		j$("#addSurvey").submit();
		return false;
	});

});

function serviceListPopup() {
	window.open("/madm/survey/popup/serviceListPopup?Oform=add", "serviceListPopup", "scrollbars=yes, width=700, height=600");
}

function svcSet(svcSeq, svcNm){
	j$('#svcSeq').val(svcSeq);
	j$('#svcNm').val(svcNm);
	return false;
}
</script>
</head>
<body>
<form id="addSurvey" name="addSurvey"  action="/madm/survey/insertSurvey" method="POST" >

<!-- 버튼 영역 시작 -->
<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-bottom: 1px solid silver;">
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="left" class="subtitle">수요도 조사</td>
	</tr>
</table>
<br/>
<!-- 버튼 영역 종료 -->

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th class="line" width="15%" height="25" align="center" bgcolor="#F5F5F5"><span style="color:RED">* </span>고객사</th>
				<td width="18%" align="left" colspan="3">
					<select id="clientCd" name="clientCd" style="height: 20px;">
		    			<option value="">---- 선택 ----</option>
		    			<c:forEach var="list" items="${clientList}">
		    				<option value="${list.clientCd }" >${list.clientNm }</option>
		    			</c:forEach>
		    		</select>
				</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5"> <span style="color:RED">* </span>카테고리</th>
				<td align="left" colspan="3">
					<c:forEach var="cateList" items="${cateList}">
		    			<input type="radio" name="surCate" value="${cateList.commCd}"/> ${cateList.commNm}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5"> <span style="color:RED">* </span>서비스</th>
				<td width="80%" align="left" colspan="3">
					<input type="hidden" name="svcSeq" id="svcSeq" value=""/>
					<input type="text" name="svcNm" id="svcNm" onclick="javascript:serviceListPopup();" size="50" readonly="readonly"/>
					<input type="button" onclick="javascript:serviceListPopup();" value="찾아보기"/>
				</td>
			</tr>
			<tr>
				<th class="line" align="center" bgcolor="#F5F5F5"> <span style="color:RED">* </span>시작/종료일</th>
				<td width="40%" align="left">
					<input type="text" name="surStDt" size="10" class="date_timepicker_start"/>
					<img id="surStDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					&nbsp;~&nbsp;
					<input type="text" name="surEdDt" size="10" class="date_timepicker_end"/>
					<img id="surEdDt" src="${url:img('/images/icon02.jpg')}"border="0" />
				</td>
				<td class="line" width="10%" height="25" align="center" bgcolor="#F5F5F5"> <span style="color:RED">* </span>사용유무</td>
				<td width="40%" align="left">
					<input type="radio" name="useYn" value="Y" checked="checked"> Y
					<input type="radio" name="useYn" value="N" > N
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
					<input type="button" id="insertBtn" value="등록" style="height:30px; width:100px;">
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form>

</body>
</html>

