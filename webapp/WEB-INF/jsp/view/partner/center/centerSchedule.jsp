<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<html>
<head>
<title>센터 스케줄</title>

<script type="text/javascript">

j$(document).ready(function(){
	
	//전체선택 체크박스 클릭 
	j$("#allCheck").click(function(){ 
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if(j$("#allCheck").prop("checked")) { 
			//해당화면에 전체 checkbox들을 체크해준다
			j$("input[type=checkbox]").prop("checked",true); 
		} 
		// 전체선택 체크박스가 해제된 경우
		else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			j$("input[type=checkbox]").prop("checked",false); 
		}
	});
	
	
	j$(".showCenter").click(function(){
		var ymd = $(this).attr("ymd");
		var counselYmd = $(this).attr("counselYmd");
		var area1 = $(this).attr("area1");
		
		j$.divPop("showCenter", counselYmd + "에 등록된 센터 리스트", "/madm/centerInfo/showCenterPop?ymd="+ymd+"&area1="+area1);
		
		return false;
	});
	
	j$("#searchBtn").click(function(){
		j$("#searchCenter").submit();
		return false;
	});
	
	//달력
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
	

	j$("#calendar6").click(function(){
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
		time.setDate (time.getDate() + 180); 

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
		
		
		$(".date_timepicker_start").val(start);
		$(".date_timepicker_end").val(end);
	});
	
	j$("#calendar5").click(function(){
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
		time.setDate (time.getDate() + 90); 

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
		
		
		$(".date_timepicker_start").val(start);
		$(".date_timepicker_end").val(end);
	});
	
	j$("#calendar4").click(function(){
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
		time.setDate (time.getDate() + 30); 

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
		
		
		$(".date_timepicker_start").val(start);
		$(".date_timepicker_end").val(end);
	});
	
	j$("#calendar3").click(function(){
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
		 
		time.setDate (time.getDate() + 15); 
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
		
		
		$(".date_timepicker_start").val(start);
		$(".date_timepicker_end").val(end);
	});
	
	j$("#calendar2").click(function(){
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
		 
		time.setDate (time.getDate() + 7); 
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
		
		
		$(".date_timepicker_start").val(start);
		$(".date_timepicker_end").val(end);
	});
	
	j$("#calendar1").click(function(){
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
	});
});
</script>

</head>
<body>

