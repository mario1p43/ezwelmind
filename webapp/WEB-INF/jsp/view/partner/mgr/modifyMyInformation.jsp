<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담사 정보관리 수정</title>


<script type="text/javascript">
	var num = 0;
	var de ="";
	var count = 0;
	var delCnt = 1;
	j$(document).ready(function(){

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
		
		<c:if test='${not empty mgr.mentalAges}'>
		var chkValue = '${mgr.mentalAges}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=mentalAges][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.mentalDiv}'>
		var chkValue = '${mgr.mentalDiv}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=mentalDiv][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.mentalType}'>
		var chkValue = '${mgr.mentalType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=mentalType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.lawDiv}'>
		var chkValue = '${mgr.lawDiv}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=lawDiv][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.lawType}'>
		var chkValue = '${mgr.lawType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=lawType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.financeDiv}'>
		var chkValue = '${mgr.financeDiv}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=financeDiv][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.financeType}'>
		var chkValue = '${mgr.financeType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=financeType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.diagnosisAges}'>
		var chkValue = '${mgr.diagnosisAges}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=diagnosisAges][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.diagnosisDiv}'>
		var chkValue = '${mgr.diagnosisDiv}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=diagnosisDiv][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.diagnosisType}'>
		var chkValue = '${mgr.diagnosisType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=diagnosisType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.rrn}'>
		var rrn = '${mgr.rrn}';
		var time = new Date();
		var year = time.getFullYear();
		var rrnYear;
	 	if(rrn.substring(7) <= 2){
			rrnYear  = "19"+rrn.substring(0,2) ;
		}else if(2 < rrn.substring(7) <= 4){
			rrnYear  = "20"+rrn.substring(0,2) ;
		}
	 	
		var age = (year - rrnYear+1)+'세';
		 document.getElementById("age").innerHTML = age;
		</c:if>
		
		
		<c:if test='${not empty mgr.languageType}'>
		var chkValue = '${mgr.languageType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=languageType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>

		<c:if test='${not empty mgr.specialType}'>
		var chkValue = '${mgr.specialType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=specialType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		

		<c:if test='${not empty mgr.jobType}'>
		var chkValue = '${mgr.jobType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=jobType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		<c:if test='${not empty mgr.personalType}'>
		var chkValue = '${mgr.personalType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=personalType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.familyType}'>
		var chkValue = '${mgr.familyType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=familyType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		<c:if test='${not empty mgr.traumaType}'>
		var chkValue = '${mgr.traumaType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=traumaType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.targetType}'>
		var chkValue = '${mgr.targetType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=targetType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
				
		<c:if test='${not empty mgr.financeCounselType}'>
		var chkValue = '${mgr.financeCounselType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=financeCounselType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.lawCounselType}'>
		var chkValue = '${mgr.lawCounselType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=lawCounselType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.preferredType}'>
		var chkValue = '${mgr.preferredType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=preferredType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		<c:if test='${not empty mgr.tendencyType}'>
		var chkValue = '${mgr.tendencyType}';
		var chkArr = chkValue.split(',');
		for (var i = 0; i < chkArr.length; i++) {
			if(chkArr[i] != ""){
			$('[name=tendencyType][value=' + chkArr[i] + ']').attr('checked',true);
			}
		}
		</c:if>
		
		// 상담사가 상태가 승인이면, 상담유형을 변경할 수 없도록
		j$("#counselTypeInfo").find('input').click(function(){
			if('${mgr.mgrStatus}' == 'Y'){
				alert('승인된 상담사의 상담유형정보는 변경할 수 없습니다.');
				return false;
			}
			
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

		j$("#delPhotoBtn").click(function(){
			j$("#delPhoto").val('${mgr.fileNm }');
			return false;
		});
		
		j$("#modifyBtn").click(function(){
			j$("#num").val(num);
			j$("#count").val(count);
			j$("#updateCounselorInfoMgr").submit();
			return false;
		});
		
	
		j$("input:checkbox").on("click",function() {
		    
		    
		    
		});

		
		//밸리데이션 체크
		$.validate({
			form : '#updateCounselorInfoMgr',
			validateOnBlur : false,
			validateOnAlert : true,
			onSuccess : function(){
				$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
			}
		});

		
		j$('#updateBtn').click(function() {

			if(j$("#centerOwnerYn").is(":checked")){
				j$("#ownerYn").val("Y");
				if('${loginId}' == '${mgr.userId}'){
					j$("#num").val(num);
					j$("#count").val(count);
					j$("#updateCounselorInfoMgr").submit();
				}else{
					j$.alert('이미 등록된 대표 센터장을 교체하시겠습니까?',function(){
						j$("#num").val(num);
						j$("#count").val(count);
						j$("#updateCounselorInfoMgr").submit();
					 },function(){
					 	return false;
					 }
					);
				}
			}else{
				j$("#ownerYn").val("N");
				j$("#num").val(num);
				j$("#count").val(count);
				j$("#updateCounselorInfoMgr").submit();
			}	
			return false;
		});	
	});

	function delCertRow(e,h){
		var certCnt = '${mgrCertCnt}';
		if(certCnt == delCnt){
			alert("최소 1개 이상 등록 해야합니다.");
			return false;
		}
		de += e+",";
		
		document.getElementById("d").innerHTML = "<input type='hidden' name='D' value='"+de+"' /> "
		count++;
		delCnt++
		document.getElementById(h).style.display = "none";
	}


	function addRow(e){
		var params = {};
		var strData = "";
		if(num == (10-'${mgrCertCnt}')){
			alert("10개까지 등록 가능합니다.");
			return false;
		}
		num++;
		var oRow = e.insertRow(num);
		var oCel = oRow.insertCell();
		
		//oCel.innerHTML = "<comm:select name='certCd"+num+"'  code='100275' /><input type='text' name='etc"+num+"' id='certEtc"+num+"' /><input type='file' name='file"+num+"' data-validation='required' data-validation-error-msg-required='첨부파일은 필수입니다.' />";
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
			return false;
		}
		var oTr = e.deleteRow(num);
		num--;
	}
	function changeCert(num){
		var fm =  document.updateCounselorInfoMgr;
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
			case(10) :
				if(fm.certCd10.options[fm.certCd10.selectedIndex].value != "100747" && fm.certCd10.options[fm.certCd10.selectedIndex].value != ""){
					$("#certEtc10").val(fm.certCd10.options[fm.certCd10.selectedIndex].text);
				    $("#certEtc10").attr('disabled', true);
				}else{
					$("#certEtc10").val("");
			        $("#certEtc10").attr('disabled', false);
				}
				break;
			default :
				break;
		}
	}

