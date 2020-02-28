<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentYear" value="${now}" pattern="yyyy" />
<html>
<head>
<title>상담사관리 수정</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function fileDownLoad(path,name){
    var f = document.downForm;

	f.filepath.value = path;
	f.filename.value = name;
	f.action = "/resources/jsp/fileDownload.jsp";
	f.submit();
}
</script>

<form name="downForm" method="post">
	<input type="hidden" name="filepath" value="">
	<input type="hidden" name="filename" value="">
</form>
<script type="text/javascript">
var num = 0;
var de ="";
var count = 0;
var delCnt = 1;

var tbl_cnt = 1;
var tbl_cnt_cert = 1;
var tbl_cnt_book = 1;

<c:if test="${! empty(mgrCert)}">
	var tbl_cnt_cert = ${mgrCert.size()};
</c:if>

<c:if test="${! empty(mgrBook)}">
	var tbl_cnt_book = ${mgrBook.size()};
</c:if>

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
	
	j$("#userImsiModiRefuseBtn").click(function(){
		
		var params = {};
		params.userId = j$("#userId").attr("value");
		if( params.userId.length > 0 ){
			jQuery.ajax({
				url: "/madm/mgr/userImsiModiRefuse",
				data: params,
				type: "POST",
				dataType: "json",
				success: function(data, textStatus){
					if(data.resultVal == 'success'){
						alert("변경사항 거절을 정상적으로 등록 하였습니다.");
					}else{
						alert("변경사항 거절을 등록에 실패했습니다. \n오류가 지속되면 담당자에게 문의바랍니다.");
					}
				}
			});
		}
		 
	});
	
	j$("#userImsiPwdUpdateBtn").click(function(){
		// 비밀번호 초기화 - 임시비밀번호 : mind1234!@
		var params = {};
		params.userId = j$(this).attr("value");
		
		if( params.userId.length > 0 ){
			jQuery.ajax({
				url: "/madm/service/csp/userImsiPwdUpdate",
				data: params,
				type: "POST",
				dataType: "json",
				success: function(data, textStatus){
					if(data.resultVal == 'success'){
						alert(" 정상적으로 변경 하였습니다. \n- 임시 비밀번호는 'mind1234!@'입니다. \n- 로그인 후 비밀번호를 변경해야 이용 가능합니다.");
					}else{
						alert("비밀번호 변경에 실패했습니다. \n오류가 지속되면 담당자에게 문의바랍니다.");
					}
				}
			});
		}
		
	});
	
	<c:if test='${not empty mgr.channelType}'>
 	var chkValue = '${mgr.channelType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=channelType][value=' + chkArr[i] + ']').attr('checked',true);
		if(chkArr[i] == 100001){
	    	$(".psyGroup").show();
	    	//$("#mentalAges").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담대상을 선택해주세요");
	    	//$("#mentalDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
	    	//$("#mentalType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
	    }else if(chkArr[i] == 100002){
	    	$(".lawGroup").show();
	    	//$("#lawDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
	    	//$("#lawType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
	    }else if(chkArr[i] == 100003){
	    	$(".finGroup").show();
	    	//$("#financeDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
	    	//$("#financeType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
	    }else if(chkArr[i] == 100004){
	    	$(".psyTestGroup").show();
	    	//$("#diagnosisAges").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담대상을 선택해주세요");
	    	//$("#diagnosisDiv").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담분야을 선택해주세요");
	    	//$("#diagnosisType").attr("data-validation","checkbox_group").attr("data-validation-qty","min1").attr("data-validation-error-msg","상담방법을 선택해주세요");
	    }
		}
	} 
	</c:if>
	
	<c:if test='${not empty mgrBefore.channelType}'>
 	var chkValue = '${mgrBefore.channelType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=channelTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.mentalAges}'>
	var chkValue = '${mgrBefore.mentalAges}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=mentalAgesBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.mentalDiv}'>
	var chkValue = '${mgrBefore.mentalDiv}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=mentalDivBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.mentalType}'>
	var chkValue = '${mgrBefore.mentalType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=mentalTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.lawDiv}'>
	var chkValue = '${mgrBefore.lawDiv}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=lawDivBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.lawType}'>
	var chkValue = '${mgrBefore.lawType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=lawTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.financeDiv}'>
	var chkValue = '${mgrBefore.financeDiv}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=financeDivBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.financeType}'>
	var chkValue = '${mgrBefore.financeType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=financeTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.diagnosisAges}'>
	var chkValue = '${mgrBefore.diagnosisAges}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=diagnosisAgesBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.diagnosisDiv}'>
	var chkValue = '${mgrBefore.diagnosisDiv}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=diagnosisDivBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.diagnosisType}'>
	var chkValue = '${mgrBefore.diagnosisType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=diagnosisTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
