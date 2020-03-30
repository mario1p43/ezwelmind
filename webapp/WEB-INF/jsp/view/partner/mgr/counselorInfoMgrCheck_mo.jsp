<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>

<head>
	<title>상담사 정보관리 수정</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<style>
		table{border-spacing: 0 !important}
		table td{background: none !important}
		input{border: none;}
		input[type=text]{ padding-left:1.3889vw; border-color:rgb(169, 169, 169);}
		.flex{display: flex; display: -webkit-flex;}
		.flexColumn{flex-direction: column;}
		.flexRow{flex-direction: row;}
		.flexRowReverse{flex-direction: row-reverse;}
		.flexGrow{-webkit-flex-grow: 1; flex-grow: 1; flex : 1 1 0;  -webkit-flex : 1 1 0;}
		.flexGrow2{flex-grow: 1;}
		.center{-webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center; }/* 가로세로중앙정렬 */
		.centerH{-webkit-align-items: center; align-items: center; }/* 세로중앙정렬 */
		.rightR{-webkit-justify-content: flex-end; justify-content: flex-end; }
		.rightC{-webkit-align-items: flex-end; align-items: flex-end;}
		.flexWrap{flex-wrap:wrap;}
		.flexWrap span{margin-right: 10px; margin-bottom: 10px;}
		
		.content-wrapper{padding: 0 5vw;}
		.content-input{font-weight: normal; font-size: 14px; color: black;}
		.content-input::placeholder{font-weight: normal; font-size: 14px; color: #828282;}
		.content-input.alignLeft{text-align: left;}
		.content-input.alignCenter{text-align: center;}
	
		.border{border: 1px solid #828282;}
		.textAlignLeft{text-align: left;}
	
		.hyphen{margin:0 5px;}
		.underline{border-bottom:1px solid #bdbdbd;}
	
		.title{font-weight: bold; font-size: 20px; color: black; margin-top:2.7778vw;}
		.subject{font-weight: bold; font-size: 16px; color: black;}
		.label{font-weight: bold; font-size: 14px; color: black;}
		.subLabel{font-weight: normal; font-size: 14px; color: #828282;}
		.contentLabel{font-weight: normal; font-size: 14px; color: black;}
		.subContentLabel{font-weight: normal; font-size: 14px; color: #333333;}
	
		.width-one-half{width: 50vw;}
		.width-one-third{width: 33vw;}
		.width-one-quarter{width: 25vw;}
		.width-one-fifth{width: 20vw;}
		.width-one-tenth{width: 10vw;}
	
		.width-fourty{width: 40vw;}
		.width-thirty{width: 30vw;}
		.width-fifteen{width: 15vw;}
	
		.height-one-tenth{height: 8.8889vw;}
		.height-fifteen{height: 15vw;}
		
		.button-blue{color: #2F80ED; border: none; outline: none; background: none; padding: 0;}
		.button-red{color: #eb5757; border: none; outline: none; background: none; padding: 0;}
		.button-gray{color: #828282; border: none; outline: none; background-color: #e0e0e0; padding: 0; font-size: 16px; font-weight: bold;}
	
		.selectGroupThird select:nth-child(1){margin-right:5px;}
		.selectGroupThird select:nth-child(2){margin-right:5px;}
		.selectGroupTwo select:nth-child(1){margin-right:5px;}
	
		.bottomPadding{padding-bottom: 5px;}
		.bottomMargin{margin-bottom: 5px;}
	
	</style>

<script type="text/javascript">
	var num = 0;
	var de ="";
	var count = 0;
	var delCnt = 1;
	
	
	j$(document).ready(function(){
		$("input").attr("readonly",true);
		$("input[type=checkbox]").attr("disabled",true);
		$("input[type=radio]").attr("disabled",true);
		$("select").attr("disabled",true);
		
		
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
<form id="updateCounselorInfoMgr" name="updateCounselorInfoMgr" action="/partner/mgr/insertCounselorInfoMgr" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="num" id="num">
	<input type="hidden" name="count" id="count">
	<input type="hidden" name="delPhoto" id="delPhoto">
	<input type="hidden" name="ownerYn" id="ownerYn">
	<input type="hidden" name="mgrCertCnt" id="mgrCertCnt" value="${mgrCertCnt}">
	<input type="hidden" name="mgrStatus" id="mgrStatus" value="${mgr.mgrStatus}">
	<div class="content-wrapper flex flexColumn">
		<span class="flex title height-fifteen">상담사 정보관리</span>
		<span class="flex subject height-one-tenth">개인정보</span>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">성명(아이디)</span>
			<div class="flex flexGrow centerH">
				<input class="content-input" type="hidden" name="userNm" value="${mgr.userNm}">${mgr.userNm}</input>
				<input class="content-input" type="hidden" name="userId" value="${mgr.userId}">(${mgr.userId})</input>
			</div>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">나이/성별</span>
			<span class="flex centerH contentLabel width-one-quarter"><label id="age"></label>
				<c:choose>
					<c:when test="${mgr.gender eq 'M'}">
						남성
					</c:when>
					<c:otherwise>
						여성
					</c:otherwise>
				</c:choose>
			</span>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">이메일</span>
			<input class="content-input flexGrow" type="text" name="email"
				data-validation="email" data-validation-error-msg-email="이메일을 확인 해주세요."
				placeholder="asdf1234@gmail.com" value="${mgr.email}"></input>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">연락처</span>
			<input class="content-input alignCenter width-one-tenth" type="text"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3" id="mobile1"
				value="${mgr.mobile1 }" data-validation="length number" data-validation-length="2-3"
				data-validation-error-msg="연락처를 확인 해주세요." placeholder="010" value="${mgr.mobile1 }"></input>
			<span class="flex subLabel centerH hyphen">-</span>
			<input class="content-input alignCenter width-fifteen" type="text"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" id="mobile2"
				value="${mgr.mobile2 }" data-validation="length number" data-validation-length="3-4"
				data-validation-error-msg="연락처를 확인 해주세요." placeholder="1234" value="${mgr.mobile2 }"></input>
			<span class="flex subLabel centerH hyphen">-</span>
			<input class="content-input alignCenter width-fifteen" type="text"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" id="mobile3"
				value="${mgr.mobile3 }" data-validation="length number" data-validation-length="4-4"
				data-validation-error-msg="연락처를 확인 해주세요." placeholder="1234" value="${mgr.mobile3 }"></input>
			<input type="hidden" name="mobile">
		</div>
		<div class="underline flex height-fifteen">
			<span class="flex label centerH width-thirty">SMS인증용<br>연락처</span>
			<input class="content-input alignCenter width-one-tenth" type="text"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3" id="mobilesms1"
				value="${mgr.mobilesms1 }" data-validation="length number" data-validation-length="2-3"
				data-validation-error-msg="연락처를 확인 해주세요." placeholder="010" value="${mgr.mobilesms1 }"></input>
			<span class="flex subLabel centerH hyphen">-</span>
			<input class="content-input alignCenter width-fifteen" type="text"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" id="mobilesms2"
				value="${mgr.mobilesms2 }" data-validation="length number" data-validation-length="3-4"
				data-validation-error-msg="연락처를 확인 해주세요." placeholder="1234" value="${mgr.mobilesms2 }"></input>
			<span class="flex subLabel centerH hyphen">-</span>
			<input class="content-input alignCenter width-fifteen" type="text"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" id="mobilesms3"
				value="${mgr.mobilesms3 }" data-validation="length number" data-validation-length="4-4"
				data-validation-error-msg="연락처를 확인 해주세요." placeholder="1234" value="${mgr.mobilesms3 }"></input>
			<input type="hidden" name="mobileSms">
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<span class="flex centerH label width-thirty height-one-tenth">학위취득사항</span>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="university" value="${mgr.university}"
					placeholder="학교명"></input>
			</div>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="department" value="${mgr.department}"
					placeholder="학과(전공)"></input>
			</div>
			<div class="flex selectGroupThird">
				<select class="flexGrow height-one-tenth contentLabel" name="education" id="education">
					<option value="M">학사</option>
					<option value="D">석사</option>
					<option value="S">박사</option>
				</select>
				<select class="flexGrow height-one-tenth contentLabel" name="eduStatus" id="eduStatus">
					<option value="졸업">졸업</option>
					<option value="재학">재학</option>
				</select>
				<select class="flexGrow height-one-tenth contentLabel" name="eduYear" id="eduYear"></select>
			</div>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="university2" value="${mgr.university2}"
					placeholder="학교명"></input>
			</div>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="department2" value="${mgr.department2}"
					placeholder="학과(전공)"></input>
			</div>
			<div class="flex selectGroupThird">
				<select class="flexGrow height-one-tenth contentLabel" name="education2" id="education2">
					<option value="M">학사</option>
					<option value="D">석사</option>
					<option value="S">박사</option>
				</select>
				<select class="flexGrow height-one-tenth contentLabel" name="eduStatus2" id="eduStatus2">
					<option value="졸업">졸업</option>
					<option value="재학">재학</option>
				</select>
				<select class="flexGrow height-one-tenth contentLabel" name="eduYear2" id="eduYear2"></select>
			</div>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="university3" value="${mgr.university3}"
					placeholder="학교명"></input>
			</div>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="department3" value="${mgr.department3}"
					placeholder="학과(전공)"></input>
			</div>
			<div class="flex selectGroupThird">
				<select class="flexGrow height-one-tenth contentLabel" name="education3" id="education3">
					<option value="M">학사</option>
					<option value="D">석사</option>
					<option value="S">박사</option>
				</select>
				<select class="flexGrow height-one-tenth contentLabel" name="eduStatus3" id="eduStatus3">
					<option value="졸업">졸업</option>
					<option value="재학">재학</option>
				</select>
				<select class="flexGrow height-one-tenth contentLabel" name="eduYear3" id="eduYear3"></select>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH subject flexGrow">주요경력</span>
			</div>
			<div class="flex flexColumn" id="tbl_organization_body">
				<c:if test="${mgrCareer.size() < 1}">
					<div class="flex flexColumn" id="organizationRow1">
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="organizationName1"
								name="organizationName" placeholder="기관명"></input>
						</div>
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="role1" name="role"
								placeholder="직위/역할"></input>
						</div>
						<div class="flex flexGrow">
							<input type="date" class="width-fourty height-one-tenth border contentLabel"
								name="roleStartDate" id="roleStartDate1" datetimeonly="true" value="2019-11-12"></input>
							<span class="flex flexGrow contentLabel center">~</span>
							<input type="date" class="width-fourty height-one-tenth border contentLabel"
								name="roleEndDate" id="roleEndDate1" datetimeonly="true" value="2019-11-12"></input>
						</div>
					</div>
				</c:if>
				<c:forEach var="list" items="${mgrCareer}" varStatus="listCnt">
					<div class="flex flexColumn" id="organizationRow${listCnt.index}">
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="organizationName${listCnt.index}"
								name="organizationName" placeholder="기관명" value="${list.organizationName}"></input>
						</div>
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="role${listCnt.index}" name="role"
								placeholder="직위/역할" value="${list.role}"></input>
						</div>
						<div class="flex flexGrow">
							<input type="date" class="width-fourty height-one-tenth border contentLabel"
								name="roleStartDate" id="roleStartDate${listCnt.index}" datetimeonly="true" value="${list.roleStartDate}"></input>
							<span class="flex flexGrow contentLabel center">~</span>
							<input type="date" class="width-fourty height-one-tenth border contentLabel"
								name="roleEndDate" id="roleEndDate${listCnt.index}" datetimeonly="true" value="${list.roleEndDate}"></input>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH subject flexGrow">상담관련자격증</span>
			</div>
			<div class="flex flexColumn" id="tbl_organization_body_cert">
				<c:forEach var="list" items="${mgrCert}" varStatus="listCnt">
					<div class="flex flexColumn" id="certOrgRow${listCnt.index}">
						<span class="flex centerH contentLabel width-thirty height-one-tenth">발급기관</span>
						<div class="flex flexGrow">
							<select class="flexGrow height-one-tenth contentLabel" id="certOrg${listCnt.index}" name="certOrg">
								<option value=<c:out value="${list.orgNm}" />>
									<c:out value="${list.orgNm}" />
								</option>
							</select>
						</div>
						<span class="flex centerH contentLabel width-thirty height-one-tenth">자격명</span>
						<div class="flex flexGrow bottomPadding">
							<select class="flexGrow height-one-tenth contentLabel" id="certName${listCnt.index}" name="certName">
								<option value=<c:out value="${list.certNm}" />>
									<c:out value="${list.certNm}" />
								</option>
							</select>	
						</div>
						<div class="flex selectGroupTwo">
							<select class="flexGrow height-one-tenth contentLabel" id="certGrade${listCnt.index}" name="certGrade">
								<option value=<c:out value="${list.grade}" />>
									<c:out value="${list.grade}" />
								</option>
							</select>
							<select class="flexGrow height-one-tenth contentLabel" id="certYear${listCnt.index}" name="certYear">
								<option value=<c:out value="${list.certYear}" />>
									<c:out value="${list.certYear}" />
								</option>
							</select>
						</div>
						<span class="flex centerH subContentLabel width-thirty height-one-tenth">사본첨부</span>
						<div class="flex flexGrow height-one-tenth ">
							<label class="flex flexGrow subContentLabel">${list.fileNm}</label>
							<div class="flex flexGrow rightR">
								<input class="button-blue width-one-fifth centerH" type="button" onclick="fileDownLoad('${list.filePath}', '${list.fileNm}')" value="다운로드"></input>
								<input type="hidden" id="fileName${listCnt.index}" name="fileName" value="${list.fileNm}" />
								<input type="hidden" id="filePath${listCnt.index}" name="filePath" value="${list.filePath}" />
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="underline flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">논문 및 저서</span>
			</div>
			<div class="flex flexColumn" id="tbl_organization_body_book">
				<c:forEach var="list" items="${mgrBook}" varStatus="listCnt">
					<div class="flex flexColumn" id="mgrBookRow${listCnt.index}">
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="bookTitle${listCnt.index}"
								name="bookTitle" placeholder="논문제목/책제목" value="${list.bookTitle}"></input>
						</div>
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="bookOrg${listCnt.index}"
								name="bookOrg" placeholder="게재학술지명/출판사명" value="${list.bookOrg}"></input>
						</div>
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="author${listCnt.index}"
								name="author" placeholder="연구자/저사명" value="${list.author}"></input>
						</div>
						<div class="flex flexGrow bottomPadding">
							<select class="flexGrow height-one-tenth contentLabel" id="bookYear${listCnt.index}" name="bookYear">
								<c:forEach var="i" begin="0" end="60" step="1">
									<option value=<c:out value="${currentYear-i}" />>
									<c:out value="${currentYear-i}" />
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">한줄소개</span>
			</div>
			<input class="content-input flexGrow subContentLabel" type="text" name="memo" data-validation="required"
				data-validation-error-msg-required="한줄소개를 확인 해주세요." value="${mgr.memo}"></input>
		</div>
		
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">사진</span>
			</div>
			<div class="flex flexGrow">
				<a href="javascript:fileDownLoad('${mgr.filePath}', '${mgr.fileNm}');">
					${mgr.fileNm }
				</a>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow"><c:if test="${mgr.authCd ne 'ROLE_PARTNER_CENTER' }"></c:if>접속권한</span>
			</div>
			<div class="flex flexGrow">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="radio" name="authCd"
						value="ROLE_PARTNER_SANGDAM" ${mgr.authCd=='ROLE_PARTNER_SANGDAM'
					? 'checked' :''} <c:if test="${mgr.authCd ne 'ROLE_PARTNER_CENTER' }"> data-validation="required"
				data-validation-error-msg-required="접속권한을 확인해주세요." </c:if> /> 상담</span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="radio" name="authCd"
					${mgr.authCd=='ROLE_PARTNER_SEND'
					? 'checked' :''} /> 파견</span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="radio" name="authCd"
						value="ROLE_PARTNER_GROUP" ${mgr.authCd=='ROLE_PARTNER_GROUP'
					? 'checked' :''} /> 집단</span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="radio" name="authCd"
						value="ROLE_PARTNER_TEACHER" ${mgr.authCd=='ROLE_PARTNER_TEACHER'
					? 'checked' :''} /> 강사</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">근무형태</span>
			</div>
			<div class="flex flexGrow">
				<span class="flex centerH subContentLabel width-thirty"><input type="radio" name="workType"
						value="S" ${mgr.workType=='S' ? 'checked' :''} /> 상주</span>
				<span class="flex centerH subContentLabel width-thirty"><input type="radio" name="workType"
						value="P" ${mgr.workType=='P' ? 'checked' :''} /> 파트타임</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">등록일</span>
			</div>
			<input class="content-input flexGrow subContentLabel" type="text" value="${mgr.regDt}"></input>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">정보변경일</span>
			</div>
			<input class="content-input flexGrow subContentLabel" type="text" value="${mgr.modiDt}"></input>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">정보변경ID</span>
			</div>
			<input class="content-input flexGrow subContentLabel" type="text" value="${mgr.modiId}"></input>
		</div>
		<div class="underline flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">대표여부</span>
			</div>
			<div class="flex flexWrap">
				<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
					<span class="flex centerH subContentLabel"><input type="checkbox" 
						name="centerOwnerYn" value="Y" id="centerOwnerYn" ${mgr.centerOwnerYn=='Y' ? 'checked' :''} />지정</span>
				</sec:authorize>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth underline">
				<span class="flex centerH subject flexGrow">상담유형</span>
			</div>
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">유형선택</span>
			</div>
			<div class="flex flexGrow">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" name="channelType"
						value="100001" data-validation="checkbox_group" data-validation-qty="min1"
						data-validation-error-msg="유형을 선택해주세요." onclick="return false;">심리</input></span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" name="channelType"
						value="100002" onclick="return false;">법률</input></span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" name="channelType"
						value="100003" onclick="return false;">재무</input></span>
				<span class="flex centerH subContentLabel width-one-quarter"><input type="checkbox"
						name="channelType" value="100004" onclick="return false;">심리검사</input></span>
			</div>
		</div>
		<div class="psyGroup flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth underline">
				<span class="flex centerH label flexGrow">심리</span>
			</div>
			<div class="flex flexColumn underline">
				<div class="flex height-one-tenth">
					<span class="flex centerH label flexGrow">상담대상</span>
				</div>
				<div class="flex flexWrap">
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges"
							name="mentalAges" value="100447" id="mentalAges" onclick="return false;">유아동</input></span>
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges"
							name="mentalAges" value="100448" onclick="return false;">아동</input></span>
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges"
							name="mentalAges" value="100449" onclick="return false;">청소년</input></span>
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges"
							name="mentalAges" value="100450" onclick="return false;">성인</input></span>
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges"
							name="mentalAges" value="100451" onclick="return false;">노년기 성인</input></span>
				</div>
			</div>
		</div>
		<div class="psyGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담분야</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv"
						value="100005" id="mentalDiv" onclick="return false;">개인상담</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv"
						value="100006" onclick="return false;">부부/가족상담</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv"
						value="100007" onclick="return false;">놀이치료</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv"
						value="100008" onclick="return false;">미술치료</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv"
						value="100009" onclick="return false;">언어치료</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv"
						value="100010" onclick="return false;">특수재활치료</input></span>
			</div>
			<div class="flex flexGrow height-one-tenth bottomPadding">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" class="mentalDiv"
						name="mentalDiv" value="100011">기타</input></span>
				<input class="content-input flexGrow" type="text" name="mentalDivEtc" id="mentalDivEtc"
					placeholder="기타 내용 입력"></input>
			</div>
		</div>
		<div class="psyGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담방법</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType"
						name="mentalType" value="100433" id="mentalType" onclick="return false;">대면</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType"
						name="mentalType" value="100434" onclick="return false;">전화</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType"
						name="mentalType" value="100435" onclick="return false;">게시판</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType"
						name="mentalType" value="100436" onclick="return false;">파견</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType"
						name="mentalType" value="100437" onclick="return false;">진단</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType"
						name="mentalType" value="100438" onclick="return false;">강의</input></span>
			</div>
		</div>
		<div class="lawGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth underline">
				<span class="flex centerH label flexGrow">법률</span>
			</div>
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담분야</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawDiv" name="lawDiv"
						value="100012" id="lawDiv" onclick="return false;">일반법률</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawDiv" name="lawDiv"
						value="100013" onclick="return false;">부동산법률</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawDiv" name="lawDiv"
						value="100014" onclick="return false;">세무</input></span>
			</div>
		</div>
		<div class="lawGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담방법</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType"
						value="100433" id="lawType" onclick="return false;">대면</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType"
						value="100434" onclick="return false;">전화</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType"
						value="100435" onclick="return false;">게시판</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType"
						value="100436" onclick="return false;">파견</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType"
						value="100437" onclick="return false;">진단</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType"
						value="100438" onclick="return false;">강의</input></span>
			</div>
		</div>
		<div class="finGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth underline">
				<span class="flex centerH label flexGrow">재무</span>
			</div>
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담분야</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeDiv"
						name="financeDiv" value="100015" id="financeDiv" onclick="return false;">재무상담</input></span>
			</div>
		</div>
		<div class="finGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담방법</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType"
						name="financeType" value="100433" id="financeType" onclick="return false;">대면</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType"
						name="financeType" value="100434" onclick="return false;">전화</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType"
						name="financeType" value="100435" onclick="return false;">게시판</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType"
						name="financeType" value="100436" onclick="return false;">파견</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType"
						name="financeType" value="100437" onclick="return false;">진단</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType"
						name="financeType" value="100438" onclick="return false;">강의</input></span>
			</div>
		</div>
		<div class="psyTestGroup flex flexColumn underline" style="display: none;">
			<div class="flex height-one-tenth underline">
				<span class="flex centerH label flexGrow">심리검사</span>
			</div>
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담대상</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges"
						name="diagnosisAges" value="100447" id="diagnosisAges" onclick="return false;">유아동</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges"
						name="diagnosisAges" value="100448" onclick="return false;">아동</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges"
						name="diagnosisAges" value="100449" onclick="return false;">청소년</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges"
						name="diagnosisAges" value="100450" onclick="return false;">성인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges"
						name="diagnosisAges" value="100451" onclick="return false;">노년기 성인</input></span>
			</div>
		</div>
		<div class="psyTestGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담분야</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisDiv"
						name="diagnosisDiv" value="100016" id="diagnosisDiv" onclick="return false;">종합심리검사</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisDiv"
						name="diagnosisDiv" value="100017" onclick="return false;">정서 및 성격검사</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisDiv"
						name="diagnosisDiv" value="100018" onclick="return false;">진로 및 적성검사</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisDiv"
						name="diagnosisDiv" value="100019" onclick="return false;">신경심리검사</input></span>
			</div>
			<div class="flex flexGrow height-one-tenth bottomPadding">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox"
						class="diagnosisDiv" name="diagnosisDiv" value="100020" onclick="return false;">기타 ${mgr.diagnosisDivEtc }</input></span>
				<input class="content-input flexGrow" type="text" name="diagnosisDivEtc" id="diagnosisDivEtc"
					placeholder="기타 내용 입력"></input>
			</div>
		</div>
		<div class="psyTestGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담방법</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType"
						name="diagnosisType" value="100433" id="diagnosisType" onclick="return false;">대면</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType"
						name="diagnosisType" value="100434" onclick="return false;">전화</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType"
						name="diagnosisType" value="100435" onclick="return false;">게시판</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType"
						name="diagnosisType" value="100436" onclick="return false;">파견</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType"
						name="diagnosisType" value="100437" onclick="return false;">진단</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType"
						name="diagnosisType" value="100438" onclick="return false;">강의</input></span>
			</div>
		</div>
		<div class="flex flexColumn underline">
			<span class="flex title height-fifteen centerH">Capability</span>
			<span class="flex subject height-one-tenth centerH">Capability</span>
		</div>
		<div class="capability underline flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">외국어 상담</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType"
						name="languageType" value="101075" onclick="return false;">영어</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType"
						name="languageType" value="101076" onclick="return false;">중국어</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType"
						name="languageType" value="101077" onclick="return false;">일본어</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType"
						name="languageType" value="101078" onclick="return false;">스페인어</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType"
						name="languageType" value="101079" onclick="return false;">프랑스어</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType"
						name="languageType" value="101080" onclick="return false;">기타</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn bottomMargin">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">특수주제</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101082" onclick="return false;">성피해상담</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101083" onclick="return false;">커리어상담</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101084" onclick="return false;">심리코칭</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101085" onclick="return false;">트라우마치료</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101086" onclick="return false;">애도상담</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101087" onclick="return false;">자살위기상담</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101088" onclick="return false;">직장내이슈 조사(직장내괴롭힘, 직장내성희롱 등)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101089" onclick="return false;">내마음보고서 해석상담</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101090" onclick="return false;">수면상담(CBTI)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType"
						name="specialType" value="101091" onclick="return false;">심리적응급처치(위기개입)</input></span>
			</div>
			<input class="flex flexGrow content-input height-one-tenth subContentLabel" type="text"
				name="specialHearing" id="specialHearing" placeholder="기타 특수주제"></input>
		</div>
		<div class="flex flexColumn underline">
			<span class="flex subject height-one-tenth centerH">주요주제</span>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">직장관련</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101093" onclick="return false;">직무소진</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101094" onclick="return false;">스트레스관리</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101095" onclick="return false;">직무 무기력</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101096" onclick="return false;">감정노동스트레스</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101097" onclick="return false;">조직문화</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101098" onclick="return false;">직장 내 트라우마</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101099" onclick="return false;">일가정양립(워킹맘/워킹파)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101100" onclick="return false;">관계갈등</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101101" onclick="return false;">업무적응</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101102" onclick="return false;">직무복귀</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType"
						value="101103" onclick="return false;">업무능력향상</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">개인관련</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101105" onclick="return false;">자기탐색 및 이해</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101106" onclick="return false;">자기성장(미래설계, 적성, 진로 등)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101107" onclick="return false;">슬픔</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101108" onclick="return false;">분노조절</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101109" onclick="return false;">우울</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101110" onclick="return false;">불안</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101111" onclick="return false;">공황</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101112" onclick="return false;">무기력</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101113" onclick="return false;">무망감</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101114" onclick="return false;">사회기술 부족</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101115" onclick="return false;">관계갈등</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101116" onclick="return false;">관계 내 어려움</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101117" onclick="return false;">중독행동(알코올)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101118" onclick="return false;">중독행동(도박)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101119" onclick="return false;">중독행동(인터넷/스마트폰)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101120" onclick="return false;">충동조절 어려움</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType"
						name="personalType" value="101121" onclick="return false;">기타 정신건강의학적 증상(섭식문제, 성격장애 등)</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">가족관련</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101123" onclick="return false;">가족이해</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101124" onclick="return false;">자녀양육</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101125" onclick="return false;">문제행동</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101126" onclick="return false;">관계갈등</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101127">가족해체관련(이혼)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101128" onclick="return false;">애도</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101129" onclick="return false;">학습심리</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101130" onclick="return false;">주의력</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101131" onclick="return false;">학교적응</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101132" onclick="return false;">행동통제어려움</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101133" onclick="return false;">반항 및 문제행동</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101134" onclick="return false;">발달문제(언어)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101135" onclick="return false;">발달문제(지체 및 자폐)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101136" onclick="return false;">행동문제</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101137" onclick="return false;">애착문제</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType"
						name="familyType" value="101138" onclick="return false;">학대 등</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">충격/트라우마</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType"
						name="traumaType" value="101140" onclick="return false;">범죄피해자</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType"
						name="traumaType" value="101141" onclick="return false;">성피해</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType"
						name="traumaType" value="101142" onclick="return false;">사고</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType"
						name="traumaType" value="101143" onclick="return false;">파산</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType"
						name="traumaType" value="101144" onclick="return false;">사회적 지탄</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType"
						name="traumaType" value="101145" onclick="return false;">사망사고</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType"
						name="traumaType" value="101146" onclick="return false;">충격사건</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType"
						name="traumaType" value="101147" onclick="return false;">폭력 및 학대</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">대상별</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType"
						name="targetType" value="101149" id="mentalType" onclick="return false;">임원급</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType"
						name="targetType" value="101150" onclick="return false;">감정노동자</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType"
						name="targetType" value="101151" onclick="return false;">교대근무자</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType"
						name="targetType" value="101152" onclick="return false;">신입사원</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType"
						name="targetType" value="101153" onclick="return false;">영유아</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">법률</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType"
						name="lawCounselType" value="101155" id="mentalType" onclick="return false;">가정사 –
					이혼, 상속, 유언 등</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType"
						name="lawCounselType" value="101156" onclick="return false;">금전거래 – 권리금, 보증금, 떼인돈 등</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType"
						name="lawCounselType" value="101157" onclick="return false;">손해배상 – 교통사고, 의료사고,
					때린사건, 맞은사건 등</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType"
						name="lawCounselType" value="101158" onclick="return false;">부동산 – 주택임대차, 상가임대차,
					유치권, 명도소송 등</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType"
						name="lawCounselType" value="101159" onclick="return false;">빚-채무 – 개인회생, 개인파산</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType"
						name="lawCounselType" value="101160" onclick="return false;">기타 – 성추행, 저작권, 노무관련,
					행정처분 등</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">재무</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeCounselType"
						name="financeCounselType" value="101162" id="mentalType" onclick="return false;">신입사원 재무설계</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeCounselType"
						name="financeCounselType" value="101163" onclick="return false;">신혼부부 재테크</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeCounselType"
						name="financeCounselType" value="101164" onclick="return false;">노후자금 마련</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeCounselType"
						name="financeCounselType" value="101165" onclick="return false;">주택마련</input></span>
			</div>
		</div>
		<div class="flex flexColumn underline">
			<span class="flex subject height-one-tenth centerH">상담선호</span>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">단회기상담</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType"
						name="preferredType" value="101167" id="mentalType" onclick="return false;">단회기상담
					선호여부</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">선호접근</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType"
						name="preferredType" value="101168" onclick="return false;">인지행동접근</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType"
						name="preferredType" value="101169" onclick="return false;">정신분적적접근</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType"
						name="preferredType" value="101170" onclick="return false;">인본주의적 접근</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType"
						name="preferredType" value="101171" onclick="return false;">현상학적접근(게슈탈트)</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType"
						name="preferredType" value="" onclick="return false;">기타(주관식)</input></span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담성향</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101173" onclick="return false;">공감적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101174" onclick="return false;">편안한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101175" onclick="return false;">잘 들어주는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101176" onclick="return false;">따뜻한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101177" onclick="return false;">위로가 되는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101178" onclick="return false;">포근한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101179" onclick="return false;">온화한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101180" onclick="return false;">신뢰로운</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101181" onclick="return false;">안심되는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101182" onclick="return false;">진정성 있는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101183" onclick="return false;">진솔한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101184" onclick="return false;">성의있는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101185" onclick="return false;">성심을 다하는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101186" onclick="return false;">진지한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101187" onclick="return false;">진중한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101188" onclick="return false;">자상한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101189" onclick="return false;">배려하는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101190" onclick="return false;">상냥한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101191" onclick="return false;">케어해주는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101192" onclick="return false;">푸근한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101193" onclick="return false;">눈높이를 맞추는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101194" onclick="return false;">용기를 주는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101195" onclick="return false;">응원해주는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101196" onclick="return false;">희망적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101197" onclick="return false;">긍정적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101198" onclick="return false;">즐거운</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101199" onclick="return false;">친절한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101200" onclick="return false;">적극적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101201" onclick="return false;">속시원한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101202" onclick="return false;">부담없는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101203" onclick="return false;">명쾌한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101204" onclick="return false;">솔직한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101205" onclick="return false;">재밌는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101206" onclick="return false;">자유로운</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101207" onclick="return false;">섬세한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101208" onclick="return false;">구체적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101209" onclick="return false;">상세히 설명하는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101210" onclick="return false;">계획적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101211" onclick="return false;">세밀한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101212" onclick="return false;">차근차근한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101213" onclick="return false;">분석적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101214" onclick="return false;">진단해주는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101215" onclick="return false;">예리한</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101216" onclick="return false;">객관적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101217" onclick="return false;">현실적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101218" onclick="return false;">전문적인</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101219" onclick="return false;">숙련된</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101220" onclick="return false;">깊이 있는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101221" onclick="return false;">새로운 관점의</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101222" onclick="return false;">통찰력 있는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101223" onclick="return false;">맥을 잘 짚는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101224" onclick="return false;">문제를 잘 파악하는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101225" onclick="return false;">내가 몰랐던 것을 알게 해주는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101226" onclick="return false;">방향을 제시하는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101227" onclick="return false;">조언을 주는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101228" onclick="return false;">해결책을 제시하는</input></span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType"
						name="tendencyType" value="101229" onclick="return false;">길을 잡아주는</input></span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding bottomMargin">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">주요 강점 및 핵심역량</span>
			</div>
			<input class="content-input flexGrow subContentLabel" type="text" name="coreVal">${mgr.coreVal}</input>
		</div>
		
		<div class="underline flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH subject flexGrow">상담 외 프로그램(집단, 특강 등)</span>
			</div>
		</div>
		<div class="flex flexColumn" id="etcExamExtra">
			<c:forEach var="list" items="${extraExamInfo}" varStatus="listCnt">
				<div class="flex flexGrow">
					<input class="content-input flexGrow height-one-tenth" type="text" id="" name="" placeholder="" value="프로그램명 : ${list.extraNm }">
				</div>
				<div class="flex flexGrow">
					<input class="content-input flexGrow height-one-tenth" type="text" id="" name="" placeholder="" value="대상 : ${list.extraTarget }">
				</div>
				<div class="flex flexGrow">
					<input class="content-input flexGrow height-one-tenth" type="text" id="" name="" placeholder="" value="센터 내 시행비용(해석상담 포함가) :${list.extraCost }">
				</div>
			</c:forEach>
		</div>
		<!-- <div class="flex flexGrow">
			<input class="flex flexGrow button-gray center height-one-tenth" type="button" id=""
				value="등록"></input>
		</div> -->
	</div>
</form>
</body>
</html>