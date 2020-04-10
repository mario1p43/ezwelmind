<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>개인상담일지 상세</title>

<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.flex{display:flex;display:-webkit-flex;}
	.flexGrow{-webkit-flex-grow:1;flex-grow:1;flex:1 1 0;-webkit-flex:1 1 0;}
	.counsel-wrapper{padding:0 5vw}
	.counsel-wrapper .title-wrapper{display:flow-root;font-weight:bold;font-size:20px}
	.counsel-wrapper .content-wrapper{width:100%;margin-top:3vw;}
	.counsel-wrapper .content-wrapper .subject-block{font-weight:bold;font-size:16px;margin-top:4.5vw}
	.counsel-wrapper .content-wrapper .subject-description{color:#EB5757;font-size:12px}
	.counsel-wrapper .content-wrapper .data-wrapper{display:flow-root;padding:2.5vw 0;font-size:14px}
	.counsel-wrapper .content-wrapper .data-wrapper textarea{width:100%;height:20vw;font-size:14px;border:0;outline:none;resize:none}
	.counsel-wrapper .content-wrapper .input-block.line-bottom input[type=text]{width:100%;float:left;padding:4px 0;font-size:16px;line-height:130%;border:none;outline:none}
	.counsel-wrapper .content-wrapper .data-wrapper textarea::placeholder{color:#A2A2A2}
	.counsel-wrapper .content-wrapper .data-wrapper .label-block{float:left;width:35%;font-weight:bold}
	.counsel-wrapper .content-wrapper .data-wrapper .label-block-line{font-weight:bold}
	.counsel-wrapper .content-wrapper .data-wrapper .label-description{font-size:11px;color:#EB5757}
	.counsel-wrapper .content-wrapper .data-wrapper .data-block{float:left;width:65%;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:1;overflow:hidden;text-overflow:ellipsis}
	.counsel-wrapper .content-wrapper .data-wrapper .data-block.text{display:block;width:100%;margin-top:2.5vw;white-space:normal;word-break:break-all;text-overflow:clip}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-description1{padding:1.3vw 0}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-description2{padding:1.3vw 0 1.3vw 3vw}
	.counsel-wrapper .content-wrapper .data-wrapper .bg-block{display:flow-root;background-color:#F2F2F2}
	.counsel-wrapper .content-wrapper .data-wrapper .bg-block:not(:first-child){margin-top:2.5vw}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-rank-wrapper{padding:2.2vw;text-align:center}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-rank-description{padding:2.2vw}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-dropdown{padding:2.2vw;text-align:center;background:"${url:resource('/resources/img/arrow_bottom.png')}" no-repeat;background-position:right 15px top 50%}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail {display:flow-root}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail .risk-detail-wrapper{display:flex}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail .risk-detail-wrapper:not(:first-child){margin-top:2.2vw}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail .risk-detail-label{position:relative;order:1;width:50%;margin-top:10px;background:#E0E0E0}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail .risk-detail-label:before{border-bottom:10px solid #E0E0E0;border-right:45vw solid transparent;position:absolute;top:-10px;width:0;content:''}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail .risk-detail-label .title{padding:2.2vw;text-align:center}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail .risk-detail-label .description{padding:0 2.2vw 2vw;word-break:break-all}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail .risk-detail-data{position:relative;order:2;width:calc(50% - 4.4vw);padding:2.2vw;margin-top:10px}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail-block{display:flex}
	.counsel-wrapper .content-wrapper .data-wrapper .risk-detail-block .risk-detail-data{padding:2.2vw}
	.counsel-wrapper .content-wrapper .data-wrapper .data-block .counsel-write-description{margin-bottom:2.2vw}
	.counsel-wrapper .content-wrapper .data-wrapper .data-block .counsel-subject-select{display:flow-root;width:100%}
	.counsel-wrapper .content-wrapper .data-wrapper .data-block .counsel-subject-select select{float:left;width:calc(33% - 0.37vw)!important;height:9vw;padding:0 2.5vw;margin-right:1vw;font-size:14px;background:"${url.resource('/resources/img/ic_select.png')}" no-repeat;background-size:12px 7px;background-position:right 6px top 50%;-webkit-appearance:none;-moz-appearance:none;appearance:none;}
	.counsel-wrapper .content-wrapper .data-wrapper .data-block .counsel-subject-select select:last-child{margin-right:0}
	.counsel-wrapper .content-wrapper .data-wrapper .check-data-label{margin-top:2.2vw}
	.counsel-wrapper .content-wrapper .data-wrapper .check-data-block{padding:3vw 0}
	.counsel-wrapper .content-wrapper .data-wrapper .check-data-block label{margin-right:3vw}
	.counsel-wrapper .content-wrapper .data-wrapper .check-data-block .check-data-radio-wrapper{display:flex;display:-webkit-flex;width:100%}
	.counsel-wrapper .content-wrapper .data-wrapper .check-data-block .check-data-radio-wrapper:first-child{margin-bottom:2vw}
	.counsel-wrapper .content-wrapper .data-wrapper .check-data-block .check-data-radio-wrapper .check-data-radio{display:flex;display:-webkit-flex}
	.counsel-wrapper .content-wrapper .data-wrapper .check-data-block .check-data-radio-wrapper .check-data-radio:not(:last-child){-webkit-flex-grow:1;flex-grow:1;flex:1 1 0;-webkit-flex:1 1 0;}
	.counsel-wrapper .content-wrapper .border-bottom{border-bottom:1px solid #BDBDBD}
	
	.counsel-wrapper #sangdamcontents{display:flow-root;width:100%;border-top:1px solid #BDBDBD}
	.bottom-btn-wrapper{margin-top: 30px;}
	.bottom-btn-wrapper .bottom-block-btn{left:0;width:100%;height:40px;color:white;font-weight:bold;font-size:16px;background-color:#006CBA}
	
	
	/* file wrapper */
	.file_wrapper {
		font-size: 3.6111vw;
		display: flex;
	}
	.chooose_file_button {
		font-size: 3.6111vw;
		color: #2F80ED;
		background:white;
		border: none;
		margin-right:2.2222vw;
		padding-left:0;
	}
	.file_chooser_wrapper { 
		display: flex;
		-webkit-flex-grow: 1; 
		flex-grow: 1; 
		flex : 1 1 0; 
		-webkit-flex : 1 1 0;
		padding-bottom:0.8333vw;
	}
	.file_wrapper input[type=file] {
		border: 0;
		width: 0;
	}
</style>

<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
var oEditors = [];

$(document).ready(function(){

	$('.mobile_nav ul li a').eq(2).addClass('active');
	$('.mobile_nav ul li a img').eq(2).attr('src', "${url:resource('/resources/img/re_list_icon_active.png')}");
	
	 if("${isNotSaveSubjectItem}" == "false") {
		 $("#subjectItemCd1").attr("disabled", true);
		 $("#subjectItemCd2").attr("disabled", true);
		 $("#subjectItemCd3").attr("disabled", true);
		 
		 $("#subjectItemCd1").css("background-color", "#bebebe");
		 $("#subjectItemCd2").css("background-color", "#bebebe");
		 $("#subjectItemCd3").css("background-color", "#bebebe");
		 
		 $("#subjectItemCd1").css("width", "");
		 $("#subjectItemCd2").css("width", "");
		 $("#subjectItemCd3").css("width", "");
	 }

	 // 상담주제 활성화를 위한 커맨드 구현
	 var firstLeft = false;
	 
	 $(document).on("keydown", function(event) {
		// 테스트용 <- + P 구현
		if(event.keyCode == 35) {
			firstLeft = true;
		}
		
		if(firstLeft) {
			if(event.keyCode == 80) {
				 $("#subjectItemCd1").attr("disabled", false);
				 $("#subjectItemCd2").attr("disabled", false);
				 $("#subjectItemCd3").attr("disabled", false);
				 
				 $("#subjectItemCd1").css("background-color", "");
				 $("#subjectItemCd2").css("background-color", "");
				 $("#subjectItemCd3").css("background-color", "");
			}
		}
	 });
	

	//완료_종결상태인 경우
	var status = $("#recordStatus").val();

	$("#counselDtlInsert").validate({
		onkeyup:false,
		onclick:false,
		onfocusout:false,
		showErrors:function(errorMap, errorList){
			if (this.numberOfInvalids()) {
				alert(errorList[0].message);
			}
		},
		rules : {
			subject  : {required:true},
			mainIssue : {required:true},
			feedback : {required:true},
			risks : {required:true},
			riskReason : {required:true}
		},
		messages: {
			subject  		: "상담의 주제(회기 주제)를 입력하세요",
			mainIssue 		: "상담의 주제(회기 내 내담자의 주호소 문제 주제)를 입력하세요",
			feedback 		: "상담 과정(내담자 주요 반응)을 입력하세요",
			risks 			: "사례 위험도를 선택하세요",
			riskReason 		: "사례 위험도 선택/변경 이유를 입력하세요"
		},
		submitHandler: function(form) {
			var recordStatusYn = $("#recordStatusYn").val(); //첫 회기이면서, 종결되지 않은 일지
			var recordStatus = $("#recordStatus").val(); //상담일지상태
			var insertGb = $("#insertGb").val(); //임시저장:T 종결:Y N/S처리:N
			var counselType = $("#counselType").val(); //상담방법

			var contCnt = 0;
			var feedback = $.trim($("#feedback").val());

			var subject = $.trim($("#subject").val());
			var mainIssue = $.trim($("#mainIssue").val());
			var riskReason = $.trim($("#riskReason"));
			var riskChk = "";

			var clientCd = $.trim($("#clientCd").val());
			var counselChannelType = $.trim($("#counselChannelType").val());

			
			if(recordStatusYn == "Y"){
				var finalGoal = $.trim($("#finalGoal")); //최종목표
				var courseGoal = $.trim($("#courseGoal")); //과정목표
				var counselPlan = $.trim($("#counselPlan")); //상담계획

				if(finalGoal.length == 0){
					alert("최종목표를 입력하세요");
					return false;
				}
				if(courseGoal.length == 0){
					alert("과정목표를 입력하세요");
					return false;
				}
				if(counselPlan.length == 0){
					alert("상담계획을 입력하세요");
					return false;
				}
			
			}
			
			if("${isNotSaveSubjectItem}" == "true") {
				var subjectItemCd1 = $.trim($("#subjectItemCd1").val()); //상담 세부 분류
				var subjectItemCd2 = $.trim($("#subjectItemCd2").val()); //상담 세부 분류
				
					
				if(subjectItemCd1 == "") {
					alert("상담 주제 분류를 선택하세요.");
					$("#subjectItemCd1").focus();
					return false;
				}
				
				if(subjectItemCd2 == "") {
					alert("상담 주제 분류를 선택하세요.");
					$("#subjectItemCd2").focus();
					return false;
				}
			}
			if(mainIssue.length == 0){
				alert("상담의 주제(회기 내 내담자의 주호소 문제 주제)를 입력하세요");
				return false;
			}
			$("input:checkbox:checked").each(function(){
				riskChk = $(this).val();
			});

			if(riskChk.length == 0){
				alert("사례 위험도를 선택하세요");
				return false;
			}
			if(riskReason.length == 0){
				alert("사례 위험도 선택/변경 이유를 입력하세요");
				return false;
			}

			//20150915_리스트에서 넘겨준 상태값 확인필요_소명/NS처리
			if(recordStatus == '100694' && $.trim($("#callingIssue")).length == 0){
				alert("소명 사유를 입력하세요");
				return false;
			}

			if($("#file").val().length > 0){
				$("#fileUpYn").val("Y");
			}

			var time = $("#time1").val()+$("#time2").val();

			if(counselType == '100434'){ //전화상담인 경우, 시간세팅
				$("#time").val(time);
			}

			if(insertGb == "Y"){ //종결하기
				$("#recordStatus").val("100692");

			}else if(insertGb == "N"){ //N/S처리
				$("#recordStatus").val("100696");
			}
			
			if( counselChannelType == '100002' ){
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
				// 저장작업 후에 값을 가져온다 
				var counselFeedBack = $.trim($("#counselFeedBack").val());
			}

			
			if(counselChannelType == '100002' && counselFeedBack.length <= 50){
				alert("상담사가 내담자에게 전하는 메시지를 입력하세요.(최소 50자 이상)\n해당 내용은 내담자에게 SMS, e-mail이 전송되며 상담포유를 통해 확인 가능합니다.");
				$("#counselFeedBack").focus();
				return false;
			}
			
			// 선택은 불가능하나 데이터는 송신해야함.
			 $("#subjectItemCd1").attr("disabled", false);
			 $("#subjectItemCd2").attr("disabled", false);
			 $("#subjectItemCd3").attr("disabled", false);
			
			form.submit();
		}
	});


	//임시저장 버튼 클릭
	$("#tempSave").click(function(){
		if (confirm("저장 하시겠습니까?")) {
			$("#counselStatus").val("100521"); //임시저장도 상담은 완료
			$("#counselDtlInsert").submit();
		}
		return false;
	});
	
	
	//수정하기 버튼 클릭
	$("#modefySave").click(function(){
		if (confirm("수정 하시겠습니까?")) {
			$("#counselStatus").val("${baseInfo_detail.status}"); // 완료되었을때 수정가능 (상담상태는 그대로, 내용만 수정)
			$("#counselDtlInsert").submit();
		}
		return false;
	});
	
	// 연장하기 버튼 클릭
	$("#insertBtn").click(function(){		
		var recordStatus = $("#recordStatus").val();
		
		if( recordStatus == '100692' || recordStatus == '100696' ){
			if (confirm("상담 일지를 저장 하시겠습니까?")) {
				$("#counselStatus").val("${baseInfo_detail.status}"); // 완료되었을때 수정가능 (상담상태는 그대로, 내용만 수정)		
				if(scheduleDtOverdue == "Y"){
					$("input.endResonTypeClass").removeAttr("disabled","disabled");
					$("#noAgree").attr('checked', true);
				}		
				$("#counselDtlInsert").submit();
			}
		}else{
			endCounsel();
		}
		
	});
	
	$('input[name="endType"]').click(function(){
		var status = j$("input[name='endType']:checked").val();
		if(status == 'ns'){
			$("#sangdamcontents").css("display","none");
		} else if(status == 'ex'){
			$("#sangdamcontents").css("display","");
			$("#endLine1").css("display","none");
			$("#endLine2").css("display","none");
			$("#endLine3").css("display","none");
		} else{
			$("#sangdamcontents").css("display","");
			$("#endLine1").css("display","");
			$("#endLine3").css("display","");

			if($("#etc")[0] != undefined && $("#etc")[0] != null){
				var endResonTypeValue = $("#etc")[0].checked;
			}
			if(endResonTypeValue){
				$("#endLine2").css("display","");
			}else{
				$("#endLine2").css("display","none");
			}
		}
	});
	
	$('input[name="endReasonType"]').click(function(){
		if(scheduleDtOverdue == "Y"){
			$("#noAgree").attr('checked', true);
		}
		var endResonTypeValue = $("#etc")[0].checked;
		if(endResonTypeValue){
			$("#endLine2").css("display","");
		}else{
			$("#endLine2").css("display","none");
		}
	});
	
	var scheduleDtOverdue = "${baseInfo_detail.scheduleDtOverdue}";
	if(scheduleDtOverdue == "Y"){
		$("input.endResonTypeClass").attr("disabled",true);
		$("#noAgree").attr('checked', true);
	}
	
	var recordStatus = "${record_detail.endType}";
	if(recordStatus == 'ex'){
		$("#sangdamcontents").css("display","");
		$("#endLine1").css("display","none");
		$("#endLine2").css("display","none");
		$("#endLine3").css("display","none");
	} else if(recordStatus == 'end'){
		$("#sangdamcontents").css("display","");
		$("#endLine1").css("display","");
		var endReasonType = "${record_detail.endReasonType}";
		j$("#"+endReasonType).attr('checked', true);
		if(endReasonType == 'etc'){
			$("#endLine2").css("display","");
		} else{
			$("#endLine2").css("display","none");
		}
	} else {
		$("#sangdamcontents").css("display","none");
	}

	var q1 = "${record_detail.q1}";
	if(q1 == 'a' || q1 == 'b'){
		j$("#q1"+q1).attr('checked', true);
	}
	var q2 = "${record_detail.q2}";
	if(q2 == 'a' || q2 == 'b'){
		j$("#q2"+q2).attr('checked', true)
	}
	var q3 = "${record_detail.q3}";
	if(q3 == 'a' || q3 == 'b'){
		j$("#q3"+q3).attr('checked', true);
	}
	var q4 = "${record_detail.q4}";
	if(q4 == 'a' || q4 == 'b'){
		j$("#q4"+q4).attr('checked', true);
	}
	var q5 = "${record_detail.q5}";
	if(q5 == 'a' || q5 == 'b'){
		j$("#q5"+q5).attr('checked', true);
	}
	var q6 = "${record_detail.q6}";
	if(q6 == 'a' || q6 == 'b'){
		j$("#q6"+q6).attr('checked', true);
	}
	var limitedNumber = new RegExp('^[0-5]');
	var q7 = "${record_detail.q7}";
	if(limitedNumber.test(q7)){
		j$("#q7"+q7).attr('checked', true);
	}else{
		j$("#q73").attr('checked', true);
	}
	var q8 = "${record_detail.q8}";
	if(limitedNumber.test(q8)){
		j$("#q8"+q8).attr('checked', true);
	}else{
		j$("#q83").attr('checked', true);
	}
	var q9 = "${record_detail.q9}";
	if(limitedNumber.test(q9)){
		j$("#q9"+q9).attr('checked', true);
	}else{
		j$("#q93").attr('checked', true);
	}
	var q10 = "${record_detail.q10}";
	if(limitedNumber.test(q10)){
		j$("#q10"+q10).attr('checked', true);
	}else{
		j$("#q103").attr('checked', true);
	}

	var limitedNumberSecond = new RegExp('^[0-9]|10');
	var q11 = "${record_detail.q11}";
	if(limitedNumberSecond.test(q11)){
		j$("#q11"+q11).attr('checked', true);
	}else{
		j$("#q115").attr('checked', true);
	}
	var q12 = "${record_detail.q12}";
	if(limitedNumberSecond.test(q12)){
		j$("#q12"+q12).attr('checked', true);
	}else{
		j$("#q125").attr('checked', true);
	}
	var q13 = "${record_detail.q13}";
	if(limitedNumberSecond.test(q13)){
		j$("#q13"+q13).attr('checked', true);
	}else{
		j$("#q135").attr('checked', true);
	}
	var q14 = "${record_detail.q14}";
	if(limitedNumberSecond.test(q14)){
		j$("#q14"+q14).attr('checked', true);
	}else{
		j$("#q145").attr('checked', true);
	}

	j$('.chooose_file_button').on('click', function() {
		j$(this).siblings('input[type=file]').trigger('click');
		return false;
	});

	j$('.file_chooser_wrapper input').on('change', function() {
		j$(this).siblings('a').text(this.files[0].name);
	});

	j$('.risk-dropdown').click(function() {
		$(this).next().slideToggle();
	})
});

//위험도 체크박스 선택
function riskCheck(riskVal) {
	 var obj = document.getElementsByName("risks");

	for(var i=0; i<obj.length; i++){
    	if(obj[i] != riskVal){
        	riskVal.checked = true; //선택한 위험도 체크
        	obj[i].checked = false; //기존 위험도 체크해제
    	}
	}
	if(riskVal.value == '4'){
		alert("고위험군 사례관리 프로세스에 따라, 이지웰니스 사례관리자가 연락드릴 예정입니다. 상담내용을 상세히 작성해주십시오.");
	}
	if(riskVal.value == '5'){
		alert("상담일지 저장 시, 사례관리를 위하여 이지웰니스 담당자에 문자 알람이 즉시 발송됩니다.");
	}
}

j$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "counselFeedBack",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
  		 },
	    fCreator: "createSEditor2"
	});
});


	function endCounsel() {
		var endType = $(":input:radio[name=endType]:checked").val();
		
		if( endType == 'undefined' || endType == '' ){
			alert( "상담일지 등록 타입을 선택해주세요." );
			return;
		}else{
			if(endType == "ex"){
				// 연장하기 100692
				$.alert('해당 상담을 다음 회기로 연장하시겠습니까?',function(){

					$("#insertGb").val("Y"); //임시저장:T 종결, 연장:Y N/S처리:N
					$("#extensionStatus").val("100931"); //연장일때 연장승인, 
					$("#counselStatus").val("100521"); //연장일때 상담완료
					var scheduleDtOverdue = "${baseInfo_detail.scheduleDtOverdue}";
					if(scheduleDtOverdue == "Y"){
						$("input.endResonTypeClass").removeAttr("disabled","disabled");
						$("#noAgree").attr('checked', true);
					}		
					$("#counselDtlInsert").submit();

					 },function(){
					 	return;
					 }
		     	);
				return;
				
			}else if(endType == "ns"){
				// N/S처리 100696
				var counselType = $("#counselType").val();
				$("#counselStatus").val("100521"); // 상담완료

				//게시판인 경우, N/S처리 못함.
				if(counselType == '100433' || counselType == '100434'){ //전화나 대면인 경우 N/S처리 가능
					$.alert('해당 상담을 No Show처리 하시겠습니까?',function(){

						$("#insertGb").val("N"); //임시저장:T 종결:Y N/S처리:N
						var scheduleDtOverdue = "${baseInfo_detail.scheduleDtOverdue}";
						if(scheduleDtOverdue == "Y"){
							$("input.endResonTypeClass").removeAttr("disabled","disabled");
							$("#noAgree").attr('checked', true);
						}		
						$("#counselDtlInsert").submit();

						 },function(){
						 	return;
						 }
			     	);
				}else{
					alert("N/S처리 할 수 없습니다.");
				}
				return;				
				
			}else if(endType == "end"){
				// 종결하기 100692
				$.alert('해당 상담(케이스)을 종결 하시겠습니까?',function(){

					$("#insertGb").val("Y"); //임시저장:T 종결:Y N/S처리:N
					$("#counselStatus").val("100884"); //종결일때 상담종결
					var scheduleDtOverdue = "${baseInfo_detail.scheduleDtOverdue}";
					if(scheduleDtOverdue == "Y"){
						$("input.endResonTypeClass").removeAttr("disabled","disabled");
						$("#noAgree").attr('checked', true);
					}		
					$("#counselDtlInsert").submit();

					 },function(){
					 	return;
					 }
		     	);
				return;
				
			}else{
				alert("상담일지 등록 타입을 확인해주세요.");
			}
		}
	 }
	
	function subjectItem1CdChange(){
		$("select[name='subjectItemCd2'] option").remove();   
		$("select[name='subjectItemCd3'] option").remove();
		$("[name='subjectItemCd2']").append("<option value=''>==== 중주제 ====</option>");
		$("[name='subjectItemCd3']").append("<option value=''>==== 소주제 ====</option>");
		var name 	= "subjectItemCd1";
		var setName = "subjectItemCd2";
		var cnt = getCommClientCdList(name, setName);
	}

	function subjectItem2CdChange(){
		j$("select[name='subjectItemCd3'] option").remove();
		j$("[name='subjectItemCd3']").append("<option value=''>==== 소주제 ====</option>");
		var name 	= "subjectItemCd2";
		var setName = "subjectItemCd3";
		var cnt = getCommClientCdList(name, setName);
	}

	function getCommClientCdList(name, setName) {
		var result = 0;
		if ($("[name='"+name+"']").val() != "" && $("[name='"+name+"']").val() != null) {
			$.ajax({
				url: "/partner/pCounselorMgr/getCommClientList?highCommCd=" + $("[name='"+name+"']").val() + "&clientCd=${record_detail.clientCd }",
				dataType: 'json',
				async: false,
				success: function (response) {
					var iter = response.list;
					var element = "";
					result = iter.length;
					for (var i = 0; i < iter.length; i++) {
						element += "<option value='" + iter[i].commCd + "'>" + iter[i].commNm + "</option>";
					}
					if (element != "") {
						$("[name='"+setName+"']").append(element);
					}
				}
			});
		}
		
		return result;
	}
	
	function riskHide(){
		j$('#contentLine1').css("display","none");
		j$('#contentLine2').css("display","none");
		j$('#contentLine3').css("display","none");
	}
	
	function riskOpen(){
		j$('#contentLine1').css("display","");
		j$('#contentLine2').css("display","");
		j$('#contentLine3').css("display","");
	}
	
	function riskOpenHide(){
		var status = j$('#contentLine1').css("display");
		if(status == "none"){
			riskOpen();
			j$('#riskOpenHideButton').html(" ▲ ");
		}else{
			riskHide();
			j$('#riskOpenHideButton').html(" ▼ ");
		}
	}
</script>
</head>
<body>
<form id="counselDtlInsert" name="counselDtlInsert" action="/partner/pCounselorMgr/pCounselorDtlInsert" method="POST" enctype="multipart/form-data">
	<input type="hidden" id="counselCd" name="counselCd" value="${param.counselCd }" />
	<input type="hidden" id="recordCd" name="recordCd" value="${record_detail.recordCd }" />
	<input type="hidden" id="intakeCd" name="intakeCd" value="${record_detail.intakeCd }" />
	<input type="hidden" id="clientCd" name="clientCd" value="${record_detail.clientCd }" />
	<input type="hidden" id="centerSeq" name="centerSeq" value="${record_detail.centerSeq }" />
	<input type="hidden" id="userKey" name="userKey" value="${record_detail.userKey }" />
	<input type="hidden" id="recordStatusYn" name="recordStatusYn" value="${record_detail.recordStatusYn }" />
	<input type="hidden" id="recordStatus" name="recordStatus" value="${record_detail.recordStatus }" />
	<input type="hidden" id="counselorId" name="counselorId" value="${record_detail.counselorId }" />
	<input type="hidden" id="counselType" name="counselType" value="${record_detail.counselType }" />
	<input type="hidden" id="extensionStatus" name="extensionStatus" value="" /> <!-- 상담 연장여부 -->
	<input type="hidden" id="counselStatus" name="counselStatus" value="" /> <!-- 상담 상태 -->
	<input type="hidden" id="time" name="time" value="" />
	<input type="hidden" id="insertGb" name="insertGb" value="" />
	<input type="hidden" id="fileUpYn" name="fileUpYn" value="N" />
	<input type="hidden" id="counselChannelType" value="${intake_detail.channelType}" />
	
	<c:set var="birthYear" scope="page" value="${fn:split(intake_detail.rrn, '-')[0] }" />
	<c:set var="birthMonth" scope="page" value="${fn:split(intake_detail.rrn, '-')[1] }" />
	<c:set var="birthDay" scope="page" value="${fn:split(intake_detail.rrn, '-')[2] }" /> 
	<c:set var="scheduleYear" scope="page" value="${fn:split(baseInfo_detail.scheduleDt, '-')[0] }" />
	<c:set var="scheduleMonth" scope="page" value="${fn:split(baseInfo_detail.scheduleDt, '-')[1] }" />
	<c:set var="scheduleDay" scope="page" value="${fn:split(baseInfo_detail.scheduleDt, '-')[2] }" /> 
	<c:set var="ageOfUser" scope="page" value="${scheduleYear - birthYear }" />
	<c:if test="${birthMonth * 100 + birthDay > scheduleMonth * 100 + scheduleDay }">
		<c:set var="ageOfUser" scope="page" value="${ageOfUser - 1 }" />
	</c:if> 
	
	<c:choose>
		<c:when test="${ageOfUser < 13 }"> <%-- 만 13세 미만, 유아 --%>
			<c:set var="groupOfUserAges" scope="page" value="102003" />
		</c:when>
		<c:when test="${ageOfUser < 20 }"> <%-- 13~20세, 청소년 --%>
			<c:set var="groupOfUserAges" scope="page" value="102002" />
		</c:when>
		<c:otherwise> <%-- 둘 다 아닐경우 성인으로 간주함 --%>
			<c:set var="groupOfUserAges" scope="page" value="102001" />
		</c:otherwise>
	</c:choose>

	<div class="counsel-wrapper">
		<div class="title-wrapper">개인상담일지</div>
		<!-- 
		<div class="content-wrapper">
			<div class="subject-block">인테이크</div>
		</div>
		<div class="content-wrapper">
			<div class="data-wrapper border-bottom">
				<div class="label-block">상담 받을 분</div>
				<div class="data-block">
					<input type="hidden" name="education" value="${intake_detail.relation }"/>
					<comm:commNmOut option="commCd" code="${intake_detail.relation } "/>
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">생년월일</div>
				<div class="data-block">
					<input type="hidden" name="rrn" value="${intake_detail.rrn }"/>
					${intake_detail.rrn }
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">성별</div>
				<div class="data-block">
					<input type="hidden" name="gender" value="${intake_detail.gender }"/>
					${intake_detail.gender }
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">성명</div>
				<div class="data-block">
					<input type="hidden" name="userNm" value="${baseInfo_detail.counselNm}"/>
					${empty baseInfo_detail.counselNm ? '-' : baseInfo_detail.counselNm}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">학력/학년</div>
				<div class="data-block">
					<input type="hidden" name="education" value="${intake_detail.education }"/>
					<comm:commNmOut option="commCd" code="${intake_detail.education } "/>
					<c:if test="${not empty intake_detail.session }">
						/
						<input type="hidden" name="session" value="${intake_detail.session }"/>
						<comm:commNmOut option="commCd" code="${intake_detail.session } "/>
					</c:if>
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">직업</div>
				<div class="data-block">
					<input type="hidden" name="job" value="${intake_detail.job }"/>
					<c:if test="${not empty intake_detail.job }">
						<comm:commNmOut option="commCd" code="${intake_detail.job }"/>
					</c:if>
					<c:if test="${empty intake_detail.job }">-</c:if>
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">이메일</div>
				<div class="data-block">
					<input type="hidden" name="email" value="${intake_detail.email }"/>
					${intake_detail.email }
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">연락처</div>
				<div class="data-block">
					<input type="hidden" name="mobile" value="${intake_detail.mobile }"/>
					${intake_detail.mobile }
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">상담분야</div>
				<div class="data-block">
					<input type="hidden" name="counselDiv" value="${intake_detail.counselDiv }"/>
					${intake_detail.counselDivNm }
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">상담 세부주제</div>
				<div class="data-block">
					<input type="hidden" name="cause" value="${intake_detail.cause }"/>
					${intake_detail.cause }
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">자유 기술</div>
				<div class="data-block text">
					<input type="hidden" name="memo" value="${intake_detail.memo }"/>
					${empty intake_detail.memo ? '-' : intake_detail.memo}
				</div>
			</div>
		</div>
		 -->
		
		<div class="content-wrapper">
			<div class="subject-block">기본정보</div>
		</div>
		<div class="content-wrapper">
			<div class="data-wrapper border-bottom">
				<div class="label-block">상담일자</div>
				<div class="data-block">
					<input type="hidden" name="ymdSelect" value="${baseInfo_detail.scheduleDt}"/>
					${baseInfo_detail.scheduleDt}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">전화상담시간</div>
				<div class="data-block">
					<input type="hidden" name="timeSelect" value="${baseInfo_detail.time}"/>
					<c:if test="${not empty baseInfo_detail.time }">
						${baseInfo_detail.time.substring(0,2)}:${baseInfo_detail.time.substring(2,4)}
					</c:if>
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">일지 작성일자</div>
				<div class="data-block">
					<input type="hidden" name="regDtSelect" value="${baseInfo_detail.regDt}"/>
					${baseInfo_detail.regDt}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">내담자명</div>
				<div class="data-block">
					<input type="hidden" name="counselNmSelect" value="${baseInfo_detail.counselNm}"/>
					${baseInfo_detail.counselNm}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">신청코드</div>
				<div class="data-block">
					<input type="hidden" name="counselCdSelect" value="${baseInfo_detail.counselCd}"/>
					${baseInfo_detail.counselCd}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">상담사명</div>
				<div class="data-block">
					<input type="hidden" name="counselorNmSelect" value="${baseInfo_detail.counselorNm}"/>
					${baseInfo_detail.counselorNm}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">고객명</div>
				<div class="data-block">
					<input type="hidden" name="userNmSelect" value="${baseInfo_detail.userNm}"/>
					${baseInfo_detail.userNm}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">직원과의 관계</div>
				<div class="data-block">
					<input type="hidden" name="relation" value="${baseInfo_detail.relation}"/>
					<comm:commNmOut option="commCd" code="${baseInfo_detail.relation}"/>
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">고객사</div>
				<div class="data-block">
					<input type="hidden" name="clientNm" value="${baseInfo_detail.clientCd}"/>
					${baseInfo_detail.clientCd}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">연락처</div>
				<div class="data-block">
					<input type="hidden" name="mobile" value="${baseInfo_detail.mobile}"/>
					${baseInfo_detail.mobile}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">사례위험도</div>
				<div class="data-block">
					<input type="hidden" name="risksSelect" value="${baseInfo_detail.risks}"/>
					${baseInfo_detail.risks}
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block">회기정보</div>
				<div class="data-block">
					<input type="hidden" name="intakeNumSelect" value="${baseInfo_detail.extensionNum }"/>
					${baseInfo_detail.extensionNum }
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="subject-block">사례위험도</div>
		</div>
		<div class="content-wrapper">
			<div class="data-wrapper border-bottom">
				<div class="label-block-line">사례위험도 평가방법은 파트너어드민 웹사이트를 참고해주세요. </div>
			</div>
			<!-- 
			<div class="data-wrapper border-bottom">
				<div class="label-block-line">[사례위험도 평가방법]</div>
				<div class="risk-description1">1. 다축적 평가개념으로, 내담자의 개인적 측면, 조직/업무적 측면, 정신건강의학적 측면에 대하여 아래의 내용을 참고하여 평가합니다.</div>
				<div class="risk-description1">2. 여러 단계에 <span style="font-weight:bold">중복 해당하는 경우 상위 단계</span>로 평가합니다.</div>
				<div class="risk-description1">3. 판단기준에 <span style="font-weight:bold">영역별 1개라도 해당될 경우, 가장 높은 단계</span>로 평가합니다.</div>
				<div class="risk-description1">4. 내담자가 <span style="font-weight:bold">다음의 직업군에 해당될 경우</span>, <u>위험도 판단을 더욱 엄격하게 적용</u>하여 주십시오.</div>
				<div class="risk-description2">1) 타인의 생명 및 안전에 직접적인 영향을 미칠 수 있는 물품을 다루거나 소지하는 직업 : 경찰, 군인 등</div>
				<div class="risk-description2">2) 업무수행 중 안전에 주의해야하는 직업군 : 운송업, 소방관 등</div>
				<div class="risk-description2">3) 타인의 건강 및 위생에 직접적인 영향을 미칠 수 있는 물품을 다루는 직업 : 식품관련, 위생관련 등</div>
				<div class="risk-description2">4) 트라우마 경험에 노출되기 쉬운 직업 : 경찰, 군인, 소방관, 경호업체 등</div>
				<div class="risk-description2">5) 고객접점의 업무수행 직업 : 콜센터, 승무원, 민원창구 등</div>
			</div>
			 -->
			<div class="data-wrapper">
				<div class="bg-block">
					<div class="risk-rank-wrapper">
						<div class="checkbox-wrapper">
							<input type="checkbox" name="risks" id="risks1" onclick="riskCheck(this)" value="1" <c:if test="${record_detail.risks == 1}">checked</c:if>>
							<label for="risks1"></label>
						</div>
						<span>1단계</span>
						<span style="color:BLUE">'안전'</span>
					</div>
					<div class="risk-rank-description">흥미와 자기성장을 위한 서비스 이용. 고민에 대한 조언 수준</div>
					<div class="risk-dropdown">사례위험도 평정 방법 상세보기</div>
					<div class="risk-detail" style="display:none">
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">개인적 측면</div>
								<div class="description">1) 주호소(상담을 받고자 하는 이유, 보호자 보고문제의 내용</div>
								<div class="description">2) 심리적 자원의 유무, 환경적 지지자원의 유무</div>
							</div>
							<div class="risk-detail-data">흥미로 인한 서비스 신청, 자기 자신에 대한 이해 및 탐색 목적, 고민에 대한 조언 요구</div>
						</div>
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">조직/업무적 측면</div>
								<div class="description">1) 직원의 심리적 상태가 업무의 질과 지속에 미치는 부정적인 영향</div>
								<div class="description">2) 직원의 심리적 문제로 인하여 조직에 미치는 혹은 미칠 것으로 예상되는 부정적인 영향</div>
								<div class="description">(ex. 집중력 저하, 주의력 저하, 관계 회피, 이직, 사직, Presenteenism, 직원에 대한 폭언, 지속적인 지각 등)</div>
							</div>
							<div class="risk-detail-data"></div>
						</div>
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">정신건강의학적 측면</div>
								<div class="description">1) 정신건강의학 관련 진료 및 약물치료 경험</div>
								<div class="description">2) 알코올, 약물 및 도박 등 중독관련 문제</div>
								<div class="description">3) 심리적 외상경험과 관련된 문제</div>
								<div class="description">4) 정신과적 관점에서 임상적 소견의 유무</div>
							</div>
							<div class="risk-detail-data"></div>
						</div>
					</div>
				</div>
				<div class="bg-block">
					<div class="risk-rank-wrapper">
						<div class="checkbox-wrapper">
							<input type="checkbox" name="risks" id="risks2" onclick="riskCheck(this)" value="2" <c:if test="${record_detail.risks == 2}">checked</c:if>>
							<label for="risks2"></label>
						</div>
						<span>2단계</span>
						<span style="color:GREEN">'관심'</span>
					</div>
					<div class="risk-rank-description">삶에 영향을 주는 어려움이 있음.<br>그 수준이 3단계에 비해 약하거나 심리사회적 자원이 충분함.</div>
					<div class="risk-dropdown">사례위험도 평정 방법 상세보기</div>
					<div class="risk-detail" style="display:none">
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">개인적 측면</div>
								<div class="description">1) 주호소(상담을 받고자 하는 이유, 보호자 보고문제의 내용</div>
								<div class="description">2) 심리적 자원의 유무, 환경적 지지자원의 유무</div>
							</div>
							<div class="risk-detail-data">개인의 삶에 영향을 주는 정도의 문제 경험</div>
						</div>
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">조직/업무적 측면</div>
								<div class="description">1) 직원의 심리적 상태가 업무의 질과 지속에 미치는 부정적인 영향</div>
								<div class="description">2) 직원의 심리적 문제로 인하여 조직에 미치는 혹은 미칠 것으로 예상되는 부정적인 영향</div>
								<div class="description">(ex. 집중력 저하, 주의력 저하, 관계 회피, 이직, 사직, Presenteenism, 직원에 대한 폭언, 지속적인 지각 등)</div>
							</div>
							<div class="risk-detail-data">업무의 질 및 지속에 영향을 주는 경우(ex. 주의력 저하 등)</div>
						</div>
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">정신건강의학적 측면</div>
								<div class="description">1) 정신건강의학 관련 진료 및 약물치료 경험</div>
								<div class="description">2) 알코올, 약물 및 도박 등 중독관련 문제</div>
								<div class="description">3) 심리적 외상경험과 관련된 문제</div>
								<div class="description">4) 정신과적 관점에서 임상적 소견의 유무</div>
							</div>
							<div class="risk-detail-data"></div>
						</div>
					</div>
				</div>
				<div class="bg-block">
					<div class="risk-rank-wrapper">
						<div class="checkbox-wrapper">
							<input type="checkbox" name="risks" id="risks3" onclick="riskCheck(this)" value="3" <c:if test="${record_detail.risks == 3}">checked</c:if>>
							<label for="risks3"></label>
						</div>
						<span>3단계</span>
						<span style="color:ORANGE">'주의'</span>
					</div>
					<div class="risk-rank-description">삶에 영향을 주는 어려움이 상당한 수준이나, 자살사고 및 자살시도의 위험성은 낮음.</div>
					<div class="risk-dropdown">사례위험도 평정 방법 상세보기</div>
					<div class="risk-detail" style="display:none">
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">개인적 측면</div>
								<div class="description">1) 주호소(상담을 받고자 하는 이유, 보호자 보고문제의 내용</div>
								<div class="description">2) 심리적 자원의 유무, 환경적 지지자원의 유무</div>
							</div>
							<div class="risk-detail-data">개인의 삶에 영향을 주는 정도이며, 그 강도가 2단계보다 강함</div>
						</div>
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">조직/업무적 측면</div>
								<div class="description">1) 직원의 심리적 상태가 업무의 질과 지속에 미치는 부정적인 영향</div>
								<div class="description">2) 직원의 심리적 문제로 인하여 조직에 미치는 혹은 미칠 것으로 예상되는 부정적인 영향</div>
								<div class="description">(ex. 집중력 저하, 주의력 저하, 관계 회피, 이직, 사직, Presenteenism, 직원에 대한 폭언, 지속적인 지각 등)</div>
							</div>
							<div class="risk-detail-data">직원의 심리적 상태가 업무의 질이나 지속에 영향을 주는 것이 분명한 경우 (ex. 심리적 문제로 인한 연차사용, 지속적 지각)</div>
						</div>
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">정신건강의학적 측면</div>
								<div class="description">1) 정신건강의학 관련 진료 및 약물치료 경험</div>
								<div class="description">2) 알코올, 약물 및 도박 등 중독관련 문제</div>
								<div class="description">3) 심리적 외상경험과 관련된 문제</div>
								<div class="description">4) 정신과적 관점에서 임상적 소견의 유무</div>
							</div>
							<div class="risk-detail-data">
								최근 <strong>3년 이내</strong>에 정신의학관련 진료 및 약물치료 경험이 있는 경우(전문가 판단 하에 단계조정 가능)<br><br>
								알코올 약물 및 도박 등에 대한 의수준의 문제<br><br>
								심리적 외상경험 혹은 정신과적 증상들로 인하여 심리적 어려움이 초래되는 경우
							</div>
						</div>
					</div>
				</div>
				<div class="bg-block">
					<div class="risk-rank-wrapper">
						<div class="checkbox-wrapper">
							<input type="checkbox" name="risks" id="risks4" onclick="riskCheck(this)" value="4" <c:if test="${record_detail.risks == 4}">checked</c:if>>
							<label for="risks4"></label>
						</div>
						<span>4단계</span>
						<span style="color:RED">'위험'</span>
					</div>
					<div class="risk-rank-description">* 고위험군<br>고통감이 매우 크며, 생명영위와 관련하여 위험성 있음.</div>
					<div class="risk-dropdown">사례위험도 평정 방법 상세보기</div>
					<div class="risk-detail" style="display:none">
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">개인적 측면</div>
								<div class="description">1) 주호소(상담을 받고자 하는 이유, 보호자 보고문제의 내용</div>
								<div class="description">2) 심리적 자원의 유무, 환경적 지지자원의 유무</div>
							</div>
							<div class="risk-detail-data">심리상태가 불안정하며 내담자의 안위 및 생명영위와 관련하여 위험하다고 판단될 때</div>
						</div>
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">조직/업무적 측면</div>
								<div class="description">1) 직원의 심리적 상태가 업무의 질과 지속에 미치는 부정적인 영향</div>
								<div class="description">2) 직원의 심리적 문제로 인하여 조직에 미치는 혹은 미칠 것으로 예상되는 부정적인 영향</div>
								<div class="description">(ex. 집중력 저하, 주의력 저하, 관계 회피, 이직, 사직, Presenteenism, 직원에 대한 폭언, 지속적인 지각 등)</div>
							</div>
							<div class="risk-detail-data">직원의 심리적 상태가 조직에 미치는/미칠 것으로 예상되는 부정적인 영향이 분명한 경우(ex. 이직, presenteeism, 폭력행동)</div>
						</div>
						<div class="risk-detail-wrapper">
							<div class="risk-detail-label">
								<div class="title">정신건강의학적 측면</div>
								<div class="description">1) 정신건강의학 관련 진료 및 약물치료 경험</div>
								<div class="description">2) 알코올, 약물 및 도박 등 중독관련 문제</div>
								<div class="description">3) 심리적 외상경험과 관련된 문제</div>
								<div class="description">4) 정신과적 관점에서 임상적 소견의 유무</div>
							</div>
							<div class="risk-detail-data">
								최근 <span style="font-weight:bold">6개월 이내</span>에 정신의학관련 진료 및 약물치료 경험이 있는 경우(전문가 판단 하에 단계조정 가능)<br><br>
								알코올 약물 및 도박 등에 대한 의수준의 문제<br><br>
								심리적 외상경험 혹은 정신과적 증상들로 인하여 심리상태가 불안정하고, 내담자의 안위와 관련하여 위험하다고 판단될 경우
							</div>
						</div>
					</div>
				</div>
				<div class="bg-block">
					<div class="risk-rank-wrapper">
						<div class="checkbox-wrapper">
							<input type="checkbox" name="risks" id="risks5" onclick="riskCheck(this)" value="5" <c:if test="${record_detail.risks == 5}">checked</c:if>>
							<label for="risks5"></label>
						</div>
						<span>5단계</span>
						<span style="color:GREEN">'보호'</span>
					</div>
					<div class="risk-rank-description">* 고위험군<br>자타해의 위험성이 높고 극단적인 선택에 임박했다고 판단됨.</div>
					<div class="risk-dropdown">사례위험도 평정 방법 상세보기</div>
					<div class="risk-detail-block" style="display:none">
						<div class="risk-detail-data">가까운 시일 내에 자신 혹은 타인의 생명이나 안전을 위협하는 행동을 실제 시행할 가능성이 높다고 판단될 때</div>
					</div>
				</div>
			</div>
			<div class="data-wrapper border-bottom">
				<div class="label-block-line">사례위험도 선택/변경 이유</div>
				<div class="data-block text">
					<textarea name="riskReason" id="riskReason">${record_detail.riskReason }</textarea>
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="data-wrapper">
				<div class="label-block-line">상담진행상태 및 다음회기계획</div>
				<c:if test="${record_detail.counselType ne '100435'}">
					<div class="data-block text">
	   					<input type='radio'  name="endType" id="ex" value='ex' <c:if test="${record_detail.endType eq 'ex'}">checked</c:if>><label for="ex">진행완료 : 다음 회기 진행 예정</label>
	   				</div>
	    		</c:if>
				<c:if test="${ record_detail.counselType eq '100433' or record_detail.counselType eq '100434' }">
	   				<div class="data-block text">
	   					<input type="radio" name="endType" id="ns" value="ns" <c:if test="${record_detail.endType eq 'ns'}">checked</c:if>><label for="ns">N/S : No Show</label>
					</div>
	    		</c:if>
   				<div class="data-block text">
	   				<input type="radio" name="endType" id="end" value="end" <c:if test="${record_detail.endType eq 'end'}">checked</c:if>><label for="end">종결 : 진행 및 케이스 종결</label>
				</div>
			</div>
		</div>
		<div id="sangdamcontents">
		
			<div class="content-wrapper">
				<div class="subject-block">상담의 목표 및 계획</div>
				<div class="subject-description">* 1회기 작성내용 그대로 이후 회기에 자동으로 작성됩니다.</div>
			</div>
			<div class="content-wrapper">
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">전체 상담의 목표</div>
					<div class="data-block text">
						<textarea id="finalGoal" name="finalGoal" value="${record_detail.finalGoal}">${record_detail.finalGoal}</textarea>
					</div>
				</div>
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">전체 상담 계획</div>
					<div class="label-description">주어진 회기의 초기-중기-후기 주요 계획</div>
					<div class="data-block text">
						<textarea id="counselPlan" name="counselPlan" value="${record_detail.counselPlan}">${record_detail.counselPlan}</textarea>
					</div>
				</div>
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">주호소 문제</div>
					<div class="label-description">되도록 내담자의 언어 그대로 적어주세요.</div>
					<div class="data-block text">
						<textarea name="mainIssue" id="mainIssue" value="${record_detail.mainIssue}">${record_detail.mainIssue}</textarea>
					</div>
				</div>
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">상담주제 분류</div>
					<div class="data-block text">
				
