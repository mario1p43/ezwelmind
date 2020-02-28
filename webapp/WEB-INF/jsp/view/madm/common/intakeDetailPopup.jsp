<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<script>
	j$(document).ready(function(){
		$(".counselDiagnosis").click(function(){
			var counselCd = $(this).attr("counselCd");
			var intakeCd = $(this).attr("intakeCd");
			$.divPop("counselDiagnosis", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/counselDiagnosis/"+intakeCd+"/"+counselCd);
			return false;
		});
		
		
	});
</script>

<div align="center"  style="width:900px; min-height: 500px; vertical-align: middle;" >

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
					<input type="hidden" name="userNm" value="${baseInfo_detail.counselNm}"/>${empty baseInfo_detail.counselNm ? '-' : baseInfo_detail.counselNm}
					
					 
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
				<td>
					<input type="hidden" name="cause" value="${intake_detail.cause }"/> ${intake_detail.cause }
				</td>
				<th class="line" align="center">사전질문</th>
				<td>
					<c:choose>
						<c:when test="${baseInfo_detail.counselType eq '100433' }">
							<button class="counselDiagnosis" type="button" counselCd="${intake_detail.counselCd }" intakeCd="${intake_detail.intakeCd }">자세히</button>
						</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
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

	<!-- 기본정보 테이블 -->
	<tr>
		<td><h3><span style="font-weight: bold; color: blue;">ㆍ기본정보</span></h3></td>
	</tr>
	<tr>
		<td>
		<table cellpadding="5" cellspacing="0" border="1" width="90%" style="border-collapse:collapse;">
			<tr align="left" height="30px" >
				<th class="line" align="center" width="13%">상담일자</th>
				<td width="20%">
					<input type="hidden" name="ymdSelect" value="${baseInfo_detail.scheduleDt}"/>${baseInfo_detail.scheduleDt}
				</td>
				<th class="line" align="center" width="13%">전화상담시간</th>
				<td width="15%">
					<input type="hidden" name="timeSelect" value="${baseInfo_detail.time}"/>
						<c:if test="${not empty baseInfo_detail.time }">
							${baseInfo_detail.time.substring(0,2)}시간 ${baseInfo_detail.time.substring(2,4)}분
						</c:if>
				</td>
				<th class="line" align="center" width="13%">일지 작성일자</th>
				<td>
					<input type="hidden" name="regDtSelect" value="${baseInfo_detail.regDt}"/>${baseInfo_detail.regDt}
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">내담자명</th>
				<td>
					<input type="hidden" name="counselNmSelect" value="${baseInfo_detail.counselNm}"/>
					<a href="/partner/customermanagement/mainmanage?counselCd=${baseInfo_detail.counselCd}"><strong>${empty baseInfo_detail.counselNm ? '-' : baseInfo_detail.counselNm}(상세보기)</strong></a>
				</td>
				<th class="line" align="center">신청코드</th>
				<td>
					<input type="hidden" name="counselCdSelect" value="${baseInfo_detail.counselCd}"/>${baseInfo_detail.counselCd}
				</td>
				<th class="line" align="center">상담사명</th>
				<td>
					<input type="hidden" name="counselorNmSelect" value="${baseInfo_detail.counselorNm}"/>${baseInfo_detail.counselorNm}
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">고객명</th>
				<td>
					<input type="hidden" name="userNmSelect" value="${baseInfo_detail.userNm}"/>${baseInfo_detail.userNm}
				</td>
				<th class="line" align="center">직원관의 관계</th>
				<td>
					<input type="hidden" name="relation" value="${baseInfo_detail.relation}"/><comm:commNmOut option="commCd" code="${baseInfo_detail.relation}"/>
				</td>
				<th class="line" align="center">고객사</th>
				<td>
					<input type="hidden" name="clientNm" value="${baseInfo_detail.clientCd}"/>${baseInfo_detail.clientCd}
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">연락처</th>
				<td>
					<input type="hidden" name="mobile" value="${baseInfo_detail.mobile}"/>${baseInfo_detail.mobile}
				</td>
				<th class="line" align="center">사례위험도</th>
				<td>
					<input type="hidden" name="risksSelect" value="${baseInfo_detail.risks}"/>${baseInfo_detail.risks}
				</td>
				<th class="line" align="center">회기정보</th>
				<td>
					<input type="hidden" name="intakeNumSelect" value="${baseInfo_detail.extensionNum }"/>${baseInfo_detail.extensionNum }
				</td>
			</tr>
			<tr align="left" height="30px" >
				<th class="line" align="center">서비스 기간</th>
				<td colspan="2">
					${jedo.startDd } ~ ${jedo.endDd }
				</td>
				<th class="line" align="center">잔여/전체 포인트</th>
				<td colspan="2">
					${privateRemainPoint} / ${ceiling } 
				</td>
			</tr>
			<%-- <tr align="left" height="30px" >
				<th class="line" align="center" colspan="2">고객사 상담운영 담당자</th>
				<td colspan="4">
					<input type="hidden" name="mobile" value="${baseInfo_detail.counselMgrNm}"/>${baseInfo_detail.counselMgrNm}
				</td>
			</tr> --%>
			<tr align="left" height="30px" >
				<th class="line" align="center">고객사<br>주요정책</td>
				<td colspan="5">
					<textarea rows="5" cols="10" id="ir1" name="memo" style="width:100%; height:100px;" readonly="readonly">${baseInfo_detail.memo} </textarea>
					
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<!-- 기본정보 테이블 끝-->
	
	<tr>
		<td height="60px"></td>
	</tr>
</table>
<br/>
<br/>
		<a href="/partner/customermanagement/mainmanage?counselCd=${baseInfo_detail.counselCd}" style="text-decoration:none">
			<div style="height: 30px;border: 1px solid #666;width: 260px;line-height: 30px;font-size: 13px;">
			<strong>연장 신청 및 동의서 등록 상세보기</strong>
			</div>
		</a>
		<br/>
<br/>
</div>