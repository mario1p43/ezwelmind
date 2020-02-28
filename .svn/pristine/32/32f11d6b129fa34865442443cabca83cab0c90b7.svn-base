<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<script>
	j$(document).ready(function(){
	});
</script>

<div align="center"  style="min-width:900px; min-height: 250px; vertical-align: middle;" >

<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse; " >
	<!-- 인테이크 테이블 -->
	<tr>
		<td><h3><span style="font-weight: bold; color: blue;">ㆍ인테이크</span></h3></td>
	</tr>
	<tr>
		<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
			<tr align="left" height="30px" >
				<th class="line" align="center" width="13%">상담 받을 분</th>
				<td width="20%">
					<input type="hidden" name="education" value="${intake_detail.relation }"/> <comm:commNmOut option="commCd" code="${intake_detail.relation } "/>
				</td>
				<th class="line" align="center" width="13%">생년월일</th>
				<td width="15%">
					<input type="hidden" name="rrn" value="${intake_detail.rrn }"/> ${intake_detail.rrn }
				</td>
				<th class="line" align="center" width="13%">성별</th>
				<td>
					<input type="hidden" name="gender" value="${intake_detail.gender }"/> ${intake_detail.gender }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">성명</th>
				<td>
					<input type="hidden" name="userNm" value="${baseInfo_detail.counselNm}"/> ${empty baseInfo_detail.counselNm ? '-' : baseInfo_detail.counselNm}
				</td>
				<th class="line" align="center">학력/학년</th>
				<td>
					<input type="hidden" name="education" value="${intake_detail.education }"/> <comm:commNmOut option="commCd" code="${intake_detail.education } "/>

					<c:if test="${not empty intake_detail.session }">
						/
						<input type="hidden" name="session" value="${intake_detail.session }"/> <comm:commNmOut option="commCd" code="${intake_detail.session } "/>
					</c:if>
				</td>
				<th class="line" align="center">직업</th>
				<td>
					<c:if test="${not empty intake_detail.job }">
						<input type="hidden" name="job" value="${intake_detail.job }"/> <comm:commNmOut option="commCd" code="${intake_detail.job }"/>
					</c:if>
					<c:if test="${empty intake_detail.job }">
						<input type="hidden" name="job" value="${intake_detail.job }"/> -
					</c:if>
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">휴대전화</th>
				<td>
					<input type="hidden" name="mobile" value="${intake_detail.mobile }"/> ${intake_detail.mobile }
				</td>
				<th class="line" align="center">이메일</th>
				<td>
					<input type="hidden" name="email" value="${intake_detail.email }"/> ${intake_detail.email }
				</td>
				<th class="line" align="center">상담분야</th>
				<td>
					<input type="hidden" name="counselDiv" value="${intake_detail.counselDiv }"/>${intake_detail.counselDivNm }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">상담방법</th>
				<td>
					<input type="hidden" name="counselType" value="${intake_detail.counselType }"/><comm:commNmOut option="commCd" code="${intake_detail.counselType }"/>
				</td>
				<th class="line" align="center">상담 세부주제</th>
				<td colspan="3">
					<input type="hidden" name="cause" value="${intake_detail.cause }"/> ${intake_detail.cause }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">자유기술</th>
				<td colspan="5">
					<input type="hidden" name="memo" value="${intake_detail.memo }"/> ${empty intake_detail.memo ? '-' : intake_detail.memo}
				</td>
			</tr>
		</table>
	</tr>
	<!-- 인테이크 테이블 끝-->

	<tr>
		<td height="80px"></td>
	</tr>

<c:if test="${fn:length(counselDiagnosis) eq 3}">
	<!-- 기본정보 테이블 -->
	<tr>
		<td><h3><span style="font-weight: bold; color: blue;">ㆍ사전 설문조사</span></h3></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
				<tr align="left" height="30px" >
					<th class="line" align="center" width="5%"></th>
					<th class="line" align="center" width="auto;">질문</th>
					<th class="line" align="center" width="15%">답변</th>
				</tr>
					
				<c:forEach var="list" items="${counselDiagnosis}" varStatus="status">
					<c:if test="${status.index eq 0 }">
						<tr align="left" height="50px" >
							<th class="line" align="center">1</th>
							<td align="center" ><b>현재 주관적으로 어느 정도의 스트레스 및 심리적인 어려움을 겪고 있는지
								<br>1에서 100까지의 수치를 선택해 주십시오. ( 1 : 매우 적음 100 : 극도의 심리적 어려움 )
								<br><br>본인이 상담을 받는 사람이 아닐 경우, 관찰자 입장에서 작성해주십시오.
								<br>예를 들어, 자녀가 상담을 받을 예정인 경우 자녀의 스트레스 정도를 선택하시면 됩니다. </b>
							</td>
							<td align="center">
								${list.point }
							</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq 1 }">
						<tr align="left" height="50px" >
							<th class="line" align="center">2</th>
							<td align="center"> <b>상담을 받고자 하는 내용으로 인하여 현재 업무 및 직장생활에서
								<br>겉으로 드러나 보이는 영향이 어느 정도 인지 체크해주세요. 
								<br><br>겉으로 드러나 보이는 영향이란 연차사용, 결근, 조퇴 등 외형적인 측면을 이야기합니다. 
								<br>본인이 상담을 받는 사람이 아닐 경우에도, 그로 인해 겪는 나의 영향을 선택해주십시오.</b>
							</td>
							<td align="center">
								<c:choose>
									<c:when test="${list.answerNum eq 1}">영향이 전혀 없다.</c:when>
									<c:when test="${list.answerNum eq 2}">영향이 거의 없다.</c:when>
									<c:when test="${list.answerNum eq 3}">보통이다.</c:when>
									<c:when test="${list.answerNum eq 4}">영향이 조금 있다.</c:when>
									<c:when test="${list.answerNum eq 5}">영향이 매우 많다.</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq 2 }">
						<tr align="left" height="50px" >
							<th class="line" align="center">3</th>
							<td align="center"> <b>상담을 받고자 하는 내용으로 인하여 현재 정신적/심리적으로
								<br>업무 및 직장생활에 미치는 정도가 어느 정도 인지 체크해주세요.
								<br><br>정신적/심리적 영향이란 집중력저하, 피로감, 불안감 조성 등으로
								<br>업무에 영향을 미치는 내재적 측면을 이야기합니다.
								<br>본인이 상담을 받는 사람이 아닐 경우에도, 그로 인해 겪는 나의 영향을 선택해 주십시오. </b>
							</td>
							<td align="center">
								<c:choose>
									<c:when test="${list.answerNum eq 1}">영향이 전혀 없다.</c:when>
									<c:when test="${list.answerNum eq 2}">영향이 거의 없다.</c:when>
									<c:when test="${list.answerNum eq 3}">보통이다.</c:when>
									<c:when test="${list.answerNum eq 4}">영향이 조금 있다.</c:when>
									<c:when test="${list.answerNum eq 5}">영향이 매우 많다.</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</td>
	</tr>
	<!-- 기본정보 테이블 끝-->
</c:if>

	<tr>
		<td height="60px"></td>
	</tr>
</table>

</div>