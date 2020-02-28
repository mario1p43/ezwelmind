<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>예약확정현황</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	
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
			
			if (d < 10) {
				d = "0" + d;
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
				url: '/madm/counsel/getScheduleTimeList',
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
	
/* 	j$("select#centerList").on("change", function(){
		j$("select#clientCd").val("");
		j$("#searchWaitList").submit();
		
	});
	
	j$("select#clientList").on("change", function(){
		j$("select#centerSeq").val("");
		j$("#searchWaitList").submit();
	}); */
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

function doExtension() {
	if(!j$("#extStTime option:selected").val()){
		alert("연장할 상담건과 예약일자, 시간을 먼저 선택해 주세요.");
		return;
	}
	
	var params = {};
	params.counselCd = $("input[type='radio']:checked").parent().siblings().find("input.counselCd").val();
	
	j$.ajax({
		url: '/madm/counsel/getCanExtension',
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
				j$("#doExtensionFrm").attr("method", "POST");
				j$("#doExtensionFrm").removeAttr("target");
				j$("#doExtensionFrm").append(formHtml);
				j$("#doExtensionFrm").submit();				
			} else {
				alert("이미 연장 신청상태 이거나, 연장 신청이 불가능한 상태 입니다.");
			}
		}
	});
}

function addCounsel() {
	var formHtml = "<input type='hidden' name='searchType' value='view'/>";
	j$("#doExtensionFrm").empty();
	j$("#doExtensionFrm").append(formHtml);
	j$("#doExtensionFrm").attr("method", "GET");
	j$("#doExtensionFrm").attr("action", "/madm/counsel/addCounsel");
	j$("#doExtensionFrm").attr("target", "_blank");
	j$("#doExtensionFrm").submit();	
}

function gotoPay(cmd, obj) {
	var clientCd = j$(obj).parents("tr:eq(0)").find("input.clientCd").val();
	var formHtml = "<input type='hidden' name='cmd' value='" + cmd + "'/>";
	formHtml += "<input type='hidden' name='userKey' value='" + j$(obj).parents("tr:eq(0)").find("input.encUserKey").val() + "'/>"
	
	j$("#doExtensionFrm").empty();
	j$("#doExtensionFrm").append(formHtml);
	j$("#doExtensionFrm").attr("method", "POST");
	if(location.toString().indexOf("//dev") > 0){
		j$("#doExtensionFrm").attr("action", "http://dev-" + clientCd + ".sangdam4u.com/login/sso2");
	}else{
		j$("#doExtensionFrm").attr("action", "http://" + clientCd + ".sangdam4u.com/login/sso2");
	}
	j$("#doExtensionFrm").attr("target", "_blank");
	j$("#doExtensionFrm").submit();	
}

/**
 * 일지변경 로직
 */
function doRecordChange() {
	var params = {};
	params.recordStatus = $("input[type='radio']:checked").parent().siblings().find("[name=recordStatus]").val(); // 상담일지 상태
	params.counselCd = $("input[type='radio']:checked").parent().siblings().find("input.counselCd").val();       // 상담코드
	
	if (typeof params.recordStatus == "undefined") {
		alert("상담을 선택해주세요.");
		return;
	}
	
	if (confirm("상담코드 : [" + params.counselCd + "]를 일지를 변경 하시겠습니까?")) {
		j$.ajax({
			url: '/madm/counsel/modefyRecordStatus',
			data: params,
			dataType: 'json',
			type: 'get',
			success: function(data, textStatus){
				if (data.updateCnt == "1") {
					alert("일지상태값이 변경되었습니다.");
				} else {
					alert("실패하였습니다. 관리자에게 문의주세요.");
				}
			}
		});
	}
}

/**
 * 상담취소 로직
 */
function doCounselCancel() {
	var params = {};
	params.counselCd = $("input[type='radio']:checked").parent().siblings().find("input.counselCd").val();       // 상담코드
	params.smsYn = "N";
	
	if (typeof params.counselCd == "undefined") {
		alert("상담을 선택해주세요.");
		return;
	}
	
	if (confirm("취소시 SMS를 보내시겠습니다.\n[확인:예][취소:아니요]")) {
		params.smsYn = "Y"
	}
	
	if (confirm("상담코드 : [" + params.counselCd + "]를 취소하시겠습니까? \n\n※취소후에는 복원이 불가능합니다.\n※상담날짜가 지났어도 100% 취소가 됩니다.")) {
		j$.ajax({
			url: '/madm/counsel/counselCancel',
			data: params,
			dataType: 'json',
			type: 'get',
			success: function(data, textStatus){
				if (data.resultValue == "success") {
					alert("취소되었습니다.");
					location.reload(true);
				} else {
					alert("실패하였습니다. 관리자에게 문의주세요.");
				}
			}
		});
	}
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
	
	var counselCd = $("input[type='radio']:checked").parent().siblings().find("input.counselCd").val();       // 상담코드
	$.divPop("counselChangePopup", "상담사/일정 변경", "/madm/counselor/counselorChange/layerPopup?counselCd=" + counselCd);
}

</script>
</head>
<body>

