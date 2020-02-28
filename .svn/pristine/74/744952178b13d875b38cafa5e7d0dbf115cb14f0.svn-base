<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>예약대기자현황</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	
	j$("#searchBtn").click(function(){
		j$("#searchWaitList").submit();
		return false;
	});
	

	j$('.date_timepicker_start').datetimepicker({
		format:'Ymd',
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
		format:'Ymd',
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
	
	j$(".fix").click(function(){
		var params = {};
		var counselCd = j$(this).attr("value");
		var counselStatus  = 100521;
		params.counselCd = counselCd;
		params.counselStatus  = counselStatus;

		if(confirm("확정 하시겠습니까?")){
			j$.ajax({
				url: '/partner/pCounselorMgr/ajaxModifyFix',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			});
		}

		return false;
	});
	
	
	j$(".cancel").click(function(){
		var params = {};
		var counselCd = j$(this).attr("value");
		var counselStatus  = 100522;
		params.counselCd = counselCd;
		params.counselStatus  = counselStatus;

		if(confirm("취소 하시겠습니까?")){
			j$.ajax({
				url: '/partner/pCounselorMgr/ajaxModifyCancel',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			});
		}

		return false;
	});
	
	
	
	
	
	
	

});
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
	var start = year+""+month+""+day;

	
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
	var start = yearStart+""+monthStart+""+dayStart;
	var end = yearEnd+""+monthEnd+""+dayEnd;
	
	
	$(".date_timepicker_start").val(start);
	$(".date_timepicker_end").val(end);
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
	var start = yearStart+""+monthStart+""+dayStart;
	var end = yearEnd+""+monthEnd+""+dayEnd;
	
	
	$(".date_timepicker_start").val(start);
	$(".date_timepicker_end").val(end);
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
	var start = yearStart+""+monthStart+""+dayStart;
	var end = yearEnd+""+monthEnd+""+dayEnd;
	
	
	$(".date_timepicker_start").val(start);
	$(".date_timepicker_end").val(end);

}

</script>
</head>
<body>


<form:form id="searchWaitList" modelAttribute="counselReservationDto" action="/partner/pCounselorMgr/counselWaitList" method="GET">
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">예약대기자현황</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="6" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<th width="15%" bgcolor="#F5F5F5" align="center">내담자명</th>
						    	<td colspan="2" width="35%" align="left">
						    		<input name="counselNm" value="${counselReservationDto.counselNm}" type="text" style="width:100px;"/>
						    	</td>
						    	<c:choose>
									<c:when test="${yn eq 'Y'}">
						            	<th width="15%" bgcolor="#F5F5F5" align="center">상담자명</th>
								    	<td colspan="2" width="35%" align="left">
								    		<input name="counselorNm" value="${counselReservationDto.counselorNm}" type="text" style="width:100px;"/>
								    	</td>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr align="left" height="30px">
								<th width="10%" bgcolor="#F5F5F5" align="center">상담일자</th>
						    	<td colspan="5" width="90%" align="left">
						    		<input type="text" name="startDt" size="10" class="date_timepicker_start" value="${counselReservationDto.startDt}"/>
									<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									&nbsp;~&nbsp;
									<input type="text" name="endDt" size="10" class="date_timepicker_end" value="${counselReservationDto.endDt}"/>
									<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
									<input type="button" onclick="todayBtn();"		value="오늘"/>
									<input type="button" onclick="weekBtn();"		value="1주일"/>
									<input type="button" onclick="fifteenBtn();"	value="15일"/>
									<input type="button" onclick="monthBtn();"		value="1개월"/>
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
											<td bgcolor="#F5F5F5" width="10%"><strong>순번</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>고객사</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>내담자</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>연락처</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>상담분야</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>상담방법</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>상담일자</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>상담시간</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>상담사</strong></td>
											<td bgcolor="#F5F5F5" width="10%"><strong>확정/취소</strong></td>
										</tr>

										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >${list.clientCd }</td>
											<td >${list.counselNm }</td>
											<td >${list.mobile }</td>
											<td ><comm:commNmOut code="${list.counselDiv }"  option="category"/></td>
											<td ><comm:commNmOut code="${list.counselType }"  option="commCd"/></td>
											<td >${list.ymd }</td>
											<td >${list.stTime }</td>
											<td >${list.counselorNm }</td>
											<td ><button class="fix" value="${list.counselCd }" type="button">확정</button><button class="cancel" value="${list.counselCd }" type="button">취소</button></td>
										</tr>
										</c:forEach>
									</table>
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



</body>
</html>