<!-- 						<div class="counsel-write-description">&lt;상담주제 작성법&gt;</div>
						<div class="counsel-write-description">1. 상담의 첫 회기에만 입력이 가능합니다.</div>
						<div class="counsel-write-description">2. 대분류 &gt; 중분류 &gt; 소분류 순으로 입력해주세요.</div>
						<div class="counsel-write-description">3. "내담자"를 기준으로 작성해주세요.<br><span style="font-size:11px;line-height:0">Ex. 내담자 아동의 부모와의 갈등인 경우<br>(아동의) 가족 관련 주제 &gt; 가족관계 어려움 &gt; 부모자녀 관계갈등</span></div>
						<div class="counsel-write-description">4. 1회기 진행 후, 내담자의 주호소문제를 바탕으로 대표적인 심리주제를 설정해주세요.</div>
						<div class="counsel-write-description">5. 일부 고객사는 분류가 다를 수 있습니다.<br><span style="font-size:11px;line-height:0">Ex. 대법원은 소분류가 없습니다.</span></div>
					 -->
						<div class="counsel-subject-select">
							<commClient:select name="subjectItemCd1" id="subjectItemCd1" clientCd="${record_detail.clientCd }" code="${groupOfUserAges }" onchange="subjectItem1CdChange();" selectValue="${record_detail.subjectItemCd1 }" basicValue="대주제" />
							<commClient:select name="subjectItemCd2" id="subjectItemCd2" clientCd="${record_detail.clientCd }" code="${record_detail.subjectItemCd1 }" onchange="subjectItem2CdChange();" selectValue="${record_detail.subjectItemCd2 }" basicValue="중주제" />
							<commClient:select name="subjectItemCd3" id="subjectItemCd3" clientCd="${record_detail.clientCd }" code="${record_detail.subjectItemCd2 }" selectValue="${record_detail.subjectItemCd3 }" basicValue="소주제" />
						</div>
					</div>
				</div>
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">Safety Checklist</div>
					<div class="check-data-label">1. 3개월 내 자타해 사고 여부</div>
					<div class="check-data-block">
						<input type="radio" id="q1a" name="q1" value="a">
						<label for="q1a">예</label>
						<input type="radio" id="q1b" name="q1" value="b" checked>
						<label for="q1b">아니오</label>
					</div>
					<div class="check-data-label">2. 과거 자살 시도 여부</div>
					<div class="check-data-block">
						<input type="radio" id="q2a" name="q2" value="a">
						<label for="q2a">예</label>
						<input type="radio" id="q2b" name="q2" value="b" checked>
						<label for="q2b">아니오</label>
					</div>
					<div class="check-data-label">3. 중독행동/물질남용 여부</div>
					<div class="check-data-block">
						<input type="radio" id="q3a" name="q3" value="a">
						<label for="q3a">예</label>
						<input type="radio" id="q3b" name="q3" value="b" checked>
						<label for="q3b">아니오</label>
					</div>
					<div class="check-data-label">4. 폭력노출여부(가정폭력, 직장내폭력, 학교폭력 등)</div>
					<div class="check-data-block">
						<input type="radio" id="q4a" name="q4" value="a">
						<label for="q4a">예</label>
						<input type="radio" id="q4b" name="q4" value="b" checked>
						<label for="q4b">아니오</label>
					</div>
					<div class="check-data-label">5. 최근 3개월 내 트라우마 경험여부</div>
					<div class="check-data-block">
						<input type="radio" id="q5a" name="q5" value="a">
						<label for="q5a">예</label>
						<input type="radio" id="q5b" name="q5" value="b" checked>
						<label for="q5b">아니오</label>
					</div>
					<div class="check-data-label">6. 정신의학과적 증상경험 여부</div>
					<div class="check-data-block">
						<input type="radio" id="q6a" name="q6" value="a">
						<label for="q6a">예</label>
						<input type="radio" id="q6b" name="q6" value="b" checked>
						<label for="q6b">아니오</label>
					</div>
					<div class="check-data-label">7. 심리적 지지자원 및 강점 정도</div>
					<div class="check-data-label">1) 환경적</div>
					<div class="check-data-block">
						<c:forEach var="i" varStatus="status" begin="0" end="5">
							<input type="radio" id="q7${i}" name="q7" value="${i}">
							<label for="q7${i}" style="margin-right:3vw">${i}</label>
						</c:forEach>
					</div>
					<div class="check-data-label">2) 경제적</div>
					<div class="check-data-block">
						<c:forEach var="i" varStatus="status" begin="0" end="5">
							<input type="radio" id="q8${i}" name="q8" value="${i}">
							<label for="q8${i}" style="margin-right:3vw">${i}</label>
						</c:forEach>
					</div>
					<div class="check-data-label">3) 관계적</div>
					<div class="check-data-block">
						<c:forEach var="i" varStatus="status" begin="0" end="5">
							<input type="radio" id="q9${i}" name="q9" value="${i}">
							<label for="q9${i}" style="margin-right:3vw">${i}</label>
						</c:forEach>
					</div>
					<div class="check-data-label">4) 인지적</div>
					<div class="check-data-block">
						<c:forEach var="i" varStatus="status" begin="0" end="5">
							<input type="radio" id="q10${i}" name="q10" value="${i}">
							<label for="q10${i}" style="margin-right:3vw">${i}</label>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="content-wrapper">
				<div class="subject-block">상담일지</div>
			</div>
			<div class="content-wrapper">
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">상담내용 / 주요개입 내용</div>
					<!-- <div class="data-block text">
						<div class="counsel-write-description">[다음 사항을 고려하여 작성해주십시오]</div>
						<div class="counsel-write-description"><strong>History</strong> : 내담자의 문제와 관련된 발달/역사적 배경, 문제의 기원, 과거 문제력 및 당시 환경 상황</div>
						<div class="counsel-write-description"><strong>내적 요인</strong> : 자아개념, 통찰내용과 수준, 인지적 스타일 및 특징, 정서적 스타일 및 특징, 신체/생리/행동적 특징</div>
						<div class="counsel-write-description"><strong>상황적 요인</strong> : 문제와 관련된 현재 생활 여건, 문제를 지속시키는 상황적 요인</div>
						<div class="counsel-write-description"><strong>대인관계 양상</strong> : 대인관계 양상, 문제영역</div>
						<div class="counsel-write-description"><strong>자원 및 취약점</strong> : 긍정적 상황과 경험 및 강점, 대처 전략, 부정적 상황과 약점</div>
						<div class="counsel-write-description"><strong>종합적 이해</strong> : 핵심 문제에 대한 이론적 설명, 내담자와 관련된 요인들에 대한 종합적 이해 및 평가</div>
					</div> -->
					<div class="data-block text">
						<c:forEach var="recordTxt" items="${record_txt}" varStatus="status">
						<c:if test="${recordTxt.recordType == '100644'}">
							<input type="hidden" id="recordType${recordTxt.contNum }" name="recordType${recordTxt.contNum }" value="${recordTxt.recordType }" />
							<textarea id="content${recordTxt.contNum}" name="content${recordTxt.contNum}" value="${recordTxt.content}" placeholder="상담내용">${recordTxt.content}</textarea>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">상담사 소견</div>
					<div class="data-block text">
						<c:forEach var="recordTxt" items="${record_txt}" varStatus="status">
						<c:if test="${recordTxt.recordType == '100642'}">
							<input type="hidden" id="recordType${recordTxt.contNum }" name="recordType${recordTxt.contNum }" value="${recordTxt.recordType }" />
							<textarea id="content${recordTxt.contNum}" name="content${recordTxt.contNum}" value="${recordTxt.content}">${recordTxt.content}</textarea>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<c:if test="${intake_detail.channelType ne '100002'}">
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">이후 계획/기타 특이사항</div>
					<div class="data-block text">
						<c:forEach var="recordTxt" items="${record_txt}" varStatus="status">
						<c:if test="${recordTxt.recordType == '100643'}">
							<input type="hidden" id="recordType${recordTxt.contNum }" name="recordType${recordTxt.contNum }" value="${recordTxt.recordType }" />
							<textarea id="content${recordTxt.contNum}" name="content${recordTxt.contNum}" value="${recordTxt.content}">${recordTxt.content}</textarea>
						</c:if>
						</c:forEach>
					</div>
				</div>
				</c:if>
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">ORS(효과성척도)</div>
					<div class="data-block text">오늘 포함하여 지난 일주일동안 아래의 항목에 대하여 내담자의 삶이 얼마나 안정적이라고 혹은 편안하게 느꼈습니까?</div>
				</div>
				<div class="data-wrapper border-bottom">
					<div class="check-data-label">1. 개인적(Individually): 개인적 웰빙, 기분이나 마음상태</div>
					<div class="check-data-block">
						<div class="check-data-radio-wrapper">
							<c:forEach var="i" varStatus="status" begin="0" end="4">
							<div class="check-data-radio">
								<input type="radio" id="q11${i}" name="q11" value="${i}">
								<label for="q11${i}">${i}</label>
							</div>
							</c:forEach>
						</div>
						<div class="check-data-radio-wrapper">
							<c:forEach var="i" varStatus="status" begin="5" end="9">
							<div class="check-data-radio">
								<input type="radio" id="q11${i}" name="q11" value="${i}">
								<label for="q11${i}">${i}</label>
							</div>
							</c:forEach>
						</div>
					</div>
					<div class="check-data-label">2. 대인관계(Interpersonally): 가족관계, 가까운 관계</div>
					<div class="check-data-block">
						<div class="check-data-radio-wrapper">
							<c:forEach var="i" varStatus="status" begin="0" end="4">
							<div class="check-data-radio">
								<input type="radio" id="q12${i}" name="q12" value="${i}">
								<label for="q12${i}">${i}</label>
							</div>
							</c:forEach>
						</div>
						<div class="check-data-radio-wrapper">
							<c:forEach var="i" varStatus="status" begin="5" end="9">
							<div class="check-data-radio">
								<input type="radio" id="q12${i}" name="q12" value="${i}">
								<label for="q12${i}">${i}</label>
							</div>
							</c:forEach>
						</div>
					</div>
					<div class="check-data-label">3. 사회생활(Socially): 직장생활, 학교생활, 친구관계</div>
					<div class="check-data-block">
						<div class="check-data-radio-wrapper">
							<c:forEach var="i" varStatus="status" begin="0" end="4">
							<div class="check-data-radio">
								<input type="radio" id="q13${i}" name="q13" value="${i}">
								<label for="q13${i}">${i}</label>
							</div>
							</c:forEach>
						</div>
						<div class="check-data-radio-wrapper">
							<c:forEach var="i" varStatus="status" begin="5" end="9">
							<div class="check-data-radio">
								<input type="radio" id="q13${i}" name="q13" value="${i}">
								<label for="q13${i}">${i}</label>
							</div>
							</c:forEach>
						</div>
					</div>
					<div class="check-data-label">4. 전반적인 주관적 안녕감(Overall)</div>
					<div class="check-data-block">
						<div class="check-data-radio-wrapper">
							<c:forEach var="i" varStatus="status" begin="0" end="4">
							<div class="check-data-radio">
								<input type="radio" id="q14${i}" name="q14" value="${i}">
								<label for="q14${i}">${i}</label>
							</div>
							</c:forEach>
						</div>
						<div class="check-data-radio-wrapper">
							<c:forEach var="i" varStatus="status" begin="5" end="9">
							<div class="check-data-radio">
								<input type="radio" id="q14${i}" name="q14" value="${i}">
								<label for="q14${i}">${i}</label>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="data-wrapper border-bottom">
					<div class="label-block-line">파일첨부</div>
					<div class="data-block text">
						<div class="file_wrapper">
							<div class="file_chooser_wrapper">
								<button class="chooose_file_button">파일 선택</button>
								<input type="file" name="file" id="file" />
								<a href="#" onclick="fileDownLoad('${record_detail.filePath}', '${record_detail.fileNm}')">${record_detail.fileNm}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</div>
	<div class="bottom-btn-wrapper">
		<input type="submit" class="bottom-block-btn" value="저장하기">
	</div>