<form:form id="searchWaitList" modelAttribute="ClientCounselDto" action="/madm/counsel/counselList" method="POST">
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
								<th width="10%" bgcolor="#F5F5F5" align="center">내담자명</th>
						    	<td align="left">
						    		<input name="counselNm" value="${counselReservationDto.counselNm}" type="text" style="width:100px;"/>
						    	</td>
						    	<th width="10%"  bgcolor="#F5F5F5" align="center">상담센터</th>
						    	<td align="left">
						    		<select name="centerSeq" id="centerList">
						    			<option value="">전체</option>
						    			<c:forEach var="item" items="${centerList}">
						    				<option value="${item.centerSeq}" <c:if test="${item.centerSeq eq counselReservationDto.centerSeq}"> selected </c:if> >${item.centerNm}</option>
						    			</c:forEach>
						    		</select>
								</td>
						    </tr>
						   <tr>
								<th width="10%" bgcolor="#F5F5F5" align="center">상담자명</th>
								<td width="35%" align="left">
									<input name="counselorNm" value="${counselReservationDto.counselorNm}" type="text" style="width:100px;"/>
								</td>
								<th width="10%"  bgcolor="#F5F5F5" align="center">고객사</th>
						    	<td align="left">
						    		<select name="clientCd" id="clientList">
						    			<option value="">전체</option>
						    			<c:forEach var="item" items="${clientList}">
						    				<option value="${item.clientCd}" <c:if test="${item.clientCd eq counselReservationDto.clientCd}"> selected </c:if>>${item.clientNm}</option>
						    			</c:forEach>
						    		</select>
								</td>
							</tr>


							<tr align="left" height="30px">
								<th width="10%" bgcolor="#F5F5F5" align="center">상담일자</th>
						    	<td width="35%" align="left">
						    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${param.startDt}"/>
									<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									&nbsp;~&nbsp;
									<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${param.endDt}"/>
									<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									<input type="button" onclick="todayBtn();"  value="오늘"/>
									<input type="button" onclick="weekBtn();"  value="1주일"/>
									<input type="button" onclick="fifteenBtn();"  value="15일"/>
									<input type="button" onclick="monthBtn();"  value="1개월"/>
						    	</td>
						    	
								<th width="10%" bgcolor="#F5F5F5" align="center">상담코드</th>
						    	<td align="left">
						    		<input name="counselCd" value="${counselReservationDto.counselCd}" type="text" style="width:100px;"/>
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
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="120%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<td bgcolor="#F5F5F5" width="4%"><strong>선택</strong></td>
											<td bgcolor="#F5F5F5" width="5%"><strong>상담코드</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>고객사</strong></td>
											<td bgcolor="#F5F5F5" width="8%"><strong>상담 운영<br>담당자</strong></td>
											<td bgcolor="#F5F5F5" width="8%"><strong>내담자</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>연락처</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>상담분야</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>상담방법</strong></td>
											<td bgcolor="#F5F5F5" width="8%"><strong>상담일자</strong></td>
											<td bgcolor="#F5F5F5" width="5%"><strong>상담시간</strong></td>
											<td bgcolor="#F5F5F5" width="15%"><strong>상담센터</strong></td>
											<td bgcolor="#F5F5F5" width="8%"><strong>상담사</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>일지작성</strong></td>
											<td bgcolor="#F5F5F5" width="8%"><strong>결제</strong></td>
										</tr>

										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td><input type="radio" name="selectUser" class="selectUser"/></td>
											<td >${list.counselCd}</td>
											<td >${list.clientNm }</td>
											<th >${list.counselMgrNm }</th>
											<td >
												${list.counselNm }
												<input type="hidden" class="userKey" value="${list.userKey}"/>
												<input type="hidden" class="counselCd" value="${list.counselCd}"/>
												<input type="hidden" class="intakeCd" value="${list.intakeCd}"/>
												<input type="hidden" class="clientCd" value="${list.clientCd}"/>
												<input type="hidden" class="encUserKey" value="${list.encUserKey}"/>
											</td>
											<td >${list.mobile }</td>
											<td ><comm:commNmOut code="${list.counselDiv }"  option="category"/></td>
											<td >
												<comm:commNmOut code="${list.counselType }"  option="commCd"/>
												<input type="hidden" class="counselType" value="${list.counselType }">
											</td>
											<td >${list.ymd }</td>
											<td >${list.stTime }</td>
											<td >${list.centerNm}</td>
											<td >
												${list.counselorNm }
												<input type="hidden" class="counselorId" value="${list.counselorId}"/>
												<input type="hidden" class="centerSeq" value="${list.centerSeq}"/>
											</td>
											<td ><comm:select name="recordStatus" code="100691" selectValue="${list.recordStatus}" /></td>
											<td>
												<c:choose>
													<c:when test="${list.needPay eq 'Y'}">
													<input type="button" onClick="gotoPay('${cmd}', this)" value="결제하기"/>
													</c:when>
													<c:otherwise>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										</c:forEach>
									</table>
									<br>
									<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
										<tr>
											<td align="left">
												<!-- <input type="button" onclick="addCounsel();" value="상담신청"/> -->
												<input type="button" onclick="doRecordChange();" value="일지변경"/>
												<input type="button" onclick="doCounselCancel();" value="상담취소"/>
												<input type="button" onclick="doCounselChange();" value="상담사/일정 변경"/>
											</td>
											<td align="right">
												<%-- 기능 삭제 -> 관리자 상담신청 메뉴 이용 
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

<form action="/madm/counsel/doExtension" id="doExtensionFrm" method="post">
</form>

</body>
</html>