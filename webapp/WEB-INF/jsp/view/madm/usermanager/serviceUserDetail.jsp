<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>서비스 상세 이용현황</title>
<script type="text/javascript">
	$(document).ready(function(){
		$(".pCounselorDateModify").click(function(){
			var counselUser = $(this).attr("value");
			var paramArr = counselUser.split('&');
			location.href = "/partner/pCounselorMgr/pCounselorDateDetail?counselCd="+paramArr[0]+"&userKey="+paramArr[1];
		});
		
		$(".detailCounsel").click(function(){
			var counselCd = $(this).attr("counselCd");
			var counselType = $(this).attr("counselType");  
			
			if (counselType == "100437") {
				alert("현재 진단은 일정을 변경 할 수 없습니다.");
				return;
			}
			
			$.divPop("counselChangePopup", "상담사/일정 변경", "/madm/counselor/counselorChange/layerPopup?counselCd=" + counselCd);
		});
		

		$(".cancelOrder").click(function(){
			var params = {};
			params.counselCd = $(this).attr("counselCd");      // 상담코드
			params.smsYn = "N";
			
			if (typeof params.counselCd == "undefined") {
				alert("다시 시도해주세요.");
				return;
			}
			
			if (confirm("취소시 SMS를 보내시겠습니다.\n[확인:예][취소:아니요]")) {
				params.smsYn = "Y"
			}
			
			if (confirm("상담코드 : [" + params.counselCd + "]를 취소하시겠습니까? \n\n※취소후에는 복원이 불가능합니다.\n※상담날짜가 지났어도 100% 취소가 됩니다.")) {
				$.ajax({
					url: '/madm/counsel/counselCancel',
					data: params,
					dataType: 'json',
					type: 'get',
					success: function(data, textStatus){
						if (data.resultValue == "success") {
							alert("취소되었습니다.");
							location.reload(true);
						} else {
							alert("실패하였습니다. 관리자에게 문의주세요.");
						}
					}
				});
			}
		});
		
		$(".halfCancel").click(function(){
			var params = {};
			params.counselCd = $(this).attr("counselCd");      // 상담코드
			var orderStatusCd = $(this).attr("orderStatusCd");
			var orderAmt = $(this).attr("orderAmt");
			params.smsYn = "N";
			
			if (typeof params.counselCd == "undefined") {
				alert("다시 시도해주세요.");
				return;
			}
			
			if (typeof orderStatusCd == "undefined") {
				alert("다시 시도해주세요.");
				return;
			}
			
			if (orderStatusCd == "100783") {
				alert("이미 100% 환불된 데이터입니다. 다시 확인해주세요.");
				return;
			}
			
			if (orderAmt < 10) {
				alert("포인트 결제만 취소 가능합니다.");
				return;
			}
			
			/*if (orderStatusCd == "101038") {
				alert("이미 50% 환불된 데이터입니다. 다시 확인해주세요.");
				return;
			} */
			if (confirm("취소시 SMS를 보내시겠습니다.\n[확인:예][취소:아니요]")) {
				params.smsYn = "Y"
			}
			
			if (confirm("상담코드 : [" + params.counselCd + "]를 취소하시겠습니까? \n\n※취소후에는 복원이 불가능합니다.\n※포인트 결제만 취소가능하며 상담날짜가 지났어도 50% 취소가 됩니다.")) {
				$.ajax({
					url: '/madm/counsel/halfCancel',
					data: params,
					dataType: 'json',
					type: 'get',
					success: function(data, textStatus){
						if (data.resultValue == "success") {
							alert("취소되었습니다.");
							location.reload(true);
						} else {
							if(data.msg!=null && data.msg!=''){
								alert(data.msg)
							}else{
								alert("실패하였습니다. 관리자에게 문의주세요.");
							}
						}
					}
				});
			}
		});
		
		$(".extendOrder").click(function () {
			
			var userStatus = '${user.userStatus}';	// 고객 재직상태
			var userUseYn = '${user.useYn}';		// 고객 사용유무
			
			if(userUseYn == 'N'){				// 사용불가 상태의 아이디
				alert('사용불가 처리된 아이디입니다.')
			}else if(userStatus == '100009'){	// 고객이 퇴직 상태이면
				alert('퇴직처리된 아이디입니다.')
			}else{
				var counselCd = $(this).attr("counselCd");
				var userKey = $(this).attr("userKey");  
				
				location.href = "/madm/counsel/adminCounselForm?userKey="+ userKey + "&counselCd=" + counselCd;
			}
		});
		
		$(".counselDiagnosis").click(function(){
			var counselCd = $(this).attr("counselCd");
			var intakeCd = $(this).attr("intakeCd");
			$.divPop("counselDiagnosis", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/counselDiagnosis/"+intakeCd+"/"+counselCd);
			return false;
		});
		
		$(".showAmount").click(function(){
			var clientCd = $(this).attr("clientCd");
			$.divPop("showClient", "고객사 상세정보", "/madm/client/showAmountPop?searchClientNm="+clientCd);
			return false;
		});
		

		$(".givePointToUser").click(function(){
			var clientCd = $(this).attr("clientCd");
			var userKey = $(this).attr("userKey");  
			var url = "/madm/operations/popupGivePointToUser?clientCd="+clientCd+"&userKey="+userKey;
			$.divPop("givePointToUserPopUp", "포인트 부여하기", url);
			return false;
		});
		
		$(".takePointToUser").click(function(){
			var clientCd = $(this).attr("clientCd");
			var userKey = $(this).attr("userKey");  
			var url = "/madm/operations/popupTakePointToUser?clientCd="+clientCd+"&userKey="+userKey;
			$.divPop("takePointToUserPopUp", "포인트 차감하기", url);
			return false;
		});
		
	});  // end ready
	
	function modifyRecordStatus(sel, counselCd){
		var params = {};
		params.recordStatus = sel.value;		// 상담일지 상태
		params.counselCd = counselCd;   	// 상담코드
		
		if (confirm("상담코드 : [" + params.counselCd + "]를 일지를 변경 하시겠습니까?")) {
			j$.ajax({
				url: '/madm/counsel/modefyRecordStatus',
				data: params,
				dataType: 'json',
				type: 'get',
				success: function(data, textStatus){
					if (data.updateCnt == "1") {
						alert("일지상태값이 변경되었습니다.");
					} else {
						alert("실패하였습니다. 관리자에게 문의주세요.");
					}
				}
			});
		}
	}
	
</script>
<style>
.downBtn{
	float:right;
    border: 1px solid rgb(221, 221, 221);;
    padding: 2px 6px;
}
</style>
</head>
<body>

<form:form id="searchBnr" modelAttribute="userManagerDto" action="/madm/userManager/getNewServiceUserList" method="GET">

<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td align="left" class="subtitle">임직원 정보</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center" width="11%"><strong>고객사명</strong></td>
		    	<td align="left" width="23%">${empDetail.clientNm }</td>
		    	<td bgcolor="#F5F5F5" align="center" width="11%"><strong>이름</strong></td>
		    	<td align="left" width="auto;" colspan="3">${empDetail.userNm }</td>
			</tr>
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center"><strong>유저키</strong></td>
		    	<td align="left">${empDetail.userKey }</td>
		    	<td bgcolor="#F5F5F5" align="center"><strong>아이디/사번</strong></td>
		    	<td align="left" colspan="3">${empDetail.userId } (${empDetail.empNum })</td>
			</tr>
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center"><strong>주민번호 앞 7자리</strong></td>
		    	<td colspan="3" align="left">${empDetail.rrn }</td>
				<td bgcolor="#F5F5F5" align="center"><strong>고객사 담당자 여부</strong></td>
		    	<td align="left" style="font-weight:bold; ${empDetail.clientMgrYn eq 'Y' ? 'color:red' : 'color:blue' }">
		    	${empDetail.clientMgrYn }
		    	</td>
			</tr>
			
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center"><strong>전화번호</strong></td>
		    	<td align="left">${empDetail.homeTel }	</td>
		    	<td bgcolor="#F5F5F5" align="center"><strong>휴대폰</strong></td>
		    	<td align="left">${empDetail.mobile }  	</td>
		    	<td bgcolor="#F5F5F5" align="center" width="11%"><strong>이메일</strong></td>
		    	<td align="left" width="23%">${empDetail.email } 	</td>
			</tr>
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center"><strong>성별</strong></td>
		    	<td align="left">${empDetail.genderNm } 	</td>
		    	<td bgcolor="#F5F5F5" align="center"><strong>직급/직책</strong></td>
		    	<td align="left">${empDetail.gradeNm} </td>
		    	<td bgcolor="#F5F5F5" align="center"><strong>재직상태</strong></td>
		    	<td align="left">${empDetail.userStatusNm }  	</td>
			</tr>
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center"><strong>소속</strong></td>
		    	<td align="left" colspan="5">
		    		${empDetail.branchNm} &nbsp; ${empDetail.deptNm} &nbsp; ${empDetail.teamNm} &nbsp; ${empDetail.partNm}
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center"><strong>주소</strong></td>
		    	<td colspan="5" align="left">${empDetail.addr1 } ${empDetail.addr2 }</td>
			</tr>
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center"><strong>사용한도</strong></td>
		    	<td colspan="5" align="left">개인 한도 : ${ceiling }<br>개인 잔여한도 : ${privateRemainPoint}<br> 고객사 잔여한도 : ${clientRemainPoint}</br> 관리자가 조정한 포인트 합산 : ${givenPoint}
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<td bgcolor="#F5F5F5" align="center"><strong>고객사 비용 조회</strong></td>
		    	<td colspan="5" align="left" ><a href="javascript:void(0);"><span style="font-weight: bold; color: blue;" class="showAmount" clientCd="${empDetail.clientCd }">보기</span></a></td>
			</tr>
			<c:if test="${isAdmin}">
				<tr align="left" height="30px">
					<td bgcolor="#F5F5F5" align="center"><strong>포인트 조정</strong></td>
			    	<td colspan="5" align="left" >
			    		<button class="givePointToUser" type="button" clientCd="${empDetail.clientCd }" userKey="${empDetail.userKey }">포인트 부여</button>
			    		<button class="takePointToUser" type="button" clientCd="${empDetail.clientCd }" userKey="${empDetail.userKey }">포인트 차감</button>
			    	</td>
				</tr>
			</c:if>
		</table>
	</td>
</tr>
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td align="left" class="subtitle">서비스 기간</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr align="center" height="30px">
				<th width="5%">No.</th>
				<th width="20%">제도 기간</th>				
				<th width="25%">개인 사용한도</th>
				<th width="25%">포인트 현황</th>
			</tr>
			<c:forEach var="list" items="${jedoList}" varStatus="status">
				<tr align="center" height="30px">
					<td>${list.periodNo }</td>
					<td>${list.startDd } ~ ${list.endDd }</td>
					<td>${list.ceilingPoint } / 멘탈헬스 한도내 ${list.mentalPoint }%</td>
					<td>${list.point } / ${list.assignBudget }</td>
				</tr>
			</c:forEach>
		</table>
	</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>
<tr>
	<td align="left" class="subtitle">인테이크</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr align="left" height="30px" >
				<th class="line" align="center" width="10%">상담 받을 분</th>
				<td width="20%">
					<comm:commNmOut option="commCd" code="${intakeDetail.relation } "/>
				</td>
				<th class="line" align="center" width="10%">생년월일</th>
				<td width="20%">
					${intakeDetail.rrn }
				</td>
				<th class="line" align="center" width="10%">성별</th>
				<td width="auto;">
					${intakeDetail.gender }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">성명</th>
				<td>
					${intakeDetail.counselNm }
				</td>
				<th class="line" align="center">학력/학년</th>
				<td>
					<comm:commNmOut option="commCd" code="${intakeDetail.education } "/>
					&nbsp; <comm:commNmOut option="commCd" code="${intakeDetail.session } "/>
				</td>
				<th class="line" align="center">직업</th>
				<td>
					<c:if test="${not empty intakeDetail.job }">
						<comm:commNmOut option="commCd" code="${intakeDetail.job }"/>
					</c:if>
					<c:if test="${empty intakeDetail.job }">
						-
					</c:if>
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">휴대전화</th>
				<td>
		    		${intakeDetail.mobile }
				</td>
				<th class="line" align="center">이메일</th>
				<td>
		    		${intakeDetail.email }
				</td>
				<th class="line" align="center">상담분야</th>
				<td>
					${intakeDetail.counselDivNm }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">상담방법</th>
				<td>
					<comm:commNmOut option="commCd" code="${intakeDetail.counselType }"/>
				</td>
				<th class="line" align="center">상담 세부주제</th>
				<td >
					${intakeDetail.cause }
				</td>
				<th class="line" align="center">사전질문</th>
				<td>
					<c:choose>
						<c:when test="${intakeDetail.counselType eq '100433' }">
							<button class="counselDiagnosis" type="button" counselCd="${intakeDetail.counselCd }" intakeCd="${intakeDetail.intakeCd }">자세히</button>
						</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">자유기술</th>
				<td colspan="5">
					${empty intakeDetail.memo ? '-' : intakeDetail.memo}
				</td>
			</tr>
			<tr>
				<th class="line" align="center">상담동의서</th><td>
					<c:if test="${intakeDetail.filename1 ne null }">
						${intakeDetail.filename1} <a href="javascript:fileDownLoad('${intakeDetail.filefath1}','${intakeDetail.filename1}');"><div class="downBtn">다운로드</div></a>
					</c:if> 
				</td>
				<th class="line" align="center">개인정보 동의서</th><td>
					<c:if test="${intakeDetail.filename2 ne null }">
						${intakeDetail.filename2}<a href="javascript:fileDownLoad('${intakeDetail.filefath2}','${intakeDetail.filename2}');"><div class="downBtn">다운로드</div></a>
					</c:if>
				</td>
				<th class="line" align="center">생명존중 서약서</th><td>
					<c:if test="${intakeDetail.filename3 ne null }">
						${intakeDetail.filename3}<a href="javascript:fileDownLoad('${intakeDetail.filefath3}','${intakeDetail.filename3}');"><div class="downBtn">다운로드</div></a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="line" align="center">심리검사동의서</th><td>
					<c:if test="${intakeDetail.filename4 ne null }">
						${intakeDetail.filename4} <a href="javascript:fileDownLoad('${intakeDetail.filefath4}','${intakeDetail.filename4}');"><div class="downBtn">다운로드</div></a>
					</c:if>
				</td>
				<th class="line" align="center">상담회기동의서</th><td>${intakeDetail.filename5} 
					<c:if test="${intakeDetail.filename5 ne null }">
						<a href="javascript:fileDownLoad('${intakeDetail.filefath5}','${intakeDetail.filename5}');"><div class="downBtn">다운로드</div></a>
					</c:if>
				</td>
				<td colspan="2"></td>
			</tr>
		</table>
	</td>
</tr>
<!-- 인테이크 테이블 끝-->
<tr>
	<td height="10px"></td>
</tr>

<tr>
	<td>	
		<!-- 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 5px auto 5px auto;">
						<tr>
							<td align="left" width="90%">
								<strong>
									총 ${fn:length(detailList)}건 
								</strong>
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
			                  <th width="">순번</th>
			                  <th width="">상담코드</th>
			                  <th width="">상담일시</th>
			                  <th width="">상담센터</th>
			                  <th width="">상담사</th>
			                  <th width="">상태</th>
			                  <th width="">주문상태</th>
			                  <th width="">주문채널</th>
			                  <th width="">위험도</th>
			                  <th width="" colspan="6">정보관리</th>
			                </tr>
			            </thead>

						<tbody>
							<c:forEach var="list" items="${detailList}" varStatus="status">
				                <tr counselCd="${list.counselCd }" >
									<td>${status.count }</td>
									<td>${list.counselCd }</td>
									<td>${list.scheduleDt }</td>
									<td>${list.centerNm }</td>
									<td>${list.counselorNm } (${list.counselorId })</td>
									<td>${list.statusNm }</td>
									<td>
										<c:choose>
											<c:when test="${list.orderStatusCd eq '100783' }">
											<span style="color:red; ">${list.orderStatus }(${list.cancelDt })</span>
											</c:when>
											<c:when test="${list.orderStatusCd eq '101038' }">
											<span style="color:blue; ">${list.orderStatus }</br>(${list.cancelDt })</span>
											</c:when>
											<c:otherwise>
											<span>${list.orderStatus }
											<c:if test="${intakeDetail.counselType eq '101047' }">
												<br/>(${list.mindPrismStatus })
											</c:if>
											</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td >${list.siteType } (${list.orderId }) </td>
									<td >${list.risk } </td>
									<c:if test="${status.first}" >
										<td id="btn02" rowspan="${fn:length(detailList)}" >
											<button class="extendOrder" type="button" counselCd="${list.counselCd }" userKey="${list.userKey }"> 연장하기 </button>
										</td>
									</c:if>
									<td id="btn02">
										<button class="detailCounsel" type="button" counselCd="${list.counselCd }" counselType="${list.counselType }">상담사/일정 변경</button>
									</td>
									<td id="btn02">
										<button class="cancelOrder" type="button" counselCd="${list.counselCd }"> 상담취소(100%) </button>
									</td>
									<td id="btn02">
										<button class="halfCancel" type="button" counselCd="${list.counselCd }" orderStatusCd="${list.orderStatusCd }" orderAmt="${list.orderAmt }"> 상담취소(50%) </button>
									</td>
									<td id="btn02">
										<button class="pCounselorDateModify" type="button" value="${list.counselCd}&${list.userKey}" > 일지조회 </button>
									</td>
									<td>
										<comm:select name="recordStatus" code="100691" selectValue="${list.recordStatus}" onchange="modifyRecordStatus(this,${list.counselCd });"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
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