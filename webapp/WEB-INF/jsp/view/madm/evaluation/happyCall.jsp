<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>만족도조사(종결)</title>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".counselDiagnosis").click(function(){
		var counselCd = $(this).attr("counselCd");
		var intakeCd = $(this).attr("intakeCd");
		$.divPop("counselDiagnosis", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/counselDiagnosis/"+intakeCd+"/"+counselCd);
		return false;
	});
	
	$("#insertBtn").click(function(){
		if(confirm("저장하시겠습니까?")){
			$("#happyForm").submit();		
		}
		return false;
	});
	
});
</script>
</head>
<body>

<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">만족도조사(종결)</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="30px"></td>
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
		    	<td colspan="5" align="left">${empDetail.rrn }</td>
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
		    	<td colspan="5" align="left">개인 한도 : ${ceiling }<br>개인 잔여한도 : ${privateRemainPoint}<br> 고객사 잔여한도 : ${clientRemainPoint}</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td height="20px"></td>
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
		</table>
	</td>
</tr>
<!-- 인테이크 테이블 끝-->

<tr>
	<td height="20px"></td>
</tr>

<form:form id="happyForm" modelAttribute="evaluationDto" action="/madm/evaluation/happyCall" method="POST">
<input type="hidden" name="userKey" value="${empDetail.userKey }" />
<input type="hidden" name="targetSeq" value="${targetSeq }">
<input type="hidden" name="counselCd" value="${counselCd }">
<input type="hidden" name="intakeCd" value="${intakeCd }">
<tr>
	<td align="left" class="subtitle">만족도조사</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr align="left" height="30px" >
				<th class="line" align="center" width="5%"></th>
				<th class="line" align="center" width="auto;">질문</th>
				<th class="line" align="center" width="45%">답변<br>(매우 그렇다 4점  -  보통이다 2점  -  전혀 아니다 0점)</th>
			</tr>
				
			<c:forEach var="list" items="${ansDetail}" varStatus="status">
				<tr align="left" height="50px" >
					<th class="line" align="center">${status.count }</th>
					<td align="center">${list.itemTitle }
						<c:if test="${status.first }">
							<input type="hidden" name="evalSeq" value="${list.evalSeq }" />
						</c:if>
						<c:if test="${status.last}">
							<input type="hidden" name="countNum" value="${status.count}">
						</c:if>
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${list.itemType eq 'Y'}">
								<input type="radio" name="lv_sel_${status.count}" id="lv_04_${list.itemSeq}" value="4" <c:if test="${list.itemAns eq '4'}"> checked </c:if> ><label for="lv_04_${list.itemSeq}">매우 그렇다.</label>
								<input type="radio" name="lv_sel_${status.count}" id="lv_03_${list.itemSeq}" value="3" <c:if test="${list.itemAns eq '3'}"> checked </c:if> ><label for="lv_03_${list.itemSeq}">그렇다.</label>
								<input type="radio" name="lv_sel_${status.count}" id="lv_02_${list.itemSeq}" value="2" <c:if test="${list.itemAns eq '2'}"> checked </c:if> ><label for="lv_02_${list.itemSeq}">보통이다.</label>
								<input type="radio" name="lv_sel_${status.count}" id="lv_01_${list.itemSeq}" value="1" <c:if test="${list.itemAns eq '1'}"> checked </c:if> ><label for="lv_01_${list.itemSeq}">아니다.</label>
								<input type="radio" name="lv_sel_${status.count}" id="lv_00_${list.itemSeq}" value="0" <c:if test="${list.itemAns eq '0'}"> checked </c:if> ><label for="lv_00_${list.itemSeq}">전혀 아니다.</label>
							</c:when>
							<c:when test="${list.itemType eq 'N'}">
								<textarea rows="5" cols="50" name="lv_sel_${status.count}" id="itemAns"  >${list.itemAns }</textarea>
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
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
				    		<td id="btn01"><a href="javascript:void(0);"><span id="insertBtn">저 장</span></a></td>
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
</form:form>
</table>

</body>
</html>

