<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page import="java.util.GregorianCalendar,java.util.Calendar,java.util.Date,java.text.SimpleDateFormat.*,java.text.SimpleDateFormat"%>
<%@ page import="com.ezwel.core.support.util.DateUtils"%>

<%!
	public int nullIntconv(String inv) {
		int conv = 0;

		try {
			conv = Integer.parseInt(inv);
		} catch (Exception e) {
		}
		return conv;
	}
%>
<%
	int iYear = nullIntconv(request.getParameter("iYear"));
	int iMonth = nullIntconv(request.getParameter("iMonth"));

	Calendar ca = new GregorianCalendar();
	int iTDay = ca.get(Calendar.DATE);
	int iTYear = ca.get(Calendar.YEAR);
	int iTMonth = ca.get(Calendar.MONTH);
	int iTTime = ca.get(Calendar.HOUR);


	if (iYear == 0) {
		iYear = iTYear;
		iMonth = iTMonth;
	}

	GregorianCalendar cal = new GregorianCalendar(iYear, iMonth, 1);

	int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int weekStartDay = cal.get(Calendar.DAY_OF_WEEK);

	cal = new GregorianCalendar(iYear, iMonth, days);
	int iTotalweeks = cal.get(Calendar.WEEK_OF_MONTH);

	String sMonth = new SimpleDateFormat("MM").format(new Date(2008, iMonth, 01));
	GregorianCalendar thisDayCal = new GregorianCalendar(iYear, iMonth, 1);

	String toDate = DateUtils.toDateStringYMDHMS();
	String toMonth = toDate.substring(0, 6);
	String toDay = toDate.substring(6, 8);
	String toTime = toDate.substring(8, 10);
	String thisMonth = "" + thisDayCal.get(Calendar.YEAR) + sMonth;

	String flagTime = "Y";
	if (Integer.parseInt(toMonth) > Integer.parseInt(thisMonth)) {
		flagTime = "P"; // 이전 년월
	} else if (toMonth.equals(thisMonth)) {
		flagTime = "E"; // 현재와같은 년월
	}
%>
<html>
<head>
<style>
.check_cell td{
height: 18px;
cursor: pointer;
}
#tableMonth td{
padding: 5px 0px; 
}

