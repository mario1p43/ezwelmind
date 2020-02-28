<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>신규상담 조회</title>
<script src="${url:resource('/resources/js/plugin/jquery.number.min.js')}"></script>
<script type="text/javascript">
	$(document).ready(function(){
		clientReload('sel');
		ajaxConnection(null, '${year}', null);
		ajaxConnectionOnline(null, '${year}', null);
		
		$("#searchBtn").click(function(){
			search();			
			return false;
		});
			
	});  // end ready
	
	function search(){
		var clientCd = $("#clientCd").val();
		var year = parseInt($("#useYear").text());
		var useOnlineYear = parseInt($("#useOnlineYear").text());
		var periodSeq = $("#periodSeq").val();
		
		if( periodSeq == undefined ){
			ajaxConnection(clientCd, year, null);
			ajaxConnectionOnline(clientCd, useOnlineYear, null);
		}else{
			ajaxConnection(clientCd, year, periodSeq);
			ajaxConnectionOnline(clientCd, useOnlineYear, periodSeq);
		}
		
		return false;
	}
	
	function clientReload(setType){
		if(setType == "sel"){
			var tempClientCd = $("#clientCd option:selected").val();
			if(tempClientCd == "") return;
			var tempClientNm = $("#clientCd option:selected").text();
			$("#chkClientCd").val(tempClientNm);
		}else if(setType == "txt"){
			var tempClientCd = $("#chkClientCd").val();
			if(tempClientCd == "") return;
			
			var clientList = new Array();
			<c:forEach var="list" items="${clientList}">
			var arr = { nm : "${list.clientNm}", cd : "${list.clientCd}"};
			clientList.push(arr);
			</c:forEach>
			
			for(var i=0 ; i < clientList.length ; i++){
				var checkClientArr = clientList[i];
				if(checkClientArr.nm.indexOf(tempClientCd) != -1) {
					$("#clientCd").val(checkClientArr.cd);
					break;
				}	
			}
		}
	}
	
	function ajaxConnection(clientCd, year, periodSeq) {
		$.ajax({
			url: '/madm/userManager/ajaxNewServiceUserList?clientCd=' + clientCd + '&year=' + year + "&periodSeq=" + periodSeq,
			dataType: 'json',
			success: function(data, textStatus) {
				$("select[name='periodSeq'] option").remove();
				$(".monthValue").text("0");
				$("#newEmpDetailTot").text("0");
				$("#reuseEmpListTot").text("0");
				$("#counselNumberTot").text("0");
				
				$("#employeeCnt").text(data.serviceUseDetail.employeeCnt);
				$("#employeeUseCnt").text(data.serviceUseDetail.employeeUseCnt);
				$("#allUseCnt").text(data.serviceUseDetail.allUseCnt);
				$("#counselCnt").text(data.serviceUseDetail.counselCnt);
				$("#confirmCnt").text(data.serviceUseDetail.confirmCnt);
				
				var usePer = parseInt(data.serviceUseDetail.employeeUseCnt.replace(/,/gi,"")) / parseInt(data.serviceUseDetail.employeeCnt.replace(/,/gi,"")) * parseInt(100);
				var allUsePer = parseInt(data.serviceUseDetail.allUseCnt.replace(/,/gi,"")) / parseInt(data.serviceUseDetail.employeeCnt.replace(/,/gi,"")) * parseInt(100);
				var confirmPer = parseInt(data.serviceUseDetail.confirmCnt.replace(/,/gi,"")) / parseInt(data.serviceUseDetail.employeeCnt.replace(/,/gi,"")) * parseInt(100);
				var counselPer = parseInt(data.serviceUseDetail.counselCnt.replace(/,/gi,"")) / parseInt(data.serviceUseDetail.employeeUseCnt.replace(/,/gi,""));
				
				$("#employeeCntPer").text( "100%");
				$("#employeeUseCntPer").text( usePer.toFixed(2) + "%" );
				$("#allUseCntPer").text( allUsePer.toFixed(2) + "%" );
				$("#counselCntPer").text( "평균 " + counselPer.toFixed(2) + "회" );
				$("#confirmCntPer").text( confirmPer.toFixed(2) + "%" );
				
				$("#noSiteTypeCnt").text(data.orderChannel.noSiteTypeCnt);
				$("#webCnt").text(data.orderChannel.webCnt);
				$("#mobileWebCnt").text(data.orderChannel.mobileWebCnt);
				$("#mobileAppCnt").text(data.orderChannel.mobileAppCnt);
				$("#adminCnt").text(data.orderChannel.adminCnt);
				$("#excelCnt").text(data.orderChannel.excelCnt);
				$("#orderTotCnt").text(data.orderChannel.orderTotCnt);

				var webCntPer 			= parseInt(data.orderChannel.webCnt.replace(/,/gi,"")) / parseInt(data.orderChannel.orderTotCnt.replace(/,/gi,"")) * parseInt(100);
				var mobileWebCntPer	= parseInt(data.orderChannel.mobileWebCnt.replace(/,/gi,"")) / parseInt(data.orderChannel.orderTotCnt.replace(/,/gi,"")) * parseInt(100);
				var mobileAppCntPer 	= parseInt(data.orderChannel.mobileAppCnt.replace(/,/gi,"")) / parseInt(data.orderChannel.orderTotCnt.replace(/,/gi,"")) * parseInt(100);
				var adminCntPer 		= parseInt(data.orderChannel.adminCnt.replace(/,/gi,"")) / parseInt(data.orderChannel.orderTotCnt.replace(/,/gi,"")) * parseInt(100);
				var excelCntPer 			= parseInt(data.orderChannel.excelCnt.replace(/,/gi,"")) / parseInt(data.orderChannel.orderTotCnt.replace(/,/gi,"")) * parseInt(100);
				var noSiteTypeCntPer 	= parseInt(data.orderChannel.noSiteTypeCnt.replace(/,/gi,"")) / parseInt(data.orderChannel.orderTotCnt.replace(/,/gi,"")) * parseInt(100);

				$("#orderTotCntPer").text( "100%" );
				$("#webCntPer").text( webCntPer.toFixed(2) + "%" );
				$("#mobileWebCntPer").text( mobileWebCntPer.toFixed(2) + "%" );
				$("#mobileAppCntPer").text( mobileAppCntPer.toFixed(2) + "%" );
				$("#adminCntPer").text( adminCntPer.toFixed(2) + "%" );
				$("#excelCntPer").text( excelCntPer.toFixed(2) + "%"  );
				$("#noSiteTypeCntPer").text( noSiteTypeCntPer.toFixed(2) + "%" );
				
				$(".newMonth").each(function(index) {
					var v = eval("data.newEmpNumber.m" + (index + 1))
					if( v == null || v == "null"){
						v = 0;
					}
					$(this).text(v)
				});
				
				$(".counselMonth").each(function(index) {
					var v = eval("data.counselNumber.m" + (index + 1))
					if( v == null || v == "null"){
						v = 0;
					}
					$(this).text(v)
				});
				
				var reuseList = data.reuseEmpNumber;
				var tempVal = parseInt(0);
				for (var i = 0; i < reuseList.length; i++) {
					var month = reuseList[i].scheduleDt.substring(4, 6);
					$("#reuse" + month).text(reuseList[i].cnt);
					tempVal += parseInt(reuseList[i].cnt);
				}
				
				$("#newEmpDetailTot").text(data.newEmpNumber.tot);
				$("#reuseEmpListTot").text( $.number(tempVal) );
				$("#counselNumberTot").text(data.counselNumber.tot);
				
				if( year != null && year != "null"){
					$("#useYear").text(year);
				}
				
				if( clientCd != null && clientCd != "null"){
					
					$(".monthEmp").each(function(index) {
						var v = eval("data.newEmpNumber.m" + (index + 1)+"User")
						var tempVal = "";
						
						if( v != null && v != "null" && v != ""	){
						  	var jbSplit = v.split( ',' );
						 	for ( var i in jbSplit ) {
						 		if(  jbSplit[i] != "" ){
						 			tempVal += jbSplit[i] + ", ";
						 		}
						  	}
						 	
							var idxOf = tempVal.lastIndexOf(', ');
							if( idxOf != -1){
								tempVal = tempVal.substring(0, idxOf  );						
							}else{
								tempVal = "-";
							}
						}else{
							tempVal = "-";
						}
						
						$(this).text(tempVal);
					});
					
					$("#jedoPeriod").show();
					var iter = data.clientJedoList;
					var element = "<option value=''>---- 전체 ----</option>";
					for (var i = 0; i < iter.length; i++) {
						if(periodSeq == iter[i].periodSeq){
							element += "<option value='" + iter[i].periodSeq + "' selected>" + iter[i].periodNo + "회기 ("+ iter[i].startDd +" ~ " + iter[i].endDd +")</option>";
						}else{
							element += "<option value='" + iter[i].periodSeq + "'>" + iter[i].periodNo + "회기 ("+ iter[i].startDd +" ~ " + iter[i].endDd +")</option>";
						}
					} 
					if (element != "") {
						$("[name=periodSeq]").append(element);
					}
					
				}
				
			}
		});
	}
	
	function doChangeMonth(move) {
		var year = parseInt($("#useYear").text());
		if (move == "n") {
			year = (year + 1);
		} else {
			year = (year - 1);
		}
		
		$("#useYear").text(year);
		search();
	}
	
	function doChangeOnlineMonth(move) {
		var year = parseInt($("#useOnlineYear").text());
		if (move == "n") {
			year = (year + 1);
		} else {
			year = (year - 1);
		}
		ajaxConnectionOnline('${clientCd}', year, $("#selectPeriod option:selected").val());
	}
	
	function ajaxConnectionOnline(clientCd, year, periodSeq) {
		$.ajax({
			url: '/madm/userManager/ajaxOnlineServiceUserList?clientCd=' + clientCd + '&year=' + year + "&periodSeq=" + periodSeq,
			dataType: 'json',
			success: function(data, textStatus) {
				
				$(".onlineMonthValue").text("0");
				
				$(".onlineNewMonth").each(function(index) {
					var v = eval("data.onlineNewEmpDetail.m" + (index + 1))
					$(this).text(v)
				});
				
				var reuseList = data.onlineReuseEmpList;
				var tempVal = parseInt(0);
				for (var i = 0; i < reuseList.length; i++) {
					var month = reuseList[i].regDt.substring(4, 6);
					$("#onlineReuse" + month).text(reuseList[i].cnt);
					tempVal += parseInt(reuseList[i].cnt);
				}
				
				$(".onlineCounselMonth").each(function(index) {
					var v = eval("data.onlineCounselNumber.m" + (index + 1))
					$(this).text(v)
				});
				

				$("#onlineNewTot").text(data.onlineNewEmpDetail.tot);
				$("#onlineReuseTot").text( $.number(tempVal) );
				$("#onlineCounselTot").text(data.onlineCounselNumber.tot);
				
				$("#useOnlineYear").text(year);
			}
		});
	}
