<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentYear" value="${now}" pattern="yyyy" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상담사관리 등록</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var num = 0;
var de ="";
var delCnt = 1;
var chkId = 0;

var tbl_cnt = 1;
var tbl_cnt_cert = 1;
var tbl_cnt_book = 1;

function selectCert(sel, count){
	$('#certNameTd'+count).children().remove();
	$('#certGradeTd'+count).children().remove();
	if(sel.value === '한국상담심리학회'){
		var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="상담심리사">상담심리사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '<option value="2급">2급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '한국임상심리학회'){
		var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="임상심리사">임상심리사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '한국상담학회'){
		var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="전문상담사">전문상담사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '<option value="2급">2급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '기타한국심리학회'){
		var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="중독심리전문가">중독심리전문가</option>';
		markup += '<option value="발달심리사">발달심리사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '보건복지부'){
		var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="정신보건임상심리사">정신보건임상심리사</option>';
		markup += '<option value="언어재활사">언어재활사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '<option value="2급">2급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '산업인력공단'){
		var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="임상심리사">임상심리사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '<option value="2급">2급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '고용노동부'){
		var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="직업상담사">직업상담사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '<option value="2급">2급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '여성가족부'){
		var markup = '<select id="certName'+count+'" name=id="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="청소년상담사">청소년상담사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '<option value="2급">2급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '한국놀이치료학회'){
		var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
		markup += '<option value="놀이심리상담사">놀이심리상담사</option>';
		markup += '</select>';
		$('#certNameTd'+count).append(markup);
		var markup = '<select id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">';
		markup += '<option value="1급">1급</option>';
		markup += '<option value="2급">2급</option>';
		markup += '</select>';
		$('#certGradeTd'+count).append(markup);
	} else if(sel.value === '기타'){
		$('#certNameTd'+count).append('<input type="text" id="certName'+count+'" name="certName'+count+'" style="width:95%;">');
		$('#certGradeTd'+count).append('<input type="text" id="certGrade'+count+'" name="certGrade'+count+'" style="width:95%;">');
	}
	
}

function selectGrade(sel, count){
	$('#certGrade'+count).children().remove();
	var markup = '<option value="1급">1급</option>';
	markup += '<option value="2급">2급</option>';
	$('#certGrade'+count).append(markup);
}


