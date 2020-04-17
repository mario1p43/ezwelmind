<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentYear" value="${now}" pattern="yyyy" />
<html>
<head>
<title>상담사 정보관리 수정</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
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

	#picAdd { width: 1px; height: 1px; visibility: hidden;}
	
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
	#addBtn { margin-top: 1.3889vw; }

</style>

<script type="text/javascript">

	$('.mobile_nav ul li a').eq(2).addClass('active');
	$('.mobile_nav ul li a img').eq(2).attr('src', "${url:resource('/resources/img/re_list_icon_active.png')}");
	
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
	

	$( document ).ready(function() {
		for (i = new Date().getFullYear(); i > 1959; i--){

		    $('.certYear').append($('<option />').val(i).html(i));
		    
		}

		$('.certYear option[value=2010]').attr('selected', 'selected');  
	});
	
	function selectGradeZero(sel, count){
		$('#certGrade'+count).children().remove();
		var markup = '<option value="1급">1급</option>';
		markup += '<option value="2급">2급</option>';
		$('#certGrade'+count).append(markup);
	}
	
	
	function selectCertZero(sel, count){
		$('#certNameTd'+count).children().remove();
		$('#certGradeTd'+count).children().remove();
		if(sel.value === '한국상담심리학회'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="상담심리사">상담심리사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '<option value="2급">2급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '한국임상심리학회'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="임상심리사">임상심리사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '한국상담학회'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="전문상담사">전문상담사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '<option value="2급">2급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '기타한국심리학회'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="중독심리전문가">중독심리전문가</option>';
			markup += '<option value="발달심리사">발달심리사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '보건복지부'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="정신보건임상심리사">정신보건임상심리사</option>';
			markup += '<option value="언어재활사">언어재활사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '<option value="2급">2급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '산업인력공단'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="임상심리사">임상심리사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '<option value="2급">2급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '고용노동부'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="직업상담사">직업상담사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '<option value="2급">2급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '여성가족부'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="청소년상담사">청소년상담사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '<option value="2급">2급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '한국놀이치료학회'){
			var markup = '<select id="certName'+count+'" name="certName" onchange="selectGradeZero(this, '+count+')" style="width:95%;">';
			markup += '<option value="놀이심리상담사">놀이심리상담사</option>';
			markup += '</select>';
			$('#certNameTd'+count).append(markup);
			var markup = '<select id="certGrade'+count+'" name="certGrade" style="width:95%;">';
			markup += '<option value="1급">1급</option>';
			markup += '<option value="2급">2급</option>';
			markup += '</select>';
			$('#certGradeTd'+count).append(markup);
		} else if(sel.value === '기타'){
			$('#certNameTd'+count).append('<input type="text" id="certName'+count+'" name="certName" style="width:95%;">');
			$('#certGradeTd'+count).append('<input type="text" id="certGrade'+count+'" name="certGrade" style="width:95%;">');
		}
		
	}
	
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
			var markup = '<select id="certName'+count+'" name="certName'+count+'" onchange="selectGrade(this, '+count+')" style="width:95%;">';
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
        //사진 추가
		$('#picAdd').on('change', function() {
			$('#picFileName').text(this.files[0].name);
			$('#picDeleteBtn').css('display', 'block');
		});
		//사진 삭제
		$('#picDeleteBtn').on('click', function(e) {
			e.stopImmediatePropagation();
			$('#picAdd').val('');
			$('#picFileName').text('');
			$(this).css('display', 'none');
			$("#delPhoto").val('${mgr.fileNm }');
			return false;
		});

		$('#picAddButton').on('click', function(e) {
			e.preventDefault();
			e.stopImmediatePropagation();
			$('#picAdd').trigger('click');
			return false;
		});
        $("#add-row-cert").click(function(){
        	// var markup = '<tr id="certOrgRow'+tbl_cnt_cert+'">';
        	// markup += '<td align="center">';
        	// markup += '<select id="certOrg'+tbl_cnt_cert+'" name="certOrg'+tbl_cnt_cert+'" onchange="selectCert(this, '+tbl_cnt_cert+')" style="width:95%;">';
        	// markup += '<option value="한국상담심리학회">한국상담심리학회</option>';
        	// markup += '<option value="한국임상심리학회">한국임상심리학회</option>';
        	// markup += '<option value="한국상담학회">한국상담학회</option>';
        	// markup += '<option value="기타한국심리학회">기타한국심리학회</option>';
        	// markup += '<option value="보건복지부">보건복지부</option>';
        	// markup += '<option value="산업인력공단">산업인력공단</option>';
        	// markup += '<option value="고용노동부">고용노동부</option>';
        	// markup += '<option value="여성가족부">여성가족부</option>';
        	// markup += '<option value="한국놀이치료학회">한국놀이치료학회</option>';
        	// markup += '<option value="기타">기타</option>';
        	// markup += '</select>';
        	// markup += '</td>';
        	// markup += '<td id="certNameTd'+tbl_cnt_cert+'" align="center">';
        	// markup += '<select id="certName'+tbl_cnt_cert+'" name="certName'+tbl_cnt_cert+'" onchange="selectGrade(this, '+tbl_cnt_cert+')" style="width:95%;">';
        	// markup += '<option value="상담심리사">상담심리사</option>';
        	// markup += '</select>';
        	// markup += '</td>';
        	// markup += '<td id="certGradeTd'+tbl_cnt_cert+'" align="center">';
        	// markup += '<select id="certGrade'+tbl_cnt_cert+'" name="certGrade'+tbl_cnt_cert+'" style="width:95%;">';
        	// markup += '<option value="1급">1급</option>';
        	// markup += '<option value="2급">2급</option>';
        	// markup += '</select>';
        	// markup += '</td>';
        	// markup += '<td align="center">';
        	// markup += '<select id="certYear'+tbl_cnt_cert+'" name="certYear'+tbl_cnt_cert+'" style="width:95%;"></select>';
        	// markup += '</td>';
        	// markup += '<td>';
        	// markup += '<input type="file" name="file_'+tbl_cnt_cert+'" data-validation="required" data-validation-error-msg-required="첨부파일은 필수입니다." style="width:95%;"/>';
        	// markup += '</td>';
        	// markup += '<td align="center">';
        	// markup += '<input type="button" name="certDel" id="certDel'+tbl_cnt+'" onclick="certTblRowDel('+tbl_cnt_cert+');" value="삭제" style="width:95%;"/>';
        	// markup += '</td>';
			// markup += '</tr>';
			var markupObj = $(
				`<div id="certOrgRow">
					<span class="flex centerH contentLabel width-thirty height-one-tenth">발급기관</span>
					<div class="flex flexGrow">
						<select class="flexGrow height-one-tenth contentLabel" id="certOrg">
							<option value="한국상담심리학회">한국상담심리학회</option>
							<option value="한국임상심리학회">한국임상심리학회</option>
							<option value="한국상담학회">한국상담학회</option>
							<option value="기타한국심리학회">기타한국심리학회</option>
							<option value="보건복지부">보건복지부</option>
							<option value="산업인력공단">산업인력공단</option>
							<option value="고용노동부">고용노동부</option>
							<option value="여성가족부">여성가족부</option>
							<option value="한국놀이치료학회">한국놀이치료학회</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<span class="flex centerH contentLabel width-thirty height-one-tenth">자격명</span>
					<div class="flex flexGrow bottomPadding">
						<select class="flexGrow height-one-tenth contentLabel" id="certName">
							<option value="상담심리사">상담심리사</option>
						</select>	
					</div>
					<div class="flex selectGroupTwo">
						<select class="flexGrow height-one-tenth contentLabel" id="certGrade">
							<option value="1급">1급</option>
							<option value="2급">2급</option>
						</select>
						<select class="flexGrow height-one-tenth contentLabel" id="certYear">
						</select>
					</div>
					<span class="flex centerH subContentLabel width-thirty height-one-tenth">사본첨부</span>
					<div class="flex flexGrow height-one-tenth ">
						<button class="button-blue width-one-fifth textAlignLeft selectFileButton">파일 선택</button>
						<label class="subContentLabel">파일명</label>
						<input style="border:none; width:1px; visibility:hidden;" type="file" name="file" data-validation="required" data-validation-error-msg-required="첨부파일은 필수입니다." value="파일명"/>
					</div>
					<div class="flex flexGrow rightR">
						<input class="button-red width-one-tenth centerH height-one-tenth" type="button" name="organizationDel" id="organizationDel" value="삭제">
					</div>
				</div>`);

			$('#certOrgRow', markupObj).attr('id', 'certOrgRow' + tbl_cnt_cert).attr('name', 'certOrgRow' + tbl_cnt_cert);
			
			$('#certOrg', markupObj).attr('id', 'certOrg' + tbl_cnt_cert).attr('name', 'certOrg' + tbl_cnt_cert);

			$('#certName', markupObj).attr('id', 'certName' + tbl_cnt_cert).attr('name', 'certName' + tbl_cnt_cert);

			$('#certGrade', markupObj).attr('id', 'certGrade' + tbl_cnt_cert).attr('name', 'certGrade' + tbl_cnt_cert);

			$('#certYear', markupObj).attr('id', 'certYear' + tbl_cnt_cert).attr('name', 'certYear' + tbl_cnt_cert);
			

			$('input[type=file]', markupObj).attr('id', 'file_' + tbl_cnt_cert).attr('name', 'file_' + tbl_cnt_cert);	

			$('.selectFileButton', markupObj).on('click', function() {
				$(this).siblings('input').trigger('click');
				return false;
			});

			$('input[type=file]', markupObj).on('change', function() {
				$('label', markupObj).text(this.files[0].name);
			});			
			
			$('#organizationDel', markupObj).on('click', function() {
				markupObj.remove();
			});

        	$("#tbl_organization_body_cert").append(markupObj);
    		
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
		
        $("#add-row").click(function(){
        	tbl_cnt = tbl_cnt+1;
        	// var markup = '<tr id="organizationRow'+tbl_cnt+'">';
        	// markup += '<td align="center">';
        	// markup += '<input type="text" style="width:95%;" id="organizationName'+tbl_cnt+'" name="organizationName" />';
        	// markup += '</td>';
        	// markup += '<td align="center">';
        	// markup += '<input type="text" style="width:95%;" id="role'+tbl_cnt+'" name="role" />';
        	// markup += '</td><td align="center">';
        	// markup += '<input type="text" name="roleStartDate"  id="roleStartDate'+tbl_cnt+'" class="startDt cal_box" datetimeonly="true" style="width:93px;" />';
        	// markup += '~<input type="text" name="roleEndDate"  id="roleEndDate'+tbl_cnt+'" class="endDt cal_box" datetimeonly="true" style="width:93px;" />';
        	// markup += '<td align="center">';
        	// markup += '<input type="button" name="organizationDel" id="organizationDel'+tbl_cnt+'" onclick="tblRowDel('+tbl_cnt+');" value="삭제" style="width:95%;"/></td>';
			// markup += '</tr>';		
			var markup =	$(`<div class="flex flexColumn" id="organizationRow">
							<div class="flex flexGrow">
								<input class="content-input flexGrow height-one-tenth" type="text" id="organizationName" name="organizationName" placeholder="기관명">
							</div>
							<div class="flex flexGrow">
								<input class="content-input flexGrow height-one-tenth" type="text" id="role" name="role" placeholder="직위/역할">
							</div>
							<div class="flex flexGrow">
								<input class="width-fourty height-one-tenth border contentLabel" name="roleStartDate" id="roleStartDate" datetimeonly="true" value="2019.11.12">
								<span class="flex flexGrow contentLabel center">~</span>
								<input class="width-fourty height-one-tenth border contentLabel" name="roleEndDate" id="roleEndDate" datetimeonly="true" value="2019.11.12">
							</div>
							<div class="flex flexGrow rightR">
								<input class="button-red width-one-tenth centerH height-one-tenth" type="button" name="organizationDel" id="organizationDel" value="삭제">
							</div>
						</div>`);
			$('#organizationRow', markup).attr('id', 'organizationRow' + tbl_cnt);
			$('#organizationName', markup).attr('id', 'organizationName' + tbl_cnt);
			$('#role', markup).attr('id', 'role' + tbl_cnt);
			$('#roleStartDate', markup).attr('id', 'roleStartDate' + tbl_cnt);
			$('#roleEndDate', markup).attr('id', 'roleEndDate' + tbl_cnt);
			$('#organizationDel', markup).attr('id', 'organizationDel' + tbl_cnt).on('click', function(){
				markup.remove();
			});
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
        
        $("#add-row-book").click(function(){
        	// var markup = '<tr id="mgrBookRow'+tbl_cnt_book+'">';
        	// markup += '<td align="center"><input type="text" style="width:95%;" id="bookTitle'+tbl_cnt_book+'" name="bookTitle"/></td>';
        	// markup += '<td align="center"><input type="text" style="width:95%;" id="bookOrg'+tbl_cnt_book+'" name="bookOrg"/></td>';
        	// markup += '<td align="center"><input type="text" style="width:95%;" id="author'+tbl_cnt_book+'" name="author"/></td>';
        	// markup += '<td align="center"><select id="bookYear'+tbl_cnt_book+'" name="bookYear" style="width:95%;"></select></td>';
        	// markup += '<td align="center"><input type="button" name="bookDel" id="bookDel'+tbl_cnt_book+'" onclick="bookTblRowDel('+tbl_cnt_book+');" value="삭제" style="width:95%;"/></td>';
			// markup += '</tr>';		
			var markup = $(`
						<div id="mgrBookRow">
							<div class="flex flexGrow">
								<input class="content-input flexGrow height-one-tenth" type="text" id="bookTitle" name="bookTitle" placeholder="논문제목/책제목">
							</div>
							<div class="flex flexGrow">
								<input class="content-input flexGrow height-one-tenth" type="text" id="bookOrg" name="bookOrg" placeholder="게재학술지명/출판사명">
							</div>
							<div class="flex flexGrow">
								<input class="content-input flexGrow height-one-tenth" type="text" id="author" name="author" placeholder="연구자/저사명">
							</div>
							<div class="flex flexGrow bottomPadding">
								<select class="flexGrow height-one-tenth contentLabel" id="bookYear"></select>	
							</div>
							<div class="flex flexGrow rightR">
								<input class="button-red width-one-tenth centerH height-one-tenth" type="button" name="organizationDel" id="organizationDel" value="삭제">
							</div>
						</div>`
					);
			$("#tbl_organization_body_book").append(markup);
			$('#mgrBookRow', markup).attr('id', 'mgrBookRow' + tbl_cnt_book);
			$('#bookTitle', markup).attr('id', 'bookTitle' + tbl_cnt_book).attr('name', 'bookTitle' + tbl_cnt_book);
			$('#bookOrg', markup).attr('id', 'bookOrg' + tbl_cnt_book).attr('name', 'bookOrg' + tbl_cnt_book);
			$('#author', markup).attr('id', 'author' + tbl_cnt_book).attr('name', 'author' + tbl_cnt_book);
			$('#bookYear', markup).attr('id', 'bookYear' + tbl_cnt_book).attr('name', 'bookYear' + tbl_cnt_book);
			$('#organizationDel', markup).attr('id', 'organizationDel' + tbl_cnt_book).on('click', function() {
				markup.remove();
			});
        	
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
			/* if('${mgr.mgrStatus}' == 'Y'){
				alert('승인된 상담사의 상담유형정보는 변경할 수 없습니다.');
				return false;
			} */
			

			
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
			form : '#updateCounselorInfoMgr',
			validateOnBlur : false,
			validateOnAlert : true,
			onSuccess : function(){
				$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
				$('[name=mobileSms]').val($('#mobilesms1').val() + "-" + $('#mobilesms2').val() + "-" + $('#mobilesms3').val()); 
			}
		});

		
		j$('#updateBtn').click(function() {
			if(confirm("승인된 상담사의 상담유형정보는 즉시 변경할 수 없습니다. 수정요청 후 이지웰니스 승인을 받아 최종 수정됩니다.")){
				updateExtraExam();
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
			}
			
			return false;
		});
		
		for (i = new Date().getFullYear(); i > 1959; i--){
		    $('#eduYear').append($('<option />').val(i).html(i));
		    $('#eduYear2').append($('<option />').val(i).html(i));
		    $('#eduYear3').append($('<option />').val(i).html(i));
		}

		$('#eduYear option[value=2010]').attr('selected', 'selected');
		$('#eduYear2 option[value=2010]').attr('selected', 'selected');
		$('#eduYear3 option[value=2010]').attr('selected', 'selected');

		<c:if test='${not empty mgr.eduYear}'>
			$("#eduYear option[value='${mgr.eduYear}']").attr('selected', 'selected');
		</c:if>
		<c:if test='${not empty mgr.eduYear2}'>
			$("#eduYear2 option[value='${mgr.eduYear2}']").attr('selected', 'selected');
		</c:if>
		<c:if test='${not empty mgr.eduYear3}'>
			$("#eduYear3 option[value='${mgr.eduYear3}']").attr('selected', 'selected');
		</c:if>

		<c:if test='${not empty mgr.eduStatus}'>
			$("#eduStatus option[value='${mgr.eduStatus}']").attr('selected', 'selected');
		</c:if>

		<c:if test='${not empty mgr.eduStatus2}'>
			$("#eduStatus2 option[value='${mgr.eduStatus2}']").attr('selected', 'selected');
		</c:if>

		<c:if test='${not empty mgr.eduStatus3}'>
			$("#eduStatus3 option[value='${mgr.eduStatus3}']").attr('selected', 'selected');
		</c:if>

		<c:if test='${not empty mgr.education}'>
			$("#education option[value='${mgr.education}']").attr('selected', 'selected');
		</c:if>

		<c:if test='${not empty mgr.education2}'>
			$("#education2 option[value='${mgr.education2}']").attr('selected', 'selected');
		</c:if>

		<c:if test='${not empty mgr.education3}'>
			$("#education3 option[value='${mgr.education3}']").attr('selected', 'selected');
		</c:if>

		<c:forEach var="list" items="${mgrBook}" varStatus="listCnt">
			$("#bookYear${listCnt.index} option[value='${list.bookYear}']").attr('selected', 'selected');
		</c:forEach>
		
	});
	
	function tblRowDel(rownum){
		$('#organizationRow'+rownum).remove();
	}
	
	function certTblRowDel(rownum){
		$('#certOrgRow'+rownum).remove();
	}
	
	function bookTblRowDel(rownum){
		$('#mgrBookRow'+rownum).remove();
	}
		
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
		var strData = $(`<div id="examSub">
							<div class="flex flexGrow">
								<input class="content-input flexGrow height-one-tenth" type="text" name="extraExamInfo1" placeholder="프로그램명">
							</div>
							<div class="flex flexGrow">
								<input class="content-input flexGrow height-one-tenth" type="text" name="extraExamInfo2" placeholder="대상">
							</div>
							<div class="flex flexGrow">
								<input class="content-input flexGrow height-one-tenth" type="text" name="extraExamInfo3" placeholder="센터 내 시행비용(해석상담 포함가)">
							</div>
							<div class="flex flexGrow rightR">
								<input class="button-red width-one-tenth centerH height-one-tenth" type="button" value="삭제">
							</div>
						</div>`);
		$('.button-red', strData).on('click', function() {
			strData.remove();
		});
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
	
	function deleteRowExam(numExamEtc){
		$("#examSub"+numExamEtc).remove();
	}
	
	
</script>
</head>
<body>
<form id="updateCounselorInfoMgr" name="updateCounselorInfoMgr" action="/partner/mgr/updateCounselorInfoMgrImsi" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="num" id="num">
	<input type="hidden" name="count" id="count">
	<input type="hidden" name="delPhoto" id="delPhoto">
	<input type="hidden" name="ownerYn" id="ownerYn">
	<input type="hidden" name="mgrCertCnt" id="mgrCertCnt" value="${mgrCertCnt}">
	<input type="hidden" name="mgrStatus" id="mgrStatus" value="${mgr.mgrStatus}">
	<input type="hidden" name="centerSeq" value="${mgr.centerSeq}"/>
	<div class="content-wrapper flex flexColumn">
		<span class="flex title height-fifteen">상담사 정보관리</span>
		<span class="flex subject height-one-tenth">개인정보</span>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">성명</span>
			<span class="content-input flexGrow">${mgr.userNm} (${mgr.userId})</span>
			<!-- <input class="content-input flexGrow" readonly type="text" name="userNm" data-validation="required" data-validation-error-msg-required="성명을 확인해주세요." placeholder="한글로 입력하세요"> -->
			<input type="hidden" name="userNm" value="${mgr.userNm}"/>
			<input type="hidden" name="userId" value="${mgr.userId}"/>
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">나이/성별</span>
			<span class="content-input width-one-quarter flex centerH"><span id="age"></span>
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
			<input class="content-input flexGrow" type="text" name="email" style="width:150px;" value="${mgr.email}" data-validation="email" data-validation-error-msg-email="이메일을 확인 해주세요." placeholder="asdf1234@gmail.com">
		</div>
		<div class="underline flex height-one-tenth">
			<span class="flex centerH label width-thirty">연락처</span>
			<input class="content-input alignCenter width-one-tenth" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="3" id="mobile1" value="${mgr.mobile1 }" data-validation="length number" data-validation-length="2-3" data-validation-error-msg="연락처를 확인 해주세요." placeholder="010">
			<span class="flex subLabel centerH hyphen">-</span>
			<input class="content-input alignCenter width-fifteen" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="4" id="mobile2" value="${mgr.mobile2 }" data-validation="length number" data-validation-length="3-4" data-validation-error-msg="연락처를 확인 해주세요." placeholder="1234">
			<span class="flex subLabel centerH hyphen">-</span>
			<input class="content-input alignCenter width-fifteen" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="4" id="mobile3" value="${mgr.mobile3 }" data-validation="length number" data-validation-length="4-4" data-validation-error-msg="연락처를 확인 해주세요." placeholder="1234">
			<input type="hidden" name="mobile">
		</div>
		<div class="underline flex height-fifteen">
			<span class="flex label centerH width-thirty">SMS인증용<br>연락처</span>
			<input class="content-input alignCenter width-one-tenth" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3" id="mobilesms1" value="${mgr.mobilesms1 }" data-validation="length number" data-validation-length="2-3" data-validation-error-msg="연락처를 확인 해주세요." placeholder="010">
			<span class="flex subLabel centerH hyphen">-</span>
			<input class="content-input alignCenter width-fifteen" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" id="mobilesms2" value="${mgr.mobilesms2 }" data-validation="length number" data-validation-length="3-4" data-validation-error-msg="연락처를 확인 해주세요." placeholder="1234">
			<span class="flex subLabel centerH hyphen">-</span>
			<input class="content-input alignCenter width-fifteen" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" id="mobilesms3" value="${mgr.mobilesms3 }" data-validation="length number" data-validation-length="4-4" data-validation-error-msg="연락처를 확인 해주세요." placeholder="1234">
			<input type="hidden" name="mobileSms">
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<span class="flex centerH label width-thirty height-one-tenth">학위취득사항</span>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="university" value="${mgr.university}" placeholder="학교명">
			</div>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="department" value="${mgr.department}" placeholder="학과(전공)">
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
				<input class="content-input flexGrow height-one-tenth" type="text" name="university2" value="${mgr.university2}" placeholder="학교명">
			</div>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="department2" value="${mgr.department2}" placeholder="학과(전공)">
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
				<input class="content-input flexGrow height-one-tenth" type="text" name="university3" value="${mgr.university3}" placeholder="학교명">
			</div>
			<div class="flex flexGrow">
				<input class="content-input flexGrow height-one-tenth" type="text" name="department3" value="${mgr.department3}" placeholder="학과(전공)">
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
		<div class="underline flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH subject flexGrow">주요경력</span>
				<input class="button-blue width-one-tenth centerH" type="button" id="add-row" value="추가">
			</div>
			<div class="flex flexColumn" id="tbl_organization_body">
				<div class="flex flexColumn" id="organizationRow1">
					<div class="flex flexGrow">
						<input class="content-input flexGrow height-one-tenth" type="text" id="organizationName1" name="organizationName" placeholder="기관명">
					</div>
					<div class="flex flexGrow">
						<input class="content-input flexGrow height-one-tenth" type="text" id="role1" name="role" placeholder="직위/역할">
					</div>
					<div class="flex flexGrow">
						<input type="date" class="width-fourty height-one-tenth border contentLabel" name="roleStartDate" id="roleStartDate1" datetimeonly="true" value="2019-11-12">
						<span class="flex flexGrow contentLabel center">~</span>
						<input type="date" class="width-fourty height-one-tenth border contentLabel" name="roleEndDate" id="roleEndDate1" datetimeonly="true" value="2019-11-12">
					</div>
					<div class="flex flexGrow rightR">
						<input class="button-red width-one-tenth centerH height-one-tenth" type="button" name="organizationDel" id="organizationDel1" onclick="tblRowDel(1);" value="삭제">
					</div>
				</div>
			</div>
		</div>
		<div class="underline flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH subject flexGrow">상담관련자격증</span>
				<input class="button-blue width-one-tenth centerH" type="button" id="add-row-cert" value="추가">
			</div>
			<div class="flex flexColumn" id="tbl_organization_body_cert">
				<c:forEach var="list" items="${mgrCert}" varStatus="listCnt">
					<div id="certOrgRow${listCnt.index}">
						<span class="flex centerH contentLabel width-thirty height-one-tenth">발급기관</span>
						<div class="flex flexGrow">
							<select class="flexGrow height-one-tenth contentLabel" name="certOrg" id="certOrg${listCnt.index}">
								<option value="${list.orgNm}">${list.orgNm}</option>
							</select>
						</div>
						<span class="flex centerH contentLabel width-thirty height-one-tenth">자격명</span>
						<div class="flex flexGrow bottomPadding">
							<select class="flexGrow height-one-tenth contentLabel" name="certName" id="certName${listCnt.index}">
								<option value="${list.certNm}">${list.certNm}</option>
							</select>	
						</div>
						<div class="flex selectGroupTwo">
							<select class="flexGrow height-one-tenth contentLabel" id="certGrade${listCnt.index}" name="certGrade">
								<option value="${list.grade}">${list.grade}</option>
							</select>
							<select class="flexGrow height-one-tenth contentLabel" id="certYear${listCnt.index}" name="certYear">
								<option value="${list.certYear}">${list.certYear}</option>
							</select>
						</div>
						<span class="flex centerH subContentLabel width-thirty height-one-tenth">사본첨부</span>
						<div class="flex flexGrow height-one-tenth ">
							<button class="button-blue width-one-fifth textAlignLeft" onclick="fileDownLoad('${list.filePath}', '${list.fileNm}')">다운 로드</button>
							<label class="subContentLabel flexGrow">${list.fileNm}</label>
							<input type="hidden" id="fileName${listCnt.index}" name="fileName" value="${list.fileNm}"/>
							<input type="hidden" id="filePath${listCnt.index}" name="filePath" value="${list.filePath}"/>
							<!-- <input style="width:0;" type="file" name="file_1" data-validation="required" data-validation-error-msg-required="첨부파일은 필수입니다." value="파일명"/> -->
						</div>
						<div class="flex flexGrow rightR">
							<input class="button-red width-one-tenth centerH height-one-tenth" name="certDel" id="certDel${listCnt.index}" type="button" onclick="certTblRowDel(${listCnt.index});" value="삭제">
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
		<div class="underline flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH subject flexGrow">논문 및 저서</span>
				<input class="button-blue width-one-tenth centerH" type="button" id="add-row-book" value="추가">
			</div>
			<div class="flex flexColumn" id="tbl_organization_body_book">
				<c:forEach var="list" items="${mgrBook}" varStatus="listCnt">
					<div class="flex flexColumn" id="mgrBookRow${listCnt.index}">
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="bookTitle${listCnt.index}" name="bookTitle" value="${list.bookTitle}" placeholder="논문제목/책제목">
						</div>
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="bookOrg${listCnt.index}" name="bookOrg" value="${list.bookOrg}" placeholder="게재학술지명/출판사명">
						</div>
						<div class="flex flexGrow">
							<input class="content-input flexGrow height-one-tenth" type="text" id="author${listCnt.index}" name="author" value="${list.author}" placeholder="연구자/저사명">
						</div>
						<div class="flex flexGrow bottomPadding">
							<select class="flexGrow height-one-tenth contentLabel" id="bookYear${listCnt.index}" name="bookYear">
								<c:forEach var="i" begin = "0" end="60" step="1" >
									<option value=<c:out value = "${currentYear-i}"/>><c:out value = "${currentYear-i}"/></option>
								</c:forEach>
							</select>	
						</div>
						<div class="flex flexGrow rightR">
							<input class="button-red width-one-tenth centerH height-one-tenth" type="button" name="bookDel" id="bookDel${listCnt.index}" onclick="bookTblRowDel(${listCnt.index});" value="삭제">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">한줄소개</span>
			</div>
			<input class="content-input flexGrow subContentLabel" type="text" name="memo" value="${mgr.memo}" data-validation="required" data-validation-error-msg-required="한줄소개를 확인 해주세요.">
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">사진</span>
			</div>
			<div class="flex flexGrow height-one-tenth centerH">
				<button class="button-blue width-one-fifth textAlignLeft" id="picAddButton">파일 선택</button>
				<label class="subContentLabel width-one-fifth flexGrow" id="picFileName"><a href="javascript:fileDownLoad('${mgr.filePath}', '${mgr.fileNm}');">${mgr.fileNm }</a></label>
				<input type="file" name="picAdd" id="picAdd" />
				<input style="display:none" class="button-red width-one-tenth centerH height-one-tenth" type="button" id="picDeleteBtn" value="삭제">
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">접속권한</span>
			</div>
			<div class="flex flexGrow">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="radio" name="authCd" value="ROLE_PARTNER_SANGDAM" 
					${mgr.authCd == 'ROLE_PARTNER_SANGDAM'  ? 'checked':''} <c:if test="${mgr.authCd ne 'ROLE_PARTNER_CENTER' }">data-validation="required" data-validation-error-msg-required="접속권한을 확인해주세요." </c:if>>상담</span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="radio" name="authCd" value="ROLE_PARTNER_SEND" ${mgr.authCd == 'ROLE_PARTNER_SEND'  ? 'checked':''}>파견</span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="radio" name="authCd" value="ROLE_PARTNER_GROUP" ${mgr.authCd == 'ROLE_PARTNER_GROUP'  ? 'checked':''}>진단</span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="radio" name="authCd" value="ROLE_PARTNER_TEACHER" ${mgr.authCd == 'ROLE_PARTNER_TEACHER'  ? 'checked':''}>강사</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">근무형태</span>
			</div>
			<div class="flex flexGrow">
				<span class="flex centerH subContentLabel width-thirty"><input type="radio" name="workType" value="S" ${mgr.workType == 'S'  ? 'checked':''}>상주</span>
				<span class="flex centerH subContentLabel width-thirty"><input type="radio" name="workType" value="P" ${mgr.workType == 'P'  ? 'checked':''}>파트타임</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">등록일</span>
			</div>
			<div class="flex flexGrow">
				<span class="content-input flexGrow">${mgr.regDt}</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">정보변경일</span>
			</div>
			<div class="flex flexGrow">
				<span class="content-input flexGrow">${mgr.modiDt}</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">정보변경 ID</span>
			</div>
			<div class="flex flexGrow">
				<span class="content-input flexGrow">${mgr.modiId}</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">대표여부</span>
			</div>
			<div class="flex flexGrow">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" name="centerOwnerYn" id="centerOwnerYn" value="Y" ${mgr.centerOwnerYn == 'Y'  ? 'checked':''} />지정</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding">
			<div class="flex height-one-tenth">
				<span class="flex centerH subject flexGrow">상담유형</span>
			</div>
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">유형선택</span>
			</div>
			<div class="flex flexGrow">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" name="channelType" value="100001" data-validation="checkbox_group" data-validation-qty="min1" data-validation-error-msg="유형을 선택해주세요.">심리</span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" name="channelType" value="100002">법률</span>
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" name="channelType" value="100003">재무</span>
				<span class="flex centerH subContentLabel width-one-quarter"><input type="checkbox" name="channelType" value="100004">심리검사</span>
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
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges" name="mentalAges" value="100447" id="mentalAges">유아동</span>
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges" name="mentalAges" value="100448">아동</span>
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges" name="mentalAges" value="100449">청소년</span>
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges" name="mentalAges" value="100450">성인</span>
					<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalAges" name="mentalAges" value="100451">노년기 성인</span>
				</div>
			</div>
		</div>
		<div class="psyGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담분야</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv" value="100005" id="mentalDiv">개인상담</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv" value="100006">부부/가족상담</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv" value="100007">놀이치료</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv" value="100008">미술치료</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv" value="100009">언어치료</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalDiv" name="mentalDiv" value="100010">특수재활치료</span>
			</div>
			<div class="flex flexGrow height-one-tenth bottomPadding">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" class="mentalDiv" name="mentalDiv" value="100011">기타</span>
				<input class="content-input flexGrow" type="text" name="mentalDivEtc" id="mentalDivEtc" value="${mgr.mentalDivEtc }" placeholder="기타 내용 입력">
			</div>
		</div>
		<div class="psyGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담방법</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType" name="mentalType" value="100433" id="mentalType">대면</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType" name="mentalType" value="100434">전화</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType" name="mentalType" value="100435">게시판</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType" name="mentalType" value="100436">파견</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType" name="mentalType" value="100437">진단</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="mentalType" name="mentalType" value="100438">강의</span>
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
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawDiv" name="lawDiv" value="100012" id="lawDiv">일반법률</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawDiv" name="lawDiv" value="100013">부동산법률</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawDiv" name="lawDiv" value="100014">세무</span>
			</div>
		</div>
		<div class="lawGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담방법</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType" value="100433" id="lawType">대면</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType" value="100434">전화</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType" value="100435">게시판</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType" value="100436">파견</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType" value="100437">진단</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawType" name="lawType" value="100438">강의</span>
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
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeDiv" name="financeDiv" value="100015" id="financeDiv">재무상담</span>
			</div>
		</div>
		<div class="finGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담방법</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType" name="financeType" value="100433" id="financeType">대면</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType" name="financeType" value="100434">전화</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType" name="financeType" value="100435">게시판</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType" name="financeType" value="100436">파견</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType" name="financeType" value="100437">진단</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeType" name="financeType" value="100438">강의</span>
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
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges" name="diagnosisAges" value="100447" id="diagnosisAges">유아동</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges" name="diagnosisAges" value="100448">아동</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges" name="diagnosisAges" value="100449">청소년</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges" name="diagnosisAges" value="100450">성인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisAges" name="diagnosisAges" value="100451">노년기 성인</span>
			</div>
		</div>
		<div class="psyTestGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담분야</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisDiv" name="diagnosisDiv" value="100016" id="diagnosisDiv">종합심리검사</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisDiv" name="diagnosisDiv" value="100017">정서 및 성격검사</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisDiv" name="diagnosisDiv" value="100018">진로 및 적성검사</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisDiv" name="diagnosisDiv" value="100019">신경심리검사</span>
			</div>
			<div class="flex flexGrow height-one-tenth bottomPadding">
				<span class="flex centerH subContentLabel width-one-fifth"><input type="checkbox" class="diagnosisDiv" name="diagnosisDiv" value="100020">기타</span>
				<input class="content-input flexGrow" type="text" name="diagnosisDivEtc" id="diagnosisDivEtc" placeholder="기타 내용 입력">
			</div>
		</div>
		<div class="psyTestGroup underline flex flexColumn" style="display: none;">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담방법</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType" name="diagnosisType" value="100433" id="diagnosisType">대면</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType" name="diagnosisType" value="100434">전화</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType" name="diagnosisType" value="100435">게시판</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType" name="diagnosisType" value="100436">파견</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType" name="diagnosisType" value="100437">진단</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="diagnosisType" name="diagnosisType" value="100438">강의</span>
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
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType" name="languageType" value="101075">영어</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType" name="languageType" value="101076">중국어</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType" name="languageType" value="101077">일본어</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType" name="languageType" value="101078">스페인어</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType" name="languageType" value="101079">프랑스어</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="languageType" name="languageType" value="101080">기타</span>
				
			</div>
			<input class="flex flexGrow content-input height-one-tenth subContentLabel" type="text" name="specialHearing" id="specialHearing" placeholder="기타 언어" value="${mgr.specialHeal }">
		
		</div>
		<div class="capability flex flexColumn bottomMargin">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">특수주제</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101082">성피해상담</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101083">커리어상담</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101084">심리코칭</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101085">트라우마치료</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101086">애도상담</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101087">자살위기상담</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101088">직장내이슈 조사(직장내괴롭힘, 직장내성희롱 등)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101089">내마음보고서 해석상담</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101090">수면상담(CBTI)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="specialType" name="specialType" value="101091">심리적응급처치(위기개입)</span>
			</div>
			</div>
		<div class="flex flexColumn underline">
			<span class="flex subject height-one-tenth centerH">주요주제</span>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">직장관련</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101093">직무소진</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101094">스트레스관리</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101095">직무 무기력</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101096">감정노동스트레스</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101097">조직문화</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101098">직장 내 트라우마</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101099">일가정양립(워킹맘/워킹파)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101100">관계갈등</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101101">업무적응</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101102">직무복귀</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="jobType" name="jobType" value="101103">업무능력향상</span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">개인관련</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101105">자기탐색 및 이해</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101106">자기성장(미래설계, 적성, 진로 등)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101107">슬픔</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101108">분노조절</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101109">우울</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101110">불안</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101111">공황</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101112">무기력</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101113">무망감</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101114">사회기술 부족</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101115">관계갈등</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101116">관계 내 어려움</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101117">중독행동(알코올)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101118">중독행동(도박)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101119">중독행동(인터넷/스마트폰)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101120">충동조절 어려움</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="personalType" name="personalType" value="101121">기타 정신건강의학적 증상(섭식문제, 성격장애 등)</span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">가족관련</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101123">가족이해</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101124">자녀양육</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101125">문제행동</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101126">관계갈등</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101127">가족해체관련(이혼)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101128">애도</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101129">학습심리</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101130">주의력</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101131">학교적응</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101132">행동통제어려움</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101133">반항 및 문제행동</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101134">발달문제(언어)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101135">발달문제(지체 및 자폐)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101136">행동문제</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101137">애착문제</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="familyType" name="familyType" value="101138">학대 등</span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">충격/트라우마</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType" name="traumaType" value="101140">범죄피해자</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType" name="traumaType" value="101141">성피해</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType" name="traumaType" value="101142">사고</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType" name="traumaType" value="101143">파산</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType" name="traumaType" value="101144">사회적 지탄</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType" name="traumaType" value="101145">사망사고</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType" name="traumaType" value="101146">충격사건</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="traumaType" name="traumaType" value="101147">폭력 및 학대</span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">대상별</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType" name="targetType" value="101149" id="mentalType">임원급</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType" name="targetType" value="101150">감정노동자</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType" name="targetType" value="101151">교대근무자</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType" name="targetType" value="101152">신입사원</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="targetType" name="targetType" value="101153">영유아</span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">법률</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType" name="lawCounselType" value="101155" id="mentalType">가정사 –
					이혼, 상속, 유언 등</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType" name="lawCounselType" value="101156">금전거래 – 권리금, 보증금, 떼인돈 등</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType" name="lawCounselType" value="101157">손해배상 – 교통사고, 의료사고,
					때린사건, 맞은사건 등</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType" name="lawCounselType" value="101158">부동산 – 주택임대차, 상가임대차,
					유치권, 명도소송 등</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType" name="lawCounselType" value="101159">빚-채무 – 개인회생, 개인파산</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="lawCounselType" name="lawCounselType" value="101160">기타 – 성추행, 저작권, 노무관련,
					행정처분 등</span>
			</div>
		</div>
		<div class="capability flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">재무</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeCounselType" name="financeCounselType" value="101162" id="mentalType">신입사원 재무설계</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeCounselType" name="financeCounselType" value="101163">신혼부부 재테크</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeCounselType" name="financeCounselType" value="101164">노후자금 마련</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="financeCounselType" name="financeCounselType" value="101165">주택마련</span>
			</div>
		</div>
		<div class="flex flexColumn underline">
			<span class="flex subject height-one-tenth centerH">상담선호</span>
		</div>
		<div class="capability flex flexColumn">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">단회기상담</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType" name="preferredType" value="101167" id="mentalType">단회기상담
					선호여부</span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">선호접근</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType" name="preferredType" value="101168">인지행동접근</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType" name="preferredType" value="101169">정신분적적접근</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType" name="preferredType" value="101170">인본주의적 접근</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType" name="preferredType" value="101171">현상학적접근(게슈탈트)</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="preferredType" name="preferredType" value="">기타(주관식)</span>
			</div>
		</div>
		<div class="capability flex flexColumn underline">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">상담성향</span>
			</div>
			<div class="flex flexWrap">
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101173">공감적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101174">편안한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101175">잘 들어주는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101176">따뜻한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101177">위로가 되는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101178">포근한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101179">온화한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101180">신뢰로운</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101181">안심되는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101182">진정성 있는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101183">진솔한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101184">성의있는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101185">성심을 다하는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101186">진지한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101187">진중한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101188">자상한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101189">배려하는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101190">상냥한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101191">케어해주는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101192">푸근한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101193">눈높이를 맞추는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101194">용기를 주는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101195">응원해주는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101196">희망적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101197">긍정적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101198">즐거운</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101199">친절한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101200">적극적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101201">속시원한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101202">부담없는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101203">명쾌한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101204">솔직한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101205">재밌는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101206">자유로운</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101207">섬세한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101208">구체적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101209">상세히 설명하는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101210">계획적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101211">세밀한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101212">차근차근한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101213">분석적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101214">진단해주는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101215">예리한</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101216">객관적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101217">현실적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101218">전문적인</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101219">숙련된</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101220">깊이 있는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101221">새로운 관점의</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101222">통찰력 있는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101223">맥을 잘 짚는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101224">문제를 잘 파악하는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101225">내가 몰랐던 것을 알게 해주는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101226">방향을 제시하는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101227">조언을 주는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101228">해결책을 제시하는</span>
				<span class="flex centerH subContentLabel"><input type="checkbox" class="tendencyType" name="tendencyType" value="101229">길을 잡아주는</span>
			</div>
		</div>
		<div class="underline flex flexColumn bottomPadding bottomMargin">
			<div class="flex height-one-tenth">
				<span class="flex centerH label flexGrow">주요 강점 및 핵심역량</span>
			</div>
			<input class="content-input flexGrow subContentLabel" type="text" name="coreVal" value="${mgr.coreVal}" placeholder="한줄소개를 입력해주세요.">
		</div>
		<div>
			<div class="flex flexColumn" id="etcExamExtra">
				<div class="flex height-one-tenth">
					<span class="flex centerH subject flexGrow">상담 외 프로그램(집단, 특강 등)</span>
					<input class="button-blue width-one-tenth centerH" type="button" onclick="addRowExam();" value="추가">
				</div>
				<c:forEach var="list" items="${extraExamInfo}" varStatus="listCnt">
					<div class="flex flexGrow centerH">
						<span>프로그램명 : </span><input class="content-input flexGrow height-one-tenth" type="text" name="extraExamInfo1" value="${list.extraNm }" placeholder="프로그램명">
					</div>
					<div class="flex flexGrow centerH">
						<span>대상 : </span><input class="content-input flexGrow height-one-tenth" type="text" name="extraExamInfo2" value="${list.extraTarget }" placeholder="대상">
					</div>
					<div class="flex flexGrow centerH">
						<span>센터 내 시행비용(해석상담 포함가) : </span><input class="content-input flexGrow height-one-tenth" type="text" name="extraExamInfo3" value="${list.extraCost }" placeholder="센터 내 시행비용(해석상담 포함가)">
					</div>
					<c:if test="${mgr.modiYn eq 'Y' }">
						<div class="flex flexGrow rightR">
							<input class="button-red width-one-tenth centerH height-one-tenth" type="button" onclick="delExtraRow('${list.extraIdx }');" value="삭제">
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		
	</div>
	<div class="flex flexGrow">
		<input class="flex flexGrow button-gray center height-one-tenth" type="button" id="updateBtn" value="수정">
	</div>
</form>
</body>
</html>