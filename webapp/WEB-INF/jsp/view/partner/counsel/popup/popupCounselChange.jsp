<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<script>
	$('.popYmd').datetimepicker({
		format:'Y.m.d',
		timepicker:false,
		maxDate:'${clientJedoPeriod.endDd}'
	});
	
	
	$(document).ready(function() {
		var dt = "${counsel.scheduleDt}";
		var year = dt.substring(0, 4);
		var month = dt.substring(4, 6);
		var day = dt.substring(6, 8);
		var time = dt.substring(8, 10);
		var time2 = dt.substring(10, 12);
		
		$("#popYmd").val(year + "." + month + "." + day);
		$("#popStTime").val(time);
		$("#popStTime2").val(time2);
		
		$("#info_date").text(year+"년"+month+"월"+day+"일");
		$("#info_time").text(time+"시"+time2+"분");
		$("#info_counselor").text($(".counselNm").val()+"("+$(".counselorId").val()+")");
	});
	
	function scheduleConfirm() {
		var params = {};
		params.userId = $("#popCounselorList").val();
		params.ymd = replaceAll($("#popYmd").val(), ".", "");
		params.stTime = $("#popStTime").val()+$("#popStTime2").val();
		params.clientCd = $("#clientCd").val();
		if ($("input:checkbox[id='smsYn']").is(":checked")) {
			params.smsYn = "Y";
		} else {
			params.smsYn = "N";
		}
		
		if (params.ymd == "") {
			alert("변경 날짜를 선택해주세요.");
			return;
		}
		if (params.stTime == "") {
			alert("변경 시간을 선택해주세요.");
			return;
		}
		
		$.ajax({
			url: '/partner/pCounselorMgr/counselScheduleConfrim',
			data: params,
			dataType: 'json',
			type: 'get',
			success: function(data) {
				if (data.resultValue == "1001") {
					if (confirm("※상담사가 등록한 스케줄은 없지만 시스템으로 등록하고, \n[상담코드:" + $("#counselCd").val() + "] 상담을 변경하시겠습니까?")) {
						executeChange(params);
					}
				} else if (data.resultValue == "1002") {
					if (confirm("[상담코드:" + $("#counselCd").val() + "] 상담을 변경하시겠습니까?")) {
						executeChange(params);
					}
				} else if (data.resultValue == "1003") {
					alert("상담사 스케줄이 이미 등록되어 있어서, \n변경이 불가능합니다.");
				} else if (data.resultValue == "1004") {
					alert("해당 일자는 계약기간이 지난 시점으로 상담변경이 불가능합니다.");
				}
			}
		});
	}
	
	
	function executeChange(params) {
		params.centerSeq = $("#popCenterList").val();
		params.counselCd = $("#counselCd").val();
		
		if (params.centerSeq == "") {
			return;
		}
		
		$.ajax({
			url: '/partner/pCounselorMgr/counselScheduleChange',
			data: params,
			dataType: 'json',
			type: 'get',
			success: function(data) {
				if (data.resultValue == "success") {
					alert("상담사/일정이 변경되었습니다.");
					location.reload(true);
				} else {
					alert("실패하였습니다. 관리자에게 문의주세요.");
				}
			}
		});
	}
	

	
</script>

<input type="hidden" id="counselCd" value="${counselCd}">

<div>
<div class="mb10">
	현재 상담사:<span id="info_counselor"></span> 상담 날짜:<span id="info_date"></span> 시간:<span id="info_time"></span> 
</div>
	<input type="hidden" id="popCenterList" value="${counsel.centerSeq}" readonly> 
	<input type="hidden" id="clientCd" value="${counsel.clientCd}" readonly>

	<span>변경할 상담사 :</span>
	<c:choose>
		<c:when test="${not empty counselorList}">
			<select id="popCounselorList">
				<c:forEach var="list" items="${ counselorList }">
					<c:if test="${list.mgrStatus eq 'Y'}">
						<option value="${list.userId}" <c:if test="${oriCounselor eq list.userId}">selected</c:if>>${list.userId}(${list.userNm})</option>
					</c:if>
				</c:forEach>
			</select>
		</c:when>
		<c:otherwise>
			<input type="hidden" id="popCounselorList" value="${oriCounselor}" readonly>
		</c:otherwise>
	</c:choose>
<br>
<br>
	<span>변경할 날짜 :</span>
	<input type="text" size="10" class="popYmd" id="popYmd" style="width: 76px;" value="" placeholder="==날짜선택==" readonly>
	<span>변경할 시간 :</span>
	<select id="popStTime">
		<option value="">= 시간 선택 =</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		<option value="13">13</option>
		<option value="14">14</option>
		<option value="15">15</option>
		<option value="16">16</option>
		<option value="17">17</option>
		<option value="18">18</option>
		<option value="19">19</option>
		<option value="20">20</option>
		<option value="21">21</option>
		<option value="22">22</option>
	</select>
	<span>변경할 분 :</span>
	<select id="popStTime2">
		<option value="">= 분 선택 =</option>
		<option value="05">05</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
		<option value="25">25</option>
		<option value="30">30</option>
		<option value="35">35</option>
		<option value="40">40</option>
		<option value="45">45</option>
		<option value="50">50</option>
		<option value="55">55</option>
		<option value="00">00</option>
	</select>
	<br>
	<br>
	<input id="smsYn" type="checkbox">SMS전송여부
	<br>
	<input type="button" onclick="scheduleConfirm();" value="변경가능여부 확인"/>
	<div style="padding-top:20px;">
 		<strong>[중요공지]</strong><br> 
 		<span style="color:red;">상담신청은 서비스기간 내</span>에서만 일정등록이 가능합니다.<br>
 		* 서비스 기간 : ${clientJedoPeriod.startDd} ~ ${clientJedoPeriod.endDd} <br>
 		문의사항은 이지웰니스로 연락부탁드립니다.(네이버톡톡:초록색배너 클릭)
 	</div>
</div>