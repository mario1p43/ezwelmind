<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>멘탈헬스 자가진단</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script language="JavaScript" type="text/javascript" src="/resources/js/bcrypt.js"></script>

<script type="text/javascript">
j$(document).ready(function(){
	
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
		yearRange: "-1:+1",
		beforeShow: function (){},
		dateFormat: "yy-mm-dd",
		onSelect: function (dateText){
			var pollSeq = j$(this).parent().parent().attr("id");
			var name = j$(this).attr("name");
			updateDateAndTime(pollSeq, name, dateText.replace(/-/gi,""), 'date');
		}
	});
	
	j$('.startTime, .endTime').timepicker({ 
	    timeFormat: 'HH:mm', 
		minTime: '00:00',
        maxHour: 24,
        maxMinutes: 59,
        startTime: new Date(0,0,0,0,0,0),
        interval: 1,
        change: function(time) {
        	var element = j$(this), text;
        	var pollSeq = element.parent().parent().attr("id");
        	var name = j$(this).attr("name");
        	var timepicker = element.timepicker();
        	text = timepicker.format(time);
        	updateDateAndTime(pollSeq, name, text.replace(/:/gi,""), 'time');
        	
        }
	});

	j$("input").keypress(function(e) {
		if (e.which == 13){
			j$("#searchInfo").submit();
			return false;
		};
	});
	j$("#searchBtn").click(function(){
		j$("#searchInfo").submit();
		return false;
	});


	j$(".userList").click(function(){
		var pollSeq = bEnco(j$(this).attr("value"));
		location.href = "/madm/diagnosis/userList?pollSeq="+pollSeq;
		return false;
	});

	j$(".pollModi").click(function(){
		var pollSeq = bEnco(j$(this).attr("value"));
		var url = "/madm/layerPopup/diagnosis/"+pollSeq;
		j$.divPop("pollModi", "온라인진단 수정", url);
		return false;
	});	

});


function updateDateAndTime(pollSeq, name, datetime, type){
	//alert(pollSeq +" " + name + " " + datetime);
	
	j$.ajax({
		type: "POST",
		url: "/madm/diagnosis/updateDateAndTime",
		cache: false,
		//async:false,
		data:"pollSeq="+pollSeq+"&"+name+"="+datetime,
		beforeSend: function() {
			
		},
		success: function(data){
			if(data == "1"){
				alert(type +" " + datetime +" 업데이트완료!");
			}
		},
		complete: function() {
			
		},
		error: function(data){
			alert("업데이트 오류");
		}
	});
}

function fncGoDignoserPage(pollSeq) {
	location.href = "/madm/clientPoll/diagnoser?pollSeq="+pollSeq;
}
</script>
</head>
<body>

<form:form id="searchInfo" modelAttribute="diagnosisDto" action="/madm/diagnosis/infoList" method="GET">
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

		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건
								</strong>
							</td>
							<td align="right">
								<input type="text" id="pollNm" name="pollNm" placeholder="검색어를 입력 하세요." value="${param.pollNm}" style="width:200px; height:20px;"/>
							</td>
							<td id="btn02" width="40px">
								<a href="#">
									<span id="searchBtn">검색</span>
								</a>
							</td>
							<td id="btn01" width="80px">
								<a href="/madm/diagnosis/insertDiagnosis">
									<span >신규등록</span>
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
							<tr>
								<th width="5%" >순번</th>
								<th width="24%">자가진단명</th>
								<th width="17%">온라인진단 코드<br>(고객사코드)</th>
								<th width="17%">시작일시</th>
								<th width="17%">종료일시</th>
								<th width="5%">사용여부</th>
								<th width="5%">상세</th>
								<th width="10%">등록일시</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px" id="${list.pollSeq}">
								<td>
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td><a href="#" class="userList" value="${list.pollSeq}@${list.questionSetSeq}"><strong>${list.pollNm}</strong></td>
								<td><a href="#" class="pollModi" value="${list.pollSeq}"><strong>${list.clientCd}</strong></td>
								<td>
									<input type="text" name="startDt" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${list.startDt}"/>
									<input type="text" name="startTime" class="startTime cal_box" datetimeonly="true" style="width:115px; margin-top:5px;" value="${list.startTime}"/>
								</td>
								<td>
									<input type="text" name="endDt" class="endDt cal_box" datetimeonly="true" style="width:93px;" value="${list.endDt}"/>
									<input type="text" name="endTime" class="endTime cal_box" datetimeonly="true" style="width:115px; margin-top:5px;" value="${list.endTime}"/>
								</td>
								<td>${list.useYn}</td>
								<td><input type="button" onclick="fncGoDignoserPage('${list.pollSeq }');" value="상세 정보" /></td>
								<td>${list.regDt}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</div>
					<br>
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
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form:form>
</body>
</html>