</script>
</head>
<body>
<form id="updateCounselorInfoMgr" name="updateCounselorInfoMgr" action="/partner/mgr/updateCounselorInfoMgr" method="POST" enctype="multipart/form-data">
<input type="hidden" name="num" id="num">
<input type="hidden" name="count" id="count">
<input type="hidden" name="delPhoto" id="delPhoto">
<input type="hidden" name="ownerYn" id="ownerYn">
<input type="hidden" name="mgrCertCnt" id="mgrCertCnt" value="${mgrCertCnt}">
<input type="hidden" name="mgrStatus" id="mgrStatus" value="${mgr.mgrStatus}">

<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-bottom: 1px solid silver;">
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="left" class="subtitle">상담사 정보관리</td>
	</tr>
</table>
<br/>

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
	<td valign="top" align="left">
		<table  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr align="left" height="30px">ㆍ개인정보
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%" na>&nbsp;&nbsp;성명(아이디)</th>
				<td width="40%">
					<input type="hidden" name="userNm" value="${mgr.userNm}"/>${mgr.userNm}
					<input type="hidden" name="userId" value="${mgr.userId}"/>(${mgr.userId})
				</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%">&nbsp;&nbsp;나이/성별</th>
				<td width="40%" class="line"><label id="age" ></label>
						<c:choose>
							<c:when test="${mgr.gender eq 'M'}">
								남성
							</c:when>
							<c:otherwise>
								여성
							</c:otherwise>
						</c:choose>
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 연락처</th>
				<td class="line" colspan="1" >
				    <input type="number" maxlength="3" id="mobile1" value="${mgr.mobile1 }" style="width: 10%;" data-validation="length number" data-validation-length="2-3"  data-validation-error-msg="연락처를 확인 해주세요."/>-
		    		<input type="number" maxlength="4" id="mobile2" value="${mgr.mobile2 }" style="width: 10%;" data-validation="length number" data-validation-length="3-4"  data-validation-error-msg="연락처를 확인 해주세요." />-
		    		<input type="number" maxlength="4" id="mobile3" value="${mgr.mobile3 }" style="width: 10%;" data-validation="length number" data-validation-length="4-4"  data-validation-error-msg="연락처를 확인 해주세요." />
		    		<input type="hidden" name="mobile">
				</td>
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 이메일</th>
				<td>
					<input type="text" name="email" style="width:150px;" value="${mgr.email}" data-validation="email" data-validation-error-msg-email="이메일을 확인 해주세요." /> 
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 학력</th>
				<td class="line" colspan="3">
					<input type="radio" name="education" value="M" ${mgr.education == 'M' ? 'checked':''} /> 석사
					<input type="radio" name="education" value="D" ${mgr.education == 'D' ? 'checked':''} /> 박사
					<input type="text" name="university" style="width:80px;" value="${mgr.university}" data-validation="required"  data-validation-error-msg-required="대학원을 확인 해주세요."/> 대학원
					<input type="text" name="department" style="width:80px;" value="${mgr.department}" data-validation="required"  data-validation-error-msg-required="학과를 확인 해주세요."/> 학과
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 경력</td>
				<td class="line" colspan="3">
					<span> * 업무를 수행하신 기간, 기관명, 담당업무를 기술해 주세요.</span><br />
					<textarea rows="5" cols="80" maxlength="1500" name="career" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${mgr.career}</textarea>
				</td>
			</tr>
			<tr align="left" height="30px">
						<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 자격&nbsp;&nbsp; <input type="button" onclick="addRow(cert);" value="+" />&nbsp;<input type="button" onclick="delRow(cert);" value="-" /> </th>
						<td class="line" colspan="3">
						<table id="cert">
							<tr align="left" >
							<td class="line" >
								<c:forEach var="list" items="${mgrCert}" varStatus="listCnt">
								 <div id="${listCnt.index }" > 
									<comm:commNmOut code="${list.certCd }" option="commCd"  />
									<c:if test="${list.certCd eq 100747}">(${list.etc })</c:if>
									 / ${list.fileNm }
									 
									  <input type="button" value="다운로드" onclick="fileDownLoad('${list.filePath}', '${list.fileNm}')" ><input type="button" value="삭제" onclick="delCertRow('${list.fileNm }','${listCnt.index }');"><input type="hidden" id="d"> <br></div>
								</c:forEach>
							</td>
							</tr>
						</table>	
						</td>
					</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 한줄소개</th>
				<td class="line" colspan="3">
					<input type="text" name="memo" style="width:40%;" value="${mgr.memo}" data-validation="required"  data-validation-error-msg-required="한줄소개를 확인 해주세요."/>
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;사진</th>
		    	<td class="line" colspan="3" >
		    		<input type="file" name="picAdd" />&nbsp;
		    		${mgr.fileNm }
		    		<input type="button" value="삭제" id="delPhotoBtn"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5"><c:if test="${mgr.authCd ne 'ROLE_PARTNER_CENTER' }">*</c:if>접속권한</th>
				<td >
					<input type="radio" name="authCd" value="ROLE_PARTNER_SANGDAM" ${mgr.authCd == 'ROLE_PARTNER_SANGDAM'  ? 'checked':''} <c:if test="${mgr.authCd ne 'ROLE_PARTNER_CENTER' }"> data-validation="required" data-validation-error-msg-required="접속권한을 확인해주세요." </c:if> /> 상담
					<input type="radio" name="authCd" value="ROLE_PARTNER_SEND" ${mgr.authCd == 'ROLE_PARTNER_SEND'  ? 'checked':''} /> 파견
					<input type="radio" name="authCd" value="ROLE_PARTNER_GROUP" ${mgr.authCd == 'ROLE_PARTNER_GROUP'  ? 'checked':''} /> 집단
					<input type="radio" name="authCd" value="ROLE_PARTNER_TEACHER" ${mgr.authCd == 'ROLE_PARTNER_TEACHER'  ? 'checked':''} /> 강사
				</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 근무형태</th>
				<td>
					<input type="radio" name="workType" value="S" ${mgr.workType == 'S'  ? 'checked':''} /> 상주
					<input type="radio" name="workType" value="P" ${mgr.workType == 'P'  ? 'checked':''} /> 파트타임
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;등록일</th>
				<td>${mgr.regDt}</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;정보변경일</th>
				<td>${mgr.modiDt}</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;정보변경ID</th>
				<td class="line" colspan="3">${mgr.modiId}</td>
			</tr>
			<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
			<tr>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 대표여부</th>
				<td class="line" colspan="3">
					<input type="checkbox" name="centerOwnerYn" id="centerOwnerYn" value="Y" ${mgr.centerOwnerYn == 'Y'  ? 'checked':''}/> 지정
				</td>
			</tr>
			</sec:authorize>
		</table>
		
