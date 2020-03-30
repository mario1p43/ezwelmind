<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<html>
<head>
<title>마음컨설팅 관리</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script type="text/javascript">
j$(document).ready(function(){
	
	
	j$("#insertBtn").click(function(){
		location.href = "/partner/counsel/counselorMgrAdd";
 		return false;
	});

	j$("#excelBtn").click(function(){		
		var counselNm 	= "${param.counselNm}";
		var cause 		= '${param.cause}';
		var counselorId = '${param.counselorId}';		
		var status 		= '${param.status}';
		var startDt 		= '${param.startDt}';		
		var endDt 		= "${param.endDt}";
		var counselStDd  = "${param.counselStDd}";		
		var counselEdDd = '${param.counselEdDd}';
		var mobile 		= '${param.mobile}';
		
		location.href = "/partner/counsel/excelDownload?counselNm="+counselNm+"&cause="+cause+"&counselorId="+counselorId+"&status="+status+"&startDt="+startDt+"&endDt="+endDt+"&counselStDd="+counselStDd+"&counselEdDd="+counselEdDd+"&mobile="+mobile;
 		return false;
	});

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
	
	j$("#searchBtn").click(function(){
		
		j$("#searchPublic").submit();
		
		return false;
	});

	j$(".publicDetail").click(function(){
		var counselCd = j$(this).attr("value");
		location.href = "/partner/counsel/modifyCounselDetailForm?counselCd="+counselCd;
		return false;
	});

	j$(".modifyDisp").click(function(){
		var params = {};
		var dataSeq = j$(this).attr("value");
		var dispYn  = j$(this).attr("disp");

		if(dispYn == "Y"){
			dispYn = "N";
		}else if(dispYn == "N"){
			dispYn = "Y";
		}

		params.dataSeq = dataSeq;
		params.dispYn  = dispYn;

		if(confirm("노출여부를 변경 하시겠습니까?")){
			j$.ajax({
				url: '/madm/common/bbs/ajaxModifyBbsDisp',
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

	j$(".replyBtn").click(function(){
		
		var dataSeq = j$(this).attr("value");			
		location.href = "/partner/sangdam/modifySangdamDetailForm?dataSeq="+dataSeq+"&pageNum=1";
		return false;
	});
	
////////////////////////////////////////////1
j$("#calendar01").click(function(){			
		$("#counselStDd").val("");
		$("#counselEdDd").val("");
	});

	j$("#calendar02").click(function(){			
		$("#startDt").val("");
		$("#endDt").val("");
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

		
		$("#counselStDd").val(start);
		$("#counselEdDd").val(start);
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
		
		
		$("#counselStDd").val(end);
		$("#counselEdDd").val(start);
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
		
		
		$("#counselStDd").val(end);
		$("#counselEdDd").val(start);
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
		
		
		$("#counselStDd").val(end);
		$("#counselEdDd").val(start);
	});
////////////////////////////////////////////2
	j$("#calendar5").click(function(){
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

		
		$("#startDt").val(start);
		$("#endDt").val(start);
	});

	j$("#calendar6").click(function(){
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
		
		
		$("#startDt").val(end);
		$("#endDt").val(start);
	});
	
	j$("#calendar7").click(function(){
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
		
		
		$("#startDt").val(end);
		$("#endDt").val(start);
	});
	

	
	j$("#calendar8").click(function(){
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
		
		
		$("#startDt").val(end);
		$("#endDt").val(start);
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


</script>
<style type="text/css">
	.fontBlue{color: #2E64FE; }
</style>
</head>
<body>

<form:form id="searchPublic" modelAttribute="centerCounselDto" action="/partner/counsel/list" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver; margin-top:20px;">
			<tr >
				<td align="left" class="subtitle" >마음컨설팅 관리</td>
				<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
					<input type="button" id="excelBtn" value="엑셀다운로드">
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
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
		
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>내담자</strong></td>
		    	<td width="40%" align="left">
		    		<input type="text" name="counselNm" placeholder="내담자명을 입력하세요." value="${param.counselNm }" style="width:350px; height:20px;">
		    	</td>
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>휴대폰번호</strong></td>
		    	<td width="40%" align="left">
		    		<input type="number" name="mobile" placeholder="휴대폰번호를 입력하세요." value="${param.mobile }" style="width:350px; height:20px;">
		    		<br>ex) 01012345678 -- 숫자만 입력하세요.
		    	</td>
			</tr>
					
			<tr align="left" height="30px">
				<th align="center" width="13%">상담주제</th>
				<td >
					<commClient:select name="cause" id="cause" clientCd="hue" code="100004"	basicValue="---- 선 택 ----"  selectValue="${param.cause }"/>
				</td>

				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>진행상태</strong></td>
		    	<td width="40%" align="left">
		    		<commClient:select name="status" id="status" clientCd="hue" code="100005" basicValue="---- 선 택 ----"  selectValue="${param.status}"/>
		    	</td>
			</tr>	
			
			<tr align="left" height="30px">
				<th align="center" width="13%">상담사</th>
				<td colspan='3'>
					<select id="counselorId" name="counselorId" >
						<option value="" >전체</option>						
						<c:forEach var="list" items="${userList}" varStatus="listCnt">
								<option value="${list.value }"  <c:if test="${param.userNm eq list.value}"> selected</c:if>>${list.title }</option>
						</c:forEach>
					</select>
				</td>
				</tr>					
				
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>고객작성일</strong></td>
		    	<td width="40%" colspan="3" align="left">		    		
					<input type="text" name="counselStDd"  id="counselStDd" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${param.counselStDd}"/>~
					<input type="text" name="counselEdDd"  id="counselEdDd"  class="endDt cal_box" datetimeonly="true" style="width:93px;" value="${param.counselEdDd}"/>
					<input id="calendar1" type="button" value="오늘" />
					<input id="calendar2" type="button" value="1주" />
					<input id="calendar3" type="button" value="15일"/>
					<input id="calendar4" type="button" value="1개월" />		
					<input id="calendar01" type="button" value="전체" />			
		    	</td>
			</tr>			
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>등록/<span class='fontBlue'>수정일</span></strong></td>
		    	<td width="40%" colspan="3" align="left">		    		
					<input type="text" name="startDt" id="startDt" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${param.startDt}"/>~
					<input type="text" name="endDt"  id="endDt" class="endDt cal_box" datetimeonly="true" style="width:93px;" value="${param.endDt}"/>
					<input id="calendar5" type="button" value="오늘" />
					<input id="calendar6" type="button" value="1주" />
					<input id="calendar7" type="button" value="15일"/>
					<input id="calendar8" type="button" value="1개월" />	
					<input id="calendar02" type="button" value="전체" />								
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
				    		<td id="btn01"><a href="javascript:void(0);"><span id="searchBtn">검 색</span></a></td>
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
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="right">
								<strong>총 ${paging.totalCount}건</strong>
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
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr>
				                 <th width="5%" >순번</th>
				                  <th width="10%">내담자명</th>
				                  <th width="10%">휴대폰번호</th>
				                  <th width="15%">고객 작성일</th>
				                  <th width="10%">상담주제</th>
				                  <th width="10%">진행상태</th>
								  <th width="10%">상담사</th>								  
								  <th width="10%">등록/<span class='fontBlue'>수정일</span></th>								  
								  <th width="10%">등록/<span class='fontBlue'>수정자</span></th>
								  <th width="10%">상담일지등록</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
			                  	<td width="">
			                  		<a href="javascript:void(0)" class="publicDetail" value="${list.counselCd}" style="padding-left: 10px;"><strong>${list.counselNm}</strong></a>
			                  	</td>
								<td align="center">${list.mobile}</td>
								<td>${list.counselDd}&nbsp;
									<c:if test="${not empty list.stDt}">${ list.stDt }</c:if><c:if test="${not empty list.edDt}"> - ${ list.edDt }</c:if>
								</td>
								
								<td align="center">${list.strCause}</td>
								<td align="center">
									<a href="javascript:void(0)" class="publicDetail" value="${list.counselCd}" style="padding-left: 10px;"><strong>${list.strStatus}</strong>
								</td>
								<td align="center">${list.counselorNm}</td>
								<c:if test="${ not empty list.modiDt }">
									<td align="center"><span class='fontBlue'>${list.modiDt.substring(0,19)}</span></td>
									<td align="center"><span class='fontBlue'>${list.modiNm}</span></td>
								</c:if>
								<c:if test="${empty list.modiDt }">
									<td align="center">${list.regDt.substring(0,19)}</td>
									<td align="center">${list.regNm}</td>
								</c:if>								
								<td id="btn02" align="center"  >
									<table>
										<tr>
											<td>
												<c:if test="${chkUserId eq false}">
													<c:if test="${chkUserId2 eq list.counselorId}"> 
														<c:if test="${list.strStatus eq '상담예정'}"> &nbsp; </c:if>
														<c:if test="${list.strStatus eq '상담진행'}"> <a href="javascript:void(0)"   style="padding-left: 10px;"><span class="replyBtn" value="${list.counselCd}">상담일지</span></a> </c:if>
														<c:if test="${list.strStatus eq '상담종결'}"> &nbsp; </c:if>
													</c:if>
												</c:if>
												<c:if test="${chkUserId eq true}">									 
													<c:if test="${list.strStatus eq '상담예정'}"> &nbsp; </c:if>
													<c:if test="${list.strStatus eq '상담진행'}"> <a href="javascript:void(0)"   style="padding-left: 10px;"><span class="replyBtn" value="${list.counselCd}">상담일지</span></a> </c:if>
													<c:if test="${list.strStatus eq '상담종결'}"> &nbsp; </c:if>									
												</c:if>
											</td>
										</tr>
									</table>
								</td>
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
					<!-- 채널 정보 종료 -->
				</td>
			</tr>
		</table>
		<!-- 채널 영역 종료 -->
	</td>
</tr>
</table>
</form:form>
</body>
</html>