</script>

</head>
<body>

<form:form id="searchBnr" modelAttribute="userManagerDto" action="/madm/userManager/getNewServiceUserList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">신규상담 조회</td>
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
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>고객사 선택</strong></td>
		    	<td width="40%" align="left" colspan="3">
		    		<select id="clientCd" name="clientCd" style="height: 20px;" onchange="clientReload('sel');">
		    			<option value="">---- 선택 ----</option>
		    			<c:forEach var="list" items="${clientList}">
		    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq userManagerDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
		    			</c:forEach>
		    		</select>
		    		<input type="text" id="chkClientCd" value="" onkeyup="clientReload('txt');" style="width:200px;" placeholder="고객사명을 입력 또는 선택하세요.">
		    	</td>
			</tr>
		
			<tr id="jedoPeriod" align="left" height="30px" style="display: none;">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>회기 선택</strong></td>
		    	<td width="40%" align="left" colspan="3">
		    		<select id="periodSeq" name="periodSeq" style="height: 20px;" >
		    			<option value="">---- 전체 ----</option>
		    			<c:forEach var="list" items="${clientJedoList}">
		    				<option value="${list.periodSeq }" <c:if test="${list.periodSeq eq userManagerDto.periodSeq}"> selected </c:if> >${list.periodNo }회기 (${list.startDd} ~ ${list.endDd })</option>
		    			</c:forEach>
		    		</select>
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
				<td align="center" >
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
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
			<colgroup>
				<col style="width:20%"/>
				<col style="width:15%"/>
				<col style="width:15%"/>
				<col style="width:15%"/>
				<col style="width:15%"/>
				<col style="width:15%"/>
			</colgroup>
			<thead>
				<tr>
					<th>구분</th>
					<th>전체임직원</th>
					<th>본인인증 임직원</th>
					<th>이용임직원</th>
					<th>전체이용인원</th>
					<th>상담횟수</th>
				</tr>
			</thead>
			<tbody>
				<tr align="" height="50px">
					<th>인원(명) / 횟수(회)</th>
					<td id="employeeCnt">0</td>
					<td id="confirmCnt">0</td>
					<td id="employeeUseCnt">0</td>
					<td id="allUseCnt">0</td>
					<td id="counselCnt">0</td>
				</tr>
				<tr align="" height="50px">
					<th>비율(%) / 회</th>
					<td id="employeeCntPer">0</td>
					<td id="confirmCntPer">0</td>
					<td id="employeeUseCntPer">0</td>
					<td id="allUseCntPer">0</td>
					<td id="counselCntPer">0</td>
				</tr>
			</tbody>		
		</table>
	</td>
