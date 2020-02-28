<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인상담일지 관리</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	j$('#cancleBtn').click(function() {
		if( confirm("상담일지 작성을 취소하시겠습니까?") ){
			window.location.href = "/partner/sangdam/list";
		}
	});
	
	j$('#addBtn').click(function() {
		
		var riskDegree ;
		var riskReason 	= $.trim($("#riskReason").val());
		var finalGoal 	= $.trim($("#finalGoal").val());
		var plan 			= $.trim($("#plan").val());
		var mainIssue 	= $.trim($("#mainIssue").val());
		var goal 			= $.trim($("#goal").val());
		var intervention = $.trim($("#intervention").val());
		
		j$("input:checkbox:checked").each(function(){
			riskDegree = $(this).val();
		});
		if(undefined == riskDegree){
			alert("사례위험도를 체크하세요.");
			j$("#risks1").focus();
			return false;
		}
		
		if( riskReason.length == 0 ){
			alert("사례위험도를 입력하세요.");
			j$("#riskReason").focus();
			return false;
		}
		
		if( finalGoal.length == 0 ){
			alert("전체 상담의 목표를 입력하세요.");
			j$("#finalGoal").focus();
			return false;
		}
		
		if( plan.length == 0 ){
			alert("상담계획을 입력하세요.");
			j$("#plan").focus();
			return false;
		}
		
		if( mainIssue.length == 0 ){
			alert("회기 내 내담자의 주호소문제를 입력하세요.");
			j$("#mainIssue").focus();
			return false;
		}
		
		if( goal.length == 0 ){
			alert("본 회기 상담목표를 입력하세요.");
			j$("#goal").focus();
			return false;
		}
		
		if( intervention.length == 0 ){
			alert("주요 개입 및 접근방법을 입력하세요.");
			j$("#intervention").focus();
			return false;
		}

		if( confirm("개인상담일지를 저장 하시겠습니까?") ){
			j$("#sangdamUpdate").submit();
		}
		
	});
	
});

//위험도 체크박스 선택
function riskCheck(riskVal) {
	 var obj = document.getElementsByName("riskDegree");

	 for(var i=0; i<obj.length; i++){
       if(obj[i] != riskVal){
           riskVal.checked = true; //선택한 위험도 체크
           obj[i].checked = false; //기존 위험도 체크해제
       }
   }
}
</script>

</head>

<body>
<form id="sangdamUpdate" name="sangdamUpdate" action="/partner/sangdam/updateSangdamMgr" method="POST" enctype="multipart/form-data">
<input type="hidden" name="intakeCd" id="intakeCd" value="${intake.intakeCd}">

