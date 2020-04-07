<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<style>
	.popup-wrapper{background-color:#FFFFFF}
	.popup-wrapper .popup-title-wrapper{display:flow-root;padding:5vw}
	.popup-wrapper .popup-title-wrapper .popup-title{float:left;font-size:20px;font-weight:bold}
	.popup-wrapper .popup-title-wrapper .popup-close{float:right;cursor:pointer}
	.popup-wrapper .popup-title-wrapper .popup-close img{width:14px;height:14px;padding:3px;vertical-align:-webkit-baseline-middle;}
	
	.popup-wrapper .popup-info-wrapper{display:flow-root;padding:0 4.5vw 4.5vw 4.5vw;font-size:14px}
	.popup-wrapper .popup-content-wrapper{display:flow-root;padding:2.6vw 4.5vw;font-size:14px}	
	.popup-wrapper .popup-content-wrapper.border-top{border-top:1px solid #BDBDBD}
	.popup-wrapper .popup-content-wrapper .content-left{float:left}
	.popup-wrapper .popup-content-wrapper .content-right{float:right}
	.popup-wrapper .popup-content-wrapper .content-title{width:38%;font-weight:bold}
	.popup-wrapper .popup-content-wrapper .content-data{width:62%}
	.popup-wrapper .popup-content-wrapper .content-data select{width:100%;border:0;font-size:14px;outline:none}
	.popup-wrapper .popup-content-wrapper .content-data input{width:100%;border:0;font-size:14px;outline:none}
	.popup-wrapper .popup-content-wrapper .select-sms-time{width:15.5vw;height:9vw;padding:0 2vw;font-size:14px;outline:none}
	.popup-wrapper .popup-content-wrapper select{background:url("${url:resource('/resources/img/ic_select.png')}") no-repeat;background-size:12px 7px;background-position:right 6px top 50%;-webkit-appearance:none;-moz-appearance:none;appearance:none;}
	
	.popup-wrapper .popup-description-wrapper{display:flow-root;padding:2.6vw 4.5vw;font-size:14px;line-height:130%}
	.popup-wrapper .popup-description-wrapper.border-top{border-top:1px solid #BDBDBD}
	.popYmd {background:url("${url:resource('/resources/img/ic_select.png')}") no-repeat;background-size:12px 7px;background-position:right 6px top 50%;-webkit-appearance:none;-moz-appearance:none;appearance:none;}
	
	.popup-bottom-wrapper .bottom-btn{width:100%;height:11vw;font-weight:bold;font-size:16px;color:white;text-align:center;background-color:#006CBA;border:0;outline:none}
</style>

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
		$("#popStTime").val(time+time2);
		$("#smsTime").val(time);
		
		$("#info_date").text(year+"년"+month+"월"+day+"일");
		$("#info_time").text(time+"시"+time2+"분");
		$("#info_counselor").text($(".counselNm").val()+"("+$(".counselorId").val()+")");
		
		
		$("#popStTime").change(function (){
			
			var str = $("#popStTime").val();
			var dd = str.substring( 0, 2);
			
			$("#smsTime").val(dd);
		});
		
	});
	
	function scheduleConfirm() {
		var dt = "${counsel.scheduleDt}";
		var year = dt.substring(0, 4);
		var month = dt.substring(4, 6);
		var day = dt.substring(6, 8);
		var params = {};
		params.userId = $("#popCounselorList").val();
		params.ymd = replaceAll($("#popYmd").val(), ".", "");
		params.stTime = $("#popStTime").val();
		params.clientCd = $("#clientCd").val();
		params.smsDt = year+month+day+$("#smsTime").val()+$("#smsTime2").val();
		
		if ($("input:checkbox[id='smsYn']").is(":checked")) {
			params.smsYn = "Y";
		} else {
			params.smsYn = "N";
		}
		
		if(params.smsDt == ""){
			params.smsDt = params.stTime;
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
					location.href="/partner/pCounselorMgr/counselFixList";
				} else {
					alert("실패하였습니다. 관리자에게 문의주세요.");
				}
			}
		});
	}
	

	