<form:form name="searchCenter" id="searchCenter" modelAttribute="centerInfo" action="/madm/centerInfo/getCenterSchedule">
<div style="overflow-x: hidden; overflow-y: scroll; height:500px; width:98%;">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">센터 스케줄 관리</td>
		    	<td align="right">
					<!-- <input type="button" class="downBtn" value="엑셀다운로드"" /> -->
				</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 검색 영역 시작 -->
		<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr align="left" height="30px">
				<th width="15%" bgcolor="#F5F5F5" align="center">지역구분</th>
		    	<td colspan="2" width="35%" align="left">
		    	<span id="area2">
		    	<input type="checkbox" id="allCheck" name="allCheck" /><label for="all">전체</label><br/>
		    	<input type="checkbox" id="100007" name="area1" value="100007" ${cf:contains(areaList, "100007") ? 'checked':''}/><label for="100007">강원도</label>
		    	<input type="checkbox" id="100008" name="area1" value="100008" ${cf:contains(areaList, "100008") ? 'checked':''}/><label for="100008">경기도</label>
				<input type="checkbox" id="100009" name="area1" value="100009" ${cf:contains(areaList, "100009") ? 'checked':''}/><label for="100009">경상남도</label>
				<input type="checkbox" id="100010" name="area1" value="100010" ${cf:contains(areaList, "100010") ? 'checked':''}/><label for="100010">경상북도</label>
		    	<input type="checkbox" id="100011" name="area1" value="100011" ${cf:contains(areaList, "100011") ? 'checked':''}/><label for="100011">광주광역시</label><br/>
				<input type="checkbox" id="100012" name="area1" value="100012" ${cf:contains(areaList, "100012") ? 'checked':''}/><label for="100012">대구광역시</label>
				<input type="checkbox" id="100013" name="area1" value="100013" ${cf:contains(areaList, "100013") ? 'checked':''}/><label for="100013">대전광역시</label>
		    	<input type="checkbox" id="100014" name="area1" value="100014" ${cf:contains(areaList, "100014") ? 'checked':''}/><label for="100014">부산광역시</label>
				<input type="checkbox" id="100015" name="area1" value="100015" ${cf:contains(areaList, "100015") ? 'checked':''}/><label for="100015">서울특별시</label>
				<input type="checkbox" id="100016" name="area1" value="100016" ${cf:contains(areaList, "100016") ? 'checked':''}/><label for="100016">세종특별자치시</label><br/>
		    	<input type="checkbox" id="100017" name="area1" value="100017" ${cf:contains(areaList, "100017") ? 'checked':''}/><label for="100017">울산광역시</label>
				<input type="checkbox" id="100018" name="area1" value="100018" ${cf:contains(areaList, "100018") ? 'checked':''}/><label for="100018">인천광역시</label>
				<input type="checkbox" id="100019" name="area1" value="100019" ${cf:contains(areaList, "100019") ? 'checked':''}/><label for="100019">전라남도</label>
				<input type="checkbox" id="100020" name="area1" value="100020" ${cf:contains(areaList, "100020") ? 'checked':''}/><label for="100020">전라북도</label>
				<input type="checkbox" id="100021" name="area1" value="100021" ${cf:contains(areaList, "100021") ? 'checked':''}/><label for="100021">제주특별자치도</label><br/>
				<input type="checkbox" id="100022" name="area1" value="100022" ${cf:contains(areaList, "100022") ? 'checked':''}/><label for="100022">충청남도</label>
				<input type="checkbox" id="100023" name="area1" value="100023" ${cf:contains(areaList, "100023") ? 'checked':''}/><label for="100023">충천북도</label>
   				</span>
		    	</td>
		    	
				<th align="center">기간</th>
				<td align="left" colspan="3">
					<input type="text" id="startDt" name="startDt" size="10" class="date_timepicker_start" value="${param.startDt}"/>
					<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					&nbsp;~&nbsp;
					<input type="text" id="endDt" name="endDt" size="10" class="date_timepicker_end" value="${param.endDt}"/>
					<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					<input id="calendar1" type="button" value="오늘" />
					<input id="calendar2" type="button" value="1주" />
					<input id="calendar3" type="button" value="15일"/>
					<input id="calendar4" type="button" value="1개월" />
					<input id="calendar5" type="button" value="3개월" />
					<input id="calendar6" type="button" value="6개월" />
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
				    		<td id="btn01">
				    			<input type="button" id="searchBtn" name="searchBtn" style="height:30px; width:100px;" value="검 색">
				    		</td>
		    			</tr>
		    		</table>
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>

<tr>
	<td>
		<!-- 표 영역 시작 -->
		<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr align="left" height="30px">
					<th width="10%" bgcolor="#F5F5F5" align="center">날짜＼지역</th>
					<c:forEach var="list" items="${area1NmList }" >
				    	<th width="" align="center">${list.area1Nm }</th>
			    	</c:forEach>
				</tr>
				<c:forEach var="cntMap" items="${centerSchedule }" varStatus="idx" >
					<tr align="left" height="30px">
						<th width="10%" bgcolor="#F5F5F5" align="center">${cntMap.key }</th>

						<c:forEach var="list" items="${area1NmList }" varStatus="areaIdx" >

							<c:set var="doneLoop" value="false"/> 
							<c:forEach var="entry" items="${cntMap.value }" varStatus="entryIdx">

								<c:if test="${not doneLoop}"> 
									<c:if test="${fn:containsIgnoreCase(list.area1, entry.area1)}">
										<td width="" align="center">				
											<c:if test="${fn:containsIgnoreCase('total', entry.area1)}">
												${entry.centerCnt }
											</c:if>
											<c:if test="${fn:containsIgnoreCase('total', entry.area1) eq false}">
												<a href="javascript:void(0);"  class="showCenter" area1="${entry.area1}" ymd="${entry.ymd}" counselYmd="${entry.counselYmd }">${entry.centerCnt }</a>											
											</c:if>
							    		</td>
							    		<c:set var="doneLoop" value="true"/>
									</c:if>
								</c:if>
							
				    		</c:forEach>
				    		
							<c:if test="${not doneLoop}">
								<td align="center">0</td>
							</c:if>	
										    		
						</c:forEach>

					</tr>
				</c:forEach>
		</table>
		<!-- 표 영역 종료 -->
	</td>
</tr>
</table>
</div>
</form:form>
</body>
</html>
