<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>상담사 정보관리</title>

<style>
	table{border-spacing:0!important}
	table td{background:none!important}
	.counsel-wrapper{padding:0 5vw}
	.counsel-wrapper .content-wrapper{display:flow-root;margin-top:5vw}
	.counsel-wrapper .content-wrapper .title-block{font-size:16px;font-weight:bold;line-height:130%}
	.counsel-wrapper .content-wrapper .input-block{display:flow-root;margin-top:2vw}
	.counsel-wrapper .content-wrapper .input-block.line-bottom input[type=text]{width:100%;float:left;padding:4px 0;font-size:16px;line-height:130%;border:none;outline:none}
	.counsel-wrapper .content-wrapper .input-block .checkbox-wrapper{float:left;margin-right:4vw;font-size:14px}
	.counsel-wrapper .content-wrapper .line-bottom{border-bottom:1px solid #C4C4C4}
	.counsel-wrapper .content-wrapper .datetimepicker-block{display:flex}
	.counsel-wrapper .content-wrapper .datetimepicker-block span{display:inline-block;float:left;width:20px;text-align:center;line-height:36px}
	.counsel-wrapper .content-wrapper .datetimepicker-block input[type=text]{float:left;width:calc(50% - 10px);height:32px;padding:0 8px;font-size:14px;border:1px solid #828282}
	.counsel-wrapper .content-wrapper .datetimepicker-btn-block{display:flow-root;margin-top:2vw}
	.counsel-wrapper .content-wrapper .datetimepicker-btn-block input[type=button]{float:left;width:calc((100% - 6vw) / 4);height:32px;font-weight:bold;font-size:16px;background-color:#E0E0E0;border:1px solid #BDBDBD;border-radius:4px}
	.counsel-wrapper .content-wrapper .datetimepicker-btn-block input[type=button]:not(:last-child){margin-right:2vw}
	.counsel-wrapper .content-wrapper .search-btn{height:40px;width:100%;color:white;font-weight:bold;font-size:16px;background-color:#006CBA;border:1px solid #004B85;border-radius:4px}
	.counsel-wrapper .content-wrapper .result-info-left{float:left}
	.counsel-wrapper .content-wrapper .result-info-right{float:right}
	.counsel-wrapper .content-wrapper .insert-btn{color:#2F80ED;font-size:14px;line-height:130%}
	
	.counsel-wrapper .data-list-wrapper{display:table;width:100%;margin-top:2vw;table-layout:fixed;border-collapse:collapse}
	.counsel-wrapper .data-list-wrapper .result-list-left{float:left;width:calc(43% - 1px);border-right:1px solid #C4C4C4}
	.counsel-wrapper .data-list-wrapper .result-list-right{float:left;width:57%;overflow:auto}
	.counsel-wrapper .data-list-wrapper table{width:100%;text-align:center;border-collapse:collapse}
	.counsel-wrapper .data-list-wrapper table thead{background-color:#F2F2F2;border-bottom:1px solid #C4C4C4}
	.counsel-wrapper .data-list-wrapper .result-list-left table tr th{height:32px;padding:0}
	.counsel-wrapper .data-list-wrapper .result-list-right table tr th{height:32px;padding:0 2vw}
	.counsel-wrapper .data-list-wrapper table tr td{height:44px;padding:0 2vw}
	.counsel-wrapper .data-list-wrapper table tr:nth-child(odd){background-color:#E0E0E0}
	.counsel-wrapper .data-list-wrapper table tr:nth-child(even){background-color:#F2F2F2}
	.counsel-wrapper .data-list-wrapper select{width:20vw;height:8vw;padding:0 2vw;border:1px solid #828282;background:"${url:resource('/resources/img/ic_select.png')}" no-repeat;background-size:12px 7px;background-position:right 6px top 50%;background-color:white;-webkit-appearance:none;-moz-appearance:none;appearance:none;}
</style>

<script type="text/javascript">

j$(document).ready(function(){

	$('.mobile_nav ul li a').eq(2).addClass('active');
	$('.mobile_nav ul li a img').eq(2).attr('src', "${url:resource('/resources/img/re_list_icon_active.png')}");

	j$("#searchBtn").click(function(){
		var frm = searchMgr;
		var temp ="" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		for(var i=0;i<frm.elements["mgrStatus"].length;i++){
			if(frm.elements["mgrStatus"][i].checked > 0){
				if(cnt!=0){   
				   temp +=","+ frm.elements["mgrStatus"][i].value;
				}else{
				   temp += frm.elements["mgrStatus"][i].value;
				}
				cnt++;
			    }
		    }
		 frm.elements["searchMgrStatus"].value = temp;
		
		 temp = "" ;
		cnt = 0;

			// checkbox 값 
			for(var i=0;i<frm.elements["channelType"].length;i++){
				if(frm.elements["channelType"][i].checked > 0){
					if(cnt!=0){   
					   temp+=","+ frm.elements["channelType"][i].value;
					   
					}else{
					   temp+= frm.elements["channelType"][i].value;
					}
					cnt++;
				    }
			    }
			 frm.elements["searchChannelType"].value = temp;
			 
			temp ="" ;
			cnt = 0;

				// checkbox 값 
				for(var i=0;i<frm.elements["workType"].length;i++){
					if(frm.elements["workType"][i].checked > 0){
						if(cnt!=0){   
						   temp +=","+ frm.elements["workType"][i].value;
						}else{
						   temp += frm.elements["workType"][i].value;
						}
						cnt++;
					    }
				    }
				 frm.elements["searchWorkType"].value = temp;
				 
				 
				 
				 
				temp = "" ;
				cnt = 0;

				// checkbox 값 
				for(var i=0;i<frm.elements["sAuthCd"].length;i++){
					if(frm.elements["sAuthCd"][i].checked > 0){
						if(cnt!=0){   
						   temp+=","+ frm.elements["sAuthCd"][i].value;
						   
						}else{
						   temp+= frm.elements["sAuthCd"][i].value;
						}
						cnt++;
					    }
				    }
				 frm.elements["authCd"].value = temp;
		
		j$("#searchMgr").submit();
		return false;
	});


	j$("#insertBtn").click(function(){
		location.href = "/partner/mgr/counselorInfoMgrAdd";
 		return false;
	});

	j$(".counselorListDetail").click(function(){
		var userId = j$(this).attr("value");
		location.href = "/partner/mgr/getCounselorInfoMgrDetail?userId="+userId;
		return false;
	});
	
	j$(".counselorListDetailCheck").click(function(){
		var userId = j$(this).attr("value");
		location.href = "/partner/mgr/getCounselorInfoMgrDetailCheck?userId="+userId;
		return false;
	});
	
	<c:if test='${not empty param.searchMgrStatus}'>
	var chkValue = '${param.searchMStatus}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=mgrStatus][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.searchChannelType}'>
	var chkValue = '${param.searchChannelType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=channelType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.searchWorkType}'>
	var chkValue = '${param.searchWType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=workType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.authCd}'>
	var chkValue = '${param.authCd}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=sAuthCd][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>


	//승인/중지
 	j$("#mgrStatus1").click(function(){
		if( j$("input[class=check]:checked").length == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		
		var frm = searchMgr;
		var temp ="" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		for(var i=0;i<frm.elements["check"].length;i++){
			if(frm.elements["check"][i].checked > 0){
				if(cnt!=0){   
				   temp+=","+"'"+ frm.elements["check"][i].value+"'";
				}else{
				   temp+= "'"+frm.elements["check"][i].value+"'";
				}
				cnt++;
			    }
		    }
 		
		var params = {};
		var userId = temp;
		var mgrStatus  = 'N';
		var siteCd = 'P'; 	// 파트너의 약자
		
		params.userId = userId;
		params.mgrStatus  = mgrStatus;
		params.siteCd  = siteCd;

		alert(userId+mgrStatus+siteCd);
		
 		if(confirm("확정 하시겠습니까?")){
			j$.ajax({
				url: '/partner/mgr/counselorInfoMgrStatus',
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
	
 	$('select.mgrStatus').on('change', function() {
 		
 		if( j$("input[class=check]:checked").length == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
 		if( j$("input[class=check]:checked").length > 1 ) {
			 j$.alert("선택된 값이 1개 이상일 수 없습니다.");
			 return;
		} 
		
		var params = {};
		var userId = $("input[class=check]:checked").val();
		var mgrStatus  = this.value;
		var siteCd = 'P'; 	// 파트너의 약자
		
		var mgrStatusNm ='';
		if(mgrStatus =='N'){
			mgrStatusNm ="중지";
		}else if(mgrStatus =='R'){
			mgrStatusNm ="거절";
		}else if(mgrStatus =='S'){
			mgrStatusNm ="대기";
		}else if(mgrStatus =='Y'){
			mgrStatusNm ="승인";
		}
		
		
		params.userId = userId;
		params.mgrStatus  = mgrStatus;
		params.siteCd  = siteCd;
		
 		if(confirm(mgrStatusNm+" 상태로 변경 하시겠습니까?")){
			j$.ajax({
				url: '/partner/mgr/counselorInfoMgrStatus',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			}); 
		}
 		

 	});

	
 	j$("#mgrStatus2").click(function(){
		if( j$("input[class=check]:checked").length == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		
		var frm = searchMgr;
		var temp ="" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		for(var i=0;i<frm.elements["check"].length;i++){
			if(frm.elements["check"][i].checked > 0){
				if(cnt!=0){   
				   temp+=","+"'"+ frm.elements["check"][i].value+"'";
				}else{
				   temp+= "'"+frm.elements["check"][i].value+"'";
				}
				cnt++;
			    }
		    }
 		
		var params = {};
		var userId = temp;
		var mgrStatus  = 'Y';
		var siteCd = 'P'; 	// 파트너의 약자
		
		params.userId = userId;
		params.mgrStatus  = mgrStatus;
		params.siteCd  = siteCd;

 		if(confirm("확정 하시겠습니까?")){
			j$.ajax({
				url: '/partner/mgr/counselorInfoMgrStatus',
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
	var start = year+"/"+month+"/"+day;

	
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
	
	
	$(".date_timepicker_start").val(end);
	$(".date_timepicker_end").val(start);
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
	
	
	$(".date_timepicker_start").val(end);
	$(".date_timepicker_end").val(start);
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
	
	
	$(".date_timepicker_start").val(end);
	$(".date_timepicker_end").val(start);

}

</script>
</head>
<body>

<form:form name="searchMgr" id="searchMgr" modelAttribute="counselorInfoMgrDto" action="/partner/mgr/counselorInfoMgrList" method="GET">
	<input type="hidden" name="searchMgrStatus" value="${param.searchMgrStatus}" />
	<input type="hidden" name="searchChannelType" value="${param.searchChannelType}" />
	<input type="hidden" name="searchWorkType" value="${param.searchWorkType}" />
	<input type="hidden" name="authCd" value="${param.authCd }">
	
	<div class="counsel-wrapper">
		<div class="content-wrapper">
			<div class="title-block">상담사명</div>
			<div class="input-block line-bottom">
				<input type="text" name="userNm" id="userNm" maxlength="25" value="${param.userNm}"/>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">연락처</div>
			<div class="input-block line-bottom">
				<input type="text" name="mobile" id="mobile" maxlength="25" value="${param.mobile}"/>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">상태값</div>
			<div class="input-block">
				<div class="checkbox-wrapper">
					<input type="checkbox" name="mgrStatus" id="mgrStatus1" value="S">
					<label for="mgrStatus1"></label>
					<label for="mgrStatus1">중지</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="mgrStatus" id="mgrStatus2" value="Y">
					<label for="mgrStatus2"></label>
					<label for="mgrStatus2">승인</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="mgrStatus" id="mgrStatus3" value="N">
					<label for="mgrStatus3"></label>
					<label for="mgrStatus3">대기</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="mgrStatus" id="mgrStatus4" value="R">
					<label for="mgrStatus4"></label>
					<label for="mgrStatus4">반려</label>
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">상담유형</div>
			<div class="input-block">
				<div class="checkbox-wrapper">
					<input type="checkbox" name="channelType" id="channelType1" value="100001">
					<label for="channelType1"></label>
					<label for="channelType1">심리</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="channelType" id="channelType2" value="100002">
					<label for="channelType2"></label>
					<label for="channelType2">법률</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="channelType" id="channelType3" value="100003">
					<label for="channelType3"></label>
					<label for="channelType3">재무</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="channelType" id="channelType4" value="100004">
					<label for="channelType4"></label>
					<label for="channelType4">심리검사</label>
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">접속권한</div>
			<div class="input-block">
				<div class="checkbox-wrapper">
					<input type="checkbox" name="sAuthCd" id="sAuthCd1" value="ROLE_PARTNER_CENTER">
					<label for="sAuthCd1"></label>
					<label for="sAuthCd1">센터장</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="sAuthCd" id="sAuthCd2" value="ROLE_PARTNER_SANGDAM">
					<label for="sAuthCd2"></label>
					<label for="sAuthCd2">상담</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="sAuthCd" id="sAuthCd3" value="ROLE_PARTNER_SEND">
					<label for="sAuthCd3"></label>
					<label for="sAuthCd3">파견</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="sAuthCd" id="sAuthCd4" value="ROLE_PARTNER_GROUP">
					<label for="sAuthCd4"></label>
					<label for="sAuthCd4">집단</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="sAuthCd" id="sAuthCd5" value="ROLE_PARTNER_TEACHER">
					<label for="sAuthCd5"></label>
					<label for="sAuthCd5">강사</label>
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">근무형태</div>
			<div class="input-block">
				<div class="checkbox-wrapper">
					<input type="checkbox" name="workType" id="workType1" value="S">
					<label for="workType1"></label>
					<label for="workType1">상주</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="checkbox" name="workType" id="workType2" value="P">
					<label for="workType2"></label>
					<label for="workType2">파트타임</label>
				</div>
				<input type="hidden" name="rStatusNm" value="${param.rStatusNm}" >
			</div>
		</div>
		<div class="content-wrapper">
			<div class="title-block">정보변경일</div>
			<div class="input-block">
				<div class="datetimepicker-block">
					<input type="text" id="startDt" name="startDt" class="date_timepicker_start" value="${param.startDt}"/>
					<span>~</span>
					<input type="text" id="endDt" name="endDt" class="date_timepicker_end" value="${param.endDt}"/>
				</div>
				<div class="datetimepicker-btn-block">
					<input type="button" onclick="todayBtn();" value="오늘" />
					<input type="button" onclick="weekBtn();" value="1주" />
					<input type="button" onclick="fifteenBtn();" value="15일"/>
					<input type="button" onclick="monthBtn();" value="1개월" />
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<input type="button" id="searchBtn" name="searchBtn" class="search-btn" value="검색"/>
		</div>
		<div class="content-wrapper">
			<div class="result-info-left">
				<span>총 ${paging.totalCount} | 페이지 : ${paging.currentPage}/${paging.getPageCount()}</span>
			</div>
			<div class="result-info-right">
			<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
				<span id="insertBtn" class="insert-btn">신규등록 &gt;</span>
			</sec:authorize>
			</div>
		</div>
		<div class="data-list-wrapper">
			<div class="result-list-left">
				<table style="width:100%;text-align:center;border-collapse:collapse;">
					<thead>
						<tr>
							<th width="25%">선택</th>
							<th width="25%">순번</th>
							<th width="50%">상담사명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr>
								<td>
									<div class="checkbox-wrapper">
										<c:choose>
											<c:when test="${list.mgrStatus eq '대기' or list.mgrStatus eq '반려'}">
												<input type="checkbox" id="data${status.index}" disabled="disabled"/>
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="data${status.index}" class="check" name="check" value="${list.userId}" />									
											</c:otherwise>
										</c:choose>
										<label for="data${status.index}"></label>
									</div>
								</td>
								<td>${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
								<td>
									<a href="#" class="counselorListDetail" value="${list.userId}" style="color:#2F80ED">
										<strong>${list.userNm} &gt;</strong>
									</a>
								</td>
							</tr>
 						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="result-list-right">
				<div style="width:max-content">
					<table style="width:100%;text-align:center;border-collapse:collapse;">
						<thead>
							<tr>
								<th>정보확인/수정</th>
								<th>나이</th>
								<th>성별</th>
								<th>연락처</th>
								<th>접속권한</th>
								<th>근무형태</th>
								<th>상담유형</th>
								<th>상태</th>
								<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
									<th>상태설정</th>
								</sec:authorize>
								<th>최초등록일</th>
								<th>정보변경일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${paging.list}" varStatus="status">
								<tr>
									<td>
										<a href="#" class="counselorListDetailCheck" value="${list.userId}" style="color:#2F80ED;margin-right:3vw"><span>확인</span></a>
										<a href="#" class="counselorListDetail" value="${list.userId}" style="color:#2F80ED"><span>수정</span></a>
									</td>
									<td>${list.rrn}</td>
									<td>${list.gender}</td>
									<td>${list.mobile}</td>
									
									<td>${list.authCd}</td>
									<td>${list.workType}</td>
									<td><comm:commNmOut code="${list.channelType}" option="category"/></td>
									<td>
								    	<c:if test="${list.mgrStatus eq '승인' }">승인 </c:if> 
								    	<c:if test="${list.mgrStatus eq '중지' }">중지</c:if>
								    	<c:if test="${list.mgrStatus eq '대기' }">대기</c:if>
								    	<c:if test="${list.mgrStatus eq '반려' }">반려</c:if>							
									</td>
									<td>
									 	<c:if test="${list.mgrStatus eq '승인' }">
									 	<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
		
												<select class="mgrStatus">
													<option value="">선택</option>
													<option value="Y" >승인</option>
													<option value="N" >중지</option>
												</select>
		
										</sec:authorize>
									 	</c:if>
									
										<c:if test="${list.mgrStatus eq '중지' }">
									 	
									 	<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
											
												<select class="mgrStatus">
													<option value="">선택</option>
													<option value="Y" >승인</option>
													<option value="N" >중지</option>
												</select>
											
										</sec:authorize>
									 	</c:if>
									</td>
									<td>${list.regDt}</td>
									<td>${list.modiDt}</td>
								</tr>
	 						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="content-wrapper">
			<table border="0" width="100%" style="border-collapse:collapse;">
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
		</div>
	</div>
</form:form>
</body>
</html>

