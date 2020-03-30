<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>상담비 정산</title>

<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.paycheck-wrapper{padding:0 5vw}
	.paycheck-wrapper .content-wrapper{display:flow-root;margin-top:5vw}
	.paycheck-wrapper .content-wrapper:first-child{margin-top:0vw}
	.paycheck-wrapper .content-wrapper .title-block{font-size:16px;font-weight:bold;line-height:130%}
	.paycheck-wrapper .content-wrapper .input-block{display:flow-root;margin-top:2vw}
	.paycheck-wrapper .content-wrapper .input-block.line-bottom input[type=text]{width:100%;float:left;padding:4px 0;font-size:16px;line-height:130%;border:none;outline:none}
	.paycheck-wrapper .content-wrapper .input-block .checkbox-wrapper{float:left;margin-right:4vw;font-size:14px}
	.paycheck-wrapper .content-wrapper .input-block select{width:100%;height:9vw;padding:0 2vw;font-size:14px;border:1px solid #BDBDBD;background:url('/resources/img/ic_select.png') no-repeat;background-size:12px 7px;background-position:right 6px top 50%;background-color:white;-webkit-appearance:none;-moz-appearance:none;appearance:none;outline:none}
	.paycheck-wrapper .content-wrapper .line-bottom{border-bottom:1px solid #C4C4C4}
	.paycheck-wrapper .content-wrapper .datetimepicker-block{display:flex}
	.paycheck-wrapper .content-wrapper .datetimepicker-block span{display:inline-block;float:left;width:20px;text-align:center;line-height:36px}
	.paycheck-wrapper .content-wrapper .datetimepicker-block input[type=text]{float:left;width:calc(50% - 10px);height:32px;padding:0 8px;font-size:14px;border:1px solid #828282}
	.paycheck-wrapper .content-wrapper .datetimepicker-btn-block{display:flow-root;margin-top:2vw}
	.paycheck-wrapper .content-wrapper .datetimepicker-btn-block input[type=button]{float:left;width:calc((100% - 6vw) / 4);height:32px;font-weight:bold;font-size:16px;background-color:#E0E0E0;border:1px solid #BDBDBD;border-radius:4px}
	.paycheck-wrapper .content-wrapper .datetimepicker-btn-block input[type=button]:not(:last-child){margin-right:2vw}
	.paycheck-wrapper .content-wrapper .search-btn{width:100%;height:11vw;color:white;font-weight:bold;font-size:16px;background-color:#006CBA;border:1px solid #004B85;border-radius:4px}
	.paycheck-wrapper .content-wrapper .update-btn{width:100%;height:11vw;color:white;font-weight:bold;font-size:16px;background-color:#006CBA;border:1px solid #004B85;border-radius:4px}
	.paycheck-wrapper .content-wrapper .btn-group-left{float:left;font-size:14px;color:#2F80ED}
	.paycheck-wrapper .content-wrapper .btn-group-right{float:right;font-size:14px;color:#2F80ED}
	.paycheck-wrapper .content-wrapper .result-info-left{float:left;font-size:12px}
	.paycheck-wrapper .content-wrapper .result-info-right{float:right;font-size:12px}
	
	.paycheck-wrapper .update-wrapper .update-info-wrapper{display:flex;display:-webkit-flex;margin-top:2.5vw;font-size:12px}
	.paycheck-wrapper .update-wrapper .update-info-wrapper span{display:flex;-webkit-align-items:center;align-items:center}
	.paycheck-wrapper .update-wrapper .update-info-wrapper input{height:7vw;padding:0 2vw;outline:none}
	.paycheck-wrapper .update-wrapper .update-info-wrapper input:not([name=email]){margin:0 1vw;text-align:center}
	.paycheck-wrapper .update-wrapper .update-info-wrapper input[name=email]{display:flex;-webkit-flex-grow:1;flex-grow:1;flex:1 1 0;-webkit-flex:1 1 0;margin-left:1vw}
	
	.paycheck-wrapper .data-list-wrapper{display:table;width:100%;margin-top:2vw;table-layout:fixed;border-collapse:collapse}
	.paycheck-wrapper .data-list-wrapper .result-list-left{float:left;width:calc(32% - 1px);border-right:1px solid #C4C4C4}
	.paycheck-wrapper .data-list-wrapper .result-list-right{float:left;width:68%;overflow:auto}
	.paycheck-wrapper .data-list-wrapper table{width:100%;text-align:center;border-collapse:collapse}
	.paycheck-wrapper .data-list-wrapper table thead{background-color:#F2F2F2;border-bottom:1px solid #C4C4C4}
	.paycheck-wrapper .data-list-wrapper .result-list-left table tr th{height:32px;padding:0}
	.paycheck-wrapper .data-list-wrapper .result-list-right table tr th{height:32px;padding:0 2vw}
	.paycheck-wrapper .data-list-wrapper table tr td{height:44px;padding:0 2vw}
	.paycheck-wrapper .data-list-wrapper table tr:nth-child(odd){background-color:#E0E0E0}
	.paycheck-wrapper .data-list-wrapper table tr:nth-child(even){background-color:#F2F2F2}
	
	.bottom-btn-wrapper{position:fixed;display:flex;display:-webkit-flex;left:0;bottom:50px;width:100%;height:11vw}
	.bottom-btn-wrapper button{display:flex;display:-webkit-flex;-webkit-flex-grow:1;flex-grow:1;flex:1 1 0;-webkit-flex:1 1 0;-webkit-justify-content:center;justify-content:center;-webkit-align-items:center;align-items:center;border:0;background-color:#006CBA;font-weight:bold;font-size:16px;color:white}
</style>

<script type="text/javascript">
$(document).ready(function(){	
	$('.mobile_nav ul li a').eq(4).addClass('active');
	$('.mobile_nav ul li a img').eq(4).attr('src', '/resources/img/home_icon_active.png');
	$('.checkboxAll').click(function() {
		if($('.checkboxAll').is(':checked') == true){
			$('.selectPayCheck').prop("checked", true);
		}else{
			$('.selectPayCheck').prop("checked", false);
		}
		
	});
	
	$("#searchBtn").click(function(){
		j$("#searchWaitList").submit();
		return false;
	});
	
	$("#updatePaycheckConfirmBtn").click(function(){
		if(confirm("수정하시겠습니까?")){
			var params = {};
			var writeMonth 			= $("input[name='writeMonth']").val();
			var writeDay 			= $("input[name='writeDay']").val();
			var issueMonth 			= $("input[name='issueMonth']").val();
			var issueDay 			= $("input[name='issueDay']").val();
			var issueHour 			= $("input[name='issueHour']").val();
			var email 				= $("input[name='email']").val();

			params.writeMonth 		= writeMonth;
			params.writeDay 		= writeDay;
			params.issueMonth 		= issueMonth;
			params.issueDay 		= issueDay;
			params.issueHour 		= issueHour;
			params.email 			= email;
			
			$.ajax({
				url: "/partner/payCheckMgr/updatePaycheckConfirm",
				data: params,
				dataType: 'json',
				success: function (response) {
					var resultCnt = response.resultCnt;
					if(resultCnt > 0){
						alert("계산서 정보가 수정되었습니다.");
						location.reload();
					}else{
						alert("계산서 정보 수정에 실패하였습니다.");
					}
				}
			});
		}
		return false;
	});
	
	$(".showPayCheckPop").click(function(){
		var counselCd = $(this).attr("counselCd");
		var startDt = $(this).attr("startDt");
		var endDt = $(this).attr("endDt");
		var searchClientCd = $(this).attr("searchClientCd");
		var searchStaffNm = $(this).attr("searchStaffNm");
		var searchMgrNm = $(this).attr("searchMgrNm");
		var searchCounselorNm = $(this).attr("searchCounselorNm");
		var searchCenterSeq = $(this).attr("searchCenterSeq");
		var insertType = $(this).attr("insertType");
		$.divPop_mo("payCheckPop", "상담비정산 상세정보", "/partner/payCheckMgr/showPayCheckPop?counselCd="+counselCd+"&startDt="+startDt+"&endDt="+endDt
				+"&searchClientCd="+searchClientCd+"&searchStaffNm="+searchStaffNm+"&searchMgrNm="+searchMgrNm+"&searchCounselorNm="+searchCounselorNm
				+"&searchCenterSeq="+searchCenterSeq+"&insertType="+insertType);
		return false;
	});
	
	$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:$('.date_timepicker_end').val()?j$('.date_timepicker_end').val():false
			})
		},
		timepicker:false
	});

	$("#btstartDt").click(function(){
		$('.date_timepicker_start').datetimepicker('show');
	});

	$('.date_timepicker_end').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:$('.date_timepicker_start').val()?j$('.date_timepicker_start').val():false
			})
		},
		timepicker:false
	});

	$("#btendDt").click(function(){
		$('.date_timepicker_end').datetimepicker('show');
	});
	
	
});

function getToDay() {
	var time = new Date();
	var year = time.getFullYear();
	var month = time.getMonth()+1;
	if(month < 10){
		month = '0'+month;
	}
	var day = time.getDate();
	if(day < 10){
		day = '0'+day;
	}
	var start = year+"/"+month+"/"+day;
	
	return start;
}
function todayBtn() {
	var time = new Date();
	var year = time.getFullYear();
	var month = time.getMonth()+1;
	if(month < 10){
		month = '0'+month;
	}
	var day = time.getDate();
	if(day < 10){
		day = '0'+day;
	}
	var start = year+"/"+month+"/"+day;

	
	$(".date_timepicker_start").val(start);
	$(".date_timepicker_end").val(start);
}
function weekBtn() {
	var time = new Date();
	
	var yearStart = time.getFullYear();
	var monthStart = time.getMonth()+1;
	if(monthStart < 10){
		monthStart = '0'+monthStart;
	}
	var dayStart = time.getDate();
	if(dayStart < 10){
		dayStart = '0'+dayStart;
	}
	 
	time.setDate (time.getDate() - 7); 
	var yearEnd = time.getFullYear();
	var monthEnd = time.getMonth()+1;
	if(monthEnd < 10){
		monthEnd = '0'+monthEnd;
	}
	var dayEnd = time.getDate();
	if(dayEnd < 10){
		dayEnd = '0'+dayEnd;
	}
	var start = yearStart+"/"+monthStart+"/"+dayStart;
	var end = yearEnd+"/"+monthEnd+"/"+dayEnd;
	
	
	$(".date_timepicker_start").val(end);
	$(".date_timepicker_end").val(start);
}
function fifteenBtn() {
	var time = new Date();
	
	var yearStart = time.getFullYear();
	var monthStart = time.getMonth()+1;
	if(monthStart < 10){
		monthStart = '0'+monthStart;
	}
	var dayStart = time.getDate();
	if(dayStart < 10){
		dayStart = '0'+dayStart;
	}
	 
	time.setDate (time.getDate() - 15); 
	var yearEnd = time.getFullYear();
	var monthEnd = time.getMonth()+1;
	if(monthEnd < 10){
		monthEnd = '0'+monthEnd;
	}
	var dayEnd = time.getDate();
	if(dayEnd < 10){
		dayEnd = '0'+dayEnd;
	}
	var start = yearStart+"/"+monthStart+"/"+dayStart;
	var end = yearEnd+"/"+monthEnd+"/"+dayEnd;
	
	
	$(".date_timepicker_start").val(end);
	$(".date_timepicker_end").val(start);
}
function monthBtn() {
	var time = new Date();
	var yearStart = time.getFullYear();
	time
	var monthStart = time.getMonth()+1;
	if(monthStart < 10){
		monthStart = '0'+monthStart;
	}
	var dayStart = time.getDate();
	if(dayStart < 10){
		dayStart = '0'+dayStart;
	}
	time.setDate (time.getDate() - 30); 

	var yearEnd = time.getFullYear();
	var monthEnd = time.getMonth()+1;
	if(monthEnd < 10){
		monthEnd = '0'+monthEnd;
	}
	var dayEnd = time.getDate();
	if(dayEnd < 10){
		dayEnd = '0'+dayEnd;
	}
	var start = yearStart+"/"+monthStart+"/"+dayStart;
	var end = yearEnd+"/"+monthEnd+"/"+dayEnd;
	
	
	$(".date_timepicker_start").val(end);
	$(".date_timepicker_end").val(start);

}

function showPayCheckPopInsert(){
	var insertType = "I";
	$.divPop_mo("payCheckPop", "상담비정산 상세정보", "/partner/payCheckMgr/showPayCheckPop?insertType="+insertType);
	return false;
}

function deletePayCheckAll(){
	if(confirm("모든 정산 데이터가 삭제됩니다. 그래도 진행하시겠습니까?")){
		$.ajax({
			url: "/partner/payCheckMgr/deletePayCheck",
			dataType: 'json',
			success: function (response) {
				var resultCnt = response.resultCnt;
				if(resultCnt > 0){
					alert("모든 정산 데이터가 삭제되었습니다.");
					location.reload();
				}else{
					alert("정산 데이터 삭제에 실패하였습니다.");
				}
			}
		});
	}
}

function excelDownPayCheck(){
	var counselCd = $("#excelBtn").attr("counselCd");
	var startDt = $("#excelBtn").attr("startDt");
	var endDt = $("#excelBtn").attr("endDt");
	var searchClientCd = $("#excelBtn").attr("searchClientCd");
	var searchStaffNm = $("#excelBtn").attr("searchStaffNm");
	var searchMgrNm = $("#excelBtn").attr("searchMgrNm");
	var searchCounselorNm = $("#excelBtn").attr("searchCounselorNm");
	var searchCenterSeq = $("#excelBtn").attr("searchCenterSeq");
	location.href = "/partner/payCheck/excelDownPayCheck?counselCd="+counselCd+"&startDt="+startDt+"&endDt="+endDt
		+"&searchClientCd="+searchClientCd+"&searchStaffNm="+searchStaffNm+"&searchMgrNm="+searchMgrNm
		+"&searchCounselorNm="+searchCounselorNm+"&searchCenterSeq="+searchCenterSeq;
}


function updateCheckYn(){
	if( j$("input[class=selectPayCheck]:checked").length == 0 ) {
		 j$.alert("선택된 값이 없습니다.");
		 return;
	}
	
	var chk = document.getElementsByName("selectPayCheck");
	var counselCdAll = document.getElementsByName("counselCd");
	var centerSeqAll = document.getElementsByName("centerSeq");
	var clientCdAll = document.getElementsByName("clientCd");

	 
	for(var i=0; i<chk.length;i++){
		if(chk[i].checked == true){  //체크가 되어있는 값 구분
			
			var counselCd = counselCdAll[i].value;
			var centerSeq = centerSeqAll[i].value;
			var clientCd = clientCdAll[i].value;	
			var params = {};
			params.counselCd = counselCd;
			params.centerSeq  = centerSeq;
			params.clientCd  = clientCd;
			console.log(params);
			j$.ajax({
				url: '/partner/payCheck/updateCheckYn',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					//window.location.reload();
				}
			});   
			
		}
	} 
	
	window.location.reload();
	return false;
	
	
}
function updateCheckYnOwner(){
	if( j$("input[class=selectPayCheck]:checked").length == 0 ) {
		 j$.alert("선택된 값이 없습니다.");
		 return;
	}
	
	var chk = document.getElementsByName("selectPayCheck");
	var counselCdAll = document.getElementsByName("counselCd");
	var centerSeqAll = document.getElementsByName("centerSeq");
	var clientCdAll = document.getElementsByName("clientCd");

	 
	for(var i=0; i<chk.length;i++){
		if(chk[i].checked == true){  //체크가 되어있는 값 구분
			
			var counselCd = counselCdAll[i].value;
			var centerSeq = centerSeqAll[i].value;
			var clientCd = clientCdAll[i].value;	
			var params = {};
			params.counselCd = counselCd;
			params.centerSeq  = centerSeq;
			params.clientCd  = clientCd;
			console.log(params);
			j$.ajax({
				url: '/partner/payCheck/updateCheckYnOwner',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					//window.location.reload();
				}
			});   
			
		}
	} 
	
	window.location.reload();
	return false;
	
	
}

function updateCheckYnManager(){
	if( j$("input[class=selectPayCheck]:checked").length == 0 ) {
		 j$.alert("선택된 값이 없습니다.");
		 return;
	}
	
	var chk = document.getElementsByName("selectPayCheck");
	var counselCdAll = document.getElementsByName("counselCd");
	var centerSeqAll = document.getElementsByName("centerSeq");
	var clientCdAll = document.getElementsByName("clientCd");

	 
	for(var i=0; i<chk.length;i++){
		if(chk[i].checked == true){  //체크가 되어있는 값 구분
			
			var counselCd = counselCdAll[i].value;
			var centerSeq = centerSeqAll[i].value;
			var clientCd = clientCdAll[i].value;	
			var params = {};
			params.counselCd = counselCd;
			params.centerSeq  = centerSeq;
			params.clientCd  = clientCd;
			console.log(params);
			j$.ajax({
				url: '/partner/payCheck/updateCheckYnManager',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					//window.location.reload();
				}
			});   
			
		}
	} 
	
	window.location.reload();
	return false;
	
	
}
</script>
</head>
<body>
<form:form id="searchWaitList" modelAttribute="payCheckAddDto" action="/partner/payCheck/payCheckList" method="GET">
	<div class="paycheck-wrapper">
		<div class="content-wrapper">
			<div class="title-block">상담일자</div>
			<div class="input-block">
				<div class="datetimepicker-block">
					<input type="text" name="startDt" class="date_timepicker_start" value="${payCheckAddDto.startDt}"/>
					<span>~</span>
					<input type="text" name="endDt" class="date_timepicker_end" value="${payCheckAddDto.endDt}"/>
				</div>
				<div class="datetimepicker-btn-block">
					<input type="button" value="오늘" onclick="todayBtn();"/>
					<input type="button" value="1주" onclick="weekBtn();"/>
					<input type="button" value="15일" onclick="fifteenBtn();"/>
					<input type="button" value="1개월" onclick="monthBtn();"/>
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">고객사 선택</div>
			<div class="input-block">
				<select id="selClientCd" name="searchClientCd">
					<option value=""> 고객사를 선택 하세요  </option>
					<c:forEach var="list" items="${clientList }">
						<option value="${list.clientCd }" <c:if test="${list.clientCd eq payCheckAddDto.searchClientCd }"> selected </c:if> >${list.clientNm } </option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">담당자명</div>
			<div class="input-block line-bottom">
				<input type="text" name="searchStaffNm" value="${counselReservationDto.counselorNm}"/>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">내담자명</div>
			<div class="input-block line-bottom">
				<input type="text" name="searchMgrNm" value="${payCheckAddDto.searchMgrNm}"/>
			</div>
		</div>
		<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
		<div class="content-wrapper">
			<div class="title-block">상담자명</div>
			<div class="input-block line-bottom">
				<input type="text" name="searchCounselorNm" value="${counselReservationDto.counselorNm}"/>
			</div>
		</div>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_PARTNER_ADMIN')">
		<div class="content-wrapper">
			<div class="title-block">고객사 선택</div>
			<div class="input-block">
				<select name="searchCenterSeq" id="centerList">
	    			<option value="">전체</option>
	    			<c:forEach var="item" items="${centerList}">
	    				<option value="${item.centerSeq}" <c:if test="${item.centerSeq eq payCheckAddDto.searchCenterSeq }">selected</c:if>>${item.centerNm}</option>
	    			</c:forEach>
	    		</select>
			</div>
		</div>
		</sec:authorize>
		<div class="content-wrapper">
			<input type="button" id="searchBtn" class="search-btn" value="검색">
		</div>
		<div class="content-wrapper">
			<div class="btn-group-left">
			<sec:authorize access="hasAnyRole('ROLE_PARTNER_ADMIN')">
				<span onclick="showPayCheckPopInsert();">신규등록</span>
				<span onclick="deletePayCheckAll();" style="margin-left:4vw">삭제</span>
			</sec:authorize>
			</div>
			<div class="btn-group-right">
			<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
				<span id="excelBtn" onclick="excelDownPayCheck();"
					startDt="${param.startDt }" endDt="${param.endDt }"
					searchClientCd="${payCheckAddDto.searchClientCd }" 	
					searchStaffNm="${payCheckAddDto.searchStaffNm}"
					searchMgrNm="${payCheckAddDto.searchMgrNm}" 
					searchCounselorNm="${payCheckAddDto.searchCounselorNm}"
					searchCenterSeq="${payCheckAddDto.searchCenterSeq }">
					엑셀 다운로드 <img src="/resources/img/ic_excel_down.png">
				</span>
			</sec:authorize>
			</div>
		</div>
		<div class="update-wrapper">
			<div class="update-info-wrapper">
				<span>계산서의 작성일자</span>
				<input type="text" name="writeMonth" style="width:5vw" value="${payCheckConfirm.writeMonth }" <c:if test="${auth == 'center'}">disabled</c:if>>
				<span>월</span>
				<input type="text" name="writeDay" style="width:5vw" value="${payCheckConfirm.writeDay }" <c:if test="${auth == 'center'}">disabled</c:if>>
				<span>일</span> 
			</div>
			<div class="update-info-wrapper">
				<span>계산서의 발행기한</span>
				<input type="text" name="issueMonth" style="width:5vw" value="${payCheckConfirm.issueMonth }" <c:if test="${auth == 'center'}">disabled</c:if>>
				<span>월</span> 
				<input type="text" name="issueDay" style="width:5vw" value="${payCheckConfirm.issueDay }" <c:if test="${auth == 'center'}">disabled</c:if>>
				<span>일</span>
				<input type="text" name="issueHour" style="width:5vw" value="${payCheckConfirm.issueHour }" <c:if test="${auth == 'center' }">disabled</c:if>>
				<span>시</span>  
			</div>
			<div class="update-info-wrapper">
				<span>계산서의 발신대상 이메일</span>
				<input type="text" name="email" <c:if test="${auth == 'center' }">disabled</c:if> value="${payCheckConfirm.email }"> 
			</div>
		</div>
		<div class="content-wrapper">
		<sec:authorize access="hasAnyRole('ROLE_PARTNER_ADMIN')">
			<button id="updatePaycheckConfirmBtn" type="button" class="update-btn">수정</button>
		</sec:authorize>
		</div>
		<div class="content-wrapper">
			<div class="result-info-left">
				<span>조회건 : ${paging.totalCount} 페이지 : ${paging.currentPage}/${paging.getPageCount()}</span>
			</div>
			<div class="result-info-right">
			<sec:authorize access="hasAnyRole('ROLE_PARTNER_ADMIN')">
				<span>합계 : ${priceSum} (부가세 포함)</span>
			</sec:authorize>
			</div>
		</div>
		<div class="data-list-wrapper">
			<div class="result-list-left">
				<table style="width:100%;text-align:center;border-collapse:collapse;">
					<thead>
						<tr>
							<th width="20px">
								<div class="checkbox-wrapper">
									<input type="checkbox" class="checkboxAll" id="checkboxAll" />
									<label for="checkboxAll"></label>
								</div>
							</th>
							<th width="*">상담코드</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${paging.list}" varStatus="status">
						<tr>
							<td>
								<div class="checkbox-wrapper">
									<input type="checkbox"  name="selectPayCheck" class="selectPayCheck" id="selectPayCheck${status.index}" />
									<label for="selectPayCheck${status.index}"></label>
								</div>
								<input type="hidden" name="counselCd" value="${list.counselCd }" />
								<input type="hidden" name="centerSeq" value="${list.centerSeq}" />
								<input type="hidden" name="clientCd" value="${list.clientCd}" />
							</td>
							<td>${list.counselCd}</td>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="result-list-right">
				<div style="width:max-content">
					<table style="width:100%;text-align:center;border-collapse:collapse;">
						<thead>
							<tr>
								<th>고객사</th>
								<th>상담일자</th>
								<th>임직원</th>
								<th>내담자</th>
								<th>상담기관</th>
								<th>상담사</th>
								<th>일지상태</th>
								<th>상담사확인</th>
								<th>확인일자</th>
								<th>센터장확인</th>
								<th>확인일자</th>
								<sec:authorize access="hasAnyRole('ROLE_PARTNER_ADMIN')">
									<th>담당자확인</th>
									<th>확인일자</th>
									<th>정보관리</th>
									<th>상담비</th>
								</sec:authorize>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr>
								<td>${list.clientNm }</td>
								<td>${list.scheduleDt }</td>
								<td>${list.staffNm }</td>
								<td>${list.mgrNm }</td>
								<td>${list.centerNm }</td>
								<td>${list.counselorNm }</td>
								<td><comm:commNmOut option="commCd" code="${list.recordStatus}"/></td>
								<td>${list.counselorCheck }</td>
								<td>${list.counselorDt }</td>
								<td>${list.ownerCheck }</td>
								<td>${list.ownerCheckDt }</td>
								<sec:authorize access="hasAnyRole('ROLE_PARTNER_ADMIN')">
									<td>${list.managerCheck }</td>
									<td>${list.managerDt }</td>
									<td class="showPayCheckPop" counselCd="${list.counselCd }" 
										startDt="${param.startDt }" endDt="${param.endDt }"
										searchClientCd="${payCheckAddDto.searchClientCd }" 	
										searchStaffNm="${payCheckAddDto.searchStaffNm}"
										searchMgrNm="${payCheckAddDto.searchMgrNm}" 
										searchCounselorNm="${payCheckAddDto.searchCounselorNm}"
										searchCenterSeq="${payCheckAddDto.searchCenterSeq }"
										insertType="U">
										<a href="javascript:void(0);"><span style="font-size:14px; color: blue;">수정 &gt;</span></a>
									</td>
									<td><fmt:formatNumber value="${list.price }" pattern="#,###"/>원</td>
								</sec:authorize>
								
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="content-wrapper" style="margin-bottom:5vw">
			<table border="0" width="100%" style="border-collapse:collapse;">
				<tr>
					<td align="center">
					 <ui:paging value="${paging}"
						btnFirst="${url:img('/images/btn_first.jpg')}"
						btnPrev="${url:img('/images/btn_prev.jpg')}"
						btnNext="${url:img('/images/btn_next.jpg')}"
						btnLast="${url:img('/images/btn_last.jpg')}" />
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="bottom-btn-wrapper">
		<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
			<button onclick="javascript:updateCheckYn();">정산 확인</button>
			<button onclick="javascript:updateCheckYnOwner();">센터장 확인</button>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_PARTNER_ADMIN')">
			<button onclick="javascript:updateCheckYnManager();">담당자 확인</button>
		</sec:authorize>
	</div>
</form:form>



</body>
</html>