</style>
<title>전체상담일정</title>
<script>
$(document).ready(function(){
	
	$('.mobile_nav ul li a').eq(2).addClass('active');
	$('.mobile_nav ul li a img').eq(2).attr('src', "${url:resource('/resources/img/re_list_icon_active.png')}");
	
	$("#preMonth").click(function(){
		var year = <%=iYear %>;
		var month = <%=iMonth %>+1; 
		var ymd;
		var cYear;
		var cMonth;
		
		if (month == 1) {
			month = 12;
			year = year - 1;
		} else {
			month = month - 1;
			year = year;
		}
			cYear = year;
			cMonth = month - 1;
		if (month < 10) {
			ymd = year+"0"+month;
		} else {
			ymd = year+""+month;
		}
		
		location.href = "/partner/pCounselorMgr/pCounselSchedule?iYear=" + cYear + "&iMonth=" + cMonth + "&thisMonth=" + ymd + "&selectId=" + $("[name='selectId']").val(); 
		return false;
	});	
	
	$("#nextMonth").click(function(){
		var year = <%=iYear %>;
		var month = <%=iMonth %>+1; 
		var ymd;
		var cYear;
		var cMonth;
		
		if (month == 12) {
			month = 1;
			year = year + 1;
		} else {
			month = month + 1;
			year = year;
		}
		
		cYear = year;
		cMonth = month-1;
		if (month < 10) {
			ymd = year+"0"+month;
		} else {
			ymd = year+""+month;
		}
		
		location.href = "/partner/pCounselorMgr/pCounselSchedule?iYear=" + cYear + "&iMonth=" + cMonth + "&thisMonth=" + ymd  + "&selectId=" + $("[name='selectId']").val(); 
		return false;
	});	

	$('#updateBtn').click(function() {
		
		var counselorName =  $("[name='selectId'] option:selected").text();
		if (counselorName != "") {
			counselorName += " 상담사의 일정을\n"
		}
		
		$.alert(counselorName + '수정하시겠습니까?',function(){
			
			$(".idx").each(function(){
				var idx = $(this).attr("name").split("_");
				if($(".sangdam_"+idx[1]).is(':checked') || $(".gumsa_"+idx[1]).is(':checked')) {
					$("#idx_"+idx[1]).val(idx[1]);
				}
			});
			
			if( "<%=flagTime%>" == "E" ) {
				$("#humu_"+"<%=toDay%>").attr("disabled", false);
			}
			
			$("#frm").submit();
		 	return false;
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});		
		
	$("#searchBtn").click(function(){
		$("#frm").submit();
		return false;
	});
	
	
	// 로딩시 휴무일 초기화
	for(var i=1;i<31;i++) {
		var strDay = "";
		if(i < 10)
			strDay = "0"+i;
		else 
			strDay = ""+i;
		
		if($("#humu_"+strDay).is(":checked")) {
			$(".sangdamAll_"+strDay).attr("disabled", true);
			$(".gumsaAll_"+strDay).attr("disabled", true);
			$(".sangdam_"+strDay).attr("disabled", true);
			$(".gumsa_"+strDay).attr("disabled", true);
		}
	}
	
	// 현재월 현재시간 이전 데이터 수정불가
	if( "<%=flagTime%>" == "P" ) {
		$("#tableMonth :checkbox").attr("disabled", true);
	} else if( "<%=flagTime%>" == "E" ) {
		for(var i=1;i<31;i++) {
			var strDay = "";
			if(i < 10)
				strDay = "0"+i;
			else 
				strDay = ""+i;
			
			if( i < <%=toDay%> ) {
				$("#table_"+strDay + " :checkbox").attr("disabled", true);
			} else if ( i == <%=toDay%> ) {

				//당일은 휴무일 지정불가
				$("#humu_" + strDay).attr("disabled", true);
				for(var j=7;j<23;j++) {
					var strTime = "";
					if(j < 10)
						strTime = "0"+j;
					else 
						strTime = ""+j;
					
					if( j <= <%=toTime%> ) {
						$("#sangdam_"+strDay+"_"+strTime).attr("disabled", true);
						$("#gumsa_"+strDay+"_"+strTime).attr("disabled", true);
					}
				}
			}
		}
	}
});

//스케쥴체크
function checkboxClick(type,day,time) {
	if(type == 'sangdam') {
		if($("#sangdam_"+day+"_"+time).is(":checked")) {
			$("#gumsa_"+day+"_"+time).prop("checked",false);
		}
	} else if(type == 'gumsa') {
		if($("#gumsa_"+day+"_"+time).is(":checked")) {
			$("#sangdam_"+day+"_"+time).prop("checked",false);
		}
	}
	
}

//휴무
function humuCheck(day) {
	var check = $("#humu_"+day).is(":checked");
	
	if( !("<%=flagTime%>" == "E" && day == <%=toDay%>) ) {
		if(check == true) { //휴무에 체크일경우
			$(".sangdamAll_"+day).attr("disabled", true);
			$(".gumsaAll_"+day).attr("disabled", true);
			$(".sangdam_"+day).attr("disabled", true);
			$(".gumsa_"+day).attr("disabled", true);
		} else { //휴무에 체크가 아닐경우
			$(".sangdamAll_"+day).attr("disabled", false);
			$(".gumsaAll_"+day).attr("disabled", false);
			$(".sangdam_"+day).attr("disabled", false);
			$(".gumsa_"+day).attr("disabled", false);
		}
	}
}

//상담
function sangdamAllCheck(day) {
	var check = $("#sangdamAll_"+day).is(":checked");
	
	if( !("<%=flagTime%>" == "E" && day == <%=toDay%>) ) {
		$("#gumsaAll_"+day).prop("checked",false);
		
		if(check == true){ //상담에 체크일경우
			$(".sangdam_"+day).prop("checked", true);
			$(".gumsa_"+day).prop("checked", false);
		}else{ //상담에 체크가 아닐경우
			$(".sangdam_"+day).prop("checked", false);
		}
	}
}

//검사
function gumsaAllCheck(day) {
	var check = $("#gumsaAll_"+day).is(":checked");
	
	if( !("<%=flagTime%>" == "E" && day == <%=toDay%>) ) {
		$("#sangdamAll_"+day).prop("checked",false);
		
		if(check == true){ //상담에 체크일경우
			$(".sangdam_"+day).prop("checked", false);
			$(".gumsa_"+day).prop("checked", true);
		}else{ //상담에 체크가 아닐경우
			$(".gumsa_"+day).prop("checked", false);
		}
	}
}


/**
 * 센터장일때 다른 상담사 선택
 */
function counselorChange() {
	location.href = "/partner/pCounselorMgr/pCounselSchedule?selectId=" + $("[name='selectId']").val();
}

</script>
</head>

<body>
<form id="frm" modelAttribute="mindScheduleDto" method="post" action="/partner/pCounselorMgr/updadeSchedule">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="2">
		<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-bottom: 1px solid silver;">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td align="left" class="subtitle">일정등록/수정</td>
			</tr>
		</table>
		</td> 
	</tr>
	
		
	<!-- 달력 년도 -->
	<tr>
		
		<td style="width: 50%;">
		<br>
			<span class="moveLeft" style="cursor: pointer;padding: 2px 5px;border: 1px solid #BCBCBC;background: #DDDDDD;margin: 20px;"> < </span><span id="weekMoveTitle">11월</span><span class="moveRight" style="cursor: pointer;padding: 2px 5px;border: 1px solid #BCBCBC;background: #DDDDDD;margin: 20px;"> > </span >
	    	<br>
		    <table border="0" cellpadding="5" cellspacing="0" width="95%" id="tableMonth">
		    	<tbody>
			      <tr>
			      	  <th></th>
			          <th><font color="red">일요일</font></th>
			          <th>월요일</th>
			          <th>화요일</th>
			          <th>수요일</th>
			          <th>목요일</th>
			          <th>금요일</th>
			          <th><font color="#529dbc">토요일</font></th>
			      </tr>
				<%
					int cnt = 1;
					for (int i = 1; i <= iTotalweeks; i++) {
				%>
					<tr class="week<%= i %> none">
					<td >
						<span style="text-align: center;">
							<font size="4">
							<b> 시간 </b>
							</font>
						</span>
						<table cellpadding="5"  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;text-align: center;" bordercolor="#DDDDDD" align="center">
						<tr>
						<td>07:00</td>
						</tr>
						<tr>
						<td>08:00</td>
						</tr>
						<tr>
						<td>09:00</td>
						</tr>
						<tr>
						<td>10:00</td>
						</tr>
						<tr>
						<td>11:00</td>
						</tr>
						<tr>
						<td>12:00</td>
						</tr>
						<tr>
						<td>13:00</td>
						</tr>
						<tr>
						<td>14:00</td>
						</tr>
						<tr>
						<td>15:00</td>
						</tr>
						<tr>
						<td>16:00</td>
						</tr>
						<tr>
						<td>17:00</td>
						</tr>
						<tr>
						<td>18:00</td>
						</tr>
						<tr>
						<td>19:00</td>
						</tr>
						<tr>
						<td>20:00</td>
						</tr>
						<tr>
						<td>21:00</td>
						</tr>
						<tr>
						<td>22:00</td>
						</tr>
						</table>
					
					</td>
	<%-- toDay:<%=toDay %>
					iTotalweeks:<%=iTotalweeks %>
					weekStartDay:<%=weekStartDay %>
					days:<%=days %>
					 --%>
					<%
						for (int j = 1; j <= 7; j++) {
							if (cnt < weekStartDay || (cnt - weekStartDay + 1) > days) {
					%>
							<td align="center" ></td>
					<% 
							} else {
					%>
								<!-- 일 시작 -->
								<td align="center"  id="day_<%=(cnt-weekStartDay+1)%>">
									<span>
									<% if (j == 1) { %>
										<font color="red" size="4">
									<% } else if (j==7) { %>
										<font color="#529dbc" size="4">
									<% } else { %>
										<font size="4">
									<% } %>
										<b> <%=(cnt - weekStartDay + 1)%> 일</b>
										</font>
									</span>
									<c:set var="day" value="<%=(cnt - weekStartDay + 1)%>"/>
									
									<fmt:formatNumber type="number" pattern="00" value="${day}" var="cDay" />
									
									<table class="check_cell" cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD" align="center" id="table_${cDay}">
										<tr>
											<td colspan="4" align="right" style="display: none;">
												<c:set var="humuDay" value="humu_${cDay}"/>
												<input type="checkbox" name="humu_${cDay}" id="humu_${cDay}" value="<%=iYear %><%=sMonth %>${cDay}" onclick="humuCheck('${cDay}')"  ${scheduleMap[humuDay].holidayYn == 'Y'  ? 'checked':''} >휴무
												<input type="hidden" class="idx" name="idx_${cDay}" id="idx_${cDay}" value="">
											</td>
										</tr>
										
										<tr>
											<td style="display:none;">
												<input style="display:none;" type="checkbox" class="sangdamAll_${cDay}" name="sangdamAll_${cDay}" id="sangdamAll_${cDay}" onclick="sangdamAllCheck('${cDay}')" />
											</td>
											<td style="display:none;">
												<input style="display:none;" type="checkbox" class="gumsaAll_${cDay}" name="gumsaAll_${cDay}" id="gumsaAll_${cDay}" onclick="gumsaAllCheck('${cDay}')" />
											</td>
										</tr>
										<tr>
											<td style="display:none;">
												<c:set var="sangdamTime07" value="sangdam_${cDay}_07"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_07" id="sangdam_${cDay}_07" value="<%=iYear %><%=sMonth %>${cDay}-0700-0800" ${scheduleMap[sangdamTime07].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','07')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime07" value="gumsa_${cDay}_07"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_07" id="gumsa_${cDay}_07" value="<%=iYear %><%=sMonth %>${cDay}-0700-0800" ${scheduleMap[gumsaTime07].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','07')" />
											</td>
											<td class="time${cDay}07" onclick="background(this);" 
											${scheduleMap[sangdamTime07].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime07].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime07].ymd eq null && scheduleMap[gumsaTime07].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime08" value="sangdam_${cDay}_08"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_08" id="sangdam_${cDay}_08" value="<%=iYear %><%=sMonth %>${cDay}-0800-0900" ${scheduleMap[sangdamTime08].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','08')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime08" value="gumsa_${cDay}_08"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_08" id="gumsa_${cDay}_08" value="<%=iYear %><%=sMonth %>${cDay}-0800-0900" ${scheduleMap[gumsaTime08].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','08')" />
											</td>
											<td class="time${cDay}08" onclick="background(this);" 
											${scheduleMap[sangdamTime08].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime08].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime08].ymd eq null && scheduleMap[gumsaTime08].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime09" value="sangdam_${cDay}_09"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_09" id="sangdam_${cDay}_09" value="<%=iYear %><%=sMonth %>${cDay}-0900-1000" ${scheduleMap[sangdamTime09].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','09')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime09" value="gumsa_${cDay}_09"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_09" id="gumsa_${cDay}_09" value="<%=iYear %><%=sMonth %>${cDay}-0900-1000" ${scheduleMap[gumsaTime09].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','09')" />
											</td>
											<td class="time${cDay}09" onclick="background(this);" 
											${scheduleMap[sangdamTime09].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime09].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime09].ymd eq null && scheduleMap[gumsaTime09].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime10" value="sangdam_${cDay}_10"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_10" id="sangdam_${cDay}_10" value="<%=iYear %><%=sMonth %>${cDay}-1000-1100" ${scheduleMap[sangdamTime10].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','10')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime10" value="gumsa_${cDay}_10"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_10" id="gumsa_${cDay}_10" value="<%=iYear %><%=sMonth %>${cDay}-1000-1100" ${scheduleMap[gumsaTime10].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','10')" />
											</td>
											<td class="time${cDay}10" onclick="background(this);" 
											${scheduleMap[sangdamTime10].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime10].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime10].ymd eq null && scheduleMap[gumsaTime10].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime11" value="sangdam_${cDay}_11"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_11" id="sangdam_${cDay}_11" value="<%=iYear %><%=sMonth %>${cDay}-1100-1200" ${scheduleMap[sangdamTime11].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','11')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime11" value="gumsa_${cDay}_11"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_11" id="gumsa_${cDay}_11" value="<%=iYear %><%=sMonth %>${cDay}-1100-1200" ${scheduleMap[gumsaTime11].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','11')" />
											</td>
											<td class="time${cDay}11" onclick="background(this);" 
											${scheduleMap[sangdamTime11].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime11].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime11].ymd eq null && scheduleMap[gumsaTime11].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime12" value="sangdam_${cDay}_12"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_12" id="sangdam_${cDay}_12" value="<%=iYear %><%=sMonth %>${cDay}-1200-1300" ${scheduleMap[sangdamTime12].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','12')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime12" value="gumsa_${cDay}_12"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_12" id="gumsa_${cDay}_12" value="<%=iYear %><%=sMonth %>${cDay}-1200-1300" ${scheduleMap[gumsaTime12].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','12')" />
											</td>
											<td class="time${cDay}12" onclick="background(this);" 
											${scheduleMap[sangdamTime12].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime12].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime12].ymd eq null && scheduleMap[gumsaTime12].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime13" value="sangdam_${cDay}_13"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_13" id="sangdam_${cDay}_13" value="<%=iYear %><%=sMonth %>${cDay}-1300-1400" ${scheduleMap[sangdamTime13].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','13')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime13" value="gumsa_${cDay}_13"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_13" id="gumsa_${cDay}_13" value="<%=iYear %><%=sMonth %>${cDay}-1300-1400" ${scheduleMap[gumsaTime13].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','13')" />
											</td>
											<td class="time${cDay}13" onclick="background(this);" 
											${scheduleMap[sangdamTime13].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime13].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime13].ymd eq null && scheduleMap[gumsaTime13].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime14" value="sangdam_${cDay}_14"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_14" id="sangdam_${cDay}_14" value="<%=iYear %><%=sMonth %>${cDay}-1400-1500" ${scheduleMap[sangdamTime14].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','14')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime14" value="gumsa_${cDay}_14"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_14" id="gumsa_${cDay}_14" value="<%=iYear %><%=sMonth %>${cDay}-1400-1500" ${scheduleMap[gumsaTime14].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','14')" />
											</td>
											<td class="time${cDay}14" onclick="background(this);" 
											${scheduleMap[sangdamTime14].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime14].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime14].ymd eq null && scheduleMap[gumsaTime14].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime15" value="sangdam_${cDay}_15"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_15" id="sangdam_${cDay}_15" value="<%=iYear %><%=sMonth %>${cDay}-1500-1600" ${scheduleMap[sangdamTime15].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','15')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime15" value="gumsa_${cDay}_15"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_15" id="gumsa_${cDay}_15" value="<%=iYear %><%=sMonth %>${cDay}-1500-1600" ${scheduleMap[gumsaTime15].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','15')" />
											</td>
											<td class="time${cDay}15" onclick="background(this);" 
											${scheduleMap[sangdamTime15].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime15].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime15].ymd eq null && scheduleMap[gumsaTime15].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime16" value="sangdam_${cDay}_16"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_16" id="sangdam_${cDay}_16" value="<%=iYear %><%=sMonth %>${cDay}-1600-1700" ${scheduleMap[sangdamTime16].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','16')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime16" value="gumsa_${cDay}_16"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_16" id="gumsa_${cDay}_16" value="<%=iYear %><%=sMonth %>${cDay}-1600-1700" ${scheduleMap[gumsaTime16].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','16')" />
											</td>
											<td class="time${cDay}16" onclick="background(this);" 
											${scheduleMap[sangdamTime16].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime16].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime16].ymd eq null && scheduleMap[gumsaTime16].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime17" value="sangdam_${cDay}_17"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_17" id="sangdam_${cDay}_17" value="<%=iYear %><%=sMonth %>${cDay}-1700-1800" ${scheduleMap[sangdamTime17].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','17')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime17" value="gumsa_${cDay}_17"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_17" id="gumsa_${cDay}_17" value="<%=iYear %><%=sMonth %>${cDay}-1700-1800" ${scheduleMap[gumsaTime17].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','17')" />
											</td>
											<td class="time${cDay}17" onclick="background(this);" 
											${scheduleMap[sangdamTime17].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime17].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime17].ymd eq null && scheduleMap[gumsaTime17].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime18" value="sangdam_${cDay}_18"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_18" id="sangdam_${cDay}_18" value="<%=iYear %><%=sMonth %>${cDay}-1800-1900" ${scheduleMap[sangdamTime18].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','18')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime18" value="gumsa_${cDay}_18"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_18" id="gumsa_${cDay}_18" value="<%=iYear %><%=sMonth %>${cDay}-1800-1900" ${scheduleMap[gumsaTime18].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','18')" />
											</td>
											<td class="time${cDay}18" onclick="background(this);" 
											${scheduleMap[sangdamTime18].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime18].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime18].ymd eq null && scheduleMap[gumsaTime18].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime19" value="sangdam_${cDay}_19"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_19" id="sangdam_${cDay}_19" value="<%=iYear %><%=sMonth %>${cDay}-1900-2000" ${scheduleMap[sangdamTime19].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','19')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime19" value="gumsa_${cDay}_19"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_19" id="gumsa_${cDay}_19" value="<%=iYear %><%=sMonth %>${cDay}-1900-2000" ${scheduleMap[gumsaTime19].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','19')" />
											</td>
											<td class="time${cDay}19" onclick="background(this);" 
											${scheduleMap[sangdamTime19].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime19].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime19].ymd eq null && scheduleMap[gumsaTime19].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime20" value="sangdam_${cDay}_20"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_20" id="sangdam_${cDay}_20" value="<%=iYear %><%=sMonth %>${cDay}-2000-2100" ${scheduleMap[sangdamTime20].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','20')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime20" value="gumsa_${cDay}_20"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_20" id="gumsa_${cDay}_20" value="<%=iYear %><%=sMonth %>${cDay}-2000-2100" ${scheduleMap[gumsaTime20].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','20')" />
											</td>
											<td class="time${cDay}20" onclick="background(this);" 
											${scheduleMap[sangdamTime20].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime20].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime20].ymd eq null && scheduleMap[gumsaTime20].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime21" value="sangdam_${cDay}_21"/>
												<input style="display:none;" type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_21" id="sangdam_${cDay}_21" value="<%=iYear %><%=sMonth %>${cDay}-2100-2200" ${scheduleMap[sangdamTime21].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','21')" />
											</td>
											<td style="display:none;">
												<c:set var="gumsaTime21" value="gumsa_${cDay}_21"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_21" id="gumsa_${cDay}_21" value="<%=iYear %><%=sMonth %>${cDay}-2100-2200" ${scheduleMap[gumsaTime21].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','21')" />
											</td>
											<td class="time${cDay}21" onclick="background(this);" 
											${scheduleMap[sangdamTime21].ymd ne null ? 'style="background:#074f89"':''}
											${scheduleMap[gumsaTime21].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime21].ymd eq null && scheduleMap[gumsaTime21].ymd eq null ? '':''}
											></td>
										</tr>
										<tr>
											
											<td style="display:none;">
												<c:set var="sangdamTime22" value="sangdam_${cDay}_22"/>
												<input style="display:none;"  type="checkbox" class="sangdam_${cDay}" name="sangdam_${cDay}_22" id="sangdam_${cDay}_22" value="<%=iYear %><%=sMonth %>${cDay}-2200-2300" ${scheduleMap[sangdamTime22].ymd ne null  ? 'checked':''} onchange="checkboxClick('sangdam','${cDay}','22')" />
											</td>
											<td style="display:none;" >
												<c:set var="gumsaTime22" value="gumsa_${cDay}_22"/>
												<input style="display:none;" type="checkbox" class="gumsa_${cDay}" name="gumsa_${cDay}_22" id="gumsa_${cDay}_22" value="<%=iYear %><%=sMonth %>${cDay}-2200-2300" ${scheduleMap[gumsaTime22].ymd ne null  ? 'checked':''} onchange="checkboxClick('gumsa','${cDay}','22')" />
											</td>
											<td class="time${cDay}22"  onclick="background(this);"
											${scheduleMap[sangdamTime22].ymd ne null ? ' style="background:#074f89"':''}
											${scheduleMap[gumsaTime22].ymd ne null ? 'style="background:#85c53b"':''}
											${scheduleMap[sangdamTime22].ymd eq null && scheduleMap[gumsaTime22].ymd eq null ? '':''}
											></td>
										</tr>
									</table>
								</td>
								<!-- 일 종료 -->
					<% 
							}
				        	cnt++;
						}
					%>
					</tr>
				<% 
					}
				%>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td colspan="7">
						
						<div style="background:#074f89;width: 90px;height: 20px;float: left;"></div>
						<div style="float: left;">&nbsp;:상담가능일&nbsp;&nbsp;&nbsp;</div>
						<!-- <div style="background:#85c53b;width: 90px;height: 20px;float: left;">
						</div><div style="float: left;">&nbsp;:검사가능일</div> -->
					</td>
				</tr>
				</tbody>
			</table>
		</td>
		<td >
			<table width="95%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td >
						<input type="hidden" name="thisYm" value="<%=iYear%><%=sMonth%>">
						<div class="float_left"><input type="button" id="preMonth" value="&lt;"></div>
						<div class="float_left" style="font-size: 14px;">&nbsp;<strong><%=iYear%>. <%=sMonth%></strong>&nbsp;</div>
					<div class="float_left"><input type="button" id="nextMonth" value="&gt;"></div>
					&nbsp;&nbsp;&nbsp;
						<c:choose>
							<c:when test="${not empty counselorList }">
								상담사&nbsp;
								<select name="selectId" onchange="counselorChange();" >
									<c:forEach var="list" items="${counselorList }">
										<option value="${list.userId }" <c:if test="${selectId eq list.userId }"> selected </c:if> >${list.userNm }</option>
									</c:forEach>
								</select>	
							</c:when>
							<c:otherwise>
								<input type="hidden" name="selectId" value="${selectId}">
							</c:otherwise>
						</c:choose>
						
					</td>
					
					
					<!-- 검색창 끝 -->
				</tr>
				<tr>
					<td>
					<br>
						<div style="border: 1px solid #BCBCBC;width: 600px;height: 80px;padding: 10px 20px;">
							상담사 일괄 일정 등록
							<br>
							
							일요일 <input type="checkbox" id="reg_sun_all"/>&nbsp;&nbsp;
							월요일 <input type="checkbox" id="reg_mon_all"/>&nbsp;&nbsp;
							화요일 <input type="checkbox" id="reg_tue_all"/>&nbsp;&nbsp;
							수요일 <input type="checkbox" id="reg_wed_all"/>&nbsp;&nbsp;
							목요일 <input type="checkbox" id="reg_thu_all"/>&nbsp;&nbsp;
							금요일 <input type="checkbox" id="reg_fri_all"/>&nbsp;&nbsp;
							토요일 <input type="checkbox" id="reg_sat_all"/>&nbsp;&nbsp;
							<br>
							시간 &nbsp;
							<select id="reg_from_all">
							  <option value="07">07:00</option>
							  <option value="08">08:00</option>
							  <option value="09">09:00</option>
							  <option value="10">10:00</option>
							  <option value="11">11:00</option>
							  <option value="12">12:00</option>
							  <option value="13">13:00</option>
							  <option value="14">14:00</option>
							  <option value="15">15:00</option>
							  <option value="16">16:00</option>
							  <option value="17">17:00</option>
							  <option value="18">18:00</option>
							  <option value="19">19:00</option>
							  <option value="20">20:00</option>
							  <option value="21">21:00</option>
							  <option value="22">22:00</option>
							</select>
							&nbsp;~&nbsp;
							<select id="reg_to_all">
							  <option value="07">07:00</option>
							  <option value="08">08:00</option>
							  <option value="09">09:00</option>
							  <option value="10">10:00</option>
							  <option value="11">11:00</option>
							  <option value="12">12:00</option>
							  <option value="13">13:00</option>
							  <option value="14">14:00</option>
							  <option value="15">15:00</option>
							  <option value="16">16:00</option>
							  <option value="17">17:00</option>
							  <option value="18">18:00</option>
							  <option value="19">19:00</option>
							  <option value="20">20:00</option>
							  <option value="21">21:00</option>
							  <option value="22">22:00</option>
							</select>
							
							<input type="button" id="registAllBtn" value="일괄 등록" style="height:30px; width:100px;float: right;">
							
							</div>
							<br>	
							<div style="border: 1px solid #BCBCBC;width:600px;height: 80px;padding: 10px 20px;">
								상담사 일괄 일정 삭제
								<br>
								일요일 <input type="checkbox" id="del_sun_all"/>&nbsp;&nbsp;
								월요일 <input type="checkbox" id="del_mon_all"/>&nbsp;&nbsp;
								화요일 <input type="checkbox" id="del_tue_all"/>&nbsp;&nbsp;
								수요일 <input type="checkbox" id="del_wed_all"/>&nbsp;&nbsp;
								목요일 <input type="checkbox" id="del_thu_all"/>&nbsp;&nbsp;
								금요일 <input type="checkbox" id="del_fri_all"/>&nbsp;&nbsp;
								토요일 <input type="checkbox" id="del_sat_all"/>&nbsp;&nbsp;
								<div class="clear_both h10"></div>
								시간 &nbsp;
								<select id="del_from_all">
								  <option value="07">07:00</option>
								  <option value="08">08:00</option>
								  <option value="09">09:00</option>
								  <option value="10">10:00</option>
								  <option value="11">11:00</option>
								  <option value="12">12:00</option>
								  <option value="13">13:00</option>
								  <option value="14">14:00</option>
								  <option value="15">15:00</option>
								  <option value="16">16:00</option>
								  <option value="17">17:00</option>
								  <option value="18">18:00</option>
								  <option value="19">19:00</option>
								  <option value="20">20:00</option>
								  <option value="21">21:00</option>
								  <option value="22">22:00</option>
								</select>
								&nbsp;~&nbsp;
								<select id="del_to_all">
								  <option value="07">07:00</option>
								  <option value="08">08:00</option>
								  <option value="09">09:00</option>
								  <option value="10">10:00</option>
								  <option value="11">11:00</option>
								  <option value="12">12:00</option>
								  <option value="13">13:00</option>
								  <option value="14">14:00</option>
								  <option value="15">15:00</option>
								  <option value="16">16:00</option>
								  <option value="17">17:00</option>
								  <option value="18">18:00</option>
								  <option value="19">19:00</option>
								  <option value="20">20:00</option>
								  <option value="21">21:00</option>
								  <option value="22">22:00</option>
								</select>
								<input type="button" id="deleteAllBtn" value="삭제" style="height:30px; width:100px;float: right;">
							
							</div>	
							<br>
							<strong> * 일정을 클릭하여 상담일 지정 및 취소가 가능합니다.</strong>
							<!-- 수정버튼 영역 -->
									<input type="button" id="updateBtn" value="등록" style="height:30px; width:100px;margin: 10px 300px;">
									<span style="margin-left: 20px;"></span>
									<!-- 수정버튼 영역 끝 -->
									<br>
									
					</td>	
				</tr>
			</table>
		</td>
	</tr>
	<!-- 달력 년도 끝 -->
	<style>
	.week1.none{display: none;}
	.week2.none{display: none;}
	.week3.none{display: none;}
	.week4.none{display: none;}
	.week5.none{display: none;}
	.week6.none{display: none;}	