</script>

<input type="hidden" id="counselCd" value="${counselCd}">
<input type="hidden" id="popCenterList" value="${counsel.centerSeq}" readonly> 
<input type="hidden" id="clientCd" value="${counsel.clientCd}" readonly>

<div class="popup-wrapper">
	<div class="popup-title-wrapper">
		<span class="popup-title">상담사/일정 변경</span>
		<span class="popup-close btClose"><img src="${url:resource('/resources/img/close_btn.png')}"></span>
	</div>
	<div class="popup-info-wrapper">
		<div><strong>현재 상담사 : </strong><span id="info_counselor"></span></div>
		<div style="margin-top:1vw"><strong>상담날짜 : </strong><span id="info_date"></span> <span id="info_time"></span></div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-left content-title">변경할 상담사</div>
		<div class="content-right content-data">
			<c:if test="${not empty counselorList}">
				<select id="popCounselorList">
				<c:forEach var="list" items="${ counselorList }">
					<c:if test="${list.mgrStatus eq 'Y'}">
						<option value="${list.userId}" <c:if test="${oriCounselor eq list.userId}">selected</c:if>>${list.userId}(${list.userNm})</option>
					</c:if>
				</c:forEach>
				</select>
			</c:if>
			<c:if test="${empty counselorList}">
				<input type="hidden" id="popCounselorList" value="${oriCounselor}" readonly>
			</c:if>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-left content-title">변경할 날짜</div>
		<div class="content-right content-data">
			<input type="text" class="popYmd" id="popYmd" value="" placeholder="==날짜선택==" readonly>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-left content-title">변경할 시간</div>
		<div class="content-right content-data">
			<select id="popStTime">
				<option value="">시간 선택</option>
				<option value="0700">07:00</option>
				<option value="0800">08:00</option>
				<option value="0900">09:00</option>
				<option value="1000">10:00</option>
				<option value="1100">11:00</option>
				<option value="1200">12:00</option>
				<option value="1300">13:00</option>
				<option value="1400">14:00</option>
				<option value="1500">15:00</option>
				<option value="1600">16:00</option>
				<option value="1700">17:00</option>
				<option value="1800">18:00</option>
				<option value="1900">19:00</option>
				<option value="2000">20:00</option>
				<option value="2100">21:00</option>
				<option value="2200">22:00</option>
			</select>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-left content-title">SMS전송여부</div>
		<div class="content-right">
			<div class="checkbox-wrapper">
				<input id="smsYn" type="checkbox" checked/>
				<label for="smsYn"></label>
			</div>
		</div>
	</div>
	<div class="popup-content-wrapper" style="padding-top:0">
		<div class="content-left" style="line-height:9vw">SMS발송용 상담시간</div>
		<div class="content-right">
			<select id="smsTime" class="select-sms-time" disabled="disabled">
				<option value="">시간</option>
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
			<select id="smsTime2" class="select-sms-time">
				<option value="">분</option>
				<option value="00">00</option>
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
			</select>
		</div>
	</div>
	<div class="popup-description-wrapper border-top">
 		<strong>[중요공지]</strong>
 		<div style="margin-top:0.9vw"><span style="color:#EB5757">상담신청은 서비스기간 내</span>에서만 일정등록이 가능합니다.</div>
 		<div>* 서비스 기간 : ${clientJedoPeriod.startDd} ~ ${clientJedoPeriod.endDd}</div> 
 		<div>문의사항은 이지웰니스로 연락부탁드립니다.</div>
 		<div>(네이버톡톡:초록색배너 클릭)</div>
 	</div>				
</div>
<div class="popup-bottom-wrapper">
	<input type="button" class="bottom-btn" onclick="scheduleConfirm();" value="변경가능여부 확인"/>
</div>