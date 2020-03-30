<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>예약확정현황</title>

<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.counsel-wrapper{padding:0 5vw}
	.counsel-wrapper .content-wrapper{display:flow-root;margin-top:5vw}
	.counsel-wrapper .content-wrapper:first-child{margin-top:0vw}
	.counsel-wrapper .content-wrapper .title-block{font-size:16px;font-weight:bold;line-height:130%}
	.counsel-wrapper .content-wrapper .input-block{display:flow-root;margin-top:2vw}
	.counsel-wrapper .content-wrapper .input-block.line-bottom input[type=text]{width:100%;float:left;padding:4px 0;font-size:16px;line-height:130%;border:none;outline:none}
	.counsel-wrapper .content-wrapper .input-block .checkbox-wrapper{float:left;margin-right:4vw;font-size:14px}
	.counsel-wrapper .content-wrapper .line-bottom{border-bottom:1px solid #C4C4C4}
	.counsel-wrapper .content-wrapper .datetimepicker-block{display:flex}
	.counsel-wrapper .content-wrapper .datetimepicker-block span{display:inline-block;float:left;width:20px;text-align:center;line-height:36px}
	.counsel-wrapper .content-wrapper .datetimepicker-block input[type=text]{float:left;width:calc(50% - 10px);height:32px;padding:0 8px;font-size:14px;border:1px solid #828282}
	.counsel-wrapper .content-wrapper .datetimepicker-btn-block{display:flow-root;margin-top:2vw}
	.counsel-wrapper .content-wrapper .datetimepicker-btn-block input[type=button]{float:left;width:calc((100% - 6vw) / 4);height:32px;font-weight:bold;font-size:16px;background-color:#E0E0E0;border:1px solid #BDBDBD;border-radius:4px}
	.counsel-wrapper .content-wrapper .datetimepicker-btn-block input[type=button]:not(:last-child){margin-right:2vw}
	.counsel-wrapper .content-wrapper .search-btn{height:40px;width:100%;color:white;font-weight:bold;font-size:16px;background-color:#006CBA;border:1px solid #004B85;border-radius:4px}
	.counsel-wrapper .content-wrapper .result-info{color:#828282}
	
	.counsel-wrapper .data-list-wrapper{display:table;width:100%;table-layout:fixed;border-collapse:collapse}
	.counsel-wrapper .data-list-wrapper .data-wrapper{margin-top:3vw;font-size:14px}
	.counsel-wrapper .data-list-wrapper .data-select .selectUser{vertical-align:text-top;margin:0 1vw}
	.counsel-wrapper .data-list-wrapper table{width:100%;margin-top:2vw;border-collapse:collapse}
	.counsel-wrapper .data-list-wrapper table tr{height:32px}
	.counsel-wrapper .data-list-wrapper table tr th{width:35%;font-size:14px;background-color:#D2D2D2}
	.counsel-wrapper .data-list-wrapper table tr td{font-size:14px;text-align:left;padding:0 2vw}
	
	.bottom-btn-wrapper .bottom-fixed-btn{position:fixed;left:0;bottom:50px;width:100%;height:40px;color:#828282;font-weight:bold;font-size:16px;background-color:#E0E0E0}
	.bottom-btn-wrapper .bottom-fixed-btn.active{color:white;background-color:#006CBA}
</style>

<script type="text/javascript">
j$(document).ready(function(){
	$('.mobile_nav ul li a').eq(2).addClass('active');
	$('.mobile_nav ul li a img').eq(2).attr('src', '/resources/img/home_icon_active.png');
	/**
	 * 상담사 및 일정 변경 팝업
	 */

	$(".counselChange").click(function () {
		var counselType = $(this).attr("counselType");       // 상담코드
		if (counselType == "100437") {
			alert("현재 진단은 일정을 변경 할 수 없습니다.");
			return;
		}
		
		
		var params = {};
		params.counselCd = $(this).attr("counselCd");       // 상담코드
		
		if (typeof params.counselCd == "undefined") {
			alert("상담을 선택해주세요.");
			return;
		}
		
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = "01";
		
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		
		var ymdLimit = year + "-" + month + "-" + day;
		var ymd = $(this).attr("counselDate");	      // 년월일
		
		if(ymd < ymdLimit) {
			alert("월이 변경되면 지난달의 상담일정 변경은 불가합니다. \n이지웰니스(네이버톡톡)으로 문의 주세요. 감사합니다.");
			
			return;
		}
		
		var counselCd = $(this).attr("counselCd");	     // 상담코드
		$.divPop_mo("counselChangePopup", "상담사/일정 변경", "/partner/pCounselorMgr/counselorChange/layerPopup?counselCd=" + counselCd);
	});
	
	$(".btnExtend").click(function () {
		
		var userStatus = $(this).attr("userStatus");	// 고객 재직상태
		var userUseYn = $(this).attr("userUseYn");		// 고객 사용유무
		var channelType = $(this).attr("channelType");		// 고객 사용유무
		
		var sameJedoYn = 'Y';
		var clientCd = $(this).attr("clientCd");
		if( clientCd.match(/optum/i) != null || clientCd.match(/op_/i) != null ){	// optum의 경우에만
			
			// 2019-02-13 #2163 옵텀고객사는 법률/재무상담 1회로 제한
			if(channelType == "100002" || channelType == "100003") {
				alert("해당 고객사는 외국계고객사로 서비스 기간 내 1회만 상담이 가능합니다.\n네이버톡톡 또는 02-6909-4414 (외국계고객사 담당자)로 문의하시기 바랍니다.");
				
				return false;
			}
			
			
			var d = new Date();
			var dd = d.getDate();
			var mm = d.getMonth()+1; //January is 0!
			var yyyy = d.getFullYear();
			if(dd<10) { dd='0'+dd } 
			if(mm<10) { mm='0'+mm } 
			var nowDate = yyyy+''+mm+''+dd;
			var counselDate = $(this).attr("counselDate");	// 상담일자
			sameJedoYn = checkCounselExtendsJedo(clientCd, counselDate, nowDate);	// 연장하려는 상담이 현재 제도와 동일한지 체크
		}
		
		if(userUseYn == 'N'){				// 사용불가 상태의 아이디
			alert('사용불가 처리된 아이디입니다.');
		}else if(userStatus == '100009'){	// 고객이 퇴직 상태이면
			alert('퇴직처리된 아이디입니다.');
		}else if (sameJedoYn == 'N'){		// 연장하려는 상담이 현재 제도와 동일하지않다면
			alert('해당 고객사의 계약갱신으로 임직원의 신규상담 재신청이 필요합니다.\n아래의 번호로 임직원이 직접 신규상담을 재신청할 수 있도록 안내를 부탁드립니다.\n\n* 신규상담 신청번호 : 02-3439-9412\n* 문의사항 : 이지웰니스 02-6909-4414');
		}else{
			location.href = "/partner/pCounselorMgr/partnerCounselForm?userKey=" + $(this).attr("userKey") + "&counselCd=" + $(this).attr("counselCd");
		}
	});

	$(".btnLimit").click(function () {
		var userKey = $(this).attr("userKey");
		var clientCd = $(this).attr("clientCd");
		$.divPop_mo("viewDetail", "개인 한도/잔여한도", "/madm/layerPopup/limitDetail?userKey=" + userKey + "&clientCd=" + clientCd);
	});
	
	j$("#searchBtn").click(function(){
		j$("#searchWaitList").submit();
		return false;
	});
	

	j$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_end').val()?j$('.date_timepicker_end').val():false
			})
		},
		timepicker:false
	});

	j$("#btstartDt").click(function(){
		j$('.date_timepicker_start').datetimepicker('show');
	});

	j$('.date_timepicker_end').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_start').val()?j$('.date_timepicker_start').val():false
			})
		},
		timepicker:false
	});

	j$("#btendDt").click(function(){
		j$('.date_timepicker_end').datetimepicker('show');
	});
	
	
	j$('.date_timepicker_extensionDt').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:getToDay()
			})
		},
		onChangeDateTime:function(ct) {
			var params = {};
			var y = ct.getFullYear();
			var m = ct.getMonth() + 1;
			var d = ct.getDate();
			var dd = new Date();
			//var strData = "";
			
			if (m < 10) {
				m = "0" + m;
			}
			
			if (dd.getTime() > ct.getTime()) {
				params.stTime = dd.getHours() + "00";
			} else {
				params.stTime = "0800";
			}
			
			params.centerSeq = $("input[type='radio']:checked").parents(".data-wrapper").find("input.centerSeq").val();
			params.counselorId = $("input[type='radio']:checked").parents(".data-wrapper").find("input.counselorId").val();
			params.ymd = y + "" + m + "" + d;
			
			if (dd.getTime() > ct.getTime()) {
				params.stTime = dd.getHours() + "00";
			} else {
				params.stTime = "0800";
			}
			
			j$.ajax({
				url: '/partner/pCounselorMgr/getScheduleTimeList',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					j$("#extStTime").empty();
					if (data.stTimeList != null && data.stTimeList.length > 0) {
						j$.each(data.stTimeList, function(i, stTimeList){
							j$("#extStTime").append("<option value='" + stTimeList.scheduleSeq + "'>" + stTimeList.stTime + "</option>");
						});
					} else {
						alert("해당 상담은 예약 가능한 일정이 없습니다.");
					}
				}
			});
		},
		validateOnBlur:false,
		timepicker:false
	});
	
	j$("#btExtensionDt").click(function(){
		j$('.date_timepicker_extensionDt').datetimepicker('show');
	});
	
	j$(".selectUser").click(function(){
		j$('.date_timepicker_extensionDt').val();
		j$('.date_timepicker_extensionDt').datetimepicker('reset');
		j$("#extStTime").empty();
		j$(".bottom-fixed-btn").addClass("active");
	});

	j$(".viewDetail").click(function(){
		var counselCd = $(this).attr("val");
		j$.divPop_mo("viewDetail", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/intakeDetail?counselCd="+counselCd);
		return false;
	});
	
	j$(".pCounselorDateModify").click(function(){
		var counselUser = j$(this).attr("value");
		var paramArr = counselUser.split('&');
		
		// 게시판일때
		if (paramArr[2] == "100435" && "${counselReservationDto.centerSeq}" != '10000462') {
			j$.ajax({
				url: '/partner/pCounselorMgr/pCounselBbs/confirm?intakeCd=' + paramArr[3],
				dataType: 'json',
				success: function(data){
					if (data.resultYn == "Y") {
						location.href = "/partner/pCounselorMgr/pCounselorDateDetail?counselCd="+paramArr[0]+"&userKey="+paramArr[1];
						return false;
					} else {
						location.href = "/partner/pCounselorMgr/pCounselBbsAddForm?intakeCd=" + paramArr[3];
						return false;
					}
				}
			});
		}

		location.href = "/partner/pCounselorMgr/pCounselorDateDetail?counselCd="+paramArr[0]+"&userKey="+paramArr[1];
		return false;
	});
	
});