<br/>ㆍ상담유형
		<table id="counselTypeInfo" cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
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
					<input type="text" name="mentalDivEtc" id="mentalDivEtc" style="width:500px;" value="${mgr.mentalDivEtc }">  
				</td>
			</tr>
			<tr class="psyGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법</td>
				<td>
					<input type="checkbox" class="mentalType" name="mentalType"  value="100433" id="mentalType" /> 대면
					<input type="checkbox" class="mentalType" name="mentalType"  value="100434"  /> 전화
					<input type="checkbox" class="mentalType" name="mentalType"  value="100435"  /> 게시판
					<input type="checkbox" class="mentalType" name="mentalType"  value="100436"  /> 파견
					<input type="checkbox" class="mentalType" name="mentalType"  value="100437"  /> 진단
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
					<input type="checkbox" class="lawType" name="lawType"  value="100437"  /> 진단
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
					<input type="checkbox" class="financeType" name="financeType"  value="100437"  /> 진단
					<input type="checkbox" class="financeType" name="financeType"  value="100438"  /> 강의
				</td>
			</tr>
			
			<!-- 심리검사 -->
			<tr class="psyTestGroup" style="display: none;">
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="3">&nbsp;심리<br />&nbsp;감사</td>
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
					<input type="text" name="diagnosisDivEtc" id="diagnosisDivEtc" style="width:500px;" value="${mgr.diagnosisDivEtc }"> 
				</td>
			</tr>
			<tr class="psyTestGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법</td>
				<td>
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100433" id="diagnosisType" /> 대면
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100434"  /> 전화
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100435"  /> 게시판
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100436"  /> 파견
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100437"  /> 진단
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100438"  /> 강의
				</td>
			</tr>
		</table>
		
		<br/>ㆍCapability
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			
			
			<!-- 심리 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="2">Capability</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 외국어 상담</td>
				<td >		
					<input type="checkbox" class="languageType" name="languageType" value="101075" /> 영어
					<input type="checkbox" class="languageType" name="languageType" value="101076" /> 중국어
					<input type="checkbox" class="languageType" name="languageType" value="101077" /> 일본어
					<input type="checkbox" class="languageType" name="languageType" value="101078" /> 스페인어
					<input type="checkbox" class="languageType" name="languageType" value="101079" /> 프랑스어
					<input type="checkbox" class="languageType" name="languageType" value="101080" /> 기타
				</td>
			</tr>
			
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 특수주제</td>
				<td>
					<input type="checkbox" class="specialType" name="specialType"  value="101082"  /> 성피해상담
					<input type="checkbox" class="specialType" name="specialType"  value="101083"  /> 커리어상담
					<input type="checkbox" class="specialType" name="specialType"  value="101084"  /> 심리코칭
					<input type="checkbox" class="specialType" name="specialType"  value="101085"  /> 트라우마치료
					<input type="checkbox" class="specialType" name="specialType"  value="101086"  /> 애도상담
					<input type="checkbox" class="specialType" name="specialType"  value="101087"  /> 자살위기상담 <br />
					<input type="checkbox" class="specialType" name="specialType"  value="101088"  /> 직장내이슈 조사(직장내괴롭힘, 직장내성희롱 등)
					<input type="checkbox" class="specialType" name="specialType"  value="101089"  /> 내마음보고서 해석상담
					<input type="checkbox" class="specialType" name="specialType"  value="101090"  /> 수면상담(CBTI)
					<input type="checkbox" class="specialType" name="specialType"  value="101091"  /> 심리적응급처치(위기개입)
					<input type="text" name="mentalDivEtc" id="mentalDivEtc" style="width:500px;" >  
				</td>
			</tr>
			
			<!-- 직장관련 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="7">주요주제</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 직장관련</td>
				<td>
					<input type="checkbox" class="jobType" name="jobType"  value="101093"  /> 직무소진
					<input type="checkbox" class="jobType" name="jobType"  value="101094"  /> 스트레스관리
					<input type="checkbox" class="jobType" name="jobType"  value="101095"  /> 직무 무기력
					<input type="checkbox" class="jobType" name="jobType"  value="101096"  /> 감정노동스트레스
					<input type="checkbox" class="jobType" name="jobType"  value="101097"  /> 조직문화
					<input type="checkbox" class="jobType" name="jobType"  value="101098"  /> 직장 내 트라우마
					<br>
					<input type="checkbox" class="jobType" name="jobType"  value="101099"  /> 일가정양립(워킹맘/워킹파)
					<input type="checkbox" class="jobType" name="jobType"  value="101100"  /> 관계갈등
					<input type="checkbox" class="jobType" name="jobType"  value="101101"  /> 업무적응
					<input type="checkbox" class="jobType" name="jobType"  value="101102"  /> 직무복귀
					<input type="checkbox" class="jobType" name="jobType"  value="101103"  /> 업무능력향상
				</td>
			</tr>

			<!-- 개인관련 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 개인관련</td>
				<td>
					<input type="checkbox" class="personalType" name="personalType"  value="101105"  /> 자기탐색 및 이해
					<input type="checkbox" class="personalType" name="personalType"  value="101106"  /> 자기성장(미래설계, 적성, 진로 등)
					<br>
					<input type="checkbox" class="personalType" name="personalType"  value="101107"  /> 슬픔
					<input type="checkbox" class="personalType" name="personalType"  value="101108"  /> 분노조절
					<input type="checkbox" class="personalType" name="personalType"  value="101109"  /> 우울
					<input type="checkbox" class="personalType" name="personalType"  value="101110"  /> 불안
					<input type="checkbox" class="personalType" name="personalType"  value="101111"  /> 공황
					<input type="checkbox" class="personalType" name="personalType"  value="101112"  /> 무기력
					<input type="checkbox" class="personalType" name="personalType"  value="101113"  /> 무망감
					<br>
					<input type="checkbox" class="personalType" name="personalType"  value="101114"  />사회기술 부족
					<input type="checkbox" class="personalType" name="personalType"  value="101115"  />관계갈등
					<input type="checkbox" class="personalType" name="personalType"  value="101116"  />관계 내 어려움
					<br>
					<input type="checkbox" class="personalType" name="personalType"  value="101117"  />중독행동(알코올)
					<input type="checkbox" class="personalType" name="personalType"  value="101118"  />중독행동(도박)
					<input type="checkbox" class="personalType" name="personalType"  value="101119"  />중독행동(인터넷/스마트폰)
					<input type="checkbox" class="personalType" name="personalType"  value="101120"  />충동조절 어려움
					<br>
					<input type="checkbox" class="personalType" name="personalType"  value="101121"  />기타 정신건강의학적 증상(섭식문제, 성격장애 등)
				</td>
			</tr>
				
						
			<!-- 가족관련 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 가족관련</td>
				<td>
					<input type="checkbox" class="familyType" name="familyType"  value="101123"  /> 가족이해
					<input type="checkbox" class="familyType" name="familyType"  value="101124"  /> 자녀양육
					<input type="checkbox" class="familyType" name="familyType"  value="101125"  /> 문제행동
					<input type="checkbox" class="familyType" name="familyType"  value="101126"  /> 관계갈등
					<input type="checkbox" class="familyType" name="familyType"  value="101127"  /> 가족해체관련(이혼)
					<input type="checkbox" class="familyType" name="familyType"  value="101128"  /> 애도
					<br>
					<input type="checkbox" class="familyType" name="familyType"  value="101129"  /> 학습심리
					<input type="checkbox" class="familyType" name="familyType"  value="101130"  /> 주의력
					<input type="checkbox" class="familyType" name="familyType"  value="101131"  /> 학교적응
					<input type="checkbox" class="familyType" name="familyType"  value="101132"  /> 행동통제어려움
					<input type="checkbox" class="familyType" name="familyType"  value="101133"  /> 반항 및 문제행동
					<br>
					<input type="checkbox" class="familyType" name="familyType"  value="101134"  />발달문제(언어)
					<input type="checkbox" class="familyType" name="familyType"  value="101135"  />발달문제(지체 및 자폐)
					<input type="checkbox" class="familyType" name="familyType"  value="101136"  />행동문제
					<input type="checkbox" class="familyType" name="familyType"  value="101137"  />애착문제
					<input type="checkbox" class="familyType" name="familyType"  value="101138"  />학대 등
				</td>
			</tr>
			
			<!-- 충격/트라우마 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 충격/트라우마</td>
				<td>
					<input type="checkbox" class="traumaType" name="traumaType"  value="101140"  /> 범죄피해자
					<input type="checkbox" class="traumaType" name="traumaType"  value="101141"  /> 성피해
					<input type="checkbox" class="traumaType" name="traumaType"  value="101142"  /> 사고
					<input type="checkbox" class="traumaType" name="traumaType"  value="101143"  /> 파산
					<input type="checkbox" class="traumaType" name="traumaType"  value="101144"  /> 사회적 지탄
					<input type="checkbox" class="traumaType" name="traumaType"  value="101145"  /> 사망사고
					<input type="checkbox" class="traumaType" name="traumaType"  value="101146"  /> 충격사건
					<input type="checkbox" class="traumaType" name="traumaType"  value="101147"  /> 폭력 및 학대
				</td>
			</tr>
	
			<!-- 대상별 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 대상별</td>
				<td>
					<input type="checkbox" class="targetType" name="targetType"  value="101149" id="mentalType" /> 임원급
					<input type="checkbox" class="targetType" name="targetType"  value="101150"  /> 감정노동자
					<input type="checkbox" class="targetType" name="targetType"  value="101151"  /> 교대근무자
					<input type="checkbox" class="targetType" name="targetType"  value="101152"  /> 신입사원
					<input type="checkbox" class="targetType" name="targetType"  value="101153"  /> 영유아
				</td>
			</tr>

			<!-- 법률 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 법률</td>
				<td>
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101155" id="mentalType" /> 가정사 – 이혼, 상속, 유언 등
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101156"  /> 금전거래 – 권리금, 보증금, 떼인돈 등
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101157"  /> 손해배상 – 교통사고, 의료사고, 때린사건, 맞은사건 등 
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101158"  /> 부동산 – 주택임대차, 상가임대차, 유치권, 명도소송 등 
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101159"  /> 빚-채무 – 개인회생, 개인파산
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101160"  /> 기타 – 성추행, 저작권, 노무관련, 행정처분 등
				</td>
			</tr>

			<!-- 재무 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 재무</td>
				<td>
					<input type="checkbox" class="financeCounselType" name="financeCounselType"  value="101162" id="mentalType" /> 신입사원 재무설계
					<input type="checkbox" class="financeCounselType" name="financeCounselType"  value="101163"  /> 신혼부부 재테크
					<input type="checkbox" class="financeCounselType" name="financeCounselType"  value="101164"  /> 노후자금 마련
					<input type="checkbox" class="financeCounselType" name="financeCounselType"  value="101165"  /> 주택마련
				</td>
			</tr>
			
			<!-- 상담선호 -->
			<!-- 단회기상담  -->
			<tr class="psyGroup">
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="2">상담선호</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 단회기상담</td>
				<td>
					<input type="checkbox" class="preferredType" name="preferredType"  value="101167" id="mentalType" /> 단회기상담 선호여부
				</td>
			</tr>
			<!-- 선호접근 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 선호접근</td>
				<td>
					<input type="checkbox" class="preferredType" name="preferredType"  value="101168"	 /> 인지행동접근
					<input type="checkbox" class="preferredType" name="preferredType"  value="101169"  /> 정신분적적접근
					<input type="checkbox" class="preferredType" name="preferredType"  value="101170"  /> 인본주의적 접근
					<input type="checkbox" class="preferredType" name="preferredType"  value="101171"  /> 현상학적접근(게슈탈트)
					<input type="checkbox" class="preferredType" name="preferredType"  value=""  /> 기타(주관식)
				</td>
			</tr>
			<!-- 상담성향 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" colspan="2">상담성향</td>
				<td>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101173"  /> 공감적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101174"  /> 편안한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101175"  /> 잘 들어주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101176"  /> 따뜻한
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101177"  /> 위로가 되는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101178"  /> 포근한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101179"  /> 온화한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101180"  /> 신뢰로운
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101181"  /> 안심되는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101182"  /> 진정성 있는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101183"  /> 진솔한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101184"  /> 성의있는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101185"  /> 성심을 다하는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101186"  /> 진지한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101187"  /> 진중한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101188"  /> 자상한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101189"  /> 배려하는 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101190"  /> 상냥한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101191"  /> 케어해주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101192"  /> 푸근한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101193"  /> 눈높이를 맞추는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101194"  /> 용기를 주는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101195" /> 응원해주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101196"  /> 희망적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101197"  /> 긍정적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101198"  /> 즐거운
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101199"  /> 친절한 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101200"  /> 적극적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101201"  /> 속시원한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101202"  /> 부담없는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101203"  /> 명쾌한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101204"  /> 솔직한
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101205"  /> 재밌는 
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101206"  /> 자유로운
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101207"  /> 섬세한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101208"  /> 구체적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101209"  /> 상세히 설명하는 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101210"  /> 계획적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101211"  /> 세밀한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101212"  /> 차근차근한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101213"  /> 분석적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101214"  /> 진단해주는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101215" /> 예리한  
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101216"  /> 객관적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101217"  /> 현실적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101218"  /> 전문적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101219"  /> 숙련된 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101220"  /> 깊이 있는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101221"  /> 새로운 관점의
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101222"  /> 통찰력 있는 
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101223"  /> 맥을 잘 짚는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101224"  /> 문제를 잘 파악하는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101225"  /> 내가 몰랐던 것을 알게 해주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101226"  /> 방향을 제시하는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101227"  /> 조언을 주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101228"  /> 해결책을 제시하는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101229"  /> 길을 잡아주는

				</td>
			</tr>
		
		
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="updateBtn" value="수정" style="height:30px; width:100px;">
					<span style="margin-left: 20px;"></span>
					<input type="button" id="cancleBtn" onclick="history.back()" value="취소" style="height:30px; width:100px;">
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

</table>
</form>

</body>
</html>