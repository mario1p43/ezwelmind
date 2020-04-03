<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담사 정보관리</title>

<script type="text/javascript">

j$(document).ready(function(){

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
		
		var params = {};
		var userId = $(this).parent("td").children(".mgrUserId").val();
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
	if($(".check51").hasClass("on")){
		$(".check51").removeClass("on")
	}else{
		$(".check51").addClass("on")
	}
	
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
	if($(".check52").hasClass("on")){
		$(".check52").removeClass("on")
	}else{
		$(".check52").addClass("on")
	}
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
	if($(".check53").hasClass("on")){
		$(".check53").removeClass("on")
	}else{
		$(".check53").addClass("on")
	}
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
	if($(".check54").hasClass("on")){
		$(".check54").removeClass("on")
	}else{
		$(".check54").addClass("on")
	}
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

<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">상담사 정보관리</td>
<!-- 				<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
				</td> -->
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
		<table cellpadding="5" cellspacing="0" border="1"  width="100%" style="border-collapse:collapse;">
			<tr>
				<th align="center" width="13%">상담사명</th>
				<td><input type="text" name="userNm" id="userNm" size="60%" maxlength="25" value="${param.userNm}"/></td>
				<th align="center" width="13%">연락처</th>
				<td><input type="text" name="mobile" id="mobile" size="60%" maxlength="25" value="${param.mobile}"/></td>
			</tr>
			<tr>
				<th align="center">상태값</th>
					<td>
					<style>
					</style>
					<label class="check11">
						<input type="checkbox" name="mgrStatus" value="S"></input>
					    <span class="ico"></span>
					    <span class="txt">중지</span>
					</label>
					<label class="check12">
						<input type="checkbox" name="mgrStatus" value="Y"></input>
						<span class="ico"></span>
					    <span class="txt">승인</span>
					</label>
					<label class="check13">
						<input type="checkbox" name="mgrStatus" value="N"></input>
						<span class="ico"></span>
					    <span class="txt">대기</span>
					</label>
					<label class="check14">
						<input type="checkbox" name="mgrStatus" value="R"></input>
						<span class="ico"></span>
					    <span class="txt">반려</span>
					</label>
					</td>
				<th align="center" width="13%">상담유형</th>
					<td width="40%">
					<label class="check21">
						<input type="checkbox" name="channelType" value="100001"></input>
						<span class="ico"></span>
					    <span class="txt">심리</span>
					</label>
					<label class="check22">
						<input type="checkbox" name="channelType" value="100002"></input>
						<span class="ico"></span>
					    <span class="txt">법률</span>
					</label>
					<label class="check23">
						<input type="checkbox" name="channelType" value="100003"></input>
						<span class="ico"></span>
					    <span class="txt">재무</span>
					</label>
					<label class="check24">
						<input type="checkbox" name="channelType" value="100004"></input>
						<span class="ico"></span>
					    <span class="txt">심리검사</span>
					</label>
					</td>
			</tr>
			<tr>
				<th align="center">접속권한</th>
				<td align="left" width="40%">
					<label class="check31">
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_CENTER" />
						<span class="ico"></span>
					    <span class="txt">센터장</span>
					</label>
					<label class="check32">
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_SANGDAM" />
						<span class="ico"></span>
					    <span class="txt">상담</span>
					</label>
					<label class="check33">
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_SEND" />
						<span class="ico"></span>
					    <span class="txt">파견</span>
					</label>
					<label class="check34">
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_GROUP" />
						<span class="ico"></span>
					    <span class="txt">집단</span>
					</label>
					<label class="check35">
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_TEACHER" />
						<span class="ico"></span>
					    <span class="txt">강사</span>
					</label>
				</td>
				<th align="center" width="10%">근무형태</th>
					<td width="40%">
					<label class="check41">
						<input type="checkbox" name="workType"  value="S" ></input>
						<span class="ico"></span>
					    <span class="txt">상주</span>
					</label>
					<label class="check42">
						<input type="checkbox" name="workType"  value="P"></input>
						<span class="ico"></span>
					    <span class="txt">파트타임</span>
					</label>
					</td>

			</tr>
			<tr>
				<th align="center">정보변경일</th>
				<td align="left" colspan="3">
					<input type="text" id="startDt" name="startDt" size="10" class="date_timepicker_start" value="${param.startDt}"/>
					<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					&nbsp;~&nbsp;
					<input type="text" id="endDt" name="endDt" size="10" class="date_timepicker_end" value="${param.endDt}"/>
					<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					<label class="check51" >
						<input onclick="todayBtn();" type="button" value="오늘" />
						<span class="ico"></span>
					    <span class="txt">파트타임</span>
					</label>
					
					<label class="check52">
						<input onclick="weekBtn();"	type="button" value="1주" />
						<span class="ico"></span>
					    <span class="txt">파트타임</span>
					</label>
					<label class="check53">
						<input onclick="fifteenBtn();" type="button" value="15일"/>
						<span class="ico"></span>
					    <span class="txt">파트타임</span>
					</label>
					<label class="check54">
						<input onclick="monthBtn();" type="button" value="1개월" />
						<span class="ico"></span>
					    <span class="txt">파트타임</span>
					</label>
				</td>
			
			</tr>
			
		</table>
	</td>
</tr>


<tr><td height="20px"></td></tr>

<tr>
	<td align="center">
		<input type="button" id="searchBtn" name="searchBtn" style="height:30px; width:100px;" value="검색"/>
<!-- 		<span class="button"><a id="searchBtn" name="searchBtn" href="#">검색</a></span> -->
	</td>
</tr>

<tr><td height="20px"></td></tr>

			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건 |
								</strong>
								<span style="margin-left: 5px;"></span>
								<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
							</td>
							<td align="right">
 			<!-- 					<span class="button"><a id="mgrStatus1" name="mgrStatus1" href="#">승인 -> 중지</a></span>
								<span class="button"><a id="mgrStatus2" name="mgrStatus2" href="#">중지 -> 승인</a></span>
								  -->
								 <sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
									<span class="button"><a id="insertBtn" href="#" > 신규등록</a></span>
								 </sec:authorize>
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
							<tr>
								<!-- <th width="5%" >선택</th> -->
								<th width="5%" >순번</th>
								<th width="10%">상담사명</th>
								<th width="10%">정보확인/수정</th>
								<th width="5%" >나이</th>
								<th width="5%">성별</th>
								<th width="8%">연락처</th>
								
								<th width="5%">접속권한</th>
								<th width="5%">근무형태</th>
								<th width="10%">상담유형</th>
								<th width="5%">상태</th>
								<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
									<th width="7%">상태설정</th>
								</sec:authorize>
								<th width="7%">최초등록일</th>
								<th width="7%">정보변경일</th>
								
								
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<%-- <td>
								
								<c:choose>
									<c:when test="${list.mgrStatus eq '대기' or list.mgrStatus eq '반려'}">
										<input type="checkbox"  disabled="disabled"/>
									</c:when>
									<c:otherwise>
										<input type="checkbox" class="check" name="check" value="${list.userId}" />									
									</c:otherwise>
								</c:choose>
								</td> --%>
								<td>
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td><a href="#" class="counselorListDetail" value="${list.userId}"><strong>${list.userNm}</strong></a></td>
								<td>
								<a href="#" class="counselorListDetailCheck" value="${list.userId}"><div>확인</div></a>
								<a href="#" class="counselorListDetail" value="${list.userId}"><div>수정</div></a>
								</td>
								<td>${list.rrn}</td>
								<td>${list.gender}</td>
								<td>${list.mobile}</td>
								
								
								
								<td>${list.authCd}</td>
								<td>${list.workType}</td>
								<td><comm:commNmOut code="${list.channelType}"  option="category"/></td>
								<td>
							    	<c:if test="${list.mgrStatus eq '승인' }"> 승인 </c:if> 
							    	<c:if test="${list.mgrStatus eq '중지' }">중지</c:if>
							    	<c:if test="${list.mgrStatus eq '대기' }">대기</c:if>
							    	<c:if test="${list.mgrStatus eq '반려' }">반려</c:if>							
								
								</td>
								<td>
									<input type="hidden" class="mgrUserId" value="${list.userId}"/>
								 	<c:if test="${list.mgrStatus eq '승인' }">
								 	
								 	<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
	
											<select class="mgrStatus">
												<option value="">-- 선택 --</option>
											   <option value="Y" >승인</option>
											   <option value="N" >중지</option>
											</select>
	
									</sec:authorize>
								 	</c:if>
								
									<c:if test="${list.mgrStatus eq '중지' }">
								 	
								 	<sec:authorize access="hasAnyRole('ROLE_PARTNER_CENTER')">
										
											<select class="mgrStatus" >
												<option value="">-- 선택 --</option>
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
					<br />

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

</tr>
</table>
</form:form>
</body>
</html>