/* 	<c:if test='${not empty mgr.rrn}'>
	var rrn = '${mgr.rrn}';
	$("#rrn1").val(rrn.substring(0,6));
	$("#rrn2").val(rrn.substring(7));
	</c:if> */
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.rrn}'>
	var rrn = '${mgrBefore.rrn}';
 	$("#rrn1").val(rrn.substring(0,6));
	$("#rrn2").val(rrn.substring(7)); 
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.languageType}'>
	var chkValue = '${mgrBefore.languageType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=languageTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.specialType}'>
	var chkValue = '${mgrBefore.specialType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=specialTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.jobType}'>
	var chkValue = '${mgrBefore.jobType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=jobTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.personalType}'>
	var chkValue = '${mgrBefore.personalType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=personalTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.familyType}'>
	var chkValue = '${mgrBefore.familyType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=familyTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.traumaType}'>
	var chkValue = '${mgrBefore.traumaType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=traumaTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.targetType}'>
	var chkValue = '${mgrBefore.targetType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=targetTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.financeCounselType}'>
	var chkValue = '${mgrBefore.financeCounselType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=financeCounselTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.lawCounselType}'>
	var chkValue = '${mgrBefore.lawCounselType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=lawCounselTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<!--이전 체크박스 값 -->
	<c:if test='${not empty mgrBefore.preferredType}'>
	var chkValue = '${mgrBefore.preferredType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=preferredTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
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
	
	<c:if test='${not empty mgrBefore.tendencyType}'>
	var chkValue = '${mgrBefore.tendencyType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=tendencyTypeBefore][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	for (i = new Date().getFullYear(); i > 1959; i--){
	    $('#eduYear').append($('<option />').val(i).html(i));
	    $('#eduYear2').append($('<option />').val(i).html(i));
	    $('#eduYear3').append($('<option />').val(i).html(i));
	}

	$('#eduYear option[value=2010]').attr('selected', 'selected');
	$('#eduYear2 option[value=2010]').attr('selected', 'selected');
	$('#eduYear3 option[value=2010]').attr('selected', 'selected');

	<c:if test='${not empty mgrBefore.eduYear}'>
		$("#eduYear option[value='${mgrBefore.eduYear}']").attr('selected', 'selected');
	</c:if>
	<c:if test='${not empty mgrBefore.eduYear2}'>
		$("#eduYear2 option[value='${mgrBefore.eduYear2}']").attr('selected', 'selected');
	</c:if>
	<c:if test='${not empty mgrBefore.eduYear3}'>
		$("#eduYear3 option[value='${mgrBefore.eduYear3}']").attr('selected', 'selected');
	</c:if>
	
	<c:if test='${not empty mgrBefore.eduStatus}'>
		$("#eduStatus option[value='${mgrBefore.eduStatus}']").attr('selected', 'selected');
	</c:if>
	
	<c:if test='${not empty mgrBefore.eduStatus2}'>
		$("#eduStatus2 option[value='${mgrBefore.eduStatus2}']").attr('selected', 'selected');
	</c:if>
	
	<c:if test='${not empty mgrBefore.eduStatus3}'>
		$("#eduStatus3 option[value='${mgrBefore.eduStatus3}']").attr('selected', 'selected');
	</c:if>
	
	<c:if test='${not empty mgrBefore.education}'>
		$("#education option[value='${mgrBefore.education}']").attr('selected', 'selected');
	</c:if>
	
	<c:if test='${not empty mgrBefore.education2}'>
		$("#education2 option[value='${mgrBefore.education2}']").attr('selected', 'selected');
	</c:if>
	
	<c:if test='${not empty mgrBefore.education3}'>
		$("#education3 option[value='${mgrBefore.education3}']").attr('selected', 'selected');
	</c:if>
	
	<c:forEach var="list" items="${mgrBook}" varStatus="listCnt">
		$("#bookYear${listCnt.index} option[value='${list.bookYear}']").attr('selected', 'selected');
	</c:forEach>
	

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
	

	
	//밸리데이션 체크
	$.validate({
		form : '#updateCounselorMgr',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
			$('[name=mobileSms]').val($('#mobilesms1').val() + "-" + $('#mobilesms2').val() + "-" + $('#mobilesms3').val()); 
			$('[name=rrn]').val($('#rrn1').val() + "-" + $('#rrn2').val()); 
		}
	});

	
	j$('#updateBtn').click(function() {

		if(j$("#centerOwnerYn").is(":checked")){
			j$("#ownerYn").val("Y");
			if('${mgr.centerOwnerYn}' == 'Y'){
				j$("#num").val(num);
				j$("#count").val(count);
				j$("#updateCounselorMgr").submit();
			}else{
				j$.alert('이미 등록된 대표 센터장을 교체하시겠습니까?',function(){
					j$("#num").val(num);
					j$("#count").val(count);
					j$("#updateCounselorMgr").submit();
				 },function(){
				 	return false;
				 }
				);
			}
		}else{
			j$("#ownerYn").val("N");
			j$("#num").val(num);
			j$("#count").val(count);
			j$("#updateCounselorMgr").submit();
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
		return false;
	}
	var oTr = e.deleteRow(num);
	num--;
}
function changeCert(num){
	var fm =  document.updateCounselorMgr;
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
<form id="updateCounselorMgr" name="updateCounselorMgr"  action="/madm/mgr/updateCounselorMgr" method="POST" enctype="multipart/form-data">
<input type="hidden" name="num" id="num">
<input type="hidden" name="count" id="count">
<input type="hidden" name="delPhoto" id="delPhoto">
<input type="hidden" name="ownerYn" id="ownerYn">
<input type="hidden" name="mgrCertCnt" id="mgrCertCnt" value="${mgrCertCnt}">

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
				<th align="left">&nbsp;&nbsp;센터코드</th>
				<td><input type="hidden" name="centerSeq" value="${mgr.centerSeq}"> ${mgr.centerSeq}</td>
				<th align="left">&nbsp;&nbsp;센터명</th>
				<td><input type="hidden" name="centerNm" value="${mgr.centerNm}">${mgr.centerNm}</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%" na>&nbsp;&nbsp;성명(아이디)</th>
				<td width="40%">
					<table>
		    			<tr>
		    				<td>
								<input type="text" name="userNm" value="${mgr.userNm}"/>
								<input type="hidden" name="userId" id="userId" value="${mgr.userId}"/>(${mgr.userId})
							</td>
		    				
		    			</tr>
		    		</table>
				</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%">&nbsp;&nbsp;생년월일/성별</th>
				<td width="40%" class="line">
				<input type="number" maxlength="6" id="rrn1" style="width: 20%;" data-validation="length number" data-validation-length="6-6"  data-validation-error-msg="생년월일을 확인 해주세요." />-
		    	<input type="number" maxlength="1" id="rrn2" style="width: 10%;" data-validation="length number" data-validation-length="1-1"  data-validation-error-msg="생년월일을 확인 해주세요." />
		    		<input type="hidden" name="rrn">ㆍ예) 901234-1 /
		    		<input type="radio" name="gender" value="M" ${mgrBefore.gender == 'M'  ? 'checked':''} /> 남성
					<input type="radio" name="gender" value="F" ${mgrBefore.gender == 'F'  ? 'checked':''} /> 여성
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 연락처</th>
				<td class="line" colspan="1" style="background:${mgrBefore.mobile1 == mgr.mobile1 && mgrBefore.mobile2 == mgr.mobile2 && mgrBefore.mobile3 == mgr.mobile3 ? '':'#f9ba7f'}">
				    <input type="number" maxlength="3" id="mobile1" value="${mgr.mobile1 }" style="width: 10%;" data-validation="length number" data-validation-length="2-3"  data-validation-error-msg="연락처를 확인 해주세요."/>-
		    		<input type="number" maxlength="4" id="mobile2" value="${mgr.mobile2 }" style="width: 10%;" data-validation="length number" data-validation-length="3-4"  data-validation-error-msg="연락처를 확인 해주세요." />-
		    		<input type="number" maxlength="4" id="mobile3" value="${mgr.mobile3 }" style="width: 10%;" data-validation="length number" data-validation-length="4-4"  data-validation-error-msg="연락처를 확인 해주세요." />
		    		<input type="hidden" name="mobile">
				</td>
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 이메일</th>
				<td style="background:${mgrBefore.email == mgr.email ? '':'#f9ba7f'}">
					<input type="text" name="email" style="width:150px;" value="${mgr.email}" data-validation="email" data-validation-error-msg-email="이메일을 확인 해주세요." /> 
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* SMS 인증용 연락처</th>
				<td class="line" colspan="1" style="background:${mgrBefore.mobilesms1 == mgr.mobilesms1 && mgrBefore.mobilesms2 == mgr.mobilesms2 && mgrBefore.mobilesms3 == mgr.mobilesms3 ? '':'#f9ba7f'}">
				    <input type="number" maxlength="3" id="mobilesms1" value="${mgr.mobilesms1 }" style="width: 10%;" data-validation="length number" data-validation-length="2-3"  data-validation-error-msg="연락처를 확인 해주세요."/>-
		    		<input type="number" maxlength="4" id="mobilesms2" value="${mgr.mobilesms2 }" style="width: 10%;" data-validation="length number" data-validation-length="3-4"  data-validation-error-msg="연락처를 확인 해주세요." />-
		    		<input type="number" maxlength="4" id="mobilesms3" value="${mgr.mobilesms3 }" style="width: 10%;" data-validation="length number" data-validation-length="4-4"  data-validation-error-msg="연락처를 확인 해주세요." />
					<input type="hidden" name="mobileSms">
				</td>
				
				
				
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
								<input type="text" name="university" style="width:95%;" value="${mgr.university}"/>
							</td>
							<td align="center">
								<input type="text" name="department" style="width:95%;" value="${mgr.department}"/>
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
								<input type="text" name="university2" style="width:95%;" value="${mgr.university2}"/>
							</td>
							<td align="center">
								<input type="text" name="department2" style="width:95%;" value="${mgr.department2}"/>
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
								<input type="text" name="university3" style="width:95%;" value="${mgr.university3}"/>
							</td>
							<td align="center">
								<input type="text" name="department3" style="width:95%;" value="${mgr.department3}"/>
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
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 주요경력</td>
				<td class="line" colspan="3">
					<table id="careerTable" cellspacing="0" border="0" width="100%">
						<thead>
							<tr>
								<th width="32%">기관명</th>
								<th width="32%">직위/역할</th>
								<th width="31%">근무기간</th>
							</tr>
						</thead>
						<tbody id="tbl_organization_body">
							<c:if test="${mgrCareer.size() < 1}">
							<tr id="organizationRow1">
								<td align="center"><input type="text" style="width:95%;" id="organizationName1" name="organizationName" /></td>
								<td align="center"><input type="text" style="width:95%;" id="role1" name="role" /></td>
								<td align="center">
									<input type="text" id="roleStartDate1" name="roleStartDate" class="startDt cal_box" datetimeonly="true" style="width:93px;" />~
									<input type="text" id="roleEndDate1" name="roleEndDate"  class="endDt cal_box" datetimeonly="true" style="width:93px;" />
							</tr>		
							</c:if>
							<c:forEach var="list" items="${mgrCareer}" varStatus="listCnt">
								<tr id="organizationRow${listCnt.index}">
									<td align="center"><input type="text" style="width:95%;" id="organizationName${listCnt.index}" name="organizationName" value="${list.organizationName}"/></td>
									<td align="center"><input type="text" style="width:95%;" id="role${listCnt.index}" name="role" value="${list.role}"/></td>
									<td align="center">
										<input type="text" id="roleStartDate${listCnt.index}" name="roleStartDate" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${list.roleStartDate}"/>~
										<input type="text" id="roleEndDate${listCnt.index}" name="roleEndDate"  class="endDt cal_box" datetimeonly="true" style="width:93px;" value="${list.roleEndDate}"/>
								</tr>		
							</c:forEach>
						</tbody>
		
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
							</tr>
						</thead>
						<tbody id="tbl_organization_body_cert">
							<c:forEach var="list" items="${mgrCert}" varStatus="listCnt">
        					<tr id="certOrgRow${listCnt.index}">
        						<td align="center"><input type="hidden" id="certOrg${listCnt.index}" name="certOrg" value="${list.orgNm}"/>${list.orgNm}</td>
        						<td align="center"><input type="hidden" id="certName${listCnt.index}" name="certName" value="${list.certNm}"/>${list.certNm}</td>
        						<td align="center"><input type="hidden" id="certGrade${listCnt.index}" name="certGrade" value="${list.grade}"/>${list.grade}</td>
        						<td align="center"><input type="hidden" id="certYear${listCnt.index}" name="certYear" value="${list.certYear}"/>${list.certYear}</td>
        						<td align="left">
        							<input type="button" value="다운로드" onclick="fileDownLoad('${list.filePath}', '${list.fileNm}')" >&nbsp;${list.fileNm}
        							<input type="hidden" id="fileName${listCnt.index}" name="fileName" value="${list.fileNm}"/>
        							<input type="hidden" id="filePath${listCnt.index}" name="filePath" value="${list.filePath}"/>
        						</td>
							</tr>
							</c:forEach>
						</tbody>
				
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
							</tr>
						</thead>
						<tbody id="tbl_organization_body_book">
							<c:forEach var="list" items="${mgrBook}" varStatus="listCnt">
        					<tr id="mgrBookRow${listCnt.index}">
								<td align="center"><input type="text" style="width:95%;" id="bookTitle${listCnt.index}" name="bookTitle" value="${list.bookTitle}" /></td>
								<td align="center"><input type="text" style="width:95%;" id="bookOrg${listCnt.index}" name="bookOrg" value="${list.bookOrg}" /></td>
								<td align="center"><input type="text" style="width:95%;" id="author${listCnt.index}" name="author" value="${list.author}" /></td>
								<td align="center">
									<select id="bookYear${listCnt.index}" name="bookYear" style="width:95%;">
									<c:forEach var="i" begin = "0" end="60" step="1" >
										<option value=<c:out value = "${currentYear-i}"/>><c:out value = "${currentYear-i}"/></option>
									</c:forEach>
									</select>
								</td>
							</tr>
							</c:forEach>
						</tbody>
			
					</table>
				</td>
			</tr>
			
			
			
			<%-- <tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 학력</th>
				<td class="line" colspan="3" style="background:${mgrBefore.education == mgr.education && mgrBefore.university == mgr.university &&  mgrBefore.department == mgr.department   ? '':'#f9ba7f'}">
					<input type="radio" name="education" value="M" ${mgr.education == 'M' ? 'checked':''} /> 석사
					<input type="radio" name="education" value="D" ${mgr.education == 'D' ? 'checked':''} /> 박사
					<input type="text" name="university" style="width:80px;" value="${mgr.university}" data-validation="required"  data-validation-error-msg-required="대학원을 확인 해주세요."/> 대학원
					<input type="text" name="department" style="width:80px;" value="${mgr.department}" data-validation="required"  data-validation-error-msg-required="학과를 확인 해주세요."/> 학과
					<br/>
					<input type="radio" name="education2" value="M" ${mgr.education2 == 'M' ? 'checked':''} /> 석사
					<input type="radio" name="education2" value="D" ${mgr.education2 == 'D' ? 'checked':''} /> 박사
					<input type="text" name="university2" style="width:80px;" value="${mgr.university2}" /> 대학원
					<input type="text" name="department2" style="width:80px;" value="${mgr.department2}" /> 학과
					<br/>
					<input type="radio" name="education3" value="M" ${mgr.education3 == 'M' ? 'checked':''} /> 석사
					<input type="radio" name="education3" value="D" ${mgr.education3 == 'D' ? 'checked':''} /> 박사
					<input type="text" name="university3" style="width:80px;" value="${mgr.university3}" /> 대학원
					<input type="text" name="department3" style="width:80px;" value="${mgr.department3}" /> 학과
					<br/>
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 경력</td>
				<td class="line" colspan="3" style="background:${mgrBefore.career == mgr.career ? '':'#f9ba7f'}">
					<span> * 업무를 수행하신 기간, 기관명, 담당업무를 기술해 주세요.</span><br />
					<textarea rows="5" cols="80" maxlength="1500" name="career" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${mgr.career}</textarea>
				</td>
			</tr>
			<tr align="left" height="30px">
						<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">* 자격&nbsp;&nbsp; <input type="button" onclick="addRow(cert);" value="+" />&nbsp;<input type="button" onclick="delRow(cert);" value="-" /> </th>
						<td class="line" colspan="3">
						<table id="cert">
							<tr align="left" >
							<td class="line" style="background:${mgrBefore.fileNm == mgr.fileNm ? '':'#f9ba7f'}">
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
					</tr> --%>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" >* 한줄소개</th>
				<td class="line" colspan="3" style="background:${mgrBefore.memo == mgr.memo ? '':'#f9ba7f'}">
					<input type="text" name="memo" style="width:40%;" value="${mgr.memo}" data-validation="required"  data-validation-error-msg-required="한줄소개를 확인 해주세요."/>
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" colspan="1" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;사진</th>
		    	<td class="line" colspan="3" style="background:${mgrBefore.fileNm == mgr.fileNm ? '':'#f9ba7f'}">
		    		<input type="file" name="picAdd" />&nbsp;
		    		${mgr.fileNm }
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">* 접속권한</th>
				<td style="background:${mgrBefore.authCd == mgr.authCd ? '':'#f9ba7f'}">
					<input type="radio" name="authCd" value="ROLE_PARTNER_CENTER" ${mgr.authCd == 'ROLE_PARTNER_CENTER'  ? 'checked':''} data-validation="required" data-validation-error-msg-required="접속권한을 확인해주세요."/> 센터장
					<input type="radio" name="authCd" value="ROLE_PARTNER_SANGDAM" ${mgr.authCd == 'ROLE_PARTNER_SANGDAM'  ? 'checked':''} /> 상담
					<input type="radio" name="authCd" value="ROLE_PARTNER_SEND" ${mgr.authCd == 'ROLE_PARTNER_SEND'  ? 'checked':''} /> 파견
					<input type="radio" name="authCd" value="ROLE_PARTNER_GROUP" ${mgr.authCd == 'ROLE_PARTNER_GROUP'  ? 'checked':''} /> 집단
					<input type="radio" name="authCd" value="ROLE_PARTNER_TEACHER" ${mgr.authCd == 'ROLE_PARTNER_TEACHER'  ? 'checked':''} /> 강사
				</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 근무형태</th>
				<td style="background:${mgrBefore.workType == mgr.workType ? '':'#f9ba7f'}">
					<input type="radio" name="workType" value="S" ${mgr.workType == 'S'  ? 'checked':''} /> 상주
					<input type="radio" name="workType" value="P" ${mgr.workType == 'P'  ? 'checked':''} /> 파트타임
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="${mgrBefore.regDt == mgr.regDt ? '#F5F5F5':'red'}">&nbsp;&nbsp;등록일</th>
				<td>${mgr.regDt}</td>
				<th class="line" height="30" align="left" bgcolor="${mgrBefore.modiDt == mgr.modiDt ? '#F5F5F5':'red'}">&nbsp;&nbsp;정보변경일</th>
				<td>${mgr.modiDt}</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;정보변경ID</th>
				<td class="line" colspan="3" >${mgr.modiId}</td>
			</tr>
				<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
			<tr>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 대표여부</th>
				<td class="line" colspan="3" style="background:${mgrBefore.centerOwnerYn == mgr.centerOwnerYn ? '':'#f9ba7f'}">
					<input type="checkbox" name="centerOwnerYn" id="centerOwnerYn" value="Y" ${mgr.centerOwnerYn == 'Y'  ? 'checked':''}/> 지정
				</td>
			</tr>
				</sec:authorize>
		</table>
		
<br/>ㆍ상담유형
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<!-- 유형선택 변경전 -->
			<tr>
				<td colspan="2" class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%">* 유형선택 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" name="channelTypeBefore" value="100001" onclick="return false;" /> 심리
					<input type="checkbox" name="channelTypeBefore" value="100002" onclick="return false;" /> 법률
					<input type="checkbox" name="channelTypeBefore" value="100003" onclick="return false;" /> 재무
					<input type="checkbox" name="channelTypeBefore" value="100004" onclick="return false;" /> 심리검사
				</td>
			</tr>
			<!-- 유형선택 변경후 -->
			<tr>
				<td colspan="2" class="line" height="30" align="left" bgcolor="#F5F5F5" width="10%">* 유형선택 (변경후)</td>
				<td>
					<input type="checkbox" name="channelType" value="100001" onclick="return false;" data-validation="checkbox_group" data-validation-qty="min1" data-validation-error-msg="유형을 선택해주세요."/> 심리
					<input type="checkbox" name="channelType" value="100002" onclick="return false;"/> 법률
					<input type="checkbox" name="channelType" value="100003" onclick="return false;"/> 재무
					<input type="checkbox" name="channelType" value="100004" onclick="return false;" /> 심리검사
				</td>
			</tr>
			
			
			<!-- 심리 변경전 -->
			<tr class="psyGroup" >
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="6">&nbsp;심리</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담대상  (변경전)</td>
				<td bgcolor="#F5F5F5" >
					<input type="checkbox" class="mentalAgesBefore" name="mentalAgesBefore" value="100447" onclick="return false;"/> 유아동
					<input type="checkbox" class="mentalAgesBefore" name="mentalAgesBefore" value="100448" onclick="return false;" /> 아동
					<input type="checkbox" class="mentalAgesBefore" name="mentalAgesBefore" value="100449" onclick="return false;" /> 청소년
					<input type="checkbox" class="mentalAgesBefore" name="mentalAgesBefore" value="100450" onclick="return false;" /> 성인
					<input type="checkbox" class="mentalAgesBefore" name="mentalAgesBefore" value="100451" onclick="return false;" /> 노년기 성인
				</td>
			</tr>
			
			<!-- 심리 변경후 -->
			<tr class="psyGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담대상 (변경후)</td>
				<td >
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100447" onclick="return false;" id="mentalAges"/> 유아동
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100448" onclick="return false;"/> 아동
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100449" onclick="return false;"/> 청소년
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100450" onclick="return false;"/> 성인
					<input type="checkbox" class="mentalAges" name="mentalAges" value="100451" onclick="return false;" /> 노년기 성인
				</td>
			</tr>
			
			<!-- 심리 상담분야 변경전 -->
			<tr class="psyGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="mentalDivBefore" name="mentalDivBefore"  value="100005"  onclick="return false;"/> 개인상담
					<input type="checkbox" class="mentalDivBefore" name="mentalDivBefore"  value="100006"  onclick="return false;" /> 부부/가족상담
					<input type="checkbox" class="mentalDivBefore" name="mentalDivBefore"  value="100007"  onclick="return false;" /> 놀이치료
					<input type="checkbox" class="mentalDivBefore" name="mentalDivBefore"  value="100008"  onclick="return false;" /> 미술치료
					<input type="checkbox" class="mentalDivBefore" name="mentalDivBefore"  value="100009"  onclick="return false;" /> 언어치료
					<input type="checkbox" class="mentalDivBefore" name="mentalDivBefore"  value="100010"  onclick="return false;" /> 특수재활치료 <br />
					<input type="checkbox" class="mentalDivBefore" name="mentalDivBefore"  value="100011"  onclick="return false;" /> 기타 
					<input type="text" name="mentalDivEtcBefore" id="mentalDivEtcBefore" style="width:500px;" value="${mgr.mentalDivEtc }" readonly>  
				</td>
			</tr>
			
			<!-- 심리 상담분야 변경후 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야 (변경후)</td>
				<td>
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100005"  id="mentalDiv"/> 개인상담
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100006"  /> 부부/가족상담
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100007"  /> 놀이치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100008"  /> 미술치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100009"  /> 언어치료
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100010"  /> 특수재활치료 <br />
					<input type="checkbox" class="mentalDiv" name="mentalDiv"  value="100011"  /> 기타 
					<input type="text" name="mentalDivEtc" id="mentalDivEtc" style="width:500px;" value="${mgr.mentalDivEtc }" readonly>  
				</td>
			</tr>
			
			<!-- 심리 상담방법 변경전 -->
			<tr class="psyGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="mentalTypeBefore" name="mentalTypeBefore"  value="100433" onclick="return false;" /> 대면
					<input type="checkbox" class="mentalTypeBefore" name="mentalTypeBefore"  value="100434" onclick="return false;" /> 전화
					<input type="checkbox" class="mentalTypeBefore" name="mentalTypeBefore"  value="100435" onclick="return false;" /> 게시판
					<input type="checkbox" class="mentalTypeBefore" name="mentalTypeBefore"  value="100436" onclick="return false;" /> 파견
					<input type="checkbox" class="mentalTypeBefore" name="mentalTypeBefore"  value="100437" onclick="return false;" /> 집단
					<input type="checkbox" class="mentalTypeBefore" name="mentalTypeBefore"  value="100438" onclick="return false;" /> 강의
				</td>
			</tr>
			
			<!-- 심리 상담방법 변경후 -->
			<tr class="psyGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법 (변경후)</td>
				<td>
					<input type="checkbox" class="mentalType" name="mentalType"  value="100433" onclick="return false;" id="mentalType" /> 대면
					<input type="checkbox" class="mentalType" name="mentalType"  value="100434" onclick="return false;" /> 전화
					<input type="checkbox" class="mentalType" name="mentalType"  value="100435" onclick="return false;" /> 게시판
					<input type="checkbox" class="mentalType" name="mentalType"  value="100436" onclick="return false;" /> 파견
					<input type="checkbox" class="mentalType" name="mentalType"  value="100437" onclick="return false;" /> 집단
					<input type="checkbox" class="mentalType" name="mentalType"  value="100438" onclick="return false;" /> 강의
				</td>
			</tr>
			
			
			
			<!-- 법률 상담분야 변경전-->
			<!--  <tr class="lawGroup" style="display: none;">
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="4">&nbsp;법률</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="lawDiv" name="lawDivBefore"  value="100012" /> 일반법률
					<input type="checkbox" class="lawDiv" name="lawDivBefore"  value="100013"  /> 부동산법률
					<input type="checkbox" class="lawDiv" name="lawDivBefore"  value="100014"  /> 세무
				</td>
			</tr>  -->
			<!-- 법률 상담분야 변경후 -->
			<tr class="lawGroup" >
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="2">&nbsp;법률</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야 (변경후)</td>
				<td >
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100012" onclick="return false;" id="lawDiv" /> 일반법률
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100013" onclick="return false;" /> 부동산법률
					<input type="checkbox" class="lawDiv" name="lawDiv"  value="100014" onclick="return false;" /> 세무
				</td>
			</tr>
			
			<!-- 법률 상담방법 변경전-->
			<!-- <tr class="lawGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="lawType" name="lawTypeBefore"  value="100433" /> 대면
					<input type="checkbox" class="lawType" name="lawTypeBefore"  value="100434"  /> 전화
					<input type="checkbox" class="lawType" name="lawTypeBefore"  value="100435"  /> 게시판
					<input type="checkbox" class="lawType" name="lawTypeBefore"  value="100436"  /> 파견
					<input type="checkbox" class="lawType" name="lawTypeBefore"  value="100437"  /> 집단
					<input type="checkbox" class="lawType" name="lawTypeBefore"  value="100438"  /> 강의
				</td>
			</tr> -->
			<!-- 법률 상담방법 변경후-->
			<tr class="lawGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법 (변경후)</td>
				<td>
					<input type="checkbox" class="lawType" name="lawType"  value="100433" onclick="return false;" id="lawType" /> 대면
					<input type="checkbox" class="lawType" name="lawType"  value="100434" onclick="return false;" /> 전화
					<input type="checkbox" class="lawType" name="lawType"  value="100435" onclick="return false;" /> 게시판
					<input type="checkbox" class="lawType" name="lawType"  value="100436" onclick="return false;" /> 파견
					<input type="checkbox" class="lawType" name="lawType"  value="100437" onclick="return false;" /> 집단
					<input type="checkbox" class="lawType" name="lawType"  value="100438" onclick="return false;"  /> 강의
				</td>
			</tr>
			
			
			<!-- 재무 변경전 -->
			<!-- <tr class="finGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="4">&nbsp;재무</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="financeDiv" name="financeDivBefore"  value="100015" id="financeDiv" /> 재무상담
				</td>
			</tr> -->
			<!-- 재무 변경후 -->
			<tr class="finGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="2">&nbsp;재무</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야 (변경후)</td>
				<td >
					<input type="checkbox" class="financeDiv" name="financeDiv"  value="100015" onclick="return false;" id="financeDiv" /> 재무상담
				</td>
			</tr>
			<!-- <tr class="finGroup" style="display: none;">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="financeType" name="financeTypeBefore"  value="100433" id="financeType" /> 대면
					<input type="checkbox" class="financeType" name="financeTypeBefore"  value="100434"  /> 전화
					<input type="checkbox" class="financeType" name="financeTypeBefore"  value="100435"  /> 게시판
					<input type="checkbox" class="financeType" name="financeTypeBefore"  value="100436"  /> 파견
					<input type="checkbox" class="financeType" name="financeTypeBefore"  value="100437"  /> 집단
					<input type="checkbox" class="financeType" name="financeTypeBefore"  value="100438"  /> 강의
				</td>
			</tr> -->
			
			<tr class="finGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법 (변경후)</td>
				<td>
					<input type="checkbox" class="financeType" name="financeType"  value="100433" onclick="return false;" id="financeType" /> 대면
					<input type="checkbox" class="financeType" name="financeType"  value="100434" onclick="return false;" /> 전화
					<input type="checkbox" class="financeType" name="financeType"  value="100435" onclick="return false;" /> 게시판
					<input type="checkbox" class="financeType" name="financeType"  value="100436" onclick="return false;" /> 파견
					<input type="checkbox" class="financeType" name="financeType"  value="100437" onclick="return false;" /> 집단
					<input type="checkbox" class="financeType" name="financeType"  value="100438" onclick="return false;" /> 강의
				</td>
			</tr>
			
			
			
			<!-- 심리검사 변경전-->
			<tr class="psyTestGroup" >
			<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="6">&nbsp;심리<br />&nbsp;검사</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담대상 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="diagnosisAges" name="diagnosisAgesBefore"  value="100447" onclick="return false;" /> 유아동
					<input type="checkbox" class="diagnosisAges" name="diagnosisAgesBefore"  value="100448" onclick="return false;" /> 아동
					<input type="checkbox" class="diagnosisAges" name="diagnosisAgesBefore"  value="100449" onclick="return false;" /> 청소년
					<input type="checkbox" class="diagnosisAges" name="diagnosisAgesBefore"  value="100450" onclick="return false;" /> 성인
					<input type="checkbox" class="diagnosisAges" name="diagnosisAgesBefore"  value="100451" onclick="return false;" /> 노년기 성인
				</td>
			</tr>
			<!-- 심리검사 변경후 -->
			<tr class="psyTestGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담대상 (변경후)</td>
				<td >
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100447" onclick="return false;" id="diagnosisAges" /> 유아동
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100448" onclick="return false;" /> 아동
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100449" onclick="return false;" /> 청소년
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100450" onclick="return false;" /> 성인
					<input type="checkbox" class="diagnosisAges" name="diagnosisAges"  value="100451" onclick="return false;" /> 노년기 성인
				</td>
			</tr>
			
			<tr class="psyTestGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="diagnosisDivBefore" name="diagnosisDivBefore"  value="100016" onclick="return false;" id="diagnosisDiv" /> 종합심리검사
					<input type="checkbox" class="diagnosisDivBefore" name="diagnosisDivBefore"  value="100017" onclick="return false;" /> 정서 및 성격검사
					<input type="checkbox" class="diagnosisDivBefore" name="diagnosisDivBefore"  value="100018" onclick="return false;" /> 진로 및 적성검사
					<input type="checkbox" class="diagnosisDivBefore" name="diagnosisDivBefore"  value="100019" onclick="return false;" /> 신경심리검사 <br />
					<input type="checkbox" class="diagnosisDivBefore" name="diagnosisDivBefore"  value="100020" onclick="return false;" /> 기타 
					<input type="text" name="diagnosisDivEtcBefore" id="diagnosisDivEtcBefore" style="width:500px;" value="${mgr.diagnosisDivEtc }" readonly> 
				</td>
			</tr>
			<tr class="psyTestGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담분야 (변경후)</td>
				<td>
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100016" onclick="return false;" id="diagnosisDiv" /> 종합심리검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100017" onclick="return false;" /> 정서 및 성격검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100018" onclick="return false;" /> 진로 및 적성검사
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100019" onclick="return false;" /> 신경심리검사 <br />
					<input type="checkbox" class="diagnosisDiv" name="diagnosisDiv"  value="100020" onclick="return false;" /> 기타 
					<input type="text" name="diagnosisDivEtc" id="diagnosisDivEtc" style="width:500px;" value="${mgr.diagnosisDivEtc }" readonly> 
				</td>
			</tr>
			<tr class="psyTestGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법 (변경전)</td>
				<td bgcolor="#F5F5F5">
					<input type="checkbox" class="diagnosisType" name="diagnosisTypeBefore"  value="100433" onclick="return false;" id="diagnosisType" /> 대면
					<input type="checkbox" class="diagnosisType" name="diagnosisTypeBefore"  value="100434" onclick="return false;" /> 전화
					<input type="checkbox" class="diagnosisType" name="diagnosisTypeBefore"  value="100435" onclick="return false;" /> 게시판
					<input type="checkbox" class="diagnosisType" name="diagnosisTypeBefore"  value="100436" onclick="return false;" /> 파견
					<input type="checkbox" class="diagnosisType" name="diagnosisTypeBefore"  value="100437" onclick="return false;" /> 집단
					<input type="checkbox" class="diagnosisType" name="diagnosisTypeBefore"  value="100438" onclick="return false;" /> 강의
				</td>
			</tr>
			<tr class="psyTestGroup" >
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담방법 (변경후)</td>
				<td>
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100433" onclick="return false;" id="diagnosisType" /> 대면
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100434" onclick="return false;" /> 전화
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100435" onclick="return false;" /> 게시판
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100436" onclick="return false;" /> 파견
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100437" onclick="return false;" /> 집단
					<input type="checkbox" class="diagnosisType" name="diagnosisType"  value="100438" onclick="return false;" /> 강의
				</td>
			</tr>
		</table>
		
		<br/>ㆍCapability
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			
			
			<!-- 심리 변경전 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="4">Capability</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 외국어 상담(변경전)</td>
				<td  bgcolor="#F5F5F5">		
					<input type="checkbox" class="languageType" name="languageTypeBefore" value="101075" onclick="return false;" /> 영어
					<input type="checkbox" class="languageType" name="languageTypeBefore" value="101076" onclick="return false;" /> 중국어
					<input type="checkbox" class="languageType" name="languageTypeBefore" value="101077" onclick="return false;" /> 일본어
					<input type="checkbox" class="languageType" name="languageTypeBefore" value="101078" onclick="return false;" /> 스페인어
					<input type="checkbox" class="languageType" name="languageTypeBefore" value="101079" onclick="return false;" /> 프랑스어
					<input type="checkbox" class="languageType" name="languageTypeBefore" value="101080" onclick="return false;" /> 기타
				</td>
			</tr>
			
			<!-- 심리 변경후 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 외국어 상담  (변경후)</td>
				<td >		
					<input type="checkbox" class="languageType" name="languageType" value="101075" onclick="return false;" /> 영어
					<input type="checkbox" class="languageType" name="languageType" value="101076" onclick="return false;" /> 중국어
					<input type="checkbox" class="languageType" name="languageType" value="101077" onclick="return false;" /> 일본어
					<input type="checkbox" class="languageType" name="languageType" value="101078" onclick="return false;" /> 스페인어
					<input type="checkbox" class="languageType" name="languageType" value="101079" onclick="return false;" /> 프랑스어
					<input type="checkbox" class="languageType" name="languageType" value="101080" onclick="return false;" /> 기타
				</td>
			</tr>
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 특수주제(변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101082"  onclick="return false;"  /> 성피해상담
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101083"  onclick="return false;"  /> 커리어상담
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101084"  onclick="return false;"  /> 심리코칭
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101085"  onclick="return false;"  /> 트라우마치료
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101086"  onclick="return false;"  /> 애도상담
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101087"  onclick="return false;"   /> 자살위기상담 <br />
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101088"  onclick="return false;"   /> 직장내이슈 조사(직장내괴롭힘, 직장내성희롱 등)
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101089"  onclick="return false;"  /> 내마음보고서 해석상담
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101090"  onclick="return false;"  /> 수면상담(CBTI)
					<input type="checkbox" class="specialType" name="specialTypeBefore"  value="101091"  onclick="return false;"  /> 심리적응급처치(위기개입)
					<input type="text" name="mentalDivEtcBefore" id="mentalDivEtcBefore" style="width:500px;"  value="${mgrBefore.specialHeal }" readonly >  
				</td>
			</tr>
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 특수주제  (변경후)</td>
				<td >
					<input type="checkbox" class="specialType" name="specialType"  value="101082" onclick="return false;"  /> 성피해상담
					<input type="checkbox" class="specialType" name="specialType"  value="101083" onclick="return false;"  /> 커리어상담
					<input type="checkbox" class="specialType" name="specialType"  value="101084" onclick="return false;" /> 심리코칭
					<input type="checkbox" class="specialType" name="specialType"  value="101085" onclick="return false;" /> 트라우마치료
					<input type="checkbox" class="specialType" name="specialType"  value="101086" onclick="return false;" /> 애도상담
					<input type="checkbox" class="specialType" name="specialType"  value="101087" onclick="return false;" /> 자살위기상담 <br />
					<input type="checkbox" class="specialType" name="specialType"  value="101088" onclick="return false;" /> 직장내이슈 조사(직장내괴롭힘, 직장내성희롱 등)
					<input type="checkbox" class="specialType" name="specialType"  value="101089" onclick="return false;" /> 내마음보고서 해석상담
					<input type="checkbox" class="specialType" name="specialType"  value="101090" onclick="return false;" /> 수면상담(CBTI)
					<input type="checkbox" class="specialType" name="specialType"  value="101091" onclick="return false;" /> 심리적응급처치(위기개입)
					<input type="text" name="specialHearing" id="specialHearing" style="width:500px;" value="${mgr.specialHeal }" readonly>  
				</td>
			</tr>
			
			<!-- 직장관련 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="14">주요주제</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 직장관련 (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101093"   onclick="return false;"  /> 직무소진
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101094"   onclick="return false;"  /> 스트레스관리
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101095"   onclick="return false;"  /> 직무 무기력
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101096"   onclick="return false;"  /> 감정노동스트레스
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101097"   onclick="return false;"  /> 조직문화
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101098"   onclick="return false;"  /> 직장 내 트라우마
					<br>
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101099"   onclick="return false;"  /> 일가정양립(워킹맘/워킹파)
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101100"   onclick="return false;"  /> 관계갈등
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101101"   onclick="return false;"  /> 업무적응
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101102"   onclick="return false;"  /> 직무복귀
					<input type="checkbox" class="jobType" name="jobTypeBefore"  value="101103"   onclick="return false;"  /> 업무능력향상
				</td>
			</tr> -->
			<!-- 직장관련 변경후 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="7">주요주제</td>		
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 직장관련 (변경후)</td>
				<td>
					<input type="checkbox" class="jobType" name="jobType"  value="101093" onclick="return false;" /> 직무소진
					<input type="checkbox" class="jobType" name="jobType"  value="101094" onclick="return false;" /> 스트레스관리
					<input type="checkbox" class="jobType" name="jobType"  value="101095" onclick="return false;" /> 직무 무기력
					<input type="checkbox" class="jobType" name="jobType"  value="101096" onclick="return false;" /> 감정노동스트레스
					<input type="checkbox" class="jobType" name="jobType"  value="101097" onclick="return false;" /> 조직문화
					<input type="checkbox" class="jobType" name="jobType"  value="101098" onclick="return false;" /> 직장 내 트라우마
					<br>
					<input type="checkbox" class="jobType" name="jobType"  value="101099" onclick="return false;" /> 일가정양립(워킹맘/워킹파)
					<input type="checkbox" class="jobType" name="jobType"  value="101100" onclick="return false;" /> 관계갈등
					<input type="checkbox" class="jobType" name="jobType"  value="101101" onclick="return false;" /> 업무적응
					<input type="checkbox" class="jobType" name="jobType"  value="101102" onclick="return false;" /> 직무복귀
					<input type="checkbox" class="jobType" name="jobType"  value="101103" onclick="return false;" /> 업무능력향상
				</td>
			</tr>


			<!-- 개인관련 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 개인관련 (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101105"   onclick="return false;"  /> 자기탐색 및 이해
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101106"   onclick="return false;"  /> 자기성장(미래설계, 적성, 진로 등)
					<br>
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101107"   onclick="return false;"  /> 슬픔
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101108"   onclick="return false;"  /> 분노조절
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101109"   onclick="return false;"  /> 우울
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101110"   onclick="return false;"  /> 불안
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101111"   onclick="return false;"  /> 공황
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101112"   onclick="return false;"  /> 무기력
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101113"   onclick="return false;"  /> 무망감
					<br>
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101114"   onclick="return false;"  />사회기술 부족
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101115"   onclick="return false;"  />관계갈등
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101116"   onclick="return false;"  />관계 내 어려움
					<br>
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101117"   onclick="return false;"  />중독행동(알코올)
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101118"   onclick="return false;"  />중독행동(도박)
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101119"   onclick="return false;"  />중독행동(인터넷/스마트폰)
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101120"   onclick="return false;"  />충동조절 어려움
					<br>
					<input type="checkbox" class="personalType" name="personalTypeBefore"  value="101121"   onclick="return false;"  />기타 정신건강의학적 증상(섭식문제, 성격장애 등)
				</td>
			</tr> -->
				
			<!-- 개인관련 변경후 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 개인관련 (변경후)</td>
				<td>
					<input type="checkbox" class="personalType" name="personalType"  value="101105" onclick="return false;" /> 자기탐색 및 이해
					<input type="checkbox" class="personalType" name="personalType"  value="101106" onclick="return false;" /> 자기성장(미래설계, 적성, 진로 등)
					<br>
					<input type="checkbox" class="personalType" name="personalType"  value="101107" onclick="return false;" /> 슬픔
					<input type="checkbox" class="personalType" name="personalType"  value="101108" onclick="return false;" /> 분노조절
					<input type="checkbox" class="personalType" name="personalType"  value="101109" onclick="return false;" /> 우울
					<input type="checkbox" class="personalType" name="personalType"  value="101110" onclick="return false;" /> 불안
					<input type="checkbox" class="personalType" name="personalType"  value="101111" onclick="return false;" /> 공황
					<input type="checkbox" class="personalType" name="personalType"  value="101112" onclick="return false;" /> 무기력
					<input type="checkbox" class="personalType" name="personalType"  value="101113" onclick="return false;" /> 무망감
					<br>
					<input type="checkbox" class="personalType" name="personalType"  value="101114" onclick="return false;" />사회기술 부족
					<input type="checkbox" class="personalType" name="personalType"  value="101115" onclick="return false;" />관계갈등
					<input type="checkbox" class="personalType" name="personalType"  value="101116" onclick="return false;" />관계 내 어려움
					<br>
					<input type="checkbox" class="personalType" name="personalType"  value="101117" onclick="return false;" />중독행동(알코올)
					<input type="checkbox" class="personalType" name="personalType"  value="101118" onclick="return false;" />중독행동(도박)
					<input type="checkbox" class="personalType" name="personalType"  value="101119" onclick="return false;" />중독행동(인터넷/스마트폰)
					<input type="checkbox" class="personalType" name="personalType"  value="101120" onclick="return false;" />충동조절 어려움
					<br>
					<input type="checkbox" class="personalType" name="personalType"  value="101121" onclick="return false;" />기타 정신건강의학적 증상(섭식문제, 성격장애 등)
				</td>
			</tr>
						
			<!-- 가족관련 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 가족관련 (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101123"  onclick="return false;"   /> 가족이해
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101124"   onclick="return false;"  /> 자녀양육
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101125"   onclick="return false;"  /> 문제행동
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101126"  onclick="return false;"   /> 관계갈등
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101127"  onclick="return false;"   /> 가족해체관련(이혼)
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101128"   onclick="return false;"  /> 애도
					<br>
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101129"  onclick="return false;"   /> 학습심리
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101130"  onclick="return false;"   /> 주의력
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101131"  onclick="return false;"   /> 학교적응
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101132"  onclick="return false;"   /> 행동통제어려움
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101133"  onclick="return false;"   /> 반항 및 문제행동
					<br>
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101134"  onclick="return false;"   />발달문제(언어)
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101135"  onclick="return false;"   />발달문제(지체 및 자폐)
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101136"  onclick="return false;"   />행동문제
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101137"  onclick="return false;"   />애착문제
					<input type="checkbox" class="familyType" name="familyTypeBefore"  value="101138"  onclick="return false;"   />학대 등
				</td>
			</tr> -->
			
			<!-- 가족관련 변경후 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 가족관련 (변경후)</td>
				<td>
					<input type="checkbox" class="familyType" name="familyType"  value="101123" onclick="return false;" /> 가족이해
					<input type="checkbox" class="familyType" name="familyType"  value="101124" onclick="return false;" /> 자녀양육
					<input type="checkbox" class="familyType" name="familyType"  value="101125" onclick="return false;" /> 문제행동
					<input type="checkbox" class="familyType" name="familyType"  value="101126" onclick="return false;" /> 관계갈등
					<input type="checkbox" class="familyType" name="familyType"  value="101127" onclick="return false;" /> 가족해체관련(이혼)
					<input type="checkbox" class="familyType" name="familyType"  value="101128" onclick="return false;" /> 애도
					<br>
					<input type="checkbox" class="familyType" name="familyType"  value="101129" onclick="return false;" /> 학습심리
					<input type="checkbox" class="familyType" name="familyType"  value="101130" onclick="return false;" /> 주의력
					<input type="checkbox" class="familyType" name="familyType"  value="101131" onclick="return false;" /> 학교적응
					<input type="checkbox" class="familyType" name="familyType"  value="101132" onclick="return false;" /> 행동통제어려움
					<input type="checkbox" class="familyType" name="familyType"  value="101133" onclick="return false;" /> 반항 및 문제행동
					<br>
					<input type="checkbox" class="familyType" name="familyType"  value="101134" onclick="return false;" />발달문제(언어)
					<input type="checkbox" class="familyType" name="familyType"  value="101135" onclick="return false;" />발달문제(지체 및 자폐)
					<input type="checkbox" class="familyType" name="familyType"  value="101136" onclick="return false;" />행동문제
					<input type="checkbox" class="familyType" name="familyType"  value="101137" onclick="return false;" />애착문제
					<input type="checkbox" class="familyType" name="familyType"  value="101138" onclick="return false;" />학대 등
				</td>
			</tr>
			
			<!-- 충격/트라우마 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 충격/트라우마  (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="traumaType" name="traumaTypeBefore"  value="101140"   onclick="return false;"  /> 범죄피해자
					<input type="checkbox" class="traumaType" name="traumaTypeBefore"  value="101141"   onclick="return false;"  /> 성피해
					<input type="checkbox" class="traumaType" name="traumaTypeBefore"  value="101142"  onclick="return false;"   /> 사고
					<input type="checkbox" class="traumaType" name="traumaTypeBefore"  value="101143"  onclick="return false;"   /> 파산
					<input type="checkbox" class="traumaType" name="traumaTypeBefore"  value="101144"   onclick="return false;"  /> 사회적 지탄
					<input type="checkbox" class="traumaType" name="traumaTypeBefore"  value="101145"   onclick="return false;"  /> 사망사고
					<input type="checkbox" class="traumaType" name="traumaTypeBefore"  value="101146"   onclick="return false;"  /> 충격사건
					<input type="checkbox" class="traumaType" name="traumaTypeBefore"  value="101147"  onclick="return false;"  /> 폭력 및 학대
				</td>
			</tr> -->
	
			<!-- 충격/트라우마 변경후 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 충격/트라우마 (변경후)</td>
				<td>
					<input type="checkbox" class="traumaType" name="traumaType"  value="101140" onclick="return false;" /> 범죄피해자
					<input type="checkbox" class="traumaType" name="traumaType"  value="101141" onclick="return false;" /> 성피해
					<input type="checkbox" class="traumaType" name="traumaType"  value="101142" onclick="return false;" /> 사고
					<input type="checkbox" class="traumaType" name="traumaType"  value="101143" onclick="return false;" /> 파산
					<input type="checkbox" class="traumaType" name="traumaType"  value="101144" onclick="return false;" /> 사회적 지탄
					<input type="checkbox" class="traumaType" name="traumaType"  value="101145" onclick="return false;" /> 사망사고
					<input type="checkbox" class="traumaType" name="traumaType"  value="101146" onclick="return false;" /> 충격사건
					<input type="checkbox" class="traumaType" name="traumaType"  value="101147" onclick="return false;" /> 폭력 및 학대
				</td>
			</tr>
	
	
			<!-- 대상별 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 대상별 (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="targetType" name="targetTypeBefore"  value="101149"   onclick="return false;" /> 임원급
					<input type="checkbox" class="targetType" name="targetTypeBefore"  value="101150"   onclick="return false;"   /> 감정노동자
					<input type="checkbox" class="targetType" name="targetTypeBefore"  value="101151"   onclick="return false;"  /> 교대근무자
					<input type="checkbox" class="targetType" name="targetTypeBefore"  value="101152"   onclick="return false;"  /> 신입사원
					<input type="checkbox" class="targetType" name="targetTypeBefore"  value="101153"   onclick="return false;"  /> 영유아
				</td>
			</tr> -->
			
			
			<!-- 대상별 변경후 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 대상별 (변경후)</td>
				<td >
					<input type="checkbox" class="targetType" name="targetType"  value="101149" onclick="return false;" id="mentalType" /> 임원급
					<input type="checkbox" class="targetType" name="targetType"  value="101150" onclick="return false;" /> 감정노동자
					<input type="checkbox" class="targetType" name="targetType"  value="101151" onclick="return false;" /> 교대근무자
					<input type="checkbox" class="targetType" name="targetType"  value="101152" onclick="return false;" /> 신입사원
					<input type="checkbox" class="targetType" name="targetType"  value="101153" onclick="return false;" /> 영유아
				</td>
			</tr>

			<!-- 법률 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 법률 (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="lawCounselType" name="lawCounselTypeBefore"  value="101155"  onclick="return false;"  /> 가정사 – 이혼, 상속, 유언 등
					<input type="checkbox" class="lawCounselType" name="lawCounselTypeBefore"  value="101156"  onclick="return false;"  /> 금전거래 – 권리금, 보증금, 떼인돈 등
					<input type="checkbox" class="lawCounselType" name="lawCounselTypeBefore"  value="101157"  onclick="return false;"  /> 손해배상 – 교통사고, 의료사고, 때린사건, 맞은사건 등 
					<input type="checkbox" class="lawCounselType" name="lawCounselTypeBefore"  value="101158"  onclick="return false;"   /> 부동산 – 주택임대차, 상가임대차, 유치권, 명도소송 등 
					<input type="checkbox" class="lawCounselType" name="lawCounselTypeBefore"  value="101159"  onclick="return false;"   /> 빚-채무 – 개인회생, 개인파산
					<input type="checkbox" class="lawCounselType" name="lawCounselTypeBefore"  value="101160"  onclick="return false;"   /> 기타 – 성추행, 저작권, 노무관련, 행정처분 등
				</td>
			</tr> -->
			
			<!-- 법률 변경후-->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 법률 (변경후)</td>
				<td>
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101155" onclick="return false;" id="mentalType" /> 가정사 – 이혼, 상속, 유언 등
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101156" onclick="return false;" /> 금전거래 – 권리금, 보증금, 떼인돈 등
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101157" onclick="return false;" /> 손해배상 – 교통사고, 의료사고, 때린사건, 맞은사건 등 
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101158" onclick="return false;" /> 부동산 – 주택임대차, 상가임대차, 유치권, 명도소송 등 
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101159" onclick="return false;" /> 빚-채무 – 개인회생, 개인파산
					<input type="checkbox" class="lawCounselType" name="lawCounselType"  value="101160" onclick="return false;" /> 기타 – 성추행, 저작권, 노무관련, 행정처분 등
				</td>
			</tr>

			<!-- 재무 변경전-->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 재무 (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="financeCounselType" name="financeCounselTypeBefore"  value="101162"   onclick="return false;"  /> 신입사원 재무설계
					<input type="checkbox" class="financeCounselType" name="financeCounselTypeBefore"  value="101163"   onclick="return false;"  /> 신혼부부 재테크
					<input type="checkbox" class="financeCounselType" name="financeCounselTypeBefore"  value="101164"   onclick="return false;"  /> 노후자금 마련
					<input type="checkbox" class="financeCounselType" name="financeCounselTypeBefore"  value="101165"   onclick="return false;"  /> 주택마련
				</td>
			</tr> -->
			
			<!-- 재무 변경후-->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 재무 (변경후)</td>
				<td>
					<input type="checkbox" class="financeCounselType" name="financeCounselType"  value="101162" onclick="return false;" id="mentalType" /> 신입사원 재무설계
					<input type="checkbox" class="financeCounselType" name="financeCounselType"  value="101163" onclick="return false;" /> 신혼부부 재테크
					<input type="checkbox" class="financeCounselType" name="financeCounselType"  value="101164" onclick="return false;" /> 노후자금 마련
					<input type="checkbox" class="financeCounselType" name="financeCounselType"  value="101165" onclick="return false;" /> 주택마련
				</td>
			</tr>
			
			<!-- 상담선호 변경전 -->
			<!-- 단회기상담 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="4">상담선호</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 단회기상담 (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="preferredType" name="preferredTypeBefore"  value="101167" onclick="return false;" /> 단회기상담 선호여부
				</td>
			</tr>
			 -->
			
			<!-- 상담선호 변경후 -->
			<!-- 단회기상담 변경후  -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" rowspan="2">상담선호</td>
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 단회기상담 (변경후)</td>
				<td>
					<input type="checkbox" class="preferredType" name="preferredType"  value="101167" onclick="return false;" id="mentalType" /> 단회기상담 선호여부
				</td>
			</tr>
			<!-- 선호접근 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 선호접근 (변경전)</td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="preferredType" name="preferredTypeBefore"  value="101168" onclick="return false;"	 /> 인지행동접근
					<input type="checkbox" class="preferredType" name="preferredTypeBefore"  value="101169" onclick="return false;" /> 정신분적적접근
					<input type="checkbox" class="preferredType" name="preferredTypeBefore"  value="101170" onclick="return false;"  /> 인본주의적 접근
					<input type="checkbox" class="preferredType" name="preferredTypeBefore"  value="101171" onclick="return false;"  /> 현상학적접근(게슈탈트)
					<input type="checkbox" class="preferredType" name="preferredTypeBefore"  value=""  /> 기타(주관식)
				</td>
			</tr> -->
			<!-- 선호접근 변경후 -->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5">* 선호접근 (변경후)</td>
				<td>
					<input type="checkbox" class="preferredType" name="preferredType"  value="101168" onclick="return false;"	 /> 인지행동접근
					<input type="checkbox" class="preferredType" name="preferredType"  value="101169" onclick="return false;" /> 정신분적적접근
					<input type="checkbox" class="preferredType" name="preferredType"  value="101170" onclick="return false;" /> 인본주의적 접근
					<input type="checkbox" class="preferredType" name="preferredType"  value="101171" onclick="return false;" /> 현상학적접근(게슈탈트)
					<input type="checkbox" class="preferredType" name="preferredType"  value="" onclick="return false;" /> 기타(주관식)
				</td>
			</tr>
			
			<!-- 상담성향 변경전 -->
			<!-- <tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" colspan="2">상담성향 (변경전) </td>
				<td  bgcolor="#F5F5F5">
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101173" onclick="return false;"  /> 공감적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101174" onclick="return false;"  /> 편안한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101175" onclick="return false;"  /> 잘 들어주는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101176" onclick="return false;"  /> 따뜻한
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101177" onclick="return false;"  /> 위로가 되는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101178" onclick="return false;"  /> 포근한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101179" onclick="return false;"  /> 온화한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101180" onclick="return false;"  /> 신뢰로운
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101181" onclick="return false;"  /> 안심되는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101182" onclick="return false;"  /> 진정성 있는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101183" onclick="return false;"  /> 진솔한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101184" onclick="return false;"  /> 성의있는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101185" onclick="return false;"  /> 성심을 다하는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101186" onclick="return false;"  /> 진지한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101187" onclick="return false;"  /> 진중한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101188" onclick="return false;"  /> 자상한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101189" onclick="return false;"  /> 배려하는 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101190" onclick="return false;"  /> 상냥한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101191" onclick="return false;"  /> 케어해주는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101192" onclick="return false;"  /> 푸근한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101193" onclick="return false;"  /> 눈높이를 맞추는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101194" onclick="return false;"  /> 용기를 주는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101195" onclick="return false;"/> 응원해주는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101196"  onclick="return false;" /> 희망적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101197"  onclick="return false;" /> 긍정적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101198"  onclick="return false;" /> 즐거운
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101199"  onclick="return false;" /> 친절한 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101200"  onclick="return false;" /> 적극적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101201"  onclick="return false;" /> 속시원한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101202"  onclick="return false;" /> 부담없는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101203"  onclick="return false;" /> 명쾌한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101204"  onclick="return false;" /> 솔직한
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101205"  onclick="return false;" /> 재밌는 
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101206"  onclick="return false;" /> 자유로운
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101207"  onclick="return false;" /> 섬세한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101208"  onclick="return false;" /> 구체적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101209"  onclick="return false;" /> 상세히 설명하는 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101210"  onclick="return false;" /> 계획적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101211"  onclick="return false;" /> 세밀한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101212"  onclick="return false;" /> 차근차근한
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101213"  onclick="return false;" /> 분석적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101214"  onclick="return false;" /> 진단해주는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101215" onclick="return false;" /> 예리한  
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101216" onclick="return false;" /> 객관적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101217" onclick="return false;" /> 현실적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101218" onclick="return false;" /> 전문적인
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101219" onclick="return false;" /> 숙련된 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101220" onclick="return false;" /> 깊이 있는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101221" onclick="return false;" /> 새로운 관점의
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101222" onclick="return false;"  /> 통찰력 있는 
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101223" onclick="return false;"  /> 맥을 잘 짚는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101224" onclick="return false;" /> 문제를 잘 파악하는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101225" onclick="return false;"  /> 내가 몰랐던 것을 알게 해주는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101226" onclick="return false;"  /> 방향을 제시하는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101227" onclick="return false;"  /> 조언을 주는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101228" onclick="return false;"  /> 해결책을 제시하는
					<input type="checkbox" class="tendencyType" name="tendencyTypeBefore"  value="101229" onclick="return false;"  /> 길을 잡아주는

				</td>
			</tr> -->
		<!-- 상담성향 변경후-->
			<tr class="psyGroup">
				<td class="line" height="30" align="left" bgcolor="#F5F5F5" colspan="2">상담성향 (변경후) </td>
				<td>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101173" onclick="return false;" /> 공감적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101174" onclick="return false;" /> 편안한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101175" onclick="return false;" /> 잘 들어주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101176" onclick="return false;" /> 따뜻한
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101177" onclick="return false;" /> 위로가 되는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101178" onclick="return false;" /> 포근한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101179" onclick="return false;" /> 온화한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101180" onclick="return false;" /> 신뢰로운
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101181" onclick="return false;" /> 안심되는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101182" onclick="return false;" /> 진정성 있는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101183" onclick="return false;" /> 진솔한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101184" onclick="return false;" /> 성의있는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101185" onclick="return false;" /> 성심을 다하는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101186" onclick="return false;" /> 진지한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101187" onclick="return false;" /> 진중한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101188" onclick="return false;" /> 자상한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101189" onclick="return false;" /> 배려하는 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101190" onclick="return false;" /> 상냥한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101191" onclick="return false;" /> 케어해주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101192" onclick="return false;" /> 푸근한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101193" onclick="return false;" /> 눈높이를 맞추는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101194" onclick="return false;" /> 용기를 주는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101195" onclick="return false;"/> 응원해주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101196" onclick="return false;" /> 희망적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101197" onclick="return false;" /> 긍정적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101198" onclick="return false;" /> 즐거운
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101199" onclick="return false;" /> 친절한 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101200" onclick="return false;" /> 적극적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101201" onclick="return false;" /> 속시원한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101202" onclick="return false;" /> 부담없는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101203" onclick="return false;" /> 명쾌한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101204" onclick="return false;" /> 솔직한
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101205" onclick="return false;" /> 재밌는 
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101206" onclick="return false;" /> 자유로운
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101207" onclick="return false;" /> 섬세한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101208" onclick="return false;" /> 구체적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101209" onclick="return false;" /> 상세히 설명하는 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101210" onclick="return false;" /> 계획적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101211" onclick="return false;" /> 세밀한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101212" onclick="return false;" /> 차근차근한
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101213" onclick="return false;" /> 분석적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101214" onclick="return false;" /> 진단해주는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101215" onclick="return false;"/> 예리한  
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101216" onclick="return false;" /> 객관적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101217" onclick="return false;" /> 현실적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101218" onclick="return false;" /> 전문적인
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101219" onclick="return false;" /> 숙련된 
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101220" onclick="return false;" /> 깊이 있는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101221" onclick="return false;" /> 새로운 관점의
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101222" onclick="return false;" /> 통찰력 있는 
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101223" onclick="return false;" /> 맥을 잘 짚는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101224" onclick="return false;" /> 문제를 잘 파악하는
					<br>
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101225" onclick="return false;" /> 내가 몰랐던 것을 알게 해주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101226" onclick="return false;" /> 방향을 제시하는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101227" onclick="return false;" /> 조언을 주는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101228" onclick="return false;" /> 해결책을 제시하는
					<input type="checkbox" class="tendencyType" name="tendencyType"  value="101229" onclick="return false;" /> 길을 잡아주는

				</td>
			</tr>
			<tr>
				<th class="line" width="15%" align="left" bgcolor="#F5F5F5"  colspan="2">
					주요 강점 및 핵심역량</th>
				<td class="line" colspan="5"><input type="text"
					name="coreVal" value="${mgr.coreVal }"
					style="width: 700px;" readonly/></td>
			</tr>					
			<tr>
				<th class="line" width="15%" align="left" bgcolor="#F5F5F5" colspan="2">상담	외 프로그램
				<br>(집단, 특강 등)
				</th>
				<td class="line" colspan="4">
					<div id="etcExamExtra">
							<c:forEach var="list" items="${extraExamInfo}" varStatus="listCnt">
								<input type="hidden" name="extraExamIdx" value="${list.extraIdx }" />
								
							프로그램명 : <input type="text" name="extraExamInfo1" value="${list.extraNm }"	readonly />
							대상 : <input type="text"	name="extraExamInfo2" value="${list.extraTarget }"	readonly />
							센터 내 시행비용(인당) :<input type="text" name="extraExamInfo3" value="${list.extraCost }"	readonly />
							<br/>
						</c:forEach> 
					</div>
				</td>
			</tr>
			
			
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="updateBtn" value="변경승인" style="height:30px; width:100px;">
					<span style="margin-left: 20px;"></span>
					<input type="button" id="userImsiModiRefuseBtn"  value="변경거절" style="height:30px; width:100px;">
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