</tr>


<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
			<colgroup>
				<col style="width:10%"/>
				<col style="width:13%"/>
				<col style="width:13%"/>
				<col style="width:13%"/>
				<col style="width:13%"/>
				<col style="width:13%"/>
				<col style="width:13%"/>
				<col style="width:13%"/>
			</colgroup>
			<thead>
				<tr>
					<th>구분</th>
					<th>전체주문</th>
					<th>웹(PC)</th>
					<th>모바일 웹</th>
					<th>모바일 앱(APP)</th>
					<th>관리자</th>
					<th>엑셀</th>
					<th>기타<br>(사이트타입 없음)</th>
				</tr>
			</thead>
			<tbody>
				<tr align="" height="50px">
					<th>주문 건수</th>
					<td id="orderTotCnt">0</td>
					<td id="webCnt">0</td>
					<td id="mobileWebCnt">0</td>
					<td id="mobileAppCnt">0</td>
					<td id="adminCnt">0</td>
					<td id="excelCnt">0</td>
					<td id="noSiteTypeCnt">0</td>
				</tr>
				<tr align="" height="50px">
					<th>비율(%)</th>
					<td id="orderTotCntPer">0</td>
					<td id="webCntPer">0</td>
					<td id="mobileWebCntPer">0</td>
					<td id="mobileAppCntPer">0</td>
					<td id="adminCntPer">0</td>
					<td id="excelCntPer">0</td>
					<td id="noSiteTypeCntPer">0</td>
				</tr>
			</tbody>		
		</table>
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td align="left" >
					<strong>▷ 월별 상담 이용추이</strong>
				</td>
				<td align="right" height="30px;" style="margin-right:20px;">
					<a href="javascript:void(0);" onclick="doChangeMonth('p');">◀</a>&nbsp;&nbsp;<strong id="useYear">${year }</strong>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="doChangeMonth('n');">▶</a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- 정보 시작 -->
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<colgroup>
							<col style="width:5%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>						
							<col style="width:3%"/>
						</colgroup>
						<thead>
							<tr>
								<th>구분</th>
								<th>1월</th>
								<th>2월</th>
								<th>3월</th>
								<th>4월</th>
								<th>5월</th>
								<th>6월</th>
								<th>7월</th>
								<th>8월</th>
								<th>9월</th>
								<th>10월</th>
								<th>11월</th>
								<th>12월</th>
								<th>총합</th>
							</tr>
						</thead>
						<tbody>
							<tr align="" height="50px">
								<th>신규이용<br>임직원(명)</th>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td class="newMonth monthValue">0</td>
								<td id="newEmpDetailTot" class="monthValue">0</td>
							</tr>
							<tr align="" height="50px">
								<th>재이용<br>임직원(명)</th>
								<td id="reuse01" class="monthValue">0</td>
								<td id="reuse02" class="monthValue">0</td>
								<td id="reuse03" class="monthValue">0</td>
								<td id="reuse04" class="monthValue">0</td>
								<td id="reuse05" class="monthValue">0</td>
								<td id="reuse06" class="monthValue">0</td>
								<td id="reuse07" class="monthValue">0</td>
								<td id="reuse08" class="monthValue">0</td>
								<td id="reuse09" class="monthValue">0</td>
								<td id="reuse10" class="monthValue">0</td>
								<td id="reuse11" class="monthValue">0</td>
								<td id="reuse12" class="monthValue">0</td>
								<td id="reuseEmpListTot" class="monthValue">0</td>
							</tr>
							<tr align="" height="50px">
								<th>상담횟수(회)</th>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td class="counselMonth monthValue">0</td>
								<td id="counselNumberTot" class="monthValue">0</td>
							</tr>
						</tbody>
					</table>
					<!-- 정보 종료 -->
				</td>
			</tr>
		</table>
		<!-- 영역 종료 -->
	</td>
