<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>예약확정현황</title>
<script type="text/javascript">
j$(document).ready(function(){
	
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
		
		
		var sdate= new Date("2019/12/21 00:00:00"); // KNOC
		var edate= new Date("2019/12/31 23:59:59"); // KNOC
		var scheduleDt = $(this).attr("counselDate");
		
		var relation = $(this).attr("relation");
		var userKey = $(this).attr("userKey");
		var counselToChildrenCount = 0;
		
		if((clientCd == "samsunglife" || clientCd == "test") && relation == "100443") { // 자녀상담의 경우 연장신청을 위해 검증을 거침
			j$.ajax({
				method : 'get',
				url : '/partner/pCounselorMgr/countByCounselToChildren',
				data : {"clientCd" : clientCd, "userKey" : userKey},
				dataType : 'json',
				async : false,
				success : function(data){
					counselToChildrenCount = data.counselToChildrenCount;
				}
			});
		
			if(counselToChildrenCount >= 2) {
				alert("삼성생명의 자녀상담은 2회기로 제한되어 있습니다.\n실제로 1회기만 진행하였으나,\n일정 연장등록이 안될경우 네이버 톡톡 or 전화 부탁드립니다.");			
					
				return false;
			}
		}
		
		if(userUseYn == 'N'){				// 사용불가 상태의 아이디
			alert('사용불가 처리된 아이디입니다.');
		}else if(userStatus == '100009'){	// 고객이 퇴직 상태이면
			alert('퇴직처리된 아이디입니다.');
		}else if (sameJedoYn == 'N'){		// 연장하려는 상담이 현재 제도와 동일하지않다면
			alert('해당 고객사의 계약갱신으로 임직원의 신규상담 재신청이 필요합니다.\n아래의 번호로 임직원이 직접 신규상담을 재신청할 수 있도록 안내를 부탁드립니다.\n\n* 신규상담 신청번호 : 02-3439-9412\n* 문의사항 : 이지웰니스 02-6909-4414');
		} else if((clientCd == "hustory") && scheduleDt <= "2019-12-31") {
			alert("계약기간 및 이용한도 리뉴얼로,\n이전 연도에서 상담연장신청은 불가능 합니다.\n신규 상담신청 부탁드립니다. ")
		} else {
			location.href = "/partner/pCounselorMgr/partnerCounselForm?userKey=" + $(this).attr("userKey") + "&counselCd=" + $(this).attr("counselCd");
		}
	});

	$(".btnLimit").click(function () {
		var userKey = $(this).attr("userKey");
		var clientCd = $(this).attr("clientCd");
		$.divPop("viewDetail", "개인 한도/잔여한도", "/madm/layerPopup/limitDetail?userKey=" + userKey + "&clientCd=" + clientCd);
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
			
			params.centerSeq = $("input[type='radio']:checked").parent().siblings().find("input.centerSeq").val();
			params.counselorId = $("input[type='radio']:checked").parent().siblings().find("input.counselorId").val();
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
	});

	j$(".viewDetail").click(function(){
		var counselCd = $(this).attr("val");
		j$.divPop("viewDetail", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/intakeDetail?counselCd="+counselCd);
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
	params.counselCd = $("input[type='radio']:checked").parent().siblings().find("input.counselCd").val();
	
	j$.ajax({
		url: '/partner/pCounselorMgr/getCanExtension',
		data: params,
		dataType: 'json',
		type: 'GET',
		cache:true,
		success: function(data, textStatus){
			if (data.ret === 'Y') {
				var formHtml = "	<input type='hidden' name='intakeCd' value='" + $("input[type='radio']:checked").parent().siblings().find("input.intakeCd").val() + "'>";
				formHtml += "	<input type='hidden' name='counselorId' value='" + $("input[type='radio']:checked").parent().siblings().find("input.counselorId").val() + "'>";
				formHtml += "	<input type='hidden' name='centerSeq' value='" + $("input[type='radio']:checked").parent().siblings().find("input.centerSeq").val() + "'>";
				formHtml += "	<input type='hidden' name='counselCd' value='" + $("input[type='radio']:checked").parent().siblings().find("input.counselCd").val() + "'>";
				formHtml += "	<input type='hidden' name='userKey' value='" + $("input[type='radio']:checked").parent().siblings().find("input.userKey").val() + "'>";
				formHtml += "	<input type='hidden' name='scheduleSeq' value='" + j$("#extStTime option:selected").val() + "'>";
				formHtml += "	<input type='hidden' name='stTime' value='" + j$("#extStTime option:selected").text() + "'>";
				formHtml += "	<input type='hidden' name='clientCd' value='" + $("input[type='radio']:checked").parent().siblings().find("input.clientCd").val() + "'>";
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
	var counselType = $("input[type='radio']:checked").parent().siblings().find("input.counselType").val();       // 상담코드
	if (counselType == "100437") {
		alert("현재 진단은 일정을 변경 할 수 없습니다.");
		return;
	}
	
	
	var params = {};
	params.counselCd = $("input[type='radio']:checked").parent().siblings().find("input.counselCd").val();       // 상담코드
	
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
	var ymd = $("input[type='radio']:checked").parent().siblings().find("input.ymd").val();       // 년월일
	
	if(ymd < ymdLimit) {
		alert("월이 변경되면 지난달의 상담일정 변경은 불가합니다. \n이지웰니스(네이버톡톡)으로 문의 주세요. 감사합니다.");
		
		return;
	}
	
	var counselCd = $("input[type='radio']:checked").parent().siblings().find("input.counselCd").val();       // 상담코드
	$.divPop("counselChangePopup", "상담사/일정 변경", "/partner/pCounselorMgr/counselorChange/layerPopup?counselCd=" + counselCd);
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

<div class="web">
<form:form id="searchWaitList" modelAttribute="counselReservationDto" action="/partner/pCounselorMgr/counselFixList" method="GET">

<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">예약확정현황</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="6" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						
 							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">고객사</th>
						    	<td width="40%" align="left"  style="padding-left: 5px;">
						    		<select id="clientCd" name="clientCd" style="height: 20px;" onchange="clientReload('sel');">
						    			<option value="">---- 선택 ----</option>
						    			<c:forEach var="list" items="${clientList}">
						    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq ecrmTaskDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
						    			</c:forEach>
						    		</select>
						    		<input type="text" id="chkClientCd" value="" onkeyup="clientReload('txt');" style="width:350px;" placeholder="고객사명을 입력 또는 선택하세요.">
						    	</td>
						    </tr> 
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">임직원명</th>
						    	<td colspan="5" align="left">
						    		<input name="ownerNm" value="${counselReservationDto.ownerNm}" type="text" style="width:100px;"/>
						    	</td>
						    </tr>
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">내담자명</th>
						    	<td colspan="5" align="left">
						    		<input name="counselNm" value="${counselReservationDto.counselNm}" type="text" style="width:100px;"/>
						    	</td>
						    </tr>
						   <sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
						   <tr>
						            	<th width="15%" bgcolor="#F5F5F5" align="center">상담자명</th>
								    	<td colspan="2" width="35%" align="left">
								    		<input name="counselorNm" value="${counselReservationDto.counselorNm}" type="text" style="width:100px;"/>
								    	</td>
							</tr colspan="5">
							</sec:authorize>


							<tr align="left" height="30px">
								<th width="10%" bgcolor="#F5F5F5" align="center">상담일자</th>
						    	<td colspan="5" width="90%" align="left">
						    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${param.startDt}"/>
									<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									&nbsp;~&nbsp;
									<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${param.endDt}"/>
									<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									<input type="button" onclick="todayBtn();"  value="오늘"/>
									<input type="button" onclick="weekBtn();"  value="1주일"/>
									<input type="button" onclick="fifteenBtn();"  value="15일"/>
									<input type="button" onclick="monthBtn();"  value="1개월"/>
									<input type="hidden" id="orderByType" name="orderByType" value="${counselReservationDto.orderByType}"/>
									<input type="hidden" id="orderByNm" name="orderByNm" value="${counselReservationDto.orderByNm}"/>
									
						    	</td>
							</tr>
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>

				<tr>
					<td height="10px"></td>
				</tr>

				<tr>
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
								    		<td id="btn01"><a href="#"><span id="searchBtn">검 색</span></a></td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>

				<tr>
					<td>
						<!-- 채널 영역 시작 -->
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr>
											<td align="left">
												<strong>조회건 : ${paging.totalCount} </strong>
												<span style="margin-left: 20px;"></span>
												<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<!-- 채널 정보 시작 -->
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<td bgcolor="#F5F5F5" width="3%"><strong>선택</strong></td>
											<!-- <td bgcolor="#F5F5F5" width="7%"><strong>상담코드</strong></td> --> <!-- 사용안함 -->
											<td bgcolor="#F5F5F5" width="8%"><strong>고객사</strong></td>
											<td bgcolor="#F5F5F5" width="5%"><strong>임직원명</strong></td><!-- 임직원 추가 -->
											<!-- <td bgcolor="#F5F5F5" width="8%"><strong>상담 운영<br>담당자</strong></td> --><!-- 사용안함 -->
											

											<td bgcolor="#F5F5F5" width="7%"><strong>내담자명
											
												<c:if test="${counselReservationDto.orderByType eq 'DESC' && counselReservationDto.orderByNm eq 'counselor'}">
												<span onclick="changeOrderbyNm()" class="searchOrderNm  down cursor_pointer" >▽</span>
												</c:if>
												<c:if test="${counselReservationDto.orderByType eq 'ASC' && counselReservationDto.orderByNm eq 'counselor'}">
												<span onclick="changeOrderbyNm()" class="searchOrderNm  up cursor_pointer" >△</span>
												</c:if>
												<c:if test="${counselReservationDto.orderByNm ne 'counselor'}">
												<span onclick="changeOrderbyNm()" class="searchOrderNm cursor_pointer" >-</span>
												</c:if>
											</strong>
											</td>
											<td bgcolor="#F5F5F5" width="8%"><strong>상담일시
											<c:if test="${counselReservationDto.orderByType eq 'DESC' && counselReservationDto.orderByNm eq 'date'}">
												<span onclick="changeOrderbyDate()" class="searchOrderDate down cursor_pointer">▽</span>
											</c:if>
											<c:if test="${counselReservationDto.orderByType eq 'ASC' && counselReservationDto.orderByNm eq 'date'}">
												<span onclick="changeOrderbyDate()" class="searchOrderDate up cursor_pointer">△</span>
											</c:if>
											<c:if test="${counselReservationDto.orderByNm ne 'date'}">
												<span onclick="changeOrderbyDate()" class="searchOrderDate cursor_pointer">-</span>
											</c:if>
											</strong></td>
											
											<td bgcolor="#F5F5F5" width="7%"><strong>연락처</strong></td>
											<td bgcolor="#F5F5F5" width="6%"><strong>상담사</strong></td>
											<td bgcolor="#F5F5F5" width="6%"><strong>상담방법</strong></td>
											<td bgcolor="#F5F5F5" width="7%"><strong>사례위험도</strong></td><!-- 사례위험도 추가 -->
											<td bgcolor="#F5F5F5" width="10%"><strong>상담분야</strong></td>
											
											
											<td bgcolor="#F5F5F5" width="7%"><strong>첫일정<br/>확정</strong></td>
											<td bgcolor="#F5F5F5" width="6%"><strong>일지작성</strong></td>
											<!-- <td bgcolor="#F5F5F5" width="auto;"><strong>한도조회</strong></td> --><!-- 사용안함 -->
											<td bgcolor="#F5F5F5" width="8%"><strong>다음회기등록<!-- <br>(포인트 즉시결제) --></strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>연장신청상태</strong></td>
										</tr>

										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td><input type="radio" name="selectUser" class="selectUser"/></td><!-- 선택 -->
											<%-- <td >${list.counselCd}</td> --%><!-- 상담코드 -->
											<td >${list.clientNm }</td><!-- 고객사 -->
											<th >${list.ownerNm }</th><!-- 임직원명 -->
											<%-- <th >${list.counselMgrNm }</th> --%><!-- 상담 운영 -->
											<td  class="viewDetail" val="${list.counselCd }" ><!-- 내담자명 -->
												<a href="javascript:void(0);"><span style="font-weight: bold; color: blue;">
													${list.counselNm }
												</span></a>
												<input type="hidden" class="userKey" value="${list.userKey}"/>
												<input type="hidden" class="counselCd" value="${list.counselCd}"/>
												<input type="hidden" class="intakeCd" value="${list.intakeCd}"/>
												<input type="hidden" class="clientCd" value="${list.clientCd}"/>
												<input type="hidden" class="ymd" value="${list.ymd }"/>
												<input type="hidden" class="counselNm" value="${list.counselorNm }"/>
												
											</td>
											<td >${list.ymd } ${list.stTime }</td><!-- 상담일시 -->
											<td >${list.mobile }</td><!-- 연락처 -->
											<td >
												
												<a href="/partner/pCounselorMgr/pCounselSchedule?selectId=${list.counselorId}">${list.counselorNm }</a>
												<input type="hidden" class="counselorId" value="${list.counselorId}"/>
												<input type="hidden" class="centerSeq" value="${list.centerSeq}"/>
											</td><!-- 상담사 -->
											<td >
												<comm:commNmOut code="${list.counselType }"  option="commCd"/>
												<input type="hidden" class="counselType" value="${list.counselType }">
											</td><!-- 상담방법 -->
											<td>${list.risk}단계</td><!-- 사례 위험도 -->
											<td ><comm:commNmOut code="${list.counselDiv }"  option="category"/></td>
											
											
											<td >${list.counselReservChk }</td><!-- 1회기 -->
											
											
											<%-- 데이터 날짜 데이터 --%>
											<c:set scope="page" var="userCounselDate">${list.ymd } ${list.stTime }</c:set>
											<fmt:parseDate value="${userCounselDate }" pattern="yyyy-MM-dd HH:mm" var="userCounselDt" />
											<fmt:formatDate value="${userCounselDt }" pattern="yyyyMMddHHmm" var="userCounselDtStr" />
											
											<c:choose>
												<c:when test="${list.recordStatus == 100695}">
													<td><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></td><!--  -->
												</c:when>
												<c:when test="${list.recordStatus == 100696}">
													<td><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></td>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${userCounselDtStr < nowDate }">
										<!-- 일지상태 -->			<td><a href="#" class="pCounselorDateModify" value="${list.counselCd}&${list.userKey}&${list.counselType}&${list.intakeCd}" ><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></a></td>
														</c:when>
														<c:otherwise>
															<td><a href="#none" onclick="alert('상담 완료 후 입력이 가능합니다.')" value="${list.counselCd}&${list.userKey}&${list.counselType}&${list.intakeCd}" ><strong><comm:commNmOut option="commCd" code="${list.recordStatus}"/></strong></a></td>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
											<%-- <td>
												<input type="button" value="한도조회" class="btnLimit" userKey="${list.userKey}" clientCd="${list.clientCd}">
											</td> --%><!-- 한도조회 -->
											<td>
												<c:if test="${list.extensionStatus eq '100932'}">
													연장완료
												</c:if>
												<c:if test="${list.extensionStatus eq '100931' or empty list.extensionStatus}">
													<input type="button" value="다음회기등록" class="btnExtend" userKey="${list.userKey}" counselCd="${list.counselCd}" 
													clientCd="${list.clientCd}" userStatus="${list.userStatus}" userUseYn="${list.useYn}" counselDate="${list.ymd}" channelType="${list.channelType }">
												</c:if>
											</td><!-- 다음회기등록 -->
											<td>
												<c:if test="${list.extensionStatus eq '100930'}">
													상담연장 신청상태
												</c:if>
								    			<c:if test="${list.extensionStatus eq '100931'}">
													상담연장 승인
												</c:if>
												<c:if test="${list.extensionStatus eq '100932'}">
													상담연장 완료
												</c:if>
											</td><!-- 연장신청상태 -->
										</tr>
										</c:forEach>
									</table>
									<br>
									<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
										<tr>
											<td align="left">
												<input type="button" onclick="doCounselChange();" value="상담사/일정 변경" style="font-size:18px;"/>
												<br/><br/>
												<span style="font-weight: bold; color: red">[상담사/일정 변경방법]
												<br/>* 희망하는 내담자의 "선택버튼"을 누른 후 상담사/일정 변경버튼 클릭시 변경하실수있습니다.</span>
											</td>
											<td align="right">
												<%-- 기능 삭제 -> 리스트내 연장신청 버튼 이용
												<input type="text" name="extensionDt" size="10" class="date_timepicker_extensionDt" value=""/>
												<img id="btExtensionDt" src="${url:img('/images/icon02.jpg')}"border="0" />&nbsp;
												<select name="extStTime" id="extStTime">
												</select>&nbsp;
												<input type="button" onclick="doExtension();" value="연장하기"/> --%>
											</td>
										</tr>
									</table>
									<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
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
									<!-- 채널 정보 종료 -->
								</td>
							</tr>
						</table>
						<!-- 채널 영역 종료 -->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form:form>
<form action="/partner/pCounselorMgr/doExtension" id="doExtensionFrm" method="post">
</form>

</div>



</body>
</html>