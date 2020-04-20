<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<script>


	$(document).ready(function() {
		var dt = "${counsel.scheduleDt}";
		var year = dt.substring(0, 4);
		var month = dt.substring(4, 6);
		var day = dt.substring(6, 8);
		var time = dt.substring(8, 12);
		var time2 = dt.substring(8, 10);
		
		$("#popYmd").val(year + "." + month + "." + day);
		$("#popStTime").val(time);
		$("#smsTime").val(time2);
		
		$("#popStTime").change(function (){
			
			var str = $("#popStTime").val();
			var dd = str.substring( 0, 2);
			
			$("#smsTime").val(dd);
		});
	});



	$('.popYmd').datetimepicker({
		format:'Y.m.d',
		timepicker:false
	});
	
	
	$("#popCenterList").change(function() {
		$.ajax({
			url: '/madm/counselor/getCounselorList?centerSeq=' + $(this).val(),
			dataType: 'json',
			success: function(data){
				var list = data.counselorList;
				
				$("#popCounselorList option").remove();
				if (list.length == 0) {
					$("#popCounselorList").append("<option value=''>-</option>");
					return;
				}
				var counselorSel = "";
				for (var i = 0; i < list.length; i++) {
					counselorSel = "<option mgrStatus='" + list[i].mgrStatus +"'"
							+ "value='" + list[i].userId + "'>" + list[i].userId + "(" + list[i].userNm + ")";
					if (list[i].mgrStatus == 'S') {
						counselorSel += " - 대기";
					} else if (list[i].mgrStatus == 'N') {
						counselorSel += " - 중지";
					} else if (list[i].mgrStatus == 'R') {
						counselorSel += " - 반려";
					}
					counselorSel += "</option>";
					$("#popCounselorList").append(counselorSel);
					
					//$("#popCounselorList").prepend("<option value='" + list[i].userId + "'>" + list[i].userId + "(" + list[i].userNm + ")" + "</option>");
				}
				
			}
		});
		
		/* 상담사 변경시 세부 */
		$("#popCounselorList").change(function() {
			var mgrStatusTemp = $("#popCounselorList option:selected").attr("mgrStatus");
			if ( mgrStatusTemp == 'N' ) {
				alert('중지상태의 상담사에게는 상담을 신청할 수 없습니다.');
				$("#popCounselorList option:selected").prop("selected", false);
			} else if ( mgrStatusTemp == 'R' ) {
				alert('반려상태의 상담사에게는 상담을 신청할 수 없습니다.');
				$("#popCounselorList option:selected").prop("selected", false);
			} 
		});
	}); 
	
	
	function scheduleConfirm() {
		var params = {};
		params.userId = $("#popCounselorList").val();
		params.ymd = replaceAll($("#popYmd").val(), ".", "");
		params.stTime = $("#popStTime").val();
		
		
		
		
		
		
		
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
		params.counselCd = $("#counselCd").val();
		
		
		
		
		
		if (params.ymd == "") {
			alert("변경 날짜를 선택해주세요.");
			return;
		}
		if (params.stTime == "") {
			alert("변경 시간을 선택해주세요.");
			return;
		}
		
		$.ajax({
			url: '/madm/counselor/counselScheduleConfrim',
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
				} else {
					alert("상담사 스케줄이 이미 등록되어 있어서, \n변경이 불가능합니다.");
				}
			}
		});
	}
	
	
	function executeChange(params) {
		params.centerSeq = $("#popCenterList").val();
		params.counselCd = $("#counselCd").val();
		if ($("input:checkbox[id='smsYn']").is(":checked")) {
			params.smsYn = "Y";
		} else {
			params.smsYn = "N";
		}
		
		if (params.centerSeq == "") {
			return;
		}
		
		$.ajax({
			url: '/madm/counselor/counselScheduleChange',
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

	<select id="popCenterList">
		<c:forEach var="list" items="${ centerList }">
			<option value="${list.centerSeq}" <c:if test="${centerSeq eq list.centerSeq}">selected</c:if>>${list.centerNm}</option>
		</c:forEach>
	</select>

	<select id="popCounselorList">
		<c:forEach var="list" items="${ counselorList }">
			<option value="${list.userId}" <c:if test="${oriCounselor eq list.userId}">selected</c:if>>${list.userId}(${list.userNm})
			<c:if test="${list.mgrStatus eq 'S'}">-대기</c:if>
			<c:if test="${list.mgrStatus eq 'N'}">-중지</c:if></option>
		</c:forEach>
	</select>
	
	<input type="text" size="10" class="popYmd" id="popYmd" value="" readonly>
	
	<select id="popStTime">
		<option value="">선택해주세요.</option>
		<option value="0700">0700</option>
		<option value="0800">0800</option>
		<option value="0900">0900</option>
		<option value="1000">1000</option>
		<option value="1100">1100</option>
		<option value="1200">1200</option>
		<option value="1300">1300</option>
		<option value="1400">1400</option>
		<option value="1500">1500</option>
		<option value="1600">1600</option>
		<option value="1700">1700</option>
		<option value="1800">1800</option>
		<option value="1900">1900</option>
		<option value="2000">2000</option>
		<option value="2100">2100</option>
		<option value="2200">2200</option>
	</select>
		<br>
	<br>
	<input id="smsYn" type="checkbox">SMS전송여부
	<br>
	SMS발송용 상담시간
	<br>
						    	
	<select id="smsTime" disabled="disabled">
		<option value="06">== 시간 선택 ==</option>
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
	<select id="smsTime2">
		<option value="00">= 분 선택 =</option>
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
	<br>
	<br>
	<span>*입력하지 않으면 변경할 시간으로 문자가 전송됩니다.</span>
	<br>	
	<input type="button" onclick="scheduleConfirm();" value="변경가능여부 확인"/>
</div>