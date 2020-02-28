<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상담사관리 등록</title>
<script type="text/javascript">
var num = 0;
var de ="";
var delCnt = 1;
var chkId = 0;
j$(document).ready(function(){
	
	j$('#userId').change(function(){
		chkId = 0;
	});

	<c:if test='${not empty mgr.channelType}'>
	var chkValue = '${mgr.channelType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=channelType][value=' + chkArr[i] + ']').attr('checked',true);
		if(chkArr[i] == 100001){
	    	$(".psyGroup").show();
	    	$("#mentalAges").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담대상을 선택해주세요");
	    	$("#mentalDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
	    	$("#mentalType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
	    }else if(chkArr[i] == 100002){
	    	$(".lawGroup").show();
	    	$("#lawDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
	    	$("#lawType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
	    }else if(chkArr[i] == 100003){
	    	$(".finGroup").show();
	    	$("#financeDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
	    	$("#financeType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
	    }else if(chkArr[i] == 100004){
	    	$(".psyTestGroup").show();
	    	$("#diagnosisAges").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담대상을 선택해주세요");
	    	$("#diagnosisDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
	    	$("#diagnosisType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
	    }
		}
	}
	</c:if>

	j$("input:checkbox").on("click",function() {
	    var check = $(this).val();

	    if($(this).is(":checked")){
		    if(check == 100001){
		    	$(".psyGroup").show();
		    	$("#mentalAges").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담대상을 선택해주세요");
		    	$("#mentalDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
		    	$("#mentalType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
		    }else if(check == 100002){
		    	$(".lawGroup").show();
		    	$("#lawDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
		    	$("#lawType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
		    }else if(check == 100003){
		    	$(".finGroup").show();
		    	$("#financeDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
		    	$("#financeType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
		    }else if(check == 100004){
		    	$(".psyTestGroup").show();
		    	$("#diagnosisAges").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담대상을 선택해주세요");
		    	$("#diagnosisDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
		    	$("#diagnosisType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
		    }
		}else{
			if(check == 100001){
		    	$(".psyGroup").attr("style","display: none");
		    	$(".mentalAges").attr("checked", false);
		    	$(".mentalDiv").attr("checked", false);
		    	$(".mentalType").attr("checked", false);
		    	$("#mentalDivEtc").val("");
		    	$("#mentalAges").removeAttr("data-validation");
		    	$("#mentalDiv").removeAttr("data-validation");
		    	$("#mentalType").removeAttr("data-validation");
		    }else if(check == 100002){
		    	$(".lawGroup").attr("style","display: none");
		    	$(".lawDiv").attr("checked", false);
		    	$(".lawType").attr("checked", false);
		    	$("#lawDiv").removeAttr("data-validation");
		    	$("#lawType").removeAttr("data-validation");
		    }else if(check == 100003){
		    	$(".finGroup").attr("style","display: none");
		    	$(".financeDiv").attr("checked", false);
		    	$(".financeType").attr("checked", false);
		    	$("#financeDiv").removeAttr("data-validation");
		    	$("#financeType").removeAttr("data-validation");
		    }else if(check == 100004){
		    	$(".psyTestGroup").attr("style","display: none");
		    	$(".diagnosisAges").attr("checked", false);
		    	$(".diagnosisDiv").attr("checked", false);
		    	$(".diagnosisType").attr("checked", false);
		    	$("#diagnosisDivEtc").val("");
		    	$("#diagnosisAges").removeAttr("data-validation");
		    	$("#diagnosisDiv").removeAttr("data-validation");
		    	$("#diagnosisType").removeAttr("data-validation");
		    }else if(check == 100011){
		    	$("#mentalDivEtc").val("");
		    }else if(check == 100024){
		    	$("#diagnosisDivEtc").val("");
		    }
		}
	});
	
	
	j$('#chkId').click(function() {
		
		var params = {};
		var strData = "";
		var userId = $("#userId").val()
		params.userId  = userId;
		if(userId == ""){
			return false;
		}else{
		j$.ajax({
			url: '/partner/mgr/checkId',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				var d =  data.mgr
				if(data.mgr != null){
				if(d.userId != ""){
					alert("중복되는 아이디가 존재합니다.");
					$("#userId").val("");
					chkId = 0;
				}
				}else{
					chkId = 1;
					alert("등록가능한 아이디입니다.");
				}
			}
		});
		}
		
	});
	
	
	//밸리데이션 체크
	$.validate({
		form : '#counselorAdd',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
			//$('[name=rrn]').val($('#rrn1').val() + "-" + $('#rrn2').val());
			$('[name=rrn]').val($('#rrn1').val());
			if(chkId != 1){
				alert("아이디 중복확인을 해야합니다.");
				return false;
			}
			else if(j$('#userPwd').val() != j$('#userPwdChk').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			alert("등록되었습니다.");
		}
	});
	
	j$('#addBtn').click(function() {
		if( $("#picAdd").val() != "" ){
			var ext = $('#picAdd').val().split('.').pop().toLowerCase();
			      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
				 alert('사진은 gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
				 return;
			      }
			}
		j$("#num").val(num);
		j$("#counselorAdd").submit();
	});
});



 function addRow(e){
	var params = {};
	var strData = "";
	
	if(num == (9-'${mgrCertCnt}')){
		alert("10개까지 등록 가능합니다.");
		return false;
	}
	num++;
	var oRow = e.insertRow(num);
	var oCel = oRow.insertCell();
	
	//oCel.innerHTML = "<comm:select name='certCd"+num+"'  code='100275'  basicValue='선택'  /><input type='text' name='etc"+num+"' id='certEtc"+num+"' /><input type='file' name='file"+num+"' data-validation='required' data-validation-error-msg-required='첨부파일은 필수입니다.' />";
	j$.ajax({
		url: '/partner/mgr/ajaxCert',
		data: params,
		dataType: 'json',
		type: 'GET',
		cache:true,
		success: function(data, textStatus){
			strData =	"<select class='certClass' name='certCd"+num+"' id='certCd"+num+"' onChange='changeCert("+num+")' data-validation='required'>";
			strData +=	"<option value=''>선택</option>";
			j$.each(data.serviceList, function(i, serviceList){
				strData += "   <option value='"+serviceList.commCd+"'>"+serviceList.commNm+"</option>";
			});
			strData +=	"</select>";	
			strData +=	"<input type='text' name='etc"+num+"' id='certEtc"+num+"' style='width: 210px'/><input type='file' name='file_"+num+"' data-validation='required' data-validation-error-msg-required='첨부파일은 필수입니다.' />";
			oCel.innerHTML = strData;
			
		}
	});

	} 

function delRow(e){
	if(num == 0){
		alert("최소1개 이상 등록 하셔야 합니다.");
		return false;
	}
	var oTr = e.deleteRow(num);
	num--;
}
function changeCert(num){
	var fm =  document.counselorAdd;
	switch(num){
		case(1) :
			if(fm.certCd1.options[fm.certCd1.selectedIndex].value != "100747" && fm.certCd1.options[fm.certCd1.selectedIndex].value != ""){
				$("#certEtc1").val(fm.certCd1.options[fm.certCd1.selectedIndex].text);
			    $("#certEtc1").attr('disabled', true);
			}else{
				$("#certEtc1").val("");
		        $("#certEtc1").attr('disabled', false);
			}
		break;
		case(2) :
			if(fm.certCd2.options[fm.certCd2.selectedIndex].value != "100747" && fm.certCd2.options[fm.certCd2.selectedIndex].value != ""){
				$("#certEtc2").val(fm.certCd2.options[fm.certCd2.selectedIndex].text);
			    $("#certEtc2").attr('disabled', true);
			}else{
				$("#certEtc2").val("");
		        $("#certEtc2").attr('disabled', false);
			}
			break;
		case(3) :
			if(fm.certCd3.options[fm.certCd3.selectedIndex].value != "100747" && fm.certCd3.options[fm.certCd3.selectedIndex].value != ""){
				$("#certEtc3").val(fm.certCd3.options[fm.certCd3.selectedIndex].text);
			    $("#certEtc3").attr('disabled', true);
			}else{
				$("#certEtc3").val("");
		        $("#certEtc3").attr('disabled', false);
			}
			break;
		case(4) :
			if(fm.certCd4.options[fm.certCd4.selectedIndex].value != "100747" && fm.certCd4.options[fm.certCd4.selectedIndex].value != ""){
				$("#certEtc4").val(fm.certCd4.options[fm.certCd4.selectedIndex].text);
			    $("#certEtc4").attr('disabled', true);
			}else{
				$("#certEtc4").val("");
		        $("#certEtc4").attr('disabled', false);
			}
			break;
		case(5) :
			if(fm.certCd5.options[fm.certCd5.selectedIndex].value != "100747" && fm.certCd5.options[fm.certCd5.selectedIndex].value != ""){
				$("#certEtc5").val(fm.certCd5.options[fm.certCd5.selectedIndex].text);
			    $("#certEtc5").attr('disabled', true);
			}else{
				$("#certEtc5").val("");
		        $("#certEtc5").attr('disabled', false);
			}
			break;
		case(6) :
			if(fm.certCd6.options[fm.certCd6.selectedIndex].value != "100747" && fm.certCd6.options[fm.certCd6.selectedIndex].value != ""){
				$("#certEtc6").val(fm.certCd6.options[fm.certCd6.selectedIndex].text);
			    $("#certEtc6").attr('disabled', true);
			}else{
				$("#certEtc6").val("");
		        $("#certEtc6").attr('disabled', false);
			}
			break;
		case(7) :
			if(fm.certCd7.options[fm.certCd7.selectedIndex].value != "100747" && fm.certCd7.options[fm.certCd7.selectedIndex].value != ""){
				$("#certEtc7").val(fm.certCd7.options[fm.certCd7.selectedIndex].text);
			    $("#certEtc7").attr('disabled', true);
			}else{
				$("#certEtc7").val("");
		        $("#certEtc7").attr('disabled', false);
			}
			break;
		case(8) :
			if(fm.certCd8.options[fm.certCd8.selectedIndex].value != "100747" && fm.certCd8.options[fm.certCd8.selectedIndex].value != ""){
				$("#certEtc8").val(fm.certCd8.options[fm.certCd8.selectedIndex].text);
			    $("#certEtc8").attr('disabled', true);
			}else{
				$("#certEtc8").val("");
		        $("#certEtc8").attr('disabled', false);
			}
			break;
		case(9) :
			if(fm.certCd9.options[fm.certCd9.selectedIndex].value != "100747" && fm.certCd9.options[fm.certCd9.selectedIndex].value != ""){
				$("#certEtc9").val(fm.certCd9.options[fm.certCd9.selectedIndex].text);
			    $("#certEtc9").attr('disabled', true);
			}else{
				$("#certEtc9").val("");
		        $("#certEtc9").attr('disabled', false);
			}
			break;
		case(0) :
			if(fm.certCd0.options[fm.certCd0.selectedIndex].value != "100747" && fm.certCd0.options[fm.certCd0.selectedIndex].value != ""){
				$("#certEtc0").val(fm.certCd0.options[fm.certCd0.selectedIndex].text);
			    $("#certEtc0").attr('disabled', true);
			}else{
				$("#certEtc0").val("");
		        $("#certEtc0").attr('disabled', false);
			}
			break;
		case(10) :
			if(fm.centerNm.options[fm.centerNm.selectedIndex].value != ""){
				$("#centerSeq").val(fm.centerNm.options[fm.centerNm.selectedIndex].value);
				$("#show").attr("style","display: block");
			}else{
				$("#centerSeq").val("");
				$("#show").attr("style","display: none");
			}
			break;
		case(11) :
			document.counselorAdd.centerNm.value = $("#centerSeq").val();
		if(document.counselorAdd.centerNm.value == $("#centerSeq").val()){
			$("#show").attr("style","display: block");
		}else{
			$("#show").attr("style","display: none");
		}
			break;	
		default :
			break;
	}
}

</script>

</head>
<body>
<form id="counselorAdd" name="counselorAdd" action="/partner/mgrHue/insertCounselorMgr" method="POST" enctype="multipart/form-data">
<input type="hidden" name="num" id="num">

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="left" class="subtitle">상담사 정보관리</td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="7%">&nbsp;&nbsp;센터명</th>
				<td class="line">
					<select id="centerNm" name="centerNm" onChange="changeCert(10)">
						<option value="">상담센터를 선택하세요</option>
						<c:forEach var="list" items="${centerList}" varStatus="listCnt">
								<option value="${list.centerSeq }" >${list.centerNm }</option>
						</c:forEach>
					</select>
				</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="8%">&nbsp;&nbsp;센터코드</th>
				<td class="line"><input type="text" name="centerSeq" id="centerSeq" style="width:150px;" onkeydown="if(event.keyCode == 13){changeCert(11)}"/> </td>
			</tr>
		</table>
		<br/>
		<div id="show" style="display: none;">	
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr align="left" height="30px">ㆍ개인정보
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%" >* 성명</th>
				<td width="40%"><input type="text" name="userNm" data-validation="required" data-validation-error-msg-required="성명을 확인해주세요." /></td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%">* 아이디</th>
				<td width="40%"><input type="text" name="userId" id="userId" data-validation="required" data-validation-error-msg-required="아이디를 확인해주세요.">  <input type="button" id="chkId" value="중복확인"></td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%" >* 비밀번호</th>
				<td><input type="password" name="userPwd" id="userPwd" data-validation="alphanumeric length" data-validation-length="6-12" data-validation-error-msg="비밀번호를 확인해주세요.">ㆍ영문자(소문자,대문자)+숫자의 조합으로 6~12자로 입력하세요.</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%">* 비밀번호 확인</th>
				<td><input type="password" name="userPwdChk" id="userPwdChk" data-validation="alphanumeric length" data-validation-length="6-12" data-validation-error-msg="비밀번호 학인을 확인해주세요."></td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 생년월일</th>
				<td>
				    <input type="number" maxlength="8" id="rrn1" style="width: 20%;" data-validation="length number" data-validation-length="8-8"  data-validation-error-msg="생년월일을 확인 해주세요." />
				    &nbsp;&nbsp;ex)&nbsp;19850612
				    <!--  
		    		-<input type="number" maxlength="1" id="rrn2" style="width: 10%;" data-validation="length number" data-validation-length="1-1"  data-validation-error-msg="생년월일을 확인 해주세요." />
		    		-->
		    		<input type="hidden" name="rrn">
				</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 성별</th>
				<td>
					<input type="radio" name="gender" value="M" data-validation="required" data-validation-error-msg-required="성별을 확인해주세요."/> 남성
					<input type="radio" name="gender" value="F" /> 여성
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 연락처</th>
				<td class="line" colspan="1" >
				    <input type="number" id="mobile1" style="width: 10%;" data-validation="length" data-validation-length="2-3"  data-validation-error-msg-length="연락처를 확인 해주세요." />-
		    		<input type="number" id="mobile2" style="width: 10%;" data-validation="length" data-validation-length="3-4"  data-validation-error-msg-length="연락처를 확인 해주세요." />-
		    		<input type="number" id="mobile3" style="width: 10%;" data-validation="length" data-validation-length="4-4"  data-validation-error-msg-length="연락처를 확인 해주세요." />
		    		<input type="hidden" name="mobile">
				</td>
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 이메일</th>
				<td>
					<input type="text" name="email" style="width:150px;" data-validation="email" data-validation-error-msg-email="이메일을 확인 해주세요." /> 
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 학력</th>
				<td class="line" colspan="3">
					<input type="radio" name="education" value="S" data-validation="required"  data-validation-error-msg-required="학력을 확인해주세요."/> 학사
					<input type="radio" name="education" value="M" data-validation="required" /> 석사
					<input type="radio" name="education" value="D" /> 박사
					<input type="text" name="university" style="width:80px;" data-validation="required"  data-validation-error-msg-required="대학(원)을 확인 해주세요."/> 대학(원)
					<input type="text" name="department" style="width:80px;" data-validation="required"  data-validation-error-msg-required="학과를 확인 해주세요."/> 학과
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 경력</td>
				<td class="line" colspan="3">
					<span> * 업무를 수행하신 기간, 기관명, 담당업무를 기술해 주세요.</span><br />
					<textarea rows="5" cols="80" maxlength="1500" name="career" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요."></textarea>
				</td>
			</tr>
			<tr align="left" height="30px">
						<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 자격&nbsp;&nbsp; <input type="button" id="plus" onclick="addRow(cert);" value="+" />&nbsp;<input type="button" onclick="delRow(cert);" value="-" /> </th>
						<td class="line" colspan="3">
						<table id="cert">
							<tr align="left" >
							<td class="line" >
							<select class="certClass" name="certCd0" id="certCd0" onChange="changeCert(0)" data-validation='required' data-validation-error-msg-required="자격증은 최소 1개 이상 등록 해야합니다.">
							<option value=''>선택</option>
								<c:forEach var="list" items="${certList}" varStatus="listCnt">
								<option value="${list.commCd }">${list.commNm }</option>
								</c:forEach>
							</select>
							<input type='text' name="etc0" id="certEtc0" style="width: 210px"/><input type='file' name="file_0" data-validation='required' data-validation-error-msg-required="첨부파일은 필수입니다." />
							</td>
							</tr>
						</table>	
						</td>
					</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 전문분야</th>
				<td class="line" colspan="3">
					<input type="text" name="memo1" style="width:40%;"  data-validation="required"  data-validation-error-msg-required="전문분야를 확인 해주세요."/>
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;메시지</th>
				<td class="line" colspan="3">
					<input type="text" name="memo" style="width:40%;" />
				</td>
			</tr>			
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;사진</th>
		    	<td class="line" colspan="3" >
		    		<input type="file" name="picAdd" id="picAdd"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">* 접속권한</th>
				<td >
					<input type="radio" name="authCd" value="ROLE_P_CENTER_HUE" data-validation="required" data-validation-error-msg-required="접속권한을 확인해주세요."/> 센터장
					<input type="radio" name="authCd" value="ROLE_P_SANGDAM_HUE" /> 상담사					
				</td>
				 
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">* 근무형태</th>
				<td >
					<input type="radio" name="workType" value="S" data-validation="required" data-validation-error-msg-required="근무형태를 확인해주세요."/> 상주
					<input type="radio" name="workType" value="P" /> 파트타임
				</td>
				</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담계약금액</th>
				<td class="line" colspan="3">
					<input type="number" name="price" style="width:10%;"  data-validation="required" data-validation-error-msg-required="상담계약금액을 확인해주세요."  />
				</td>
			</tr>				
			<tr>			
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">* 상태</th>
				<td colspan="3">
					<input type="radio" name="mgrStatus" value="S" data-validation="required" data-validation-error-msg-required="근무형태를 확인해주세요."/> 대기
					<input type="radio" name="mgrStatus" value="Y" /> 승인
					<input type="radio" name="mgrStatus" value="N" /> 중지
				</td>							
			</tr>
		</table>
		
<br/>ㆍ상담유형
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<td colspan="2" class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%">* 유형선택</td>
				<td>
					<input type="checkbox" name="channelType" value="100001" data-validation="checkbox_group" data-validation-qty="min1" data-validation-error-msg="유형을 선택해주세요."/> 심리
					<input type="checkbox" name="channelType" value="100002" /> 법률
					<input type="checkbox" name="channelType" value="100003" /> 재무
					<input type="checkbox" name="channelType" value="100004" /> 심리검사
				</td>
			</tr>
			
			<!-- 심리 -->
			<tr class="psyGroup" style="display: none;">
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="3">&nbsp;심리</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담대상</td>
				<td >
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100447" id="mentalAges"/> 유아동
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100448" /> 아동
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100449" /> 청소년
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100450" /> 성인
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100451" /> 노년기 성인
				</td>
			</tr>
			<tr class="psyGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야</td>
				<td>
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100005"  id="mentalDiv"/> 개인상담
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100006"  /> 부부/가족상담
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100007"  /> 놀이치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100008"  /> 미술치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100009"  /> 언어치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100010"  /> 특수재활치료 <br />
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100011"  /> 기타 
					<input type="text" name="mentalDivEtc" id="mentalDivEtc" style="width:500px;" >  
				</td>
			</tr>
			<tr class="psyGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법</td>
				<td>
					<input type="checkbox" class="mentalType" name="mentalType"  value="100433" id="mentalType" /> 대면
					<input type="checkbox" class="mentalType" name="mentalType"  value="100434"  /> 전화
					<input type="checkbox" class="mentalType" name="mentalType"  value="100435"  /> 게시판
					<input type="checkbox" class="mentalType" name="mentalType"  value="100436"  /> 파견
					<input type="checkbox" class="mentalType" name="mentalType"  value="100437"  /> 집단
					<input type="checkbox" class="mentalType" name="mentalType"  value="100438"  /> 강의
				</td>
			</tr>
			
			<!-- 법률 -->
			<tr class="lawGroup" style="display: none;">
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="2">&nbsp;법률</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야</td>
				<td >
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100012" id="lawDiv" /> 일반법률
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100013"  /> 부동산법률
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100014"  /> 세무
				</td>
			</tr>
			<tr class="lawGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법</td>
				<td>
					<input type="checkbox" class="lawType" name="lawType"  value="100433" id="lawType" /> 대면
					<input type="checkbox" class="lawType" name="lawType"  value="100434"  /> 전화
					<input type="checkbox" class="lawType" name="lawType"  value="100435"  /> 게시판
					<input type="checkbox" class="lawType" name="lawType"  value="100436"  /> 파견
					<input type="checkbox" class="lawType" name="lawType"  value="100437"  /> 집단
					<input type="checkbox" class="lawType" name="lawType"  value="100438"  /> 강의
				</td>
			</tr>
			
			<!-- 재무 -->
			<tr class="finGroup" style="display: none;">
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="2">&nbsp;재무</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야</td>
				<td >
					<input type="checkbox" class="financeDiv" name="financeDiv"  value="100015" id="financeDiv" /> 재무상담
				</td>
			</tr>
			<tr class="finGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법</td>
				<td>
					<input type="checkbox" class="financeType" name="financeType"  value="100433" id="financeType" /> 대면
					<input type="checkbox" class="financeType" name="financeType"  value="100434"  /> 전화
					<input type="checkbox" class="financeType" name="financeType"  value="100435"  /> 게시판
					<input type="checkbox" class="financeType" name="financeType"  value="100436"  /> 파견
					<input type="checkbox" class="financeType" name="financeType"  value="100437"  /> 집단
					<input type="checkbox" class="financeType" name="financeType"  value="100438"  /> 강의
				</td>
			</tr>
			
			<!-- 심리검사 -->
			<tr class="psyTestGroup" style="display: none;">
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="3">&nbsp;심리<br />&nbsp;검사</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담대상</td>
				<td >
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100447" id="diagnosisAges" /> 유아동
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100448"  /> 아동
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100449"  /> 청소년
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100450"  /> 성인
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100451"  /> 노년기 성인
				</td>
			</tr>
			<tr class="psyTestGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야</td>
				<td>
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100016" id="diagnosisDiv" /> 종합심리검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100017"  /> 정서 및 성격검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100018"  /> 진로 및 적성검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100019"  /> 신경심리검사 <br />
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100020"  /> 기타 
					<input type="text" name="diagnosisDivEtc" id="diagnosisDivEtc" style="width:500px;" > 
				</td>
			</tr>
			<tr class="psyTestGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법</td>
				<td>
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100433" id="diagnosisType" /> 대면
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100434"  /> 전화
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100435"  /> 게시판
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100436"  /> 파견
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100437"  /> 집단
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100438"  /> 강의
				</td>
			</tr>
		</table>
 		
 		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="addBtn" value="등록" style="height:30px; width:100px;">
					<span style="margin-left: 20px;"></span>
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 시작 -->
		</div>
	</td>
</tr>

</table>
</form>

</body>
</html>