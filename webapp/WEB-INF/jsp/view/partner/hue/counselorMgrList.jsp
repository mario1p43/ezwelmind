<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담사관리</title>
<style type="text/css">
	.fontBlue{color: #2E64FE; }
</style>
<script type="text/javascript">

j$(document).ready(function(){
	j$('#bcheck_0').click(function(){
		if ( $("#bcheck_0").prop('checked') ) {
			j$("input[id^=bcheck_]").prop('checked',true);
		}else if( $("#bcheck_0").prop('checked') == false ){
			j$("input[id^=bcheck_]").prop('checked',false);
		}					
});
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
		 frm.elements["sMgrStatus"].value = temp;
		
 		 temp = "" ;
		cnt = 0;

		j$("#searchMgr").submit();
		return false;
	});


	j$("#insertBtn").click(function(){
		location.href = "/partner/mgrHue/counselorMgrAdd";
 		return false;
	});

	j$("#excelBtn").click(function(){
		var centerNm = '${param.centerNm}';
		var userNm = '${param.userNm}';
		var userMnm = '${param.userMnm}';
		var userRrn ='${param.userRrn}';		
		var userGender ='${param.userGender}';				
		var mgrStatus = "${param.sMgrStatus}";
		var startDt = '${param.startDt}';
		var endDt = '${param.endDt}';
		var authCd = '${param.authCd}';
		var userMobile = '${param.userMobile}';
	
		location.href = "/partner/mgrHue/excelDownload?userMobile="+userMobile+"&centerNm="+centerNm+"&userNm="+userNm+"&userMnm="+userMnm+"&userRrn="+userRrn+"&userGender="+userGender+"&mgrStatus="+mgrStatus+"&startDt="+startDt+"&endDt="+endDt+"&authCd="+authCd;
 		return false;
	});
	
	j$(".counselorListDetail").click(function(){
		var userId = j$(this).attr("value");
		location.href = "/partner/mgrHue/getCounselorMgrDetail?userId="+userId;
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
	j$("#calendar0").click(function(){			
		$(".date_timepicker_start").val("");
		$(".date_timepicker_end").val("");
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
		
		
		$(".date_timepicker_start").val(end);
		$(".date_timepicker_end").val(start);
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
		
		
		$(".date_timepicker_start").val(end);
		$(".date_timepicker_end").val(start);
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
		
		
		$(".date_timepicker_start").val(end);
		$(".date_timepicker_end").val(start);
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

	<c:if test='${not empty param.sMgrStatus}'>
	var chkValue = '${param.sMgrStatus}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=mgrStatus][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	<c:if test='${not empty param.suserGender}'>
	var chkValue = '${param.suserGender}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=userGender][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	<c:if test='${not empty param.sChannelType}'>
	var chkValue = '${param.sChannelType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=channelType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty param.sWorkType}'>
	var chkValue = '${param.sWorkType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=workType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty centerNm}'>
	var chkValue = '${centerNm}';
	document.searchMgr.centerNm.value = chkValue;
	</c:if>
	
	/*
	<c:if test='${not empty param.authCd}'>
	var chkValue = '${param.authCd}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=sAuthCd][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
*/

	
	//대기 ->  승인
 	j$("#mgrStatus1").click(function(){
		var leng = j$("input[class=check]:checked").length;
		
		if( leng == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		var frm = searchMgr;
		var temp ="" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		if ( typeof frm.elements["check"].length == "undefined" ) {
			// 체크박스가 다 disabled이고 하나만 있으면 배열이 먹지 않아서 undefind체크함
			temp+= "'"+frm.elements["check"].value+"'";
		} else {
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
		}
	    
		if(temp == ""){
			return false;
		}    
 		
		var params = {};
		
		params.userId = temp;
		params.mgrStatus  = 'Y';
		
		
 		if(confirm("확정 하시겠습니까?")){
			j$.ajax({
				url: '/partner/mgr/counselorInfoMgrStatus2',
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
	//승인 -> 중지
 	j$("#mgrStatus2").click(function(){
		var leng = j$("input[class=check]:checked").length;
		
		if( leng == 0 ) {
			 j$.alert("선택된 값이 없습니다.");
			 return;
		}
		var frm = searchMgr;
		var temp ="" ;
		var cnt = 0;

		//재직상태 checkbox 값 
		if ( typeof frm.elements["check"].length == "undefined" ) {
			// 체크박스가 다 disabled이고 하나만 있으면 배열이 먹지 않아서 undefind체크함
			temp+= "'"+frm.elements["check"].value+"'";
		} else {
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
		}
	    
		if(temp == ""){
			return false;
		}    
 		
		var params = {};
		
		params.userId = temp;
		params.mgrStatus  = 'N';
		
		
 		if(confirm("확정 하시겠습니까?")){
			j$.ajax({
				url: '/partner/mgr/counselorInfoMgrStatus2',
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
</script>
</head>
<body>

<form id="searchMgr" name="searchMgr" modelAttribute="CounselorInfoMgrDto" action="/partner/mgrHue/counselorMgrList" method="GET">
<input type="hidden" id="centerIndex" name="centerIndex">
<input type="hidden" name="suserGender" value="${param.suserGender}" />
<input type="hidden" name="sMgrStatus" value="${param.sMgrStatus}" />
<input type="hidden" name="sChannelType" value="${param.sChannelType}" />
<input type="hidden" name="sWorkType" value="${param.sWorkType}" />
<!--  
<input type="hidden" name="authCd" value="${param.authCd }">
-->
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">상담사관리</td>
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
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1"  width="100%" style="border-collapse:collapse;">
			<tr>
				<th align="center" width="13%">센터명</th>
				<td >
					<select id="centerNm" name="centerNm" >						
						<c:forEach var="list" items="${centerList}" varStatus="listCnt">
								<option value="${list.centerNm }" >${list.centerNm }</option>
						</c:forEach>
					</select>
				</td>
				<th align="center" width="13%">이름</th>
				<td><input type="text" name="userNm" id="userNm" size="50%" maxlength="25" value="${param.userNm}"/></td>
			</tr>

			<tr>
				<th align="center" width="13%">생년월일</th>
				<td><input type="text" name="userRrn" id="userRrn" size="50%" maxlength="25" value="${param.userRrn}"/></td>
				<th align="center" width="13%">휴대폰번호</th>
				<td><input type="text" name="userMobile" id="userMobile" size="50%" maxlength="25" value="${param.userMobile}"/></td>
			</tr>
						
			<tr>
				<th align="center">접속권한</th>
				<td align="left">
				<input type="radio" name="authCd" value=""  <c:if test="${param.authCd eq ''}"> checked </c:if>/>전체
					<input type="radio" name="authCd" value="ROLE_P_CENTER_HUE" <c:if test="${param.authCd eq 'ROLE_P_CENTER_HUE'}"> checked </c:if> />센터장
					<input type="radio" name="authCd" value="ROLE_P_SANGDAM_HUE" <c:if test="${param.authCd eq 'ROLE_P_SANGDAM_HUE'}"> checked </c:if>/>상담사					
				</td>
				<th align="center">상태값</th>
										<td>
						<input type="checkbox" name="statusAll" id="bcheck_0" value="0" >전체
						<input type="checkbox" name="mgrStatus"  id="bcheck_1" data-validation-qty="1-3" value="S"></input>대기
						<input type="checkbox" name="mgrStatus"  id="bcheck_2" data-validation-qty="1-3" value="Y"></input>승인
						<input type="checkbox" name="mgrStatus"  id="bcheck_3" data-validation-qty="1-3" value="N"></input>중지
					</td>
				
			</tr>
			
			
			
			
			<tr>
				<th align="center">성별</th>
				<td align="left">
				    <input type="radio" name="userGender" value="" <c:if test="${param.userGender eq ''}"> checked </c:if>>전체
					<input type="radio" name="userGender" value="M" <c:if test="${param.userGender eq 'M'}"> checked </c:if>>남
					<input type="radio" name="userGender" value="F" <c:if test="${param.userGender eq 'F'}"> checked </c:if>>여					
				</td>
				<th align="center" width="13%">등록/<span class='fontBlue'>수정자</span></th>
				<td><input type="text" name="userMnm" id="userMnm" size="50%" maxlength="25" value="${param.userMnm}"/></td>
			</tr>
			
			<tr>
				<th align="center">정보변경일</th>
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
					<input id="calendar0" type="button" value="전체" />
				</td>
			</tr>
		</table>
	</td>
</tr>


<tr><td height="20px"></td></tr>

<tr>
	<td align="center">
		<input type="button" id="searchBtn" name="searchBtn" style="height:30px; width:100px;" value="검색"/>
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
								<span class="button"><a id="mgrStatus1"  href="#">선택승인</a></span>&nbsp;
								<span class="button"><a id="mgrStatus2"  href="#">선택중지</a></span>
								<!--  
	 							<span class="button"><a id="mgrStatus2"  href="#">별 등급관리</a></span>
	 							-->
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
								<th width="3%" >선택</th>
								<th width="4%" >순번</th>								
								<th width="10%">이름</th>
								<th width="10%" >아이디</th>
								<th width="3%">성별</th>
								<th width="12%" >생년월일</th>								
								<th width="14%">휴대폰번호</th>
								<th width="10%">접속권한</th>																
								<th width="10%">상태</th>
								<th width="14%">등록일/<span class='fontBlue'>수정일</span></th>
								<th width="10%">등록/<span class='fontBlue'>수정자</span></th>
							</tr>							
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td>
								<!-- 
								<c:choose>
									<c:when test="${list.mgrStatus eq '승인' || list.mgrStatus eq '중지'}">
										<input type="checkbox"  disabled="disabled"/>
									</c:when>
									<c:otherwise>
										<input type="checkbox" class="check" name="check" value="${list.userId}" />									
									</c:otherwise>
								</c:choose>
								-->
								<input type="checkbox" class="check" name="check" value="${list.userId}" />
								</td>
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>								
								<td><a href="#" class="counselorListDetail" value="${list.userId}"><strong>${list.userNm}</strong></a></td>
								<td><strong>${list.userId}</strong></td>
								<td>${list.gender}</td>
								<td>${list.rrn}</td>
								<td>${list.mobile}</td>								
								<td>${list.authCd }</td>
								<td>${list.mgrStatus}</td>																
								<c:if test="${list.regDt ne list.modiDt }">
								<td align="center"><span class='fontBlue'>${list.modiDt.substring(0,19)}</span></td>
								<td align="center"><span class='fontBlue'>${list.workType}</span></td>
								</c:if>
								<c:if test="${list.regDt eq list.modiDt }">
								<td align="center">${list.modiDt.substring(0,19)}</td>
								<td align="center">${list.workType}</td>
								</c:if>
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
</form>
</body>
</html>

