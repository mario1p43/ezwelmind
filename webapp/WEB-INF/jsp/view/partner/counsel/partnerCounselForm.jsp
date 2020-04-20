<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>서비스 이용목록</title>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('.counselYmd').datetimepicker({
			format:'Y.m.d',
			timepicker:false,
			minDate:0,
			maxDate:'${clientJedoPeriod.endDd}'
		});
		
		$("#stTime").change(function (){
			var str = $("#stTime").val();
			var dd = str.substring( 0, 2);
			
			$("#smsTime").val(dd);
		});
		
		
		
		/** 상담사 일정 체크 */
		$("#btnCounselConfirm").click(function () {
			
			
			
			var centerSeq = $("#centerList").val();
			var userId = $("#counselorList").val();
			var stTime = $("#stTime").val();
			//var smsTime = $("#smsTime").val()+$("#smsTime2").val();
			
			var ymd = $("#counselYmd").val();
			
			if ($("#intakeCd").val() == "") {
				alert("인테이크를 먼저 등록해주세요.");
				return;
			}
			if (typeof userId == "undefined" || userId == null || userId == "") {
				alert("상담사를 선택해주세요.");
				return;
			}
			if (ymd == "") {
				alert("상담날짜를 선택해주세요.");
				return;
			}
			if (stTime == "") {
				alert("상담시간을 선택해주세요.");
				return;
			}
			
			/* if(stTime < smsTime){
				alert("상담시간보다 sms문자시간이 늦을 수 없습니다.");
				return;
			}
			 */
			var params = {};
			params.userId = userId;
			params.ymd = replaceAll(ymd, ".", "");
			params.stTime = stTime;
			params.centerSeq = centerSeq;
			params.clientCd = $("#clientCd").val();
			//params.smsDt = smsTime;

			
			$.ajax({
				url: '/partner/pCounselorMgr/counselScheduleConfrim',
				data: params,
				dataType: 'json',
				type: 'get',
				success: function(data) {
					if (data.resultValue == "1001") {
						if (confirm("※상담사가 등록한 스케줄은 없습니다.\n상담사 스케줄을 등록하시겠습니까?\n\n★★상담사 스케줄을 등록하고 주문을 하지 않아도 상담사 스케줄이 그대로 남습니다.")) {
							$.ajax({
								url: '/partner/pCounselorMgr/addSchedule',
								data: params,
								dataType: 'json',
								type: 'get',
								success: function(data) {
									if (data.resultValue == "1") {
										alert("상담사 일정이 등록되었습니다.");
										$("#scheduleSeq").val(data.scheduleSeq);
										doPointCheck();
									} else {
										alert("실패하였습니다. 관리자에게 문의주세요.");
									}
								}
							});
						}
					} else if (data.resultValue == "1002") {
						//alert("상담이 가능한 시간입니다.");
						$("#scheduleSeq").val(data.scheduleSeq);
						popupBoxShow();
					} else if (data.resultValue == "1003") {
						alert("상담사 스케줄이 이미 등록되어 있어서, \n주문이 불가능합니다.");
					} else if (data.resultValue == "1004") {
						alert("해당 일자는 계약기간이 지난 시점으로 주문이 불가능합니다.");
					}
				}
			});  
			 
			
		});
		
		
	
		
		// 주문하기
		$("#doOrder").click(function () {
			$("#trOrder").hide();
			var params = {};
			params.userKey = $("#userKey").val();
			params.clientCd = $("#clientCd").val();
			params.intakeCd = $("#intakeCd").val();
			params.scheduleSeq = $("#scheduleSeq").val();
			params.ceilingCategoryCd = $("#ceilingCategoryCd").val();
			
			if ($("input:checkbox[id='smsYn']").is(":checked")) {
				params.smsYn = "Y";
			} else {
				params.smsYn = "N";
			}
			
			$.ajax({
				url: '/partner/pCounselorMgr/doOrder',
				data: params,
				dataType: 'json',
				type: 'post',
				success: function(data) {
					if (data.resultValue == "success") {
						alert("주문이 완료되었습니다.");
						location.href = "/partner/pCounselorMgr/counselFixList";
					} else {
						alert("주문에 실패하였습니다.");
					}
				}
			});
		});
		
			
	});  // end ready
	
	
	/** 
	 * 상담 가격정보
	 */ 
	function doPointCheck() {
		$("#popupBox").css("display","none");
		
		var params = {};
		params.userKey = $("#userKey").val();
		params.clientCd = $("#clientCd").val();
		params.intakeCd = $("#intakeCd").val();
		
		
		$.ajax({
			url: '/partner/pCounselorMgr/getOrderInfo',
			data: params,
			dataType: 'json',
			type: 'get',
			success: function(data) {
				if (data.resultValue == "success") {
					$("#counselOrderPrice").text(data.price);
					$("#trOrder").show();
					$("#btnCounselConfirm").hide();
				} else {
					alert("포인트가 부족합니다.");
				}
			}
		});
		///madm/counsel/getOrderInfo
	}
	
	function popupBoxShow(){
		$("#popupBox").css("display","block");
	}
	

</script>
</head>
<body>




<input type="hidden" id="userKey" name="userKey" value="${param.userKey}">
<input type="hidden" id="clientCd" name="clientCd" value="${user.clientCd}">

<input type="hidden" id="intakeCd" name="intakeCd" value="${intakeCd}">
<input type="hidden" id="scheduleSeq" name="scheduleSeq" value="">