<%-- <table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">

	<!-- 	일지 등록 -->
	<tr id="sangdamcontents" style="display:none">
		<td valign="top" align="left">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">

				<tr>
					<td>ㆍ상담일지</td>
				</tr>
				<tr>
					<td>
					<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
						<tr>
							<td>
								<table width="100%" border="0">
									<tr>
										<td colspan="11">1. 개인적(Individually): 개인적 웰빙, 기분이나 마음상태</td>
									</tr>
									<tr>
										<td colspan="6" align="left">← 매우 편안하지 않다</td>
										<td colspan="5" align="right">매우 편안하다 →</td>
									</tr>
									<tr>
										<c:forEach var="i" varStatus="status" begin="0" end="10">
											<td align="center">${i}</td>
										</c:forEach>
									</tr>
									<tr>
										<c:forEach var="i" varStatus="status" begin="0" end="10">
											<td align="center"><input type="radio" id="q11${i}" name="q11" value="${i}"></td>
										</c:forEach>
									</tr>
									<tr>
										<td height="20px"></td>
									</tr>
									<tr>
										<td colspan="11">2. 대인관계(Interpersonally): 가족관계, 가까운 관계</td>
									</tr>
									<tr>
										<td colspan="6" align="left">← 매우 편안하지 않다</td>
										<td colspan="5" align="right">매우 편안하다 →</td>
									</tr>
									<tr>
										<c:forEach var="i" varStatus="status" begin="0" end="10">
											<td align="center">${i}</td>
										</c:forEach>
									</tr>
									<tr>
										<c:forEach var="i" varStatus="status" begin="0" end="10">
											<td align="center"><input type="radio" id="q12${i}" name="q12" value="${i}"></td>
										</c:forEach>
									</tr>
									<tr>
										<td height="20px"></td>
									</tr>
									<tr>
										<td colspan="11">3. 사회생활(Socially): 직장생활, 학교생활, 친구관계, 종교생활 등</td>
									</tr>
									<tr>
										<td colspan="6" align="left">← 매우 편안하지 않다</td>
										<td colspan="5" align="right">매우 편안하다 →</td>
									</tr>
									<tr>
										<c:forEach var="i" varStatus="status" begin="0" end="10">
											<td align="center">${i}</td>
										</c:forEach>
									</tr>
									<tr>
										<c:forEach var="i" varStatus="status" begin="0" end="10">
											<td align="center"><input type="radio" id="q13${i}" name="q13" value="${i}"></td>
										</c:forEach>
									</tr>
									<tr>
										<td height="20px"></td>
									</tr>
									<tr>
										<td colspan="11">4. 전반적인 주관적 안녕감(Overall)</td>
									</tr>
									<tr>
										<td colspan="6" align="left">← 매우 편안하지 않다</td>
										<td colspan="5" align="right">매우 편안하다 →</td>
									</tr>
									<tr>
										<c:forEach var="i" varStatus="status" begin="0" end="10">
											<td align="center">${i}</td>
										</c:forEach>
									</tr>
									<tr>
										<c:forEach var="i" varStatus="status" begin="0" end="10">
											<td align="center"><input type="radio" id="q14${i}" name="q14" value="${i}"></td>
										</c:forEach>
									</tr>
								</table>
							</td>
						</tr>
						<!-- 전화,법 상담 인 경우에만 노출 -->
						<c:if test="${record_detail.counselType eq '100434' or record_detail.counselType eq '100002' }">
							<tr>
								<th>상담시간</th>
								<td>
									<select name="time1" id="time1">
										<c:forEach var="time1" begin="00" end="05">
											<option value="0${time1}" <c:if test="${time1 == record_detail.time.substring(0,2)}">selected="selected"</c:if> >0${time1}</option>
										</c:forEach>
									</select> 시간
									<select name="time2" id="time2">
										<option value="00" <c:if test="${record_detail.time.substring(2,4) eq 00}">selected="selected"</c:if> >00</option>
										<option value="10" <c:if test="${record_detail.time.substring(2,4) eq 10}">selected="selected"</c:if> >10</option>
										<option value="20" <c:if test="${record_detail.time.substring(2,4) eq 20}">selected="selected"</c:if> >20</option>
										<option value="30" <c:if test="${record_detail.time.substring(2,4) eq 30}">selected="selected"</c:if> >30</option>
										<option value="40" <c:if test="${record_detail.time.substring(2,4) eq 40}">selected="selected"</c:if> >40</option>
										<option value="50" <c:if test="${record_detail.time.substring(2,4) eq 50}">selected="selected"</c:if> >50</option>
									</select> 분
								</td>
							</tr>
						</c:if>
						
						<!-- 법률 상담 인 경우에만 노출 -->
						<c:if test="${intake_detail.channelType eq '100002'}">
							<tr>
								<th rowspan="2">상담사가 내담자에게<br>전하는 메시지</th>
								<th>
									<span style="color:BLUE">작성한 내용은 저장 즉시 내담자에게 바로 전달되어,<br>'내담자페이지'나 SMS 및 이메일을 통해 열람 및 출력할 수 있습니다.<br>※ '종결하기'일 경우에만 발송됩니다.<br><br></span>
									발송을 원하지 않으면 체크를 해지해주세요.<br> 
									<label for="checkSms"> SMS <input type="checkbox" name="checkSms" id="checkSms" value="Y" checked="checked"/></label> 
									<label for="checkEmail"> e-mail <input type="checkbox" name="checkEmail" id="checkEmail" value="Y" checked="checked"/></label>
								</th>
							</tr>
							<tr>
								<td>
	            					<textarea rows="10" cols="30" id="counselFeedBack" name="counselFeedBack" style="width:100%; height:150px;">${counsel_feedback.content }</textarea>
								</td>
							</tr>
						</c:if>
						<tr>
							<th>파일첨부</th>
							<td colspan="7" >
				    			<input type="file" name="file" id="file" />&nbsp;<a href="#" onclick="fileDownLoad('${record_detail.filePath}', '${record_detail.fileNm}')">${record_detail.fileNm}</a>
		    				</td>
						</tr>

						<c:if test="${record_detail.recordStatus == 100694}">
			 				<tr>
								<th><span style="color:RED">* </span>소명사유</th>
								<td><textarea rows="15" cols="50" style="width: 95%" id="callingIssue" name="callingIssue">${record_detail.callingIssue }</textarea></td>
							</tr>
						</c:if>
						<c:if test="${record_detail.recordStatus != 100694}">
							<c:if test="${not empty record_detail.callingIssue}">
			 				<tr>
								<th><span style="color:RED">* </span>소명사유</th>
								<td><textarea rows="15" cols="50" style="width: 95%" id="callingIssue" name="callingIssue">${record_detail.callingIssue }</textarea></td>
							</tr>
							</c:if>
						</c:if>
						<tr id="endLine1">
							<th>종결유형</th>
						    <td>
						    	<input type='radio' name="endReasonType" class="endResonTypeClass" id="noAgree" value='noAgree'/><label for="noAgree">합의되지 않은 종결</label>&nbsp;
						    	<input type='radio' name="endReasonType" class="endResonTypeClass" id="planned" value='planned'/><label for="planned">계획된 종결(회기소진 포함)</label>&nbsp;
						    	<input type='radio' name="endReasonType" class="endResonTypeClass" id="etc" value='etc'/><label for="etc">기타</label>
						    </td>
						</tr>
						<tr id="endLine2">
							<th>기타 종결사유</th>
						    <td>
								<textarea rows="1" cols="50" style="width: 95%" id="etcEndReason" name="etcEndReason">${record_detail.etcEndReason}</textarea>
						    </td>
						</tr>
						<tr id="endLine3">
							<th>종결보고<br>내담자 현 상태 및 상담사 소견</th>
						    <td>
								<textarea rows="5" cols="50" style="width: 95%" id="endReport" name="endReport">${record_detail.endReport}</textarea>
						    </td>
						</tr>
					</table>
					</td>
				</tr>
				<!-- 상담일지 끝 -->
			</table>
		</td>
	</tr>

	<!-- 버튼 영역 시작 -->
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="90%" style="border-collapse:collapse;">
				<tr align="center" height="50px">
					<td class="" colspan="2" align="center">
	 							<input type="button" id="insertBtn" value="저장하기" style="height:30px; width:100px;">
						<span style="margin-left: 20px;"></span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!-- 버튼 영역 시작 -->
</table> --%>
</form>
</body>
</html>