function changeOrderbyNm(){
	if($(".searchOrderNm").hasClass("up")){

		$(".searchOrderNm").text("▽");
		$("#orderByNm").val("counselor");
		$("#orderByType").val("DESC");
		$("#searchBtn").click();
		
	}else{

		$(".searchOrderNm").text("△");
		$("#orderByNm").val("counselor");
		$("#orderByType").val("ASC");
		$("#searchBtn").click();
	}
}
function changeOrderbyDate(){
	if($(".searchOrderDate").hasClass("up")){

		$(".searchOrderDate").text("▽");
		$("#orderByNm").val("date");
		$("#orderByType").val("DESC");
		$("#searchBtn").click();
	}else{

		$(".searchOrderDate").text("△");
		$("#orderByNm").val("date");
		$("#orderByType").val("ASC");
		$("#searchBtn").click();
	}
	
}




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

function doExtension() {
	var params = {};
	params.counselCd = $("input[type='radio']:checked").parents(".data-wrapper").find("input.counselCd").val();
	
	j$.ajax({
		url: '/partner/pCounselorMgr/getCanExtension',
		data: params,
		dataType: 'json',
		type: 'GET',
		cache:true,
		success: function(data, textStatus){
			if (data.ret === 'Y') {
				var formHtml = "	<input type='hidden' name='intakeCd' value='" + $("input[type='radio']:checked").parents(".data-wrapper").find("input.intakeCd").val() + "'>";
				formHtml += "	<input type='hidden' name='counselorId' value='" + $("input[type='radio']:checked").parents(".data-wrapper").find("input.counselorId").val() + "'>";
				formHtml += "	<input type='hidden' name='centerSeq' value='" + $("input[type='radio']:checked").parents(".data-wrapper").find("input.centerSeq").val() + "'>";
				formHtml += "	<input type='hidden' name='counselCd' value='" + $("input[type='radio']:checked").parents(".data-wrapper").find("input.counselCd").val() + "'>";
				formHtml += "	<input type='hidden' name='userKey' value='" + $("input[type='radio']:checked").parents(".data-wrapper").find("input.userKey").val() + "'>";
				formHtml += "	<input type='hidden' name='scheduleSeq' value='" + j$("#extStTime option:selected").val() + "'>";
				formHtml += "	<input type='hidden' name='stTime' value='" + j$("#extStTime option:selected").text() + "'>";
				formHtml += "	<input type='hidden' name='clientCd' value='" + $("input[type='radio']:checked").parents(".data-wrapper").find("input.clientCd").val() + "'>";
				formHtml += "	<input type='hidden' name='ymd' value='" + j$(".date_timepicker_extensionDt").val().replace(/\//gi, "") +  "'>";

				j$("#doExtensionFrm").empty();
				j$("#doExtensionFrm").append(formHtml);
				$("#doExtensionFrm").submit();				
			} else {
				alert("이미 연장 신청상태 이거나, 연장 신청이 불가능한 상태 입니다.");
			}
		}
	});
}


/**
 * 상담사 및 일정 변경 팝업
 */
function doCounselChange() {
	var userStatus = $(this).attr("userStatus");	// 고객 재직상태
	var userUseYn = $(this).attr("userUseYn");		// 고객 사용유무
	var channelType = $(this).attr("channelType");		// 고객 사용유무
	
	var counselType = $("input[type='radio']:checked").parents(".data-wrapper").find("input.counselType").val();       // 상담코드
	if (counselType == "100437") {
		alert("현재 진단은 일정을 변경 할 수 없습니다.");
		return;
	}
	
	
	var params = {};
	params.counselCd = $("input[type='radio']:checked").parents(".data-wrapper").find("input.counselCd").val();       // 상담코드
	
	if (typeof params.counselCd == "undefined") {
		alert("상담을 선택해주세요.");
		return;
	}
	
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = "01";
	
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	
	var ymdLimit = year + "-" + month + "-" + day;
	var ymd = $("input[type='radio']:checked").parents(".data-wrapper").find("input.ymd").val();       // 년월일
	
	if(ymd < ymdLimit) {
		alert("월이 변경되면 지난달의 상담일정 변경은 불가합니다. \n이지웰니스(네이버톡톡)으로 문의 주세요. 감사합니다.");
		
		return;
	}
	
	var counselCd = $("input[type='radio']:checked").parents(".data-wrapper").find("input.counselCd").val();       // 상담코드
	$.divPop_mo("counselChangePopup", "상담사/일정 변경", "/partner/pCounselorMgr/counselorChange/layerPopup?counselCd=" + counselCd);
}

// 연장신청 시, 해당 상담이 이전 제도에 포함되는지를 체크 - ajax 비동기 방식으로 처리
function checkCounselExtendsJedo(clientCd, counselDate, nowDate){
	
	var params = {};
	params.clientCd = clientCd;
	params.counselDate = counselDate;
	params.nowDate = nowDate;
	
	var sameJedoYn = 'Y';
	
	j$.ajax({
		url: '/partner/pCounselorMgr/checkCounselExtendsJedo',
		data: params,
		dataType: 'json',
		type: 'GET',
		cache:true,
		async: false,
		success: function(data, textStatus){
			if(data.counselJedoSeq != data.nowJedoSeq){
				sameJedoYn = 'N';
			}
		}
	});
	return sameJedoYn;
}
</script>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMMddHHmm" var="nowDate" />

<form:form id="searchWaitList" modelAttribute="counselReservationDto" action="/partner/pCounselorMgr/counselFixList" method="GET">
	<div class="counsel-wrapper">
		<div class="content-wrapper">
			<div class="title-block">임직원명</div>
			<div class="input-block line-bottom">
				<input type="text" name="ownerNm" id="ownerNm" value="${counselReservationDto.ownerNm}"/>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">내담자명</div>
			<div class="input-block line-bottom">
				<input type="text" name="counselNm" id="counselNm" value="${counselReservationDto.counselNm}"/>
			</div>
		</div>
		<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
		<div class="content-wrapper">
			<div class="title-block">상담자명</div>
			<div class="input-block line-bottom">
				<input type="text" name="counselorNm" id="counselorNm" value="${counselReservationDto.counselorNm}"/>
			</div>
		</div>
		</sec:authorize>
		<div class="content-wrapper">
			<div class="title-block">상담일자</div>
			<div class="input-block">
				<div class="datetimepicker-block">
					<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${param.startDt}"/>
					<span>~</span>
					<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${param.endDt}"/>
				</div>
				<div class="datetimepicker-btn-block">
					<input type="hidden" id="orderByType" name="orderByType" value="${counselReservationDto.orderByType}"/>
					<input type="hidden" id="orderByNm" name="orderByNm" value="${counselReservationDto.orderByNm}"/>
					<input type="button" value="오늘" onclick="todayBtn();"/>
					<input type="button" value="1주" onclick="weekBtn();"/>
					<input type="button" value="15일" onclick="fifteenBtn();"/>
					<input type="button" value="1개월" onclick="monthBtn();"/>
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<input type="button" id="searchBtn" name="searchBtn" class="search-btn" value="검색"/>
		</div>
		<div class="content-wrapper">
			<span class="result-info">조회건 : ${paging.totalCount} &nbsp;&nbsp; 페이지 : ${paging.currentPage}/${paging.getPageCount()}</span>
		</div>
		<div class="data-list-wrapper">
		<c:forEach var="list" items="${paging.list}" varStatus="status">
			<div class="data-wrapper">
				<div class="data-select">
					<label>선택 <input type="radio" name="selectUser" class="selectUser"/></label>
				</div>
				<table border="1" style="width:100%;text-align:center;border-collapse:collapse;">
					<tr>
						<th>고객사</th>
						<td>${list.clientNm }</td>
					</tr>
					<tr>
						<th>임직원명</th>
						<td>${list.ownerNm }</td>
					</tr>
					<tr>
						<th>내담자명</th>
						<td class="viewDetail" val="${list.counselCd }">
							<a href="javascript:void(0);">
								<span style="color:#2F80ED">${list.counselNm } &gt;</span>
							</a>
							<input type="hidden" class="userKey" value="${list.userKey}"/>
							<input type="hidden" class="counselCd" value="${list.counselCd}"/>
							<input type="hidden" class="intakeCd" value="${list.intakeCd}"/>
							<input type="hidden" class="clientCd" value="${list.clientCd}"/>
							<input type="hidden" class="ymd" value="${list.ymd }"/>
							<input type="hidden" class="counselNm" value="${list.counselorNm }"/>
						</td>
					</tr>
					<tr>
						<th>상담일시</th>
						<td>${list.ymd } ${list.stTime }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${list.mobile }</td>
					</tr>
					<tr>
						<th>상담사</th>
						<td>
							<a href="/partner/pCounselorMgr/pCounselSchedule?selectId=${list.counselorId}">${list.counselorNm }</a>
							<input type="hidden" class="counselorId" value="${list.counselorId}"/>
							<input type="hidden" class="centerSeq" value="${list.centerSeq}"/>
						</td>
					</tr>
					<tr>
						<th>상담방법</th>
						<td>
							<comm:commNmOut code="${list.counselType }" option="commCd"/>
							<input type="hidden" class="counselType" value="${list.counselType }">
						</td>
					</tr>
					<tr>
						<th>사례위험도</th>
						<td>${list.risk}단계</td>
					</tr>
					<tr>
						<th>상담분야</th>
						<td><comm:commNmOut code="${list.counselDiv }" option="category"/></td>
					</tr>
					<tr>
						<th>첫 일정 확정</th>
						<td>${list.counselReservChk }</td>
					</tr>
					<tr>
						<th>회기</th>
						<td>${list.extensionNum }회차</td>
					</tr>
					<tr>
						<th>일지작성</th>
						<td>
							<c:set scope="page" var="userCounselDate">${list.ymd } ${list.stTime }</c:set>
							<fmt:parseDate value="${userCounselDate }" pattern="yyyy-MM-dd HH:mm" var="userCounselDt" />
							<fmt:formatDate value="${userCounselDt }" pattern="yyyyMMddHHmm" var="userCounselDtStr" />
							
							<c:choose>
								<c:when test="${list.recordStatus == 100695}">
									<strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong>
								</c:when>
								<c:when test="${list.recordStatus == 100696}">
								<c:choose>
										<c:when test="${list.extensionNum == 1 }">
											<a href="#" class="pCounselorDateModify" value="${list.counselCd}&${list.userKey}&${list.counselType}&${list.intakeCd}" ><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></a>
										</c:when>
										<c:otherwise>
											<strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong>
										</c:otherwise>
								</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${userCounselDtStr < nowDate }">
											<a href="#" class="pCounselorDateModify" value="${list.counselCd}&${list.userKey}&${list.counselType}&${list.intakeCd}" ><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></a>
										</c:when>
										<c:otherwise>
											<a href="#none" onclick="alert('상담 완료 후 입력이 가능합니다.')" value="${list.counselCd}&${list.userKey}&${list.counselType}&${list.intakeCd}" ><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></a>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>다음회기등록</th>
						<td>
							<c:if test="${list.extensionStatus eq '100932'}">
								연장완료
							</c:if>
							<c:if test="${list.extensionStatus eq '100931' or empty list.extensionStatus}">
								<span class="btnExtend" style="color:#2F80ED" userKey="${list.userKey}" counselCd="${list.counselCd}" clientCd="${list.clientCd}" userStatus="${list.userStatus}" userUseYn="${list.useYn}" counselDate="${list.ymd}" channelType="${list.channelType }">다음회기등록 &gt;</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>상담일정변경</th>
						<td>
							<span class="counselChange" style="color:#2F80ED" userKey="${list.userKey}" counselCd="${list.counselCd}" clientCd="${list.clientCd}" userStatus="${list.userStatus}" userUseYn="${list.useYn}" counselDate="${list.ymd}" channelType="${list.channelType }">상담일정변경 &gt;</span>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
		</div>
		<div class="content-wrapper" style="margin-bottom:5vw">
			<table width="100%" style="border-collapse:collapse;">
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
		<input type="button" class="bottom-fixed-btn" value="상담사/일정 변경" onclick="doCounselChange();"/>
	</div>
</form:form>
<form action="/partner/pCounselorMgr/doExtension" id="doExtensionFrm" method="post"></form>
</body>
</html>