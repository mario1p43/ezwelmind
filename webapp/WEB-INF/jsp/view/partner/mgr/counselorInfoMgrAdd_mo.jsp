<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentYear" value="${now}" pattern="yyyy" />
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>상담사 정보관리 수정</title>

<style>
	table{border-spacing: 0 !important}
	table td{background: none !important}
	input{border: none;}

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
	
	.content-wrapper{padding: 0 5vw;}
	.content-input{font-weight: normal; font-size: 14px;}
	.content-input::placeholder{font-weight: normal; font-size: 14px; color: #828282;}
	.content-input.alignLeft{text-align: left;}
	.content-input.alignCenter{text-align: center;}

	.underline{border-bottom:1px solid #bdbdbd;}

	.title{font-weight: bold; font-size: 20px; color: black;}
	.subject{font-weight: bold; font-size: 16px; color: black;}
	.label{font-weight: bold; font-size: 14px; color: black;}
	.subLabel{font-weight: normal; font-size: 14px; color: #828282;}
	.contentLabel{font-weight: normal; font-size: 14px; color: black;}

	.width-one-half{width: 50vw;}
	.width-one-third{width: 33vw;}
	.width-one-quarter{width: 25vw;}
	.width-one-fifth{width: 20vw;}
	.width-one-tenth{width: 10vw;}

	.width-fourty{width: 40vw;}
	.width-thirty{width: 30vw;}
	.width-fifteen{width: 15vw;}

	.height-one-tenth{height: 10vw;}
	.height-fifteen{height: 15vw;}
	
	.button-blue{color: #2F80ED; border: none; outline: none; background: none; padding: 0;}
	.button-red{color: #eb5757; border: none; outline: none; background: none; padding: 0;}

	.selectGroupThird select:nth-child(1){margin-right:5px;}
	.selectGroupThird select:nth-child(2){margin-right:5px;}
	.selectGroupTwo select:nth-child(1){margin-right:5px;}
	
	.counselor-info-wrapper .content-title-wrapper{font-weight:bold;font-size:20px;}

	.has-validation-callback .content-wrapper{display:flow-root;margin-top:5vw}
	.has-validation-callback .content-wrapper:first-child{margin-top:0vw}
	.has-validation-callback .content-wrapper .title-big-block{font-size:20px;font-weight:bold;line-height:130%}
	.has-validation-callback .content-wrapper .title-small-block{font-size:14px;font-weight:bold;line-height:130%}
	.has-validation-callback .content-wrapper .title-block{font-size:16px;font-weight:bold;line-height:130%}
	.has-validation-callback .content-wrapper .input-block{display:flow-root;margin-top:2vw}
	.has-validation-callback .content-wrapper .input-block.line-bottom input[type=text]{width:100%;float:left;padding:4px 0;font-size:16px;line-height:130%;border:none;outline:none}
	.has-validation-callback .content-wrapper .input-block .checkbox-wrapper{float:left;margin-right:4vw;font-size:14px}
	.has-validation-callback .content-wrapper .line-bottom{border-bottom:1px solid #C4C4C4}
	.has-validation-callback .content-wrapper .datetimepicker-block{display:flex}
	.has-validation-callback .content-wrapper .datetimepicker-block span{display:inline-block;float:left;width:20px;text-align:center;line-height:36px}
	.has-validation-callback .content-wrapper .datetimepicker-block input[type=text]{float:left;width:calc(50% - 10px);height:32px;padding:0 8px;font-size:14px;border:1px solid #828282}
	.has-validation-callback .content-wrapper .datetimepicker-btn-block{display:flow-root;margin-top:2vw}
	.has-validation-callback .content-wrapper .datetimepicker-btn-block input[type=button]{float:left;width:calc((100% - 6vw) / 4);height:32px;font-weight:bold;font-size:16px;background-color:#E0E0E0;border:1px solid #BDBDBD;border-radius:4px}
	.has-validation-callback .content-wrapper .datetimepicker-btn-block input[type=button]:not(:last-child){margin-right:2vw}
	.has-validation-callback .content-wrapper .search-btn{height:40px;width:100%;color:white;font-weight:bold;font-size:16px;background-color:#006CBA;border:1px solid #004B85;border-radius:4px}
	.has-validation-callback .content-wrapper .result-info-left{float:left}
	.has-validation-callback .content-wrapper .result-info-right{float:right}
	.has-validation-callback .content-wrapper .insert-btn{color:#2F80ED;font-size:14px;line-height:130%}
	
	.has-validation-callback .data-list-wrapper{display:table;width:100%;margin-top:2vw;table-layout:fixed;border-collapse:collapse}
	.has-validation-callback .data-list-wrapper .result-list{float:left;width:calc(100% - 1px);border-right:1px solid #C4C4C4}
	.has-validation-callback .data-list-wrapper .result-list-left{float:left;width:calc(43% - 1px);border-right:1px solid #C4C4C4}
	.has-validation-callback .data-list-wrapper .result-list-right{float:left;width:57%;overflow:auto}
	.has-validation-callback .data-list-wrapper table{width:100%;text-align:center;border-collapse:collapse}
	.has-validation-callback .data-list-wrapper table thead{background-color:#F2F2F2;border-bottom:1px solid #C4C4C4}
	.has-validation-callback .data-list-wrapper .result-list-left table tr th{height:32px;padding:0}
	.has-validation-callback .data-list-wrapper .result-list-right table tr th{height:32px;padding:0 2vw}
	.has-validation-callback .data-list-wrapper table tr td{height:44px;padding:0 2vw}
	.has-validation-callback .data-list-wrapper table tr:nth-child(odd){background-color:#E0E0E0}
	.has-validation-callback .data-list-wrapper table tr:nth-child(even){background-color:#F2F2F2}
	
	.has-validation-callback .data-list-wrapper select{width:22vw;height:8vw;padding:0 2vw;border:1px solid #828282;background:url('/resources/img/ic_select.png') no-repeat;background-size:12px 7px;background-position:right 6px top 50%;background-color:white;-webkit-appearance:none;-moz-appearance:none;}
</style>

<!-- 
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
 -->

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

		 $(".add-row-cert").click(function(){
        	var markup = '<div id="certOrgRow'+tbl_cnt_cert+'">';
        	markup += '<div align="center">';
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
        	markup += '</div>';
        	markup += '<div id="certNameTd'+tbl_cnt_cert+'" align="center">';
        	markup += '<select id="certName'+tbl_cnt_cert+'" name="certName'+tbl_cnt_cert+'" onchange="selectGrade(this, '+tbl_cnt_cert+')" style="width:95%;">';
        	markup += '<option value="상담심리사">상담심리사</option>';
        	markup += '</select>';
        	markup += '</div>';
        	markup += '<div id="certGradeTd'+tbl_cnt_cert+'" align="center">';
        	markup += '<select id="certGrade'+tbl_cnt_cert+'" name="certGrade'+tbl_cnt_cert+'" style="width:95%;">';
        	markup += '<option value="1급">1급</option>';
        	markup += '<option value="2급">2급</option>';
        	markup += '</select>';
        	markup += '</div>';
        	markup += '<div align="center">';
        	markup += '<select id="certYear'+tbl_cnt_cert+'" name="certYear'+tbl_cnt_cert+'" style="width:95%;"></select>';
        	markup += '</div>';
        	markup += '<div>';
        	markup += '<input type="file" name="file_'+tbl_cnt_cert+'" data-validation="required" data-validation-error-msg-required="첨부파일은 필수입니다." style="width:95%;"/>';
        	markup += '</div>';
        	markup += '<div align="center">';
        	markup += '<input type="button" name="certDel" id="certDel'+tbl_cnt+'" onclick="certTblRowDel('+tbl_cnt_cert+');" value="삭제" style="width:95%;"/>';
        	markup += '</div>';
        	markup += '</div>';
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
        	var markup = '<div id="organizationRow'+tbl_cnt+'">';
        	markup += '<div align="center">';
        	markup += '<input type="text" style="width:95%;" id="organizationName'+tbl_cnt+'" name="organizationName" />';
        	markup += '</div>';
        	markup += '<div align="center">';
        	markup += '<input type="text" style="width:95%;" id="role'+tbl_cnt+'" name="role" />';
        	markup += '</div><div align="center">';
        	markup += '<input type="text" name="roleStartDate"  id="roleStartDate'+tbl_cnt+'" class="startDt cal_box" datetimeonly="true" style="width:93px;" />';
        	markup += '~<input type="text" name="roleEndDate"  id="roleEndDate'+tbl_cnt+'" class="endDt cal_box" datetimeonly="true" style="width:93px;" />';
        	markup += '<div align="center">';
        	markup += '<input type="button" name="organizationDel" id="organizationDel'+tbl_cnt+'" onclick="tblRowDel('+tbl_cnt+');" value="삭제" style="width:95%;"/></div>';
        	markup += '</div>';		
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
        	var markup = '<div id="mgrBookRow'+tbl_cnt_book+'">';
        	markup += '<div align="center"><input type="text" style="width:95%;" id="bookTitle'+tbl_cnt_book+'" name="bookTitle"/></div>';
        	markup += '<div align="center"><input type="text" style="width:95%;" id="bookOrg'+tbl_cnt_book+'" name="bookOrg"/></div>';
        	markup += '<div align="center"><input type="text" style="width:95%;" id="author'+tbl_cnt_book+'" name="author"/></div>';
        	markup += '<div align="center"><select id="bookYear'+tbl_cnt_book+'" name="bookYear" style="width:95%;"></select></div>';
        	markup += '<div align="center"><input type="button" name="bookDel" id="bookDel'+tbl_cnt_book+'" onclick="bookTblRowDel('+tbl_cnt_book+');" value="삭제" style="width:95%;"/></div>';
        	markup += '</div>';		
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
						alert("등록가능한 아아디입니다.");
					}
				}
			});
			}
			
		});
		
		
		
		
		//밸리데이션 체크
		$.validate({
			form : '#insertCounselorInfoMgr',
			validateOnBlur : false,
			validateOnAlert : true,
			onSuccess : function(){
				$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
				$('[name=mobileSms]').val($('#mobilesms1').val() + "-" + $('#mobilesms2').val() + "-" + $('#mobilesms3').val());
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
			j$("#insertCounselorInfoMgr").submit();
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
		var fm =  document.insertCounselorInfoMgr;
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
<form name="insertCounselorInfoMgr" id="insertCounselorInfoMgr" action="/partner/mgr/insertCounselorInfoMgr" method="POST" enctype="multipart/form-data">
<input type="hidden" name="num" id="num">
	<div class="content-wrapper flex flexColumn">
		<span class="flex title height-fifteen">상담사 정보관리</span>
		<span class="flex subject height-one-tenth">개인정보</span>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">성명</span>
			<input class="content-input flexGrow" placeholder="한글로 입력하세요"></input>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">아이디</span>
			<input class="content-input flexGrow" placeholder="아이디를 입력하세요"></input>
			<button class="button-blue width-fifteen">중복확인</button>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">비밀번호</span>
			<input type="password" maxlength="12" minlength="6" class="content-input flexGrow" placeholder="영문(대, 소)+숫자 6~12자 이내"></input>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">비밀번호 확인</span>
			<input type="password" maxlength="12" minlength="6" class="content-input flexGrow" placeholder="영문(대, 소)+숫자 6~12자 이내"></input>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">생년월일</span>
			<input type="number" maxlength="6" class="content-input width-one-quarter" placeholder="901234"></input>
			<span class="flex label centerH">-</span>
			<input type="number" maxlength="1" class="content-input width-one-quarter" placeholder="1"></input>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">성별</span>
			<span class="flex centerH label width-one-quarter"><input type="radio" name="gender">남성</span>
			<span class="flex centerH label width-one-quarter"><input type="radio" name="gender">여성</span>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">이메일</span>
			<input type="email" class="content-input flexGrow" placeholder="asdf1234@gmail.com"></input>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">연락처</span>
			<input type="number" class="content-input alignCenter width-one-tenth" placeholder="010"></input>
			<span class="flex label centerH">-</span>
			<input type="number" class="content-input alignCenter width-fifteen" placeholder="1234"></input>
			<span class="flex label centerH">-</span>
			<input type="number" class="content-input alignCenter width-fifteen" placeholder="1234"></input>
		</div>
		<div class="underline flex height-fifteen">
			<span class="flex label centerH width-thirty">SMS인증용<br>연락처</span>
			<input type="number" class="content-input alignCenter width-one-tenth" placeholder="010"></input>
			<span class="flex label centerH">-</span>
			<input type="number" class="content-input alignCenter width-fifteen" placeholder="1234"></input>
			<span class="flex label centerH">-</span>
			<input type="number" class="content-input alignCenter width-fifteen" placeholder="1234"></input>
		</div>
		<div class="underline flex flexColumn">
			<span class="flex centerH label width-thirty height-one-tenth">학위취득사항</span>
			<span class="flex centerH subLabel width-thirty height-one-tenth">학교명</span>
			<span class="flex centerH subLabel width-thirty height-one-tenth">학과(전공)</span>
			<div class="flex selectGroupThird">
				<select class="flexGrow height-one-tenth">
					<option value="1">학사</option>
					<option value="2">석사</option>
					<option value="3">박사</option>
				</select>
				<select class="flexGrow height-one-tenth">
					<option value="1">졸업</option>
					<option value="2">재학</option>
					<option value="3">중퇴</option>
				</select>
				<select class="flexGrow height-one-tenth">
					<option value="2020">2020</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
				</select>
			</div>
			<span class="flex centerH label width-thirty height-one-tenth">학위취득사항</span>
			<span class="flex centerH subLabel width-thirty height-one-tenth">학교명</span>
			<span class="flex centerH subLabel width-thirty height-one-tenth">학과(전공)</span>
			<div class="underline flex selectGroupThird">
				<select class="flexGrow height-one-tenth">
					<option value="1">학사</option>
					<option value="2">석사</option>
					<option value="3">박사</option>
				</select>
				<select class="flexGrow height-one-tenth">
					<option value="1">졸업</option>
					<option value="2">재학</option>
					<option value="3">중퇴</option>
				</select>
				<select class="flexGrow height-one-tenth">
					<option value="2020">2020</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
				</select>
			</div>
			<span class="flex centerH label width-thirty height-one-tenth">학위취득사항</span>
			<span class="flex centerH subLabel width-thirty height-one-tenth">학교명</span>
			<span class="flex centerH subLabel width-thirty height-one-tenth">학과(전공)</span>
			<div class="flex selectGroupThird">
				<select class="flexGrow height-one-tenth">
					<option value="1">학사</option>
					<option value="2">석사</option>
					<option value="3">박사</option>
				</select>
				<select class="flexGrow height-one-tenth">
					<option value="1">졸업</option>
					<option value="2">재학</option>
					<option value="3">중퇴</option>
				</select>
				<select class="flexGrow height-one-tenth">
					<option value="2020">2020</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
				</select>
			</div>
		</div>
		<div class="underline flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH subject flexGrow">주요경력</span>
				<button class="button-blue width-one-tenth">추가</button>
			</div>
			<span class="flex centerH contentLabel width-thirty height-one-tenth">발급기관</span>
			<select class="flexGrow height-one-tenth">
				<option value="1">한국상담심리학회</option>
				<option value="2">한국상담심리학회</option>
				<option value="3">한국상담심리학회</option>
			</select>
			<span class="flex centerH contentLabel width-thirty height-one-tenth">자격명</span>
			<select class="flexGrow height-one-tenth">
				<option value="1">상담심리사</option>
				<option value="2">상담심리사</option>
				<option value="3">상담심리사</option>
			</select>
			<div class="flex selectGroupTwo">
				<select class="flexGrow height-one-tenth">
					<option value="1">1급</option>
					<option value="2">2급</option>
					<option value="3">3급</option>
				</select>
				<select class="flexGrow height-one-tenth">
					<option value="1">2010</option>
					<option value="2">2000</option>
					<option value="3">1990</option>
				</select>
			</div>
		</div>
	</div>
</form>
</body>
</html>
