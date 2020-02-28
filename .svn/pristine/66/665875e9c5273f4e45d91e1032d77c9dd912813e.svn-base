<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<html>
<head>
<title>공개상담 관리</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script type="text/javascript">
j$(document).ready(function(){
	j$("#excelBtn").click(function(){			
		var searchNm = '${param.searchNm}';
		var searchMobile = '${param.searchMobile}';		
		var genderArr = "${param.genderArr}";
		var searchArr = '${param.searchArr}';			
		var startRDt = '${param.startRDt}';
		var endRDt = '${param.endRDt}';
		var startDt = '${param.startDt}';
		var endDt = '${param.endDt}';
		var startCDt = '${param.startCDt}';
		var endCDt = '${param.endCDt}';
		
		location.href = "/partner/booking/excelDownload?searchNm="+searchNm+"&searchMobile="+searchMobile+"&genderArr="+genderArr+"&searchArr="+searchArr+"&startRDt="+startRDt+"&endRDt="+endRDt+"&startDt="+startDt+"&endDt="+endDt+"&startCDt="+startCDt+"&endCDt="+endCDt;
				
 		return false;
	});
	var status = '${param.searchArr}';
	var statusArr = status.split(',');
	
	$('input:checkbox[name="statusArr"]').each(function() {
		for(var i=0; i < statusArr.length; i++){
	    	if(this.value == statusArr[i]){ //값 비교
	    		this.checked = true; //checked 처리
	    	}
		} 
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
	
	j$('#bcheck_0').click(function(){
			if ( $("#bcheck_0").prop('checked') ) {
				j$("input[id^=bcheck_]").prop('checked',true);
			}else if( $("#bcheck_0").prop('checked') == false ){
				j$("input[id^=bcheck_]").prop('checked',false);
			}					
	});
	/*
	$("#updateChecked").click(function() {
		var splitCode = $("#splitCode").val().split(",");
		for (var idx in splitCode) {
			$("input[name=box][value=" + splitCode[idx] + "]").attr("checked", true);
		}
	});
	*/
	//console.log(${param.statusArr});
	
/*	
 	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	var searchRegNmType = j$("select[name='searchRegNmType']").val();
			var regNm = j$("input[name='regNm']").val();

			if(searchRegNmType.length == 0 && regNm.length > 0 ){
				alert("등록/수정자를 선택해주세요.");
				j$("select[name='searchRegNmType']").focus();
			}else{
				j$("#searchPublic").submit();
			}
			return false;
	    };
	});
*/
	j$("#searchBtn").click(function(){
		
		var searchNm = j$("input[name='searchNm']").val();
		if(searchNm){
			searchNm.replace("'","");
			searchNm.replace(">","");
			searchNm.replace("<","");
			j$("input[name='searchNm']").val(searchNm);
		}
		
		var startRDt = j$("input[name='startRDt']").val();
		var endRDt = j$("input[name='endRDt']").val();		
		var startDt = j$("input[name='startDt']").val();
		var endDt = j$("input[name='endDt']").val();		
		var startCDt = j$("input[name='startCDt']").val();
		var endCDt = j$("input[name='endCDt']").val();
		if(startRDt){
			if(!endRDt){
				alert("상담신청일을 선택해 주세요");
				return false;
			}			
		}		
		if(endRDt){
			if(!startRDt){
				alert("상담신청일을 선택해 주세요");
				return false;
			}			
		}
	
		if(startDt){
			if(!endDt){
				alert("상담희망을 선택해 주세요");
				return false;
			}			
		}		
		if(endDt){
			if(!startDt){
				alert("상담희망을 선택해 주세요");
				return false;
			}			
		}
		
		if(startCDt){
			if(!endCDt){
				alert("상담예약일을 선택해 주세요");
				return false;
			}			
		}		
		if(endCDt){
			if(!startCDt){
				alert("상담예약일을 선택해 주세요");
				return false;
			}			
		}
		
		// 배열 선언
		var arrayParam = new Array();

		//each로 loop를 돌면서 checkbox의 check된 값을 가져와 담아준다.
		$("input:checkbox[name=statusArr]:checked").each(function(){
			arrayParam.push($(this).val());
		});
		
		if(arrayParam != ""){
			j$("#searchArr").val(arrayParam);
		}
		
		j$("#searchPublic").submit();
		return false;
	});

	j$(".publicDetail").click(function(){
		var dataSeq = j$(this).attr("value");
		var bbsCd = j$("#bbsCd").val();
		var serviceType = j$("#serviceType").val();
		location.href = "/partner/booking/modifyPublicDetailForm?dataSeq="+dataSeq+"&serviceType="+serviceType;
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
		var bbsCd = j$("#bbsCd").val();
		var serviceType = j$("#serviceType").val();
		location.href = "/partner/booking/modifyPublicDetailForm?dataSeq="+dataSeq+"&bbsCd="+bbsCd+"&serviceType="+serviceType;
		return false;
	});
	
////////////////////////////////////////////1
	j$("#calendar01").click(function(){			
		$("#startRDt").val("");
		$("#endRDt").val("");
	});

	j$("#calendar02").click(function(){			
		$("#startDt").val("");
		$("#endDt").val("");
	});

	j$("#calendar03").click(function(){			
		$("#startCDt").val("");
		$("#endCDt").val("");
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

		
		$("#startRDt").val(start);
		$("#endRDt").val(start);
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
		
		
		$("#startRDt").val(end);
		$("#endRDt").val(start);
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
		
		
		$("#startRDt").val(end);
		$("#endRDt").val(start);
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
		
		
		$("#startRDt").val(end);
		$("#endRDt").val(start);
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
////////////////////////////////////////////3
	j$("#calendar9").click(function(){
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

		
		$("#startCDt").val(start);
		$("#endCDt").val(start);
	});

	j$("#calendar10").click(function(){
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
		
		
		$("#startCDt").val(end);
		$("#endCDt").val(start);
	});
	
	j$("#calendar11").click(function(){
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
		
		
		$("#startCDt").val(end);
		$("#endCDt").val(start);
	});
	

	
	j$("#calendar12").click(function(){
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
		
		
		$("#startCDt").val(end);
		$("#endCDt").val(start);
	});

///////////////////////////////////////////	
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

<form:form id="searchPublic" modelAttribute="bbsAddDto" action="/partner/booking/list" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px">
		<input type="hidden" name="serviceType" id="serviceType" value="${serviceType }">
		<input type="hidden" name="bbsCd" id="bbsCd" value="${bbsCd }">
		<input type="hidden" name="searchArr" id="searchArr" value="">
	</td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">상담신청 관리</td>
		    	<td align="right">					
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
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>이름</strong></td>
		    	<td width="40%" align="left">
		    		<input type="text" name="searchNm" placeholder="검색어를 입력하세요." value="${param.searchNm }" style="width:350px; height:20px;">
		    	</td>
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>휴대폰번호</strong></td>
		    	<td width="40%" align="left">
		    		<input type="number" name="searchMobile" placeholder="검색어를 입력하세요." value="${param.searchMobile }" style="width:350px; height:20px;">
		    	</td>
			</tr>
					
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>성별</strong></td>
		    	<td width="40%" colspan="3" align="left">
		    		
		    		<input type="radio" name="genderArr" id="check_A" value=""  <c:if test="${param.genderArr eq ''}"> checked </c:if>>
				    <label for="check_A">전체</label>
		    		
		    		<input type="radio" name="genderArr" id="check_M"  value="M" <c:if test="${param.genderArr eq 'M'}"> checked </c:if>>
				    <label for="check_M">남</label>
				    
				    <input type="radio" name="genderArr" id="check_F"  value="F" <c:if test="${param.genderArr eq 'F'}"> checked </c:if>>
				    <label for="check_F">여</label>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상태</strong></td>
		    	<td width="40%" colspan="3" align="left">
		    		<input type="checkbox" name="statusAll" id="bcheck_0" value="0" >
				    <label for="bcheck_0">전체</label>
				    
		    		<input type="checkbox" name="statusArr" id="bcheck_1" value="1" >
				    <label for="bcheck_1">신청완료</label>
		    		
		    		<input type="checkbox" name="statusArr" id="bcheck_2" value="2">
				    <label for="bcheck_2">신청취소</label>
				    
				    <input type="checkbox" name="statusArr" id="bcheck_3" value="3" >
				    <label for="bcheck_3">일정확정</label>
				    
				    <input type="checkbox" name="statusArr" id="bcheck_4" value="4" >
				    <label for="bcheck_4">상담완료</label>
		    	</td>
			</tr>			

			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담신청일</strong></td>
		    	<td width="40%" colspan="3" align="left">
		    		<input type="text" name="startRDt"  id="startRDt" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${param.startRDt}"/>~
					<input type="text" name="endRDt"  id="endRDt"  class="endDt cal_box" datetimeonly="true" style="width:93px;" value="${param.endRDt}"/>
					<input id="calendar1" type="button" value="오늘" />
					<input id="calendar2" type="button" value="1주" />
					<input id="calendar3" type="button" value="15일"/>
					<input id="calendar4" type="button" value="1개월" />
					<input id="calendar01" type="button" value="전체" />
		    	</td>
			</tr>			
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담희망일</strong></td>
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
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담예약일</strong></td>
		    	<td width="40%" colspan="3" align="left">
		    		<input type="text" name="startCDt" id="startCDt" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${param.startCDt}"/>~
					<input type="text" name="endCDt"  id="endCDt"  class="endDt cal_box" datetimeonly="true" style="width:93px;" value="${param.endCDt}"/>
					<input id="calendar9" type="button" value="오늘" />
					<input id="calendar10" type="button" value="1주" />
					<input id="calendar11" type="button" value="15일"/>
					<input id="calendar12" type="button" value="1개월" />
					<input id="calendar03" type="button" value="전체" />
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
				                  <th width="15%">이름</th>
				                  <th width="15%">휴대폰번호</th>
				                  <th width="10%">성별</th>
				                  <th width="15%">상담신청일</th>
				                  <th width="15%" >상담희망일</th>
								  <th width="15%">상담예약일</th>								  
								  <th width="10%">상태</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
			                  	<td width="">	<a href="javascript:void(0)" class="publicDetail" value="${list.contactNo}" style="padding-left: 10px;"><strong>${list.counNm}</strong></a></td>
								<td align="center">${list.mobile}</td>
								<c:choose>
									<c:when test="${list.gender eq 'M'}">
										<td><span class="fontBlue">남</span></td>										
									</c:when>
									<c:otherwise>
										<td><span class="fontBlue">여</span></td>										
									</c:otherwise>
								</c:choose>
								<td>${fn:replace(list.regDt,'.0','')}</td>
								<td>${list.date}&nbsp;${ list.time }
								<c:if test="${not empty list.time}">시</c:if>
								</td>
								<td>${list.cdate}&nbsp;${ list.ctime }
								<c:if test="${not empty list.ctime}">시</c:if></td>
								<td align="center">
								<a href="javascript:void(0)" class="publicDetail" value="${list.contactNo}" style="padding-left: 10px;"><strong>
									<c:choose>
									<c:when test="${list.cstatus eq '1'}">
										신청완료										
									</c:when>
									<c:when test="${list.cstatus eq '2'}">
										신청취소										
									</c:when>
									<c:when test="${list.cstatus eq '3'}">
										일정확정										
									</c:when>
									<c:when test="${list.cstatus eq '4'}">
										상담완료										
									</c:when>									
								</c:choose>
								</strong></a>
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