</style>
	
</table>
<script type="text/javascript">
function background(aa){
	if($(aa).prev().prev().children().is(":checked")){
		
		/* $(aa).prev().prev().children().prop("checked", false);
		$(aa).prev().children().prop("checked", true);
		$(aa).css("background","#85c53b"); */
		
		$(aa).prev().prev().children().prop("checked", false);
		$(aa).prev().children().prop("checked", false);
		$(aa).css("background","white");
		
	}else if($(aa).prev().children().is(":checked")){
		
		$(aa).prev().prev().children().prop("checked", false);
		$(aa).prev().children().prop("checked", false);
		$(aa).css("background","white");		
	}else{
		
		$(aa).prev().prev().children().prop("checked", true);
		$(aa).prev().children().prop("checked", false);
		$(aa).css("background","#074f89");
	}
	
	
	
	
}


var weekNo = Math.ceil((<%=weekStartDay %> - 1 + <%=toDay %>) / 7);


var month = <%=iMonth %>+1; 

var weekStartDay =(((weekNo*7)-6)-<%=weekStartDay %>)+1;

var weekSun = weekStartDay; 
var weekMon = weekStartDay+1;
var weekTue = weekStartDay+2;
var weekWed = weekStartDay+3;
var weekThu = weekStartDay+4;
var weekFri = weekStartDay+5;
var weekSat = weekStartDay+6;