<input type="hidden" id="ceilingCategoryCd" name="ceilingCategoryCd" value="100681">
<style>
#popupBox{
	border: 1px solid gray;
    width: 450px;
    height: 100px;
    z-index: 100;
    position: absolute;
    background: white;
    top: 200px;
    left: 350px;
    box-shadow: 5px 5px 5px 5px #dddddd6b;
    padding:40px;
    text-align: center;
    font-size: 13px;
}

#popupBoxBtn{
	border:1px solid gray;
	width: 100px;
	padding:5px;
	margin-top:50px;
	margin-left: auto;
    margin-right: auto;
    cursor: pointer;
}
</style>


<div class="web">
<div id="popupBox" style="display: none;">
즉시 포인트/회기가 차감되며, 내담자용 페이지에서 확인이 가능합니다. 
<br>
내담자와 사전 협의된 일정만 등록하십시오.
	<div id="popupBoxBtn" onclick="doPointCheck();">확인</div>
</div>
<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td align="left" class="subtitle">다음회기등록</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="60%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="20%" bgcolor="#F5F5F5" align="center">
									<strong>상담센터/상담사</strong>
								</td>
						    	<td width="40%" align="left">
						    		<c:choose>
						    			<c:when test="${empty intakeCd}">
						    				<select id="centerList">
												<option value="">센터를 선택해주세요.</option>
												<c:forEach var="list" items="${ centerList }">
													<option value="${list.centerSeq}" <c:if test="${centerSeq eq list.centerSeq}">selected</c:if>>${list.centerNm}</option>
												</c:forEach>
											</select>
											<select id="counselorList">
											</select>
						    			</c:when>
						    			<c:otherwise>
						    				<select id="centerList">
						    					<option value="${counsel.centerSeq}">${counsel.centerNm}</option>
						    				</select>
						    				<select id="counselorList">
						    					<option value="${counsel.counselorId}">${counsel.counselorId}(${counsel.counselorNm})</option>
											</select>
						    			</c:otherwise>
						    		
						    		</c:choose>

						    	</td>
							</tr>
							
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>날짜/시간</strong>
								</td>
						    	<td width="40%" align="left">
						    		<input type="text" size="10" class="counselYmd" id="counselYmd" value="" style="width:102px;" placeholder="=== 날짜 선택 ===" readonly>
					    			<select id="stTime">
					    				<option value=""> 시간 선택 </option>
										<option value="0700">07:00</option>
										<option value="0800">08:00</option>
										<option value="0900">09:00</option>
										<option value="1000">10:00</option>
										<option value="1100">11:00</option>
										<option value="1200">12:00</option>
										<option value="1300">13:00</option>
										<option value="1400">14:00</option>
										<option value="1500">15:00</option>
										<option value="1600">16:00</option>
										<option value="1700">17:00</option>
										<option value="1800">18:00</option>
										<option value="1900">19:00</option>
										<option value="2000">20:00</option>
										<option value="2100">21:00</option>
										<option value="2200">22:00</option>
									</select>
									
						    		<input type="button" id="btnCounselConfirm"  value="상담스케줄 확인 / 주문확인">
						    		<div style="padding-top:10px;">
								 		<strong>[중요공지]</strong><br> 
								 		<span style="color:red;">상담신청은 서비스기간 내</span>에서만 일정등록이 가능합니다.<br>
								 		* 서비스 기간 : ${clientJedoPeriod.startDd} ~ ${clientJedoPeriod.endDd} <br>
								 		문의사항은 이지웰니스로 연락부탁드립니다.(네이버톡톡:초록색배너 클릭)
								 	</div>
						    	</td>
							</tr>
							
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center">
									<strong>개인 잔여한도 / 개인한도</strong>
								</td>
						    	<td width="40%" align="left">
						    		${privateRemainPoint } / ${ceiling }
						    	</td>
							</tr>
							
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>
				<tr>
					<td height="30px"></td>
				</tr>
				
				
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="60%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px" style="display:none;">
								<td width="20%" bgcolor="#F5F5F5" align="center">
									<strong>주문가격</strong>
								</td>
						    	<td width="40%" align="left">
									<span id="counselOrderPrice"></span>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="20%" bgcolor="#F5F5F5" align="center">
									<strong>SMS전송여부</strong>
								</td>
						    	<td width="40%" align="left">
									<input id="smsYn" type="checkbox" checked>
									&nbsp;&nbsp;&nbsp;★  SMS를 전송하지 않으려면 체크를 해제 해주세요.
						    	</td>
							</tr>
							<!-- <tr align="left" height="30px">
								<td width="20%" bgcolor="#F5F5F5" align="center">
									<strong>SMS발송용 상담시간</strong>
								</td>
						    	<td width="40%" align="left">
									<select id="smsTime" disabled="disabled">
										<option value="">== 시간 선택 ==</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
									</select>
									<select id="smsTime2">
										<option value="00">= 분 선택 =</option>
										<option value="00">00</option>
										<option value="05">05</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
										<option value="30">30</option>
										<option value="35">35</option>
										<option value="40">40</option>
										<option value="45">45</option>
										<option value="50">50</option>
										<option value="55">55</option>
									</select>
									<span>*입력하지 않으면 변경할 시간으로 문자가 전송됩니다.</span>
						    	</td>
							</tr> -->
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>
				<tr id="trOrder" style="display:none;">
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="70%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
								    		<td id="btn01">
								    			<a href="#"><span id="doOrder">주문하기</span></a>
								    		</td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
</table>
	<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</div>

</body>
</html>