j$(document).ready(function(){
	
	j$('#userId').change(function(){
		chkId = 0;
	});


	 $(".add-row-cert").click(function(){
   	var markup = '<tr id="certOrgRow'+tbl_cnt_cert+'">';
   	markup += '<td align="center">';
   	markup += '<select id="certOrg'+tbl_cnt_cert+'" name="certOrg'+tbl_cnt_cert+'" onchange="selectCert(this, '+tbl_cnt_cert+')" style="width:95%;">';
   	markup += '<option value="한국상담심리학회">한국상담심리학회</option>';
   	markup += '<option value="한국임상심리학회">한국임상심리학회</option>';
   	markup += '<option value="한국상담학회">한국상담학회</option>';
   	markup += '<option value="기타한국심리학회">기타한국심리학회</option>';
   	markup += '<option value="보건복지부">보건복지부</option>';
   	markup += '<option value="산업인력공단">산업인력공단</option>';
   	markup += '<option value="고용노동부">고용노동부</option>';
   	markup += '<option value="여성가족부">여성가족부</option>';
   	markup += '<option value="한국놀이치료학회">한국놀이치료학회</option>';
   	markup += '<option value="기타">기타</option>';
   	markup += '</select>';
   	markup += '</td>';
   	markup += '<td id="certNameTd'+tbl_cnt_cert+'" align="center">';
   	markup += '<select id="certName'+tbl_cnt_cert+'" name="certName'+tbl_cnt_cert+'" onchange="selectGrade(this, '+tbl_cnt_cert+')" style="width:95%;">';
   	markup += '<option value="상담심리사">상담심리사</option>';
   	markup += '</select>';
   	markup += '</td>';
   	markup += '<td id="certGradeTd'+tbl_cnt_cert+'" align="center">';
   	markup += '<select id="certGrade'+tbl_cnt_cert+'" name="certGrade'+tbl_cnt_cert+'" style="width:95%;">';
   	markup += '<option value="1급">1급</option>';
   	markup += '<option value="2급">2급</option>';
   	markup += '</select>';
   	markup += '</td>';
   	markup += '<td align="center">';
   	markup += '<select id="certYear'+tbl_cnt_cert+'" name="certYear'+tbl_cnt_cert+'" style="width:95%;"></select>';
   	markup += '</td>';
   	markup += '<td>';
   	markup += '<input type="file" name="file_'+tbl_cnt_cert+'" data-validation="required" data-validation-error-msg-required="첨부파일은 필수입니다." style="width:95%;"/>';
   	markup += '</td>';
   	markup += '<td align="center">';
   	markup += '<input type="button" name="certDel" id="certDel'+tbl_cnt+'" onclick="certTblRowDel('+tbl_cnt_cert+');" value="삭제" style="width:95%;"/>';
   	markup += '</td>';
   	markup += '</tr>';
   	$("#tbl_organization_body_cert").append(markup);
		
		for (i = new Date().getFullYear(); i > 1959; i--){
		    $('#certYear'+tbl_cnt_cert).append($('<option />').val(i).html(i));
		}

		$('#certYear'+tbl_cnt_cert+' option[value=2010]').attr('selected', 'selected');        	
   	
   	tbl_cnt_cert = tbl_cnt_cert+1;
   });
   
	$( ".startDt, .endDt").datepicker({
		showOn: "both",
		buttonImageOnly: true,
		buttonImage: "//img.ezwelmind.co.kr/sangdam4u/images/comunity/ico_calendar.gif",
		buttonText: "달력보기",
		changeMonth: true, 
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		closeText: '닫기',
		monthNamesShort: [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" ],
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		yearRange: "-40:+0",
		beforeShow: function (){},
		dateFormat: "yy-mm-dd",
		onSelect: function (dateText){
			var pollSeq = j$(this).parent().parent().attr("id");
			var name = j$(this).attr("name");
			updateDateAndTime(pollSeq, name, dateText.replace(/-/gi,""), 'date');
		}
	});
	
   $(".add-row").click(function(){
   	tbl_cnt = tbl_cnt+1;
   	var markup = '<tr id="organizationRow'+tbl_cnt+'">';
   	markup += '<td align="center">';
   	markup += '<input type="text" style="width:95%;" id="organizationName'+tbl_cnt+'" name="organizationName" />';
   	markup += '</td>';
   	markup += '<td align="center">';
   	markup += '<input type="text" style="width:95%;" id="role'+tbl_cnt+'" name="role" />';
   	markup += '</td><td align="center">';
   	markup += '<input type="text" name="roleStartDate"  id="roleStartDate'+tbl_cnt+'" class="startDt cal_box" datetimeonly="true" style="width:93px;" />';
   	markup += '~<input type="text" name="roleEndDate"  id="roleEndDate'+tbl_cnt+'" class="endDt cal_box" datetimeonly="true" style="width:93px;" />';
   	markup += '<td align="center">';
   	markup += '<input type="button" name="organizationDel" id="organizationDel'+tbl_cnt+'" onclick="tblRowDel('+tbl_cnt+');" value="삭제" style="width:95%;"/></td>';
   	markup += '</tr>';		
   	$("#tbl_organization_body").append(markup);
		
		$( ".startDt, .endDt").datepicker({
			showOn: "both",
			buttonImageOnly: true,
			buttonImage: "//img.ezwelmind.co.kr/sangdam4u/images/comunity/ico_calendar.gif",
			buttonText: "달력보기",
			changeMonth: true, 
			changeYear: true,
			nextText: '다음 달',
			prevText: '이전 달',
			closeText: '닫기',
			monthNamesShort: [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" ],
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			yearRange: "-40:+0",
			beforeShow: function (){},
			dateFormat: "yy-mm-dd",
			onSelect: function (dateText){
				var pollSeq = j$(this).parent().parent().attr("id");
				var name = j$(this).attr("name");
				updateDateAndTime(pollSeq, name, dateText.replace(/-/gi,""), 'date');
			}
		});
		
   });
   
   $(".add-row-book").click(function(){
   	var markup = '<tr id="mgrBookRow'+tbl_cnt_book+'">';
   	markup += '<td align="center"><input type="text" style="width:95%;" id="bookTitle'+tbl_cnt_book+'" name="bookTitle"/></td>';
   	markup += '<td align="center"><input type="text" style="width:95%;" id="bookOrg'+tbl_cnt_book+'" name="bookOrg"/></td>';
   	markup += '<td align="center"><input type="text" style="width:95%;" id="author'+tbl_cnt_book+'" name="author"/></td>';
   	markup += '<td align="center"><select id="bookYear'+tbl_cnt_book+'" name="bookYear" style="width:95%;"></select></td>';
   	markup += '<td align="center"><input type="button" name="bookDel" id="bookDel'+tbl_cnt_book+'" onclick="bookTblRowDel('+tbl_cnt_book+');" value="삭제" style="width:95%;"/></td>';
   	markup += '</tr>';		
   	$("#tbl_organization_body_book").append(markup);
   	
		for (i = new Date().getFullYear(); i > 1959; i--){
		    $('#bookYear'+tbl_cnt_book).append($('<option />').val(i).html(i));
		}

		$('#bookYear'+tbl_cnt_book+' option[value=2010]').attr('selected', 'selected');  
   	
   	tbl_cnt_book = tbl_cnt_book+1;
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
			$('[name=rrn]').val($('#rrn1').val() + "-" + $('#rrn2').val()); 
			if(chkId != 1){
				alert("아이디 중복확인을 해야합니다.");
				return false;
			}
			else if(j$('#userPwd').val() != j$('#userPwdChk').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	});
	
	j$('#addBtn').click(function() {
		j$("#num").val(num);
		j$("#counselorAdd").submit();
	});
	
	for (i = new Date().getFullYear(); i > 1959; i--){
	    $('#eduYear').append($('<option />').val(i).html(i));
	    $('#eduYear2').append($('<option />').val(i).html(i));
	    $('#eduYear3').append($('<option />').val(i).html(i));
	}

	$('#eduYear option[value=2010]').attr('selected', 'selected');
	$('#eduYear2 option[value=2010]').attr('selected', 'selected');
	$('#eduYear3 option[value=2010]').attr('selected', 'selected');
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
		url: '/madm/mgr/ajaxCert',
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


function updateExtraExam(){
	console.log("updateExtraExam 타고 있음");
	var extraExamIdxAll = document.getElementsByName("extraExamIdx");
	var extraExamInfoAll1 = document.getElementsByName("extraExamInfo1");
	var extraExamInfoAll2 = document.getElementsByName("extraExamInfo2");
	var extraExamInfoAll3 = document.getElementsByName("extraExamInfo3");

	for(var i=0; i<extraExamIdxAll.length;i++){
		
		var extraExamIdx = extraExamIdxAll[i].value;
		var extraExamInfo1 = extraExamInfoAll1[i].value;
		var extraExamInfo2 = extraExamInfoAll2[i].value;
		var extraExamInfo3 = extraExamInfoAll3[i].value;	
		var params = {};
		
		if(extraExamIdx != '9999999'){
			params.extraIdx = extraExamIdx;
		}
		
		params.extraNm = extraExamInfo1;
		params.extraTarget  = extraExamInfo2;
		params.extraCost  = extraExamInfo3;
		params.highCommCd = '102015';
		params.userId ='${mgr.userId}';
		console.log(params);
		j$.ajax({
			url: '/partner/centerInfo/updateExtraExam',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				//window.location.reload();
			}
		});  
			
	} 
	
	return false;
	
}

var numExtra = 0;
var numExam = 0;
var de ="";
var count = 0;
var delCnt = 1;


//상담 외 프로그램(집단, 특강 등) db삭제
function delExtraRow(idx,high_cd){
	if(confirm("정말 삭제 하시겠습니까?")){
		var params = {};
		params.extraIdx = idx;
		params.highCommCd = high_cd;
		j$.ajax({
			url: '/partner/centerInfo/deleteExtraExam',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				window.location.reload();
			}
		});  
	}
	
}

//상담 외 프로그램(집단, 특강 등) 추가
function addRowExam(){
		if(numExam >= 10){
		alert("10개 이상 등록할 수 없습니다.");
		return false;
	} 
	
	numExam++;
	var strData = "";
	strData += "<div id='examSub"+numExam+"'>";
	strData += " <input type='hidden' name='extraExamIdx' value='9999999' />";
	strData += " 프로그램명 : <input type='text' name='extraExamInfo1' value=''	 /> ";
	strData += " 대상 : <input type='text'	name='extraExamInfo2' value=''	 /> ";
	strData += " 센터내 시행비용(해석상담 포함가) :<input type='text' name='extraExamInfo3' value=''	 /> <br/>";
	strData += "</div>";
	$( '#etcExamExtra' ).append(strData);
}

//상담 외 프로그램(집단, 특강 등) 삭제
function delRowExam(){
	if(numExam == 0){
		alert("최소1개 이상 등록 하셔야 합니다.");
		return false;
	}
	$("#examSub"+numExam).remove();
	numExam--;
}


</script>

</head>
<body>
<form id="counselorAdd" name="counselorAdd" action="/madm/mgr/insertCounselorMgr" method="POST" enctype="multipart/form-data">
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
				<td width="40%"><input type="text" name="userNm" data-validation="required" data-validation-error-msg-required="성명을 확인해주세요."></td>
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
				    <input type="number" maxlength="6" id="rrn1" style="width: 20%;" data-validation="length number" data-validation-length="6-6"  data-validation-error-msg="생년월일을 확인 해주세요." />-
		    		<input type="number" maxlength="1" id="rrn2" style="width: 10%;" data-validation="length number" data-validation-length="1-1"  data-validation-error-msg="생년월일을 확인 해주세요." />
		    		<input type="hidden" name="rrn">
		    		ㆍ예) 901234-1
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
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* SMS 인증용 연락처</th>
				<td class="line" colspan="1" >
				    <input type="number" maxlength="3" id="mobilesms1" value="" style="width: 10%;" data-validation="length number" data-validation-length="2-3"  data-validation-error-msg="연락처를 확인 해주세요."/>-
		    		<input type="number" maxlength="4" id="mobilesms2" value="" style="width: 10%;" data-validation="length number" data-validation-length="3-4"  data-validation-error-msg="연락처를 확인 해주세요." />-
		    		<input type="number" maxlength="4" id="mobilesms3" value="" style="width: 10%;" data-validation="length number" data-validation-length="4-4"  data-validation-error-msg="연락처를 확인 해주세요." />
				</td>
				<input type="hidden" name="mobileSms">
				
				
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 학위취득사항</th>
				<td class="line" colspan="3">
					<table cellspacing="0" border="0" width="100%">
						<tr>
							<th width="35%">학교명</th>							
							<th width="35%">학과(전공)</th>
							<th width="10%">학위명</th>							
							<th width="10%">상태</th>							
							<th width="10%">연도</th>					
						</tr>
						<tr>
							<td align="center">
								<input type="text" name="university" style="width:95%;" value=""/>
							</td>
							<td align="center">
								<input type="text" name="department" style="width:95%;" value=""/>
							</td>
							<td align="center">
								<select name="education" id="education" style="width:95%;">
									<option value="M">학사</option>
									<option value="D">석사</option>
									<option value="S">전문학사</option>
								</select>
							</td>
							<td align="center">
								<select name="eduStatus" id="eduStatus" style="width:95%;">
									<option value="졸업">졸업</option>
									<option value="재학">재학</option>
								</select>
							</td>
							<td align="center">
								<select name="eduYear" id="eduYear" style="width:95%;"></select>
							</td>
						</tr>
						<tr>
							<td align="center">
								<input type="text" name="university2" style="width:95%;" value=""/>
							</td>
							<td align="center">
								<input type="text" name="department2" style="width:95%;" value=""/>
							</td>
							<td align="center">
								<select name="education2" id="education2" style="width:95%;">
									<option value="M">학사</option>
									<option value="D">석사</option>
									<option value="S">전문학사</option>
								</select>
							</td>
							<td align="center">
								<select name="eduStatus2" id="eduStatus2" style="width:95%;">
									<option value="졸업">졸업</option>
									<option value="재학">재학</option>
								</select>
							</td>
							<td align="center">
								<select name="eduYear2" id="eduYear2" style="width:95%;"></select>
							</td>
						</tr>
						<tr>
							<td align="center">
								<input type="text" name="university3" style="width:95%;" value=""/>
							</td>
							<td align="center">
								<input type="text" name="department3" style="width:95%;" value=""/>
							</td>
							<td align="center">
								<select name="education3" id="education3" style="width:95%;">
									<option value="M">학사</option>
									<option value="D">석사</option>
									<option value="S">전문학사</option>
								</select>
							</td>
							<td align="center">
								<select name="eduStatus3" id="eduStatus3" style="width:95%;">
									<option value="졸업">졸업</option>
									<option value="재학">재학</option>
								</select>
							</td>
							<td align="center">
								<select name="eduYear3" id="eduYear3" style="width:95%;"></select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<!-- <tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 학력</th>
				<td class="line" colspan="3">
					<input type="radio" name="education" value="M" data-validation="required"  data-validation-error-msg-required="학력을 확인해주세요."/> 석사
					<input type="radio" name="education" value="D" /> 박사
					<input type="text" name="university" style="width:80px;" data-validation="required"  data-validation-error-msg-required="대학원을 확인 해주세요."/> 대학원
					<input type="text" name="department" style="width:80px;" data-validation="required"  data-validation-error-msg-required="학과를 확인 해주세요."/> 학과
				</td>
			</tr> -->
			
 			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 주요경력</td>
				<td class="line" colspan="3">
					<table id="careerTable" cellspacing="0" border="0" width="100%">
						<thead>
							<tr>
								<th width="32%">기관명</th>
								<th width="32%">직위/역할</th>
								<th width="31%">근무기간</th>
								<th width="5%">삭제</th>
							</tr>
						</thead>
						<tbody id="tbl_organization_body">
							
						</tbody>
						<tr>
							<td colspan="4" align="center"><input type="button" class="add-row" value="추가"></td>
						</tr>				
					</table>
				</td>
			</tr> 
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 상담관련자격증</td>
				<td class="line" colspan="3">
					<table id="careerTable" cellspacing="0" border="0" width="100%">
						<thead>
							<tr>
								<th width="20%">발급기관</th>
								<th width="20%">자격명</th>
								<th width="5%">급수</th>
								<th width="10%">발급년도</th>
								<th width="40%">사본첨부</th>
								<th width="5%">삭제</th>
							</tr>
						</thead>
						<tbody id="tbl_organization_body_cert">
							
						</tbody>
						<tr>
							<td colspan="6" align="center"><input type="button" class="add-row-cert" value="추가"></td>
						</tr>				
					</table>
				</td>
			</tr> 
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 논문 및 저서</td>
				<td class="line" colspan="3">
					<table id="careerTable" cellspacing="0" border="0" width="100%">
						<thead>
							<tr>
								<th width="35%">논문제목/책제목</th>
								<th width="35%">게재학술지명/출판사명</th>
								<th width="15%">연구자/저자명</th>
								<th width="10%">연도</th>
								<th width="5%">삭제</th>
							</tr>
						</thead>
						<tbody id="tbl_organization_body_book">
							
						</tbody>
						<tr>
							<td colspan="5" align="center"><input type="button" class="add-row-book" value="추가"></td>
						</tr>				
					</table>
				</td>
			</tr> 
<%-- 			<tr align="left" height="30px">
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
							<input type='text' name="etc0" id="certEtc0" style="width: 210px"/><input type='file' name="file_0" data-validation='required' data-validation-error-msg-required='첨부파일은 필수입니다.' />
							</td>
							</tr>
						</table>	
						</td>
					</tr> --%>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 한줄소개</th>
				<td class="line" colspan="3">
					<input type="text" name="memo" style="width:40%;"  data-validation="required"  data-validation-error-msg-required="한줄소개를 확인 해주세요."/>
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;사진</th>
		    	<td class="line" colspan="3" >
		    		<input type="file" name="picAdd" />
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">* 접속권한</th>
				<td >
					<input type="radio" name="authCd" value="ROLE_PARTNER_SANGDAM" data-validation="required" data-validation-error-msg-required="접속권한을 확인해주세요."/> 상담
					<input type="radio" name="authCd" value="ROLE_PARTNER_SEND" /> 파견
					<input type="radio" name="authCd" value="ROLE_PARTNER_GROUP" /> 집단
					<input type="radio" name="authCd" value="ROLE_PARTNER_TEACHER" /> 강사
				</td>
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">* 근무형태</th>
				<td>
					<input type="radio" name="workType" value="S" data-validation="required" data-validation-error-msg-required="근무형태를 확인해주세요."/> 상주
					<input type="radio" name="workType" value="P" /> 파트타임
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
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100010"  /> 특수재활치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100022"  /> 내마음보고서 해석상담 <br />
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
 		
 		<br/>ㆍCapability
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			
			
			<!-- 심리 -->
			<tr class="capability">
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
			
			<tr class="capability">
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
					<input type="text"  name="specialHearing" id="specialHearing" style="width:500px;" >  
				</td>
			</tr>
			
			<!-- 직장관련 -->
			<tr class="capability">
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
			<tr class="capability">
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
			<tr class="capability">
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
			<tr class="capability">
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
			<tr class="capability">
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
			<tr class="capability">
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
			<tr class="capability">
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
			<tr class="capability">
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="2">상담선호</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 단회기상담</td>
				<td>
					<input type="checkbox" class="preferredType" name="preferredType"  value="101167" id="mentalType" /> 단회기상담 선호여부
				</td>
			</tr>
			<!-- 선호접근 -->
			<tr class="capability">
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
			<tr class="capability">
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
			<!-- 주요 강점 및 핵심역량 -->
			<tr>
				<th class="line" width="15%" align="left" bgcolor="#F5F5F5"  colspan="2">
					주요 강점 및 핵심역량</th>
				<td class="line" colspan="5">
					<input type="text" name="coreVal" value="" style="width: 700px;" />
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