</tr>


<tr>
	<td height="30px"></td>
</tr>


<tr>
	<td>
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			
			<tr>
				<td align="left" >
					<strong>▷ 월별 온라인검사 이용추이</strong>
				</td>
				<td align="right" height="30px;" style="margin-right:20px;">
					<a href="javascript:void(0);" onclick="doChangeOnlineMonth('p');">◀</a>&nbsp;&nbsp;<strong id="useOnlineYear">${year	}</strong>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="doChangeOnlineMonth('n');">▶</a>
				</td>
			</tr>	
				
			<tr>
				<td colspan="2">
					<!-- 정보 시작 -->
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<colgroup>
							<col style="width:5%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>
							<col style="width:3%"/>			
						</colgroup>
						<thead>
							<tr>
								<th>구분</th>
								<th>1월</th>
								<th>2월</th>
								<th>3월</th>
								<th>4월</th>
								<th>5월</th>
								<th>6월</th>
								<th>7월</th>
								<th>8월</th>
								<th>9월</th>
								<th>10월</th>
								<th>11월</th>
								<th>12월</th>
								<th>총합</th>
							</tr>
						</thead>
						<tbody>
							<tr align="" height="50px">
								<th>신규이용<br>임직원(명)</th>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td class="onlineNewMonth onlineMonthValue">0</td>
								<td id="onlineNewTot" class="onlineMonthValue">0</td>
							</tr>
							<tr align="" height="50px">
								<th>재이용<br>임직원(명)</th>
								<td id="onlineReuse01" class="onlineMonthValue">0</td>
								<td id="onlineReuse02" class="onlineMonthValue">0</td>
								<td id="onlineReuse03" class="onlineMonthValue">0</td>
								<td id="onlineReuse04" class="onlineMonthValue">0</td>
								<td id="onlineReuse05" class="onlineMonthValue">0</td>
								<td id="onlineReuse06" class="onlineMonthValue">0</td>
								<td id="onlineReuse07" class="onlineMonthValue">0</td>
								<td id="onlineReuse08" class="onlineMonthValue">0</td>
								<td id="onlineReuse09" class="onlineMonthValue">0</td>
								<td id="onlineReuse10" class="onlineMonthValue">0</td>
								<td id="onlineReuse11" class="onlineMonthValue">0</td>
								<td id="onlineReuse12" class="onlineMonthValue">0</td>
								<td id="onlineReuseTot" class="onlineMonthValue">0</td>
							</tr>
							<tr align="" height="50px">
								<th>이용횟수(회)</th>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td class="onlineCounselMonth onlineMonthValue">0</td>
								<td id="onlineCounselTot" class="onlineMonthValue">0</td>
							</tr>
						</tbody>
					</table>
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
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<!-- 정보 시작 -->
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<colgroup>
							<col style="width:10%"/>
							<col style="width:autol"/>
						</colgroup>
						<thead>
							<tr>
								<th>구분</th>
								<th>신규이용 임직원</th>
							</tr>
						</thead>
						<tbody>
							<tr align="" height="50px">
								<th>1월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>2월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>3월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>4월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>5월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>6월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>7월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>8월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>9월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>10월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>11월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
							<tr align="" height="50px">
								<th>12월</th>
								<td class="monthEmp monthEmpValue">-</td>
							</tr>
						</tbody>
					</table>
					<!-- 정보 종료 -->
				</td>
			</tr>
		</table>
		<!-- 영역 종료 -->
	</td>
</tr>

</table>
</form:form>
</body>
</html>