<!-- New Form  -->
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
	<tr>
		<td valign="top" align="left">
			<table cellpadding="0" cellspacing="0" border="0" width="90%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
							<tr>
						    	<td align="left" class="subtitle">개인상담일지</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="20px"></td>
				</tr>

				<!-- 인테이크 테이블 -->
				<tr>
					<td>ㆍ인테이크</td>
				</tr>
				<tr>
					<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
						<tr align="left" height="30px" >
							<th class="line" align="center" width="13%">성명</th>
							<td width="20%">
								${intake.counselNm }
								<input type="hidden" name="userNm" value="${intake.counselNm }"/>
							</td>
							<th class="line" align="center" width="13%">생년월일</th>
							<td width="15%">
								${intake.rrn}
								<input type="hidden" name="rrn" value="${intake.rrn}"/> 
							</td>
							<th class="line" align="center" width="13%">기혼여부</th>
							<td >
								<comm:commNmOut option="clientCommCd"  clientCd="hue" code="${intake.marry} "/>
								<input type="hidden" name="marry" value="${intake.marry}"/> 
							</td>
						</tr>
						<tr align="left" height="30px" >
							<th class="line" align="center" width="13%">성별</th>
							<td width="20%">
								${intake.gender}
								<input type="hidden" name="gender" value="${intake.gender}"/>
							</td>
							<th class="line" align="center" width="13%">학력/학년</th>
							<td width="20%">
								<comm:commNmOut option="clientCommCd"  clientCd="hue" code="${intake.education} "/>
								<comm:commNmOut option="clientCommCd"  clientCd="hue" code="${intake.session} "/>
								<input type="hidden" name="education" value="${intake.education}"/> 
								<input type="hidden" name="session" value="${intake.session}"/> 
							</td>
							<th class="line" align="center" width="13%">직업</th>
							<td>
								<comm:commNmOut option="clientCommCd"  clientCd="hue" code="${intake.job} "/>
								<input type="hidden" name="job" value="${intake.job}"/> 
							</td>
						</tr>
						<tr align="left" height="30px" >
							<th class="line" align="center">휴대전화</th>
							<td>
								${intake.mobile }
								<input type="hidden" name="mobile" value="${intake.mobile }"/> 
							</td>
							<th class="line" align="center">이메일</th>
							<td>
								${intake.email }
								<input type="hidden" name="email" value="${intake.email }"/>
							</td>
							<th class="line" align="center">상담분야</th>
							<td>
								<comm:commNmOut option="clientCommCd"  clientCd="hue" code="${intake.cause} "/>
								<input type="hidden" name="cause" value="${intake.cause}"/> 
							</td>
						</tr>
					</table>
				</tr>
				<!-- 인테이크 테이블 끝-->

				<tr>
					<td height="20px"></td>
				</tr>

				<!-- 기본정보 테이블 -->
				<tr>
					<td>ㆍ기본정보</td>
				</tr>
				<tr>
					<td>
					<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
						<tr align="left" height="30px" >
							<th class="line" align="center" width="13%">고객작성일</th>
							<td width="20%">
								${intake.counselDd }, ${intake.stDt }~${intake.edDt }
								<input type="hidden" name="counselDd" value="${intake.counselDd }"/>
								<input type="hidden" name="stDt" value="${intake.stDt }"/>
								<input type="hidden" name="edDt" value="${intake.edDt }"/>
							</td>
							<th class="line" align="center" width="13%">진행상태</th>
							<td width="20%">
								<commClient:select name="status" id="status" clientCd="hue" code="100005" basicValue="---- 선 택 ----"  selectValue="${intake.status}"/>
							</td>
							<th class="line" align="center" width="13%">일지 작성일자</th>
							<td>
								${intake.regDt }
							</td>
						</tr>
						<tr align="left" height="30px" >
							<th class="line" align="center">내담자명</th>
							<td>
								${intake.counselNm }
							</td>
							<th class="line" align="center">신청코드</th>
							<td>
								${intake.counselCd }
								<input type="hidden" name="counselCd" value="${intake.counselCd }"/>
							</td>
							<th class="line" align="center">상담사명(아이디)</th>
							<td>
								${intake.counselorNm } (${intake.counselorId })
								<input type="hidden" name="counselorId" value="${intake.counselorId }"/>
							</td>
						</tr>
						<tr align="left" height="30px" >
							<th class="line" align="center">사례위험도</th>
							<td>
								${intake.riskDegree }
							</td>
							<th class="line" align="center">회기정보</th>
							<td colspan="3">
								<input type="hidden" name="" value=""/>
							</td>
						</tr>
					</table>
					</td>
				</tr>
				<!-- 기본정보 테이블 끝-->
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td>ㆍ사례위험도</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
							<tr>
								<td rowspan="3" width="25%"> </td>
							</tr>
							<tr>
								<th>다음 중 본 사례에 해당하는 위험도를 체크해 주십시오.<br></th>
							</tr>
							<tr>
								<td>
								<span style="font-weight:bold">[사례위험도 평가방법]</span><br>
								1. 다축적 평가개념으로, 내담자의 개인적 측면, 조직/업무적 측면, 정신건강의학적 측면에 대하여 아래의 내용을 참고하여 평가합니다.<br>
								2. 여러 단계에 <span style="font-weight:bold">중복 해당하는 경우 상위 단계</span>로 평가합니다.<br>
								3. 판단기준에 <span style="font-weight:bold">영역별 1개라도 해당될 경우, 가장 높은 단계</span>로 평가합니다.<br>
								4. 내담자가 <span style="font-weight:bold">다음의 직업군에 해당될 경우</span>, <u>위험도 판단을 더욱 엄격하게 적용</u>하여 주십시오.<br>
									<table cellpadding="5" cellspacing="5" border="1" width="90%" style="border-collapse:collapse;">
										<tr>
											<td>
												&nbsp;1) 타인의 생명 및 안전에 직접적인 영향을 미칠 수 있는 물품을 다루거나 소지하는 직업 : 경찰, 군인 등<br>
												&nbsp;2) 업무수행 중 안전에 주의해야하는 직업군 : 운송업, 소방관 등<br>
												&nbsp;3) 타인의 건강 및 위생에 직접적인 영향을 미칠 수 있는 물품을 다루는 직업 : 식품관련, 위생관련 등<br>
												&nbsp;4) 트라우마 경험에 노출되기 쉬운 직업 : 경찰, 군인, 소방관, 경호업체 등<br>
												&nbsp;5) 고객접점의 업무수행 직업 : 콜센터, 승무원, 민원창구 등				
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
							<tr>
								<th>&nbsp;</th>
								<c:forEach var="riskList" varStatus="i" begin="1" end="5">
									<th><input type="checkbox" name="riskDegree" id="risks${riskList}" onclick="riskCheck(this)" value="${riskList}" <c:if test="${riskList == intake.riskDegree}">checked="checked"</c:if>/> ${riskList}단계
									<c:choose>
										<c:when test="${riskList == 1}">'<span style="color:GREEN">안전</span>'</c:when>
										<c:when test="${riskList == 2}">'<span style="color:GREEN">관심</span>'</c:when>
										<c:when test="${riskList == 3}">'<span style="color:ORANGE">주의</span>'</c:when>
										<c:when test="${riskList == 4}">'<span style="color:RED">위험</span>'</c:when>
										<c:otherwise>'<span style="color:RED">보호</span>'</c:otherwise>
									</c:choose>
									</th>
								</c:forEach>
							</tr> 
							<tr>
								<th width="25%"><h2><span style="color:BLUE">개인적 측면</span></h2><br>
									1) 주호소(상담을 받고자 하는 이유, 보호자 보고문제의 내용<br>
									2) 심리적 자원의 유무, 환경적 지지자원의 유무<br>
								</th>
								<td width="15%"> 흥미로 인한 서비스 신청, 자기 자신에 대한 이해 및 탐색 목적, 고민에 대한 조언 요구</td>
								<td width="15%"> 개인의 삶에 영향을 주는 정도의 문제 경험	</td>
								<td width="15%"> 개인의 삶에 영향을 주는 정도이며, 그 강도가 2단계보다 강함</td>
								<td width="15%"> 심리상태가 불안정하며 내담자의 안위 및 생명영위와 관련하여 위험하다고 판단될 때</td>
								<td width="15%" rowspan="3"> 가까운 시일 내에 자신 혹은 타인의 생명이나 안전을 위협하는 행동을 실제 시행할 가능성이 높다고 판단될 때	</td>
							</tr>
							<tr>
								<th><h2><span style="color:BLUE">조직/업무적 측면</span></h2><br>
									1) 직원의 심리적 상태가 업무의 질과 지속에 미치는 부정적인 영향<br>
									2) 직원의 심리적 문제로 인하여 조직에 미치는 혹은 미칠 것으로 예상되는 부정적인 영향<br>
									(ex. 집중력 저하, 주의력 저하, 관계 회피, 이직, 사직, presenteenism, 직원에 대한 폭언, 지속적인 지각 등)<br>
								</th>
								<td></td>
								<td> 업무의 질 및 지속에 영향을 주는 경우(ex. 주의력 저하 등)<br>	</td>
								<td> 직원의 심리적 상태가 업무의 질이나 지속에 영향을 주는 것이 분명한 경우 (ex. 심리적 문제로 인한 연차사용, 지속적 지각)<br>	</td>
								<td> 직원의 심리적 상태가 조직에 미치는/미칠 것으로 예상되는 부정적인 영향이 분명한 경우(ex. 이직, presenteeism, 폭력행동)<br></td>
							</tr>
							<tr>
								<th><h2><span style="color:BLUE">정신건강의학적 측면</span></h2><br>
									1) 정신건강의학 관련 진료 및 약물치료 경험<br>
									2) 알코올, 약물 및 도박 등 중독관련 문제<br>
									3) 심리적 외상경험과 관련된 문제<bR>
									4) 정신과적 관점에서 임상적 소견의 유무<br>									
								</th>
								<td></td>
								<td></td>
								<td> 최근 <span style="font-weight:bold">3년 이내</span>에 정신의학관련 진료 및 약물치료 경험이 있는 경우(전문가 판단 하에 단계조정 가능)<br><br>
									   알코올 약물 및 도박 등에 대한 의수준의 문제<br><br>
									   심리적 외상경험 혹은 정신과적 증상들로 인하여 심리적 어려움이 초래되는 경우<br>
								</td>
								<td> 최근 <span style="font-weight:bold">6개월 이내</span>에 정신의학관련 진료 및 약물치료 경험이 있는 경우(전문가 판단 하에 단계조정 가능)<br><br>
									   알코올 약물 및 도박 등에 대한 의수준의 문제<br><br>
									   심리적 외상경험 혹은 정신과적 증상들로 인하여 심리상태가 불안정하고, 내담자의 안위와 관련하여 위험하다고 판단될 경우<br>
								</td>
							</tr>
							<tr>
								<th colspan="8">사례위험도 선택/변경 이유</th>
							</tr>
							<tr>
								<td colspan="8"><textarea rows="15" cols="50" style="width: 95%" name="riskReason" id="riskReason">${record_detail.riskReason }</textarea></td>
							</tr>
						</table>
					</td>
				</tr>
				<%-- <tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
							<tr>
								<th rowspan="5" width="13%"><span style="color:RED">* </span>사례위험도<br/> <기준></th>
								<th colspan="7">다음 중 본 사례에 해당하는 위험도를 체크해 주십시오.</th>
							</tr>
							<tr>
							 	<c:forEach var="riskList" varStatus="i" begin="1" end="5">
									<th><input type="checkbox"  name="riskDegree" id="risks${riskList}" onclick="riskCheck(this)" value="${riskList}" <c:if test="${riskList == intake.riskDegree}">checked="checked"</c:if>/> ${riskList}단계</th>
								</c:forEach> 
							</tr>
							<tr>
								<td width="17%">- 고민에 대한 조언수준의 자문요구</br>
									- 내담자가 문제를 해결 할 자원을 충분히 가지고 있음</br>
									- 지지자원 및 환경이 충분함
								</td>
								<td width="17%"> - 일상생활에 영향을 주는 수준의 문제</br>
									 - 내담자가 문제를 해결할 자원을 충분히 가지고 있음</br>
									 - 지지자원 및 환경이 부족할 수 있음
								</td>
								<td width="17%"> - 일상생활에 영향을 주며, 그 강도가 2단계보다 강함</br>
									 - 내담자가 문제를 해결 할 자원이 충분치 않아, 상담을 통해 자원을 만들어야할 필요가 있음</br>
									 - 지지자원 및 환경이 충분치 않음
								</td>
								<td width="17%"> <span style="font-weight:bold">■에 1개라도 표시될 때</span></br>
									 - 심리적 상태가 매우 불안정하여 내담자의 안위 및 생명영위와 관련하여 위협적인 상황일 때
								  <p>- 내담자의 내적자원과 상관없이 경험자체가 누구에게나 심리적으로 큰 영향을 줄 수 있는 상황일 때</p>
								</td>
								<td width="17%"> - 자신 혹은 타인의 생명을 위협하는 행동을 실제 시행할 가능성이 높고, 시일이 임박하였다고 느낄 때
								  <p>- 내담자의 내적자원과 상관없이 경험자체가 누구에게나 심리적으로 큰 영향을 줄 수 있는 상황일 때</p>
								</td>
							</tr>
							<tr>
								<th colspan="7">사례위험도 선택/변경 이유</th>
							</tr>
							<tr>
								<td colspan="7"><textarea rows="15" cols="50" style="width: 95%" name="riskReason" id="riskReason">${intake.riskReason }</textarea></td>
							</tr>
						</table>
					</td>
				</tr> --%>
				<tr>
					<td height="20px"></td>
				</tr>
			</table>
		</td>
	</tr>

	<!-- 	일지 등록 -->
	<tr>
		<td valign="top" align="left">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
					<tr>
						<td>ㆍ상담의 목표 및 계획</td>
					</tr>
					<tr>
						<td>
						<table id="mytable" cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
							<tr class="plan">
								<th bgcolor="#F5F5F5" width="13%"><span style="color:RED">* </span>전체 상담의 목표</th>
								<td><textarea rows="15" cols="50" style="width: 97%" id="finalGoal" name="finalGoal" value="${intake.finalGoal }">${intake.finalGoal }</textarea></td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" width="13%"><span style="color:RED">* </span>상담 계획</th>
								<td><textarea rows="15" cols="50" style="width: 97%" id="plan" name="plan" value="${intake.plan }">${intake.plan}</textarea> </td>
							</tr>
						</table>
						</td>
					</tr>
					<!-- 상담의 목표 및 계획 테이블 끝 -->
					<tr>
						<td height="40px"></td>
					</tr>
				<tr>
					<td>ㆍ상담일지</td>
				</tr>
				<tr>
					<td>
					<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
						<tr>
							<th width="16%">대주제</th>
							<th width="16%">소주제</th>
							<th colspan="6">내용</th>
						</tr>
						<tr>
							<th width="13%" rowspan="2"><span style="color:RED">* </span>주호소<br/>&nbsp;&nbsp;문제</th>
						</tr>
						<tr>
							<th width="13%">회기 내 내담자의<br/>주소호문제</th>
							<td colspan="6"><textarea rows="4" cols="50" style="width: 97%" name="mainIssue" id="mainIssue" value="${intake.mainIssue }">${intake.mainIssue }</textarea> </td>
						</tr>
						<tr>
							<th width="13%" rowspan="2"><span style="color:RED">* </span>상담과정</th>
							<th width="13%" rowspan="1">본 회기 상담목표<br/></th>
							<td colspan="6"><textarea rows="4" cols="50" style="width: 97%" name="goal" id="goal" value="${intake.goal }">${intake.goal }</textarea></td>
						</tr>
						<tr>
							<th width="13%">주요 개입 및 접근방법</th>
							<td colspan="6"><textarea rows="4" cols="50" style="width: 97%" name="intervention" id="intervention" value="${intake.intervention }">${intake.intervention }</textarea> </td>
						</tr>
						<tr>
							<th width="13%" rowspan="2">상담 내용</th>
							<th width="13%" colspan="7" align="left">[다음 사항을 고려하여 작성해주십시오]<br/>
							ㆍ History : 내담자의 문제와 관련된 발달/역사적 배경, 문제의 기원, 과거 문제력 및 당시 환경 상황<br/>
							ㆍ 내적 요인 : 자아개념, 통찰내용과 수준, 인지적 스타일 및 특징, 정서적 스타일 및 특징, 신체/생리/행동적 특징<br/>
							ㆍ 상황적 요인 : 문제와 관련된 현재 생활 여건, 문제를 지속시키는 상황적 요인<br/>
							ㆍ 대인관계 양상 : 대인관계 양상, 문제영역<br/>
							ㆍ 자원 및 취약점 : 긍정적 상황과 경험 및 강점, 대처 전략, 부정적 상황과 약점<br/>
							ㆍ 종합적 이해 : 핵심 문제에 대한 이론적 설명, 내담자와 관련된 요인들에 대한 종합적 이해 및 평가
							</th>
						</tr>
						<tr>
							<td colspan="7">
								<textarea rows="4" cols="50"  style="width: 97%" name="counselText" id="counselText" value="${intake.counselText }">${intake.counselText }</textarea>
							</td>
						</tr>
						<tr>
							<th>상담사 소견</th>
							<td colspan="7">
								<textarea rows="4" cols="50"  style="width: 97%" name="opinion" id="opinion" value="${intake.opinion }">${intake.opinion }</textarea>
							</td>
						</tr>
						<tr>
							<th>이후 계획</th>
							<td colspan="7">
								<textarea rows="4" cols="50"  style="width: 97%" name="nextPlan" id="nextPlan" value="${intake.nextPlan }">${intake.nextPlan }</textarea>
							</td>
						</tr>
						<tr>
							<th>기타/특이사항</th>
							<td colspan="7">
								<textarea rows="4" cols="50"  style="width: 97%" name="memo" id="memo" value="${intake.memo }">${intake.memo }</textarea>
							</td>
						</tr>

						<tr>
							<th>파일첨부</th>
							<td colspan="7" >
				    			<input type="file" name="file" id="file" />&nbsp;${intake.fileNm }
		    				</td>
						</tr>
					</table>
					</td>
				</tr>
				<!-- 상담일지 끝 -->

			</table>
		</td>
	</tr>
</table>			
					
<!-- 버튼 영역 시작 -->
<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
	<tr align="center" height="50px">
		<td class="" colspan="2" align="center">
			<input type="button" id="addBtn" value="저장" style="height:30px; width:100px;">
			<span style="margin-left: 20px;"></span>
			<input type="button" id="cancleBtn" value="취소" style="height:30px; width:100px;">
			<span style="margin-left: 20px;"></span>
		</td>
	</tr>
</table>
<!-- 버튼 영역 시작 -->
		
</form>
</body>
</html>