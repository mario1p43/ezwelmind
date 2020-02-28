<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>멘탈헬스 자가진단</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>

<script type="text/javascript">
j$(document).ready(function(){
	j$(function() {
		j$( ".startDt, .endDt").datepicker({
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
			yearRange: "-1:+1",
			beforeShow: function (){},
			dateFormat: "yy-mm-dd",
			onSelect: function (dateText){
			}
		});
	});
	
	
	j$('.startTime, .endTime').timepicker({ 
	    timeFormat: 'HH:mm', 
		minTime: '00:00',
        maxHour: 24,
        maxMinutes: 59,
        startTime: new Date(0,0,0,0,0,0),
        interval: 1,
        change: function(time) {
        }
	});
	
	j$("#insertBtn").click(function(){
		var clientCd = $("#clientCd").val();
		var pollNm = $("#pollNm").val();
		var startDt = $("#startDt").val();
		var startTime = $("#startTime").val();
		var endDt = $("#endDt").val();
		var endTime = $("#endTime").val();
		
		if (pollNm == "") {
			alert("설문명을 입력하세요."); 
			$("#pollNm").focus();
			return;
		}

		if (clientCd == "") {
			alert("온라인진단 코드(고객사코드)를 입력하세요.."); 
			$("#clientCd").focus();
			return;
		}

		if (startDt == "") {
			alert("시작일을 입력하세요."); 
			$("#startDt").focus();
			return;
		}
		
		if (startTime == "") {
			alert("시작시간을 입력하세요."); 
			$("#startTime").focus();
			return;
		}
		
		if (endDt == "") {
			alert("종료일을 입력하세요."); 
			$("#endDt").focus();
			return;
		}
		
		if (endTime == "") {
			alert("종료시간 입력하세요."); 
			$("#endTime").focus();
			return;
		}
		
		var params = {};
		params.clientCd = clientCd;

		$.ajax({
			url: '/madm/diagnosis/checkClientCd',
			data: params,
			dataType: 'json',
			type: 'post',
			success: function(data) {
				if (data.resultValue == 0) {
					if(confirm("저장하시겠습니까?")){
						$("#insertDiagnosis").submit();
					}
				}else{
					alert("중복된 온라인진단 코드가 있습니다.");
					return;
				}
			}
		});
		
	});
});
</script>
</head>
<body>

<form:form id="insertDiagnosis" modelAttribute="diagnosisDto" action="/madm/diagnosis/insertDiagnosis" method="POST">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">멘탈헬스 자가진단</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="80%" align="left" style="border-collapse:collapse;">
			<tr align="left" height="50px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">설문명</th>
		    	<td  >
		    		<input name="pollNm" id="pollNm" value="" type="text" style="width:100%;"/>
		    	</td>
		    </tr>
			<tr align="left" height="50px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">온라인진단 코드<br>(고객사코드)</th>
		    	<td  >
		    		<input name="clientCd" id="clientCd" value="" type="text" style="width:100%;"/>
		    	</td>
		    </tr>
			<tr align="left" height="50px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">시작일/종료일</th>
		    	<td  >
					<input type="text" id="startDt" name="startDt" class="startDt cal_box" datetimeonly="true" style="width:93px;" value=""/>
					<input type="text" id="startTime" name="startTime" class="startTime cal_box" datetimeonly="true" style="width:115px; margin-top:5px;" value=""/>
					&nbsp;~&nbsp;
					<input type="text" id="endDt"  name="endDt" class="endDt cal_box" datetimeonly="true" style="width:93px;" value=""/>
					<input type="text" id="endTime" name="endTime" class="endTime cal_box" datetimeonly="true" style="width:115px; margin-top:5px;" value=""/>
		    	</td>
		    </tr>
			<tr>
				<th colspan="2"><br>
					관리자 신규 등록은 기본형 셋팅만 가능합니다. <br>
					기본형과 다르게 셋팅이 필요할 경우 담당 개발자에게 문의해주세요.<br><br>
					<strong><온라인자가진단 기본형></strong><br>
					3단계 척도 -> 스트레스 자각 척도, 우울감, 직무스트레스 요인<br><br>							
				</th>
			</tr>
			<tr align="center" height="60px">
				<td colspan="2">
					<input type="button" id="insertBtn" value="등록" />
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

</table>
</form:form>
</body>
</html>