$(".week"+weekNo).removeClass("none");
$("#weekMoveTitle").text(month+"월 "+weekNo+"째주");
$(document).ready(function(){
	$('.moveLeft').click(function(){
		
		var currentInt = weekNo;

		if(currentInt != 1){
			weekNo=weekNo-1;
			$("#weekMoveTitle").text(month+"월 "+weekNo+"째주");	
			var beforeInt = currentInt;
			currentInt = currentInt - 1;	
			$(".week"+beforeInt).addClass("none");
			$(".week"+currentInt).removeClass("none");	
		}
		
	});

	$('.moveRight').click(function(){
		var currentInt = weekNo;
		if(currentInt != <%=iTotalweeks%>){
			weekNo=weekNo+1;
			$("#weekMoveTitle").text(month+"월 "+weekNo+"째주");
			var beforeInt = currentInt;
			currentInt = currentInt + 1;
			$(".week"+beforeInt).addClass("none");
			$(".week"+currentInt).removeClass("none");
		}
		
	});


	$('#registAllBtn').click(function(){
		var startTime = $("#reg_from_all").val();
		var endTime = $("#reg_to_all").val();
		if(startTime > endTime){
			alert("시작시간이 종료시간보다 늦을 수 없습니다.");
			return false;
		}
		
		var week1 = $("#reg_sun_all").is(":checked");
		var week2 = $("#reg_mon_all").is(":checked");
		var week3 = $("#reg_tue_all").is(":checked");
		var week4 = $("#reg_wed_all").is(":checked");
		var week5 = $("#reg_thu_all").is(":checked");
		var week6 = $("#reg_fri_all").is(":checked");
		var week7 = $("#reg_sat_all").is(":checked");

		
		if(week1 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				
				
				if($(".time"+weekSun+""+idx).prev().prev().children().is(":checked")){

				}else if($(".time"+weekSun+""+idx).prev().children().is(":checked")){
		
				}else{
					$(".time"+weekSun+""+idx).prev().prev().children().prop("checked", true);
					$(".time"+weekSun+""+idx).prev().children().prop("checked", false);
					$(".time"+weekSun+""+idx).css("background","#074f89");  //상담가능일
				}
			}
		}
		
		if(week2 ==true){
			
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				
				if($(".time"+weekMon+""+idx).prev().prev().children().is(":checked")){

				}else if($(".time"+weekMon+""+idx).prev().children().is(":checked")){
		
				}else{
					$(".time"+weekMon+""+idx).prev().prev().children().prop("checked", true);
					$(".time"+weekMon+""+idx).prev().children().prop("checked", false);
					$(".time"+weekMon+""+idx).css("background","#074f89");  //상담가능일
				}
			}
		}
		if(week3 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				
				if($(".time"+weekTue+""+idx).prev().prev().children().is(":checked")){

				}else if($(".time"+weekTue+""+idx).prev().children().is(":checked")){
		
				}else{
					$(".time"+weekTue+""+idx).prev().prev().children().prop("checked", true);
					$(".time"+weekTue+""+idx).prev().children().prop("checked", false);
					$(".time"+weekTue+""+idx).css("background","#074f89");  //상담가능일
				}
			}
		}
		if(week4 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				
				if($(".time"+weekWed+""+idx).prev().prev().children().is(":checked")){

				}else if($(".time"+weekWed+""+idx).prev().children().is(":checked")){
		
				}else{
					$(".time"+weekWed+""+idx).prev().prev().children().prop("checked", true);
					$(".time"+weekWed+""+idx).prev().children().prop("checked", false);
					$(".time"+weekWed+""+idx).css("background","#074f89");  //상담가능일
				}
			}
		}
		if(week5 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				
				if($(".time"+weekThu+""+idx).prev().prev().children().is(":checked")){

				}else if($(".time"+weekThu+""+idx).prev().children().is(":checked")){
		
				}else{
					$(".time"+weekThu+""+idx).prev().prev().children().prop("checked", true);
					$(".time"+weekThu+""+idx).prev().children().prop("checked", false);
					$(".time"+weekThu+""+idx).css("background","#074f89");  //상담가능일
				}
			}
		}
		if(week6 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				
				if($(".time"+weekFri+""+idx).prev().prev().children().is(":checked")){

				}else if($(".time"+weekFri+""+idx).prev().children().is(":checked")){
		
				}else{
					$(".time"+weekFri+""+idx).prev().prev().children().prop("checked", true);
					$(".time"+weekFri+""+idx).prev().children().prop("checked", false);
					$(".time"+weekFri+""+idx).css("background","#074f89");  //상담가능일
				}
			}
		}
		
		if(week7 ==true){
			
			for(var i=startTime; i<= endTime; i++){
				
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				console.log(".time"+weekSat+""+idx);
				//$(".time"+weekMon+""+i).trigger("click");
				//console.log(".time"+weekMon+""+i);
				//$(".time"+weekMon+""+i).trigger("click");
				if($(".time"+weekSat+""+idx).prev().prev().children().is(":checked")){

				}else if($(".time"+weekSat+""+idx).prev().children().is(":checked")){
		
				}else{
					$(".time"+weekSat+""+idx).prev().prev().children().prop("checked", true);
					$(".time"+weekSat+""+idx).prev().children().prop("checked", false);
					$(".time"+weekSat+""+idx).css("background","#074f89");  //상담가능일
				}
			}
		}
		
	});

	$('#deleteAllBtn').click(function(){
		
		var startTime = $("#del_from_all").val(); 
		var endTime = $("#del_to_all").val();
		if(startTime > endTime){
			alert("시작시간이 종료시간보다 늦을 수 없습니다.");
			return false;
		}
		
		var week1 = $("#del_sun_all").is(":checked");
		var week2 = $("#del_mon_all").is(":checked");
		var week3 = $("#del_tue_all").is(":checked");
		var week4 = $("#del_wed_all").is(":checked");
		var week5 = $("#del_thu_all").is(":checked");
		var week6 = $("#del_fri_all").is(":checked");
		var week7 = $("#del_sat_all").is(":checked");

		if(week1 ==true){
			for(var i=startTime; i<= endTime; i++){
				
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				console.log(".time"+weekSun+""+idx);
				
				if($(".time"+weekSun+""+idx).prev().prev().children().is(":checked")){
					console.log("1");
					$(".time"+weekSun+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekSun+""+idx).prev().children().prop("checked", false);
					$(".time"+weekSun+""+idx).css("background","white");
				}else if($(".time"+weekSun+""+idx).prev().children().is(":checked")){
					console.log("2");
					$(".time"+weekSun+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekSun+""+idx).prev().children().prop("checked", false);
					$(".time"+weekSun+""+idx).css("background","white");
				}else{
					console.log("3");
				}
			}
		}
		
		if(week2 ==true){
			
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				console.log(".time"+weekMon+""+idx);

				if($(".time"+weekMon+""+idx).prev().prev().children().is(":checked")){
					$(".time"+weekMon+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekMon+""+idx).prev().children().prop("checked", false);
					$(".time"+weekMon+""+idx).css("background","white");
				}else if($(".time"+weekMon+""+idx).prev().children().is(":checked")){
					$(".time"+weekMon+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekMon+""+idx).prev().children().prop("checked", false);
					$(".time"+weekMon+""+idx).css("background","white");
				}else{

				}
			}
		}
		if(week3 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				console.log(".time"+weekTue+""+idx);

				if($(".time"+weekTue+""+idx).prev().prev().children().is(":checked")){
					$(".time"+weekTue+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekTue+""+idx).prev().children().prop("checked", false);
					$(".time"+weekTue+""+idx).css("background","white");
				}else if($(".time"+weekTue+""+idx).prev().children().is(":checked")){
					$(".time"+weekTue+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekTue+""+idx).prev().children().prop("checked", false);
					$(".time"+weekTue+""+idx).css("background","white");
				}else{

				}
			}
		}
		if(week4 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				console.log(".time"+weekWed+""+idx);

				if($(".time"+weekWed+""+idx).prev().prev().children().is(":checked")){
					$(".time"+weekWed+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekWed+""+idx).prev().children().prop("checked", false);
					$(".time"+weekWed+""+idx).css("background","white");
				}else if($(".time"+weekWed+""+idx).prev().children().is(":checked")){
					$(".time"+weekWed+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekWed+""+idx).prev().children().prop("checked", false);
					$(".time"+weekWed+""+idx).css("background","white");
				}else{

				}
			}
		}
		if(week5 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				console.log(".time"+weekThu+""+idx);

				if($(".time"+weekThu+""+idx).prev().prev().children().is(":checked")){
					$(".time"+weekThu+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekThu+""+idx).prev().children().prop("checked", false);
					$(".time"+weekThu+""+idx).css("background","white");
				}else if($(".time"+weekThu+""+idx).prev().children().is(":checked")){
					$(".time"+weekThu+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekThu+""+idx).prev().children().prop("checked", false);
					$(".time"+weekThu+""+idx).css("background","white");
				}else{

				}
			}
		}
		if(week6 ==true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				console.log(".time"+weekFri+""+idx);

				if($(".time"+weekFri+""+idx).prev().prev().children().is(":checked")){
					$(".time"+weekFri+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekFri+""+idx).prev().children().prop("checked", false);
					$(".time"+weekFri+""+idx).css("background","white");
				}else if($(".time"+weekFri+""+idx).prev().children().is(":checked")){
					$(".time"+weekFri+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekFri+""+idx).prev().children().prop("checked", false);
					$(".time"+weekFri+""+idx).css("background","white");
				}else{

				}
			}
		}
		
		if(week7 == true){
			for(var i=startTime; i<= endTime; i++){
				var idx = "";
				if(i =="7"){
					idx = "07";	
				}else if(i =="8"){
					idx = "08";
				}else if(i =="9"){
					idx = "09";
				}else{
					idx = i;
				}
				if($(".time"+weekSat+""+idx).prev().prev().children().is(":checked")){
					$(".time"+weekSat+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekSat+""+idx).prev().children().prop("checked", false);
					$(".time"+weekSat+""+idx).css("background","white");
				}else if($(".time"+weekSat+""+idx).prev().children().is(":checked")){
					$(".time"+weekSat+""+idx).prev().prev().children().prop("checked", false);
					$(".time"+weekSat+""+idx).prev().children().prop("checked", false);
					$(".time"+weekSat+""+idx).css("background","white");
				}else{

				}
			}
		}
		
	});
});


</script>

</form>
</body>

</html>
