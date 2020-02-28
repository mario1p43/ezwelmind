<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date ct = new Date();
	SimpleDateFormat fmt = new SimpleDateFormat("yyyy/MM/dd");
	
	//today
	String today = fmt.format(ct);
	
	//today-7
	ct.setDate(ct.getDate()-7);
	String owa = fmt.format(ct);
	
	//today -15(7+8)
	ct.setDate(ct.getDate()-8);
	String hma = fmt.format(ct);
	
	//today -30(7+8+15)
	ct.setDate(ct.getDate()-15);
	String oma = fmt.format(ct);

	//today -60(7+8+15+30)
	ct.setDate(ct.getDate()-30);
	String tma = fmt.format(ct);
	
%>
<html>
<head>
<title>서비스 이용현황 조회</title>
<script type="text/javascript">
	$(document).ready(function(){
		var temp = "";
		var cnt = 0;
		clientReload('sel');
		setStatus();
		
		$("#searchBtn").click(function(){
			
			$('input:checkbox[name="searchStatus"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#counselStatusArr").val(temp);

			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchOrder"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#siteTypeArr").val(temp);

			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchRisk"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#riskArr").val(temp);
			
			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchOrderStatus"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#orderStatusArr").val(temp);

			$("#searchForm").attr("action","/madm/userManager/getServiceUserListV2");
			$("#searchForm").submit();
			return false;
		});
			
		$(".detailView").click(function(){
			var intakeCd = $(this).attr("intakeCd");
			var counselCd = $(this).attr("counselCd");
			var userKey = $(this).attr("userKey");
			location.href = "/madm/userManager/getServiceUserDetail?intakeCd="+intakeCd+"&userKey="+userKey+"&counselCd="+counselCd;
			return false;
		});
		
		$(".detailCounsel").click(function(){
			var counselCd = $(this).attr("counselCd");
			var counselType = $(this).attr("counselType");  
			
			if (counselType == "100437") {
				alert("현재 진단은 일정을 변경 할 수 없습니다.");
				return;
			}
			
			$.divPop("counselChangePopup", "상담사/일정 변경", "/madm/counselor/counselorChange/layerPopup?counselCd=" + counselCd);
			
			return false;
		});

		$(".detailUser").click(function(){
			var counselCd = $(this).attr("counselCd");
			$.divPop("detailUser", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/counselDetail?counselCd="+counselCd);
			return false;
		});
		
		$(".modifyIntake").click(function(){
			var userKey = $(this).attr("userKey");
			var counselCd = $(this).attr("counselCd");
			var intakeCd = $(this).attr("intakeCd");
			
			if( confirm("임직원/인테이크정보 수정페이지로 이동하시겠습니까?") ){
				location.href = "/madm/employeeManagement/detail?userKey="+userKey+"&counselCd="+counselCd+"&intakeCd="+intakeCd;
			}
			return false;
		});
		
		$(".modifyDisp").click(function(){
			var params = {};
			var intakeCd = $(this).attr("intakeCd");
			var type 		= $(this).attr("type");
			var dispYn   = $(this).attr("disp");

			if(dispYn == "Y"){
				dispYn = "N";
			}else if(dispYn == "N"){
				dispYn = "Y";
			}

			params.intakeCd 	= intakeCd;
			params.dispYn  		= dispYn;
			params.type 	 		= type;

			if(confirm("변경 하시겠습니까?")){
				j$.ajax({
					url: '/madm/common/userManager/ajaxModifyIntakeDisp',
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
		
		$('.date_timepicker_startMonth').datetimepicker({
			format:'Y/m/d',
			onShow:function( ct ){
				this.setOptions({
					maxDate:j$('.date_timepicker_endMonth').val()?j$('.date_timepicker_endMonth').val():false
				})
			},
			timepicker:false
		});

		$('.date_timepicker_endMonth').datetimepicker({
			format:'Y/m/d',
			onShow:function( ct ){
				this.setOptions({
					minDate:j$('.date_timepicker_startMonth').val()?j$('.date_timepicker_startMonth').val():false
				})
			},
			timepicker:false
		});
		
		$("#startMonthImg").click(function(){
			$('.date_timepicker_startMonth').datetimepicker('show');
		});

		$("#endMonthImg").click(function(){
			$('.date_timepicker_endMonth').datetimepicker('show');
		});
		
		$("#excelBtn").click(function(){
			$('input:checkbox[name="searchStatus"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#counselStatusArr").val(temp);

			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchOrder"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#siteTypeArr").val(temp);

			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchRisk"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#riskArr").val(temp);
			
			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchOrderStatus"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#orderStatusArr").val(temp);
			$(".excelBtn").hide();
			$("#searchForm").attr("action","/madm/userManager/excelDownloadV2");
			$("#searchForm").submit();
		});
		
		$("#excelBtn2").click(function(){
			$('input:checkbox[name="searchStatus"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#counselStatusArr").val(temp);

			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchOrder"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#siteTypeArr").val(temp);

			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchRisk"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#riskArr").val(temp);
			
			temp = "";
			cnt = 0;
			
			$('input:checkbox[name="searchOrderStatus"]').each(function() {
			    if(this.checked){//checked 처리된 항목의 값
					if(cnt!=0){
				    	temp += "," + this.value;
					}else{
				    	temp += this.value;
					}
					cnt++;
			    }
			});
			$("#orderStatusArr").val(temp);
			$(".excelBtn").hide();
			$("#searchForm").attr("action","/madm/userManager/excelDownloadV3");
			$("#searchForm").submit();
		});
		
		$(".searchInput").keypress(function(e) {
			if (e.which == 13 ){
				$("#searchForm").attr("action","/madm/userManager/getServiceUserListV2");
				$("#searchForm").submit();
				return false;
			};
		});
		
		$("#searchCenter").keypress(function(e) {
			if (e.which == 13 ){
				$("#searchCenterBtn").click();
				return false;
			};
		});
		
		$(".happyCall").click(function(){
			var orderNum	= $(this).attr("orderNum");
			var userKey 		= $(this).attr("userKey");
			var counselCd 	= $(this).attr("counselCd");
			var intakeCd 	= $(this).attr("intakeCd");
			
			var cSplit = counselCd.split( ',' );
			var tempVal = "";
		 	for ( var i in cSplit ) {
		 		if(  cSplit[i] != "" ){
		 			if(tempVal == ""){
		 				tempVal = cSplit[i];
		 			}
		 			
		 			if(cSplit[i] < tempVal){
		 				tempVal = cSplit[i];
		 			}
		 		}
		  	}
		 	
			if( confirm("해피콜(만족도조사) 작성 페이지로 이동하시겠습니까?") ){
				location.href = "/madm/evaluation/happyCall?orderNum="+orderNum+"&userKey="+userKey+"&counselCd="+tempVal+"&intakeCd="+intakeCd;
			}
			return false;
		});
		
		
		// 센터검색
		$("#searchCenterBtn").click(function () {
			var searchCenter = $("#searchCenter").val();
			var params = {};
			
			if( searchCenter == ""){
				alert("센터명을 입력하세요");
				$("#searchCenter").focus();
				return true;
			}
			
			params.searchCenter = searchCenter;
			
			$.ajax({
				url: '/madm/counsel/searchCenter',
				data: params,
				dataType: 'json',
				type: 'post',
				success: function(data) {
					
					if( data.resultValue.length <= 0 ){
						alert("검색 결과가 없습니다.");
						return true;
					}else{
						var iter = data.resultValue;
						var element = "";
						result = iter.length;
						
						element += "<option value=''>--- 선택 ---</option>";
						for (var i = 0; i < iter.length; i++) {
							element += "<option value='" + iter[i].centerSeq + "'>" + iter[i].centerNm + "</option>";
						}
						
						if (element != "") {
							$("#centerSeq").empty();
							$("#centerSeq").append(element);
						}
					}
					
				}
			});
			
		});
		
	});  // end ready
	
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
	
	function jsSearchDate(arg) {
	    if (arg == "today") { //오늘
	    	$("#startMonth").val("<%=today %>");
	    	$("#endMonth").val("<%=today %>");
	    }
	    if (arg == "week") {  //일주일
	    	$("#startMonth").val("<%=owa %>");
	    	$("#endMonth").val("<%=today %>");
	    }
	    if (arg == "halfMonth") {  //보름
	    	$("#startMonth").val("<%=hma %>");
	    	$("#endMonth").val("<%=today %>");
	    }
	    if (arg == "month") {  //한달
	    	$("#startMonth").val("<%=oma %>");
	    	$("#endMonth").val("<%=today %>");
	    }
	    if (arg == "twoMonths") {  //두달
	    	$("#startMonth").val("<%=tma %>");
	    	$("#endMonth").val("<%=today %>");
	    } 
	}

	function jsSearchDateClear() {
		$("#startMonth").val("");
		$("#endMonth").val("");
	}
	
	function setStatus(){
		var counselStatusArr = $("#counselStatusArr").val().split(',');
		var siteTypeArr = $("#siteTypeArr").val().split(',');
		var riskArr = $("#riskArr").val().split(',');
		var orderStatusArr = $("#orderStatusArr").val().split(',');
		var tempVal = "";
		  
		$('input:checkbox[name="searchStatus"]').each(function() {
			tempVal = this;
			
			$.each(counselStatusArr, function(index, element){
				if(tempVal.value == element){
					tempVal.checked = true;
				}
			});
		});
		
		$('input:checkbox[name="searchOrder"]').each(function() {
			tempVal = this;
			
			$.each(siteTypeArr, function(index, element){
				if(tempVal.value == element){
					tempVal.checked = true;
				}
			});
		});

		$('input:checkbox[name="searchRisk"]').each(function() {
			tempVal = this;
			
			$.each(riskArr, function(index, element){
				if(tempVal.value == element){
					tempVal.checked = true;
				}
			});
		});
		
		$('input:checkbox[name="searchOrderStatus"]').each(function() {
			tempVal = this;
			
			$.each(orderStatusArr, function(index, element){
				if(tempVal.value == element){
					tempVal.checked = true;
				}
			});
		});
		
	}
</script>

</head>
<body>

<form:form id="searchForm" accept-charset="utf-8" modelAttribute="userManagerDto" action="/madm/userManager/getServiceUserListV2" method="POST">
<input type="hidden" name="searchYn" id="searchYn" value="Y" />
<input type="hidden" name="counselStatusArr"  id="counselStatusArr" value="${param.counselStatusArr }"  />
<input type="hidden" name="siteTypeArr"  id="siteTypeArr" value="${param.siteTypeArr }"  />
<input type="hidden" name="riskArr"  id="riskArr" value="${param.riskArr }"  />
<input type="hidden" name="orderStatusArr"  id="orderStatusArr" value="${param.orderStatusArr }"  />

<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>
	
<tr>
	<td>
		<!-- 헤더 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">서비스 이용현황 조회</td>
			</tr>
		</table>
		<!-- 헤더 영역 종료 -->
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
			
			<tr align="left" height="30px">
		    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담코드</strong></td>
		    	<td width="40%" align="left">
		    		<input type="text" name="counselCd" class="searchInput" placeholder="상담코드를 입력하세요." value="${userManagerDto.counselCd }" style="width:350px;">
		    	</td>
		    	
		    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>임직원 아이디</strong></td>
		    	<td width="40%" align="left">
		    		<input type="text" name="userId" class="searchInput" value="${userManagerDto.userId }" style="width:350px;">
		    	</td>
			</tr>
			
			<tr align="left" height="30px">
		    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>임직원명</strong></td>
		    	<td width="auto;" align="left">
		    		<input type="text" name="userNm" class="searchInput" value="${userManagerDto.userNm }" style="width:350px;">
		    	</td>
		    	
		    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>내담자명</strong></td>
		    	<td width="40%" align="left">
		    		<input type="text" name="counselNm" class="searchInput" value="${userManagerDto.counselNm }" style="width:350px;">
		    	</td>
			</tr>
			
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담센터</strong></td>
		    	<td width="40%" align="left">
			    	<select id="centerSeq" name="centerSeq" style="height: 20px;" >
			    		<option value="">---- 선택 ----</option>	
			    		<c:forEach var="list" items="${centerList}">
		    				<option value="${list.centerSeq }" <c:if test="${list.centerSeq eq userManagerDto.centerSeq}"> selected </c:if> >${list.centerNm }</option>
		    			</c:forEach>
		    		</select> 
		    		
					<input type="text" name="searchCenter" id="searchCenter"  style="width:250px">
		    		<input type="button" id="searchCenterBtn" value="센터 검색">
		    		
		    	</td>
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담사명</strong></td>
		    	<td width="40%" align="left">
		    		<input type="text" name="counselorNm" class="searchInput" placeholder="상담사의 이름을 입력하세요." value="${userManagerDto.counselorNm }" style="width:350px;">
		    	</td>
			</tr>
			
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담분야</strong></td>
		    	<td width="40%" align="left">
		    		<input type="checkbox" name="searchStatus" id="status01" value="100001"/><label for="status01">심리</label>
		    		<input type='checkbox'  name="searchStatus" id="status02" value='100003'/><label for="status02">재무</label>
		    		<input type="checkbox" name="searchStatus" id="status03" value="100002"/><label for="status03">법률/세무</label>
		    	</td>
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>주문채널</strong></td>
		    	<td width="40%" align="left">
		    		<input type="checkbox" name="searchOrder" id="status04" value="101005"/><label for="status04">웹</label>
		    		<input type='checkbox' name="searchOrder" id="status05" value='101006'/><label for="status05">모바일 웹</label>
		    		<input type="checkbox" name="searchOrder" id="status06" value="101007"/><label for="status06">모바일 앱</label>
		    		<input type='checkbox' name="searchOrder" id="status07" value='101008'/><label for="status07">관리자</label>
		    		<input type="checkbox" name="searchOrder" id="status08" value="101009"/><label for="status08">엑셀업로드</label>
		    	</td>
			</tr>
			
			<tr align="left" height="30px">
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>운영 담당자</strong></td>
		    	<td width="40%" align="left">
					<select name="mgrId">
						<option value="">---- 선택 ----</option>
						<c:forEach var="list" items="${mgrList}">
							<option value="${list.userId}" ${list.userId == userManagerDto.mgrId ? 'selected':''}>${list.userNm}</option>
						</c:forEach>
					</select>
		    	</td>
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>상담 담당자</strong></td>
		    	<td width="40%" align="left">
					<select name="counselMgrId">
						<option value="">---- 선택 ----</option>
						<c:forEach var="list" items="${mgrList}">
							<option value="${list.userId}" ${list.userId == userManagerDto.counselMgrId ? 'selected':''}>${list.userNm}</option>
						</c:forEach>
					</select>
		    	</td>
			</tr>
			
			<tr align="left" height="30px">
				<td width="" bgcolor="#F5F5F5" align="center"><strong>위험도</strong></td>
		    	<td width="" align="left">
		    		<input type="checkbox"  name="searchRisk" id="status09" value="1"/><label for="status09">1단계</label>
		    		<input type="checkbox"  name="searchRisk" id="status10" value='2'/><label for="status10">2단계</label>
		    		<input type="checkbox"  name="searchRisk" id="status11" value="3"/><label for="status11">3단계</label>
		    		<input type="checkbox"  name="searchRisk" id="status12" value='4'/><label for="status12">4단계</label>
		    		<input type="checkbox"  name="searchRisk" id="status13" value="5"/><label for="status13">5단계</label>
				</td>
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>1회기 확인</strong></td>
		    	<td width="40%" align="left">
		    		<input type="checkbox" name="counselReservChk" id="status14" value="Y" <c:if test="${'Y' eq userManagerDto.counselReservChk}"> checked </c:if>/><label for="status14">Y</label>
		    		<input type='checkbox'  name="counselReservChk" id="status15" value="N" <c:if test="${'N' eq userManagerDto.counselReservChk}"> checked </c:if>/><label for="status15">N</label>
		    	</td>
			</tr>

			<tr align="left" height="30px">
				<td width="" bgcolor="#F5F5F5" align="center"><strong>내담자 전화번호</strong></td>
		    	<td width="" align="left">
		    		<input type="text" name="counselMobile" class="searchInput" placeholder="내담자의 전화번호를 입력하세요." value="${userManagerDto.counselMobile }" style="width:350px;">
				</td>
				<td width="" bgcolor="#F5F5F5" align="center"><strong>임직원 전화번호</strong></td>
		    	<td width="" align="left">
		    		<input type="text" name="mobile" class="searchInput" placeholder="임직원의 전화번호를 입력하세요." value="${userManagerDto.mobile }" style="width:350px;">
				</td>				
			</tr>
			
			<tr align="left" height="30px">
				<td width="" bgcolor="#F5F5F5" align="center"><strong>상담(예정)일</strong></td>
		    	<td width="" align="left">
					<input type="text" name="startMonth" id="startMonth" size="10" class="date_timepicker_startMonth" value="${userManagerDto.startMonth}"/>
					<img id="startMonthImg" src="//img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
					&nbsp;~&nbsp;
					<input type="text" name="endMonth" id="endMonth" size="10" class="date_timepicker_endMonth" value="${userManagerDto.endMonth}"/>
					<img id="endMonthImg" src="//img.ezwelmind.co.kr/images/icon02.jpg"border="0" />
					
					<input type="button" value="오늘" onclick="javascript:jsSearchDate('today');" >
					<input type="button" value="일주일" onclick="javascript:jsSearchDate('week');" >
					<input type="button" value="15일" onclick="javascript:jsSearchDate('halfMonth');" >
					<input type="button" value="한달" onclick="javascript:jsSearchDate('month');" >
					<input type="button" value="두달" onclick="javascript:jsSearchDate('twoMonths');" >
					<input type="button" value="전체" onclick="javascript:jsSearchDateClear();" >
				</td>
				<td width="10%" bgcolor="#F5F5F5" align="center"><strong>주문상태</strong></td>
		    	<td width="40%" align="left">
		    		<input type="checkbox" name="searchOrderStatus" id="orderStatus01" value="100782"/><label for="orderStatus01">주문완료</label>
		    		<input type='checkbox' name="searchOrderStatus" id="orderStatus02" value='100783'/><label for="orderStatus02">주문취소</label>
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
		<!-- 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="60px;">
								<strong>
									총 ${paging.totalCount}건
								</strong>
							</td>
							<td id="btn02" width="auto;" align="left">
								<a href="#">
									<span id="excelBtn">액셀 다운로드</span>
								</a>
								<a href="#">
									<span id="excelBtn2">액셀 다운로드(상담일지포함)</span>
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
								
			<tr>
				<td>
					<!-- 정보 시작 -->
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr>
			                  <th width="45px">순번</th>
			                  <th width="120px">고객사</th>
			                  <th width="100px">접수일자<br>(주문일)</th>
			                  <th width="60px">임직원명</th>
			                  <th width="60px">내담자</th>
			                  <th width="100px">연락처</th>
			                  <th width="140px">상담주제</th>
			                  <th width="150px">상담센터</th>
			                  <th width="70px">상담사</th>
			                  <th width="120px">상담일시</th>
			                  <th width="100px">주문상태</th>
			                  <th width="40px">1회기<br>확인</th>
			                  <th width="40px">리마인드콜</th>
			                  <th width="40px">해피콜</th>
			                  <th width="auto;" colspan="3">정보관리</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
								<td>${list.clientNm }</td>
								<td>${list.orderDt }</td>
								<td>${list.userNm }</td>
								<td>
									<a href="javascript:void(0);" style="font-weight: bold; color: blue;">
										<span class="detailUser" counselCd="${fn:split(list.counselCd,',')[0]}">${list.counselNm }</span>
									</a>
								</td>
								<td>${list.mobile }</td>
								<td>${list.counselDiv } (${list.counselType})</td>
								<td>${list.centerNm }</td>
								<td>
									<c:set var="counselorNm" value="${fn:split(list.counselorNm,',')}" />
									<c:forEach var="data" items="${counselorNm}" varStatus="idx">
										${data }<br>
									</c:forEach>
								</td>
								<td>
									<c:set var="schedule" value="${fn:split(list.scheduleDt,',')}" />
									<c:set var="counselCd" value="${fn:split(list.counselCd,',')}" />
									<c:forEach var="data" items="${schedule}" varStatus="idx">
										<a href="javascript:void(0);" style="font-weight: bold; color: blue;">
											<span class="detailCounsel" counselCd="${counselCd[idx.index] }" counselType="${list.counselType }">${data }</span>
										</a> <br>
									</c:forEach> 
								</td>
								<td>
									<c:set var="orderStatusNm" value="${fn:split(list.orderStatusNm,',')}" />
									<c:forEach var="data" items="${orderStatusNm}" varStatus="idx">
										<c:choose>
											<c:when test="${data eq '주문취소' }">
											<span style="color:red; ">${data } </span><br>
											</c:when>
											<c:when test="${data eq '주문취소(50%환불)' }">
											<span style="color:blue; ">${data }</span><br>
											</c:when>
											<c:otherwise>
											<span>${data }</span><br>
											</c:otherwise>
										</c:choose>
									</c:forEach> 
								</td>
								<td>
									<a href="#" class="modifyDisp" intakeCd="${list.intakeCd}" disp="${list.counselReservChk}" type="COUNSEL_RESERV_CHK" style="font-weight: bold; 
										<c:choose>
											<c:when test="${list.counselReservChk eq 'N'}"> color: red;</c:when>
											<c:otherwise>color: blue;</c:otherwise>
										</c:choose> ">
										${list.counselReservChk }
									</a>
								</td>
								<td>
									<a href="#" class="modifyDisp" intakeCd="${list.intakeCd}" disp="${list.confirmCallYn}" type="CONFIRM_CALL_YN" style="font-weight: bold; color: blue;">
										${list.confirmCallYn }
									</a>
								</td>
								<td>
									<a href="#" class="modifyDisp" intakeCd="${list.intakeCd}" disp="${list.surveyCallYn }" type="SURVEY_CALL_YN" style="font-weight: bold; color: blue;">
										${list.surveyCallYn }
									</a>
								</td>
								<td id="btn02" width="">
									<button class="detailView" intakeCd="${list.intakeCd}" counselCd="${counselCd[0] }" userKey="${list.userKey}" type="button">상세</button>
								</td>
								<td id="btn02" width="">
									<button class="happyCall"  orderNum="${list.orderNum }"  counselCd="${list.minCounselCd }" userKey="${list.userKey }" intakeCd="${list.intakeCd}" type="button">만족도조사</button>
								</td>
								<td id="btn02" width="" >
									<button class="modifyIntake" intakeCd="${list.intakeCd}" counselCd="${counselCd[0] }" userKey="${list.userKey}" type="button">임직원/인테이크</button>
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
								<c:choose>
									<c:when test="${not empty paging}">
										<ui:paging value="${paging}"
		  									btnFirst="${url:img('/images/btn_first.jpg')}"
		  									btnPrev="${url:img('/images/btn_prev.jpg')}"
		  									btnNext="${url:img('/images/btn_next.jpg')}"
		  									btnLast="${url:img('/images/btn_last.jpg')}" />
  									</c:when>
									<c:otherwise>검색 내역이 없습니다.</c:otherwise>
								</c:choose>
							</td>
						</tr>
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