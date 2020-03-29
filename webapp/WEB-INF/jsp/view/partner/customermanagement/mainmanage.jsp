<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ include file="/WEB-INF/jsp/layout/inc/staticAfter.jspf"%>
<html>
<head>
<title>내담자 관리</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	
	$("#mokrokBtn").click(function(){
		location.href="/partner/pCounselorMgr/counselFixList";
	});
	$(".counselDiagnosis").click(function(){
		var counselCd = $(this).attr("counselCd");
		var intakeCd = $(this).attr("intakeCd");
		$.divPop("counselDiagnosis", "상세보기 (신청코드 : " + counselCd + " )", "/madm/layerPopup/counselDiagnosis/"+intakeCd+"/"+counselCd);
		return false;
	});
	
	j$("#btnConsultAgreement").click(function(){
		var aa = $("[name=consultAgreement]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("상담동의서 파일을 등록하여 주십시요.");
			return false;
		}
		
 		if(confirm("상담동의서를 등록하시겠습니까?")){
			j$("#addConsultAgreementFiles").submit();
		} 
	});
	
	j$("#btnPrivateAgreement").click(function(){
		
		var aa = $("[name=privateAgreement]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("개인정보동의서 파일을 등록하여 주십시요.");
			return false;
		}
		
		if(confirm("개인정보동의서를 등록하시겠습니까?")){
			j$("#addPrivateAgreementFiles").submit();
		}
	});
	
	j$("#btnLifeAgreement").click(function(){
		
		var aa = $("[name=lifeAgreement]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("생명존중서약서 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("생명존중서약서를 등록하시겠습니까?")){
			j$("#addLifeAgreementFiles").submit();
		}
	});
	j$("#btnMentalAgreement").click(function(){
		
		var aa = $("[name=mentalAgreement]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("심리검사동의서 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("심리검사동의서를 등록하시겠습니까?")){
			j$("#addMentalAgreementFiles").submit();
		}
	});
	j$("#btnReflectionAgreement").click(function(){
		
		var aa = $("[name=ReflectionAgreement]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("상담회기동의서 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("상담회기동의서를 등록하시겠습니까?")){
			j$("#addReflectionAgreementFiles").submit();
		}
	});
	j$("#btnExtendApply").click(function(){
		
		var aa = $("[name=ExtendApply]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("연장신청서 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("연장신청서를 승인 요청하시겠습니까?")){
			j$("#addExtendApplyFiles").submit();
		}
	});
	j$("#btnConsultOpinion").click(function(){
		
		var aa = $("[name=ConsultOpinion]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("상담소견서 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("상담소견서를 승인 요청하시겠습니까?")){
			j$("#addConsultOpinionFiles").submit();
		}
	});
	j$("#btnConsultConfirm").click(function(){
		
		var aa = $("[name=ConsultConfirm]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("상담확인증 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("상담확인증을 승인 요청하시겠습니까?")){
			j$("#addConsultConfirmFiles").submit();
		}
	});
	
	
});

</script>

<script type="text/javascript">

</script>



</head>

<body>

<table cellpadding="0" align="center" cellspacing="0" border="0" width="100%" height="100%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="80%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
							<tr>
						    	<td align="left" class="subtitle">내담자 상세정보</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px"><li><strong>인테이크</strong></li></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="6" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<th width="10%" bgcolor="#F5F5F5" align="center">상담 받을 분</th>
								<td width="20%">${customerServiceInfo.relation}</td>
								<th width="10%" bgcolor="#F5F5F5" align="center">생년월일</th>
								<td width="18%">${customerServiceInfo.rrn}</td>
								<th width="10%" bgcolor="#F5F5F5" align="center">성별</th>
								<td width="32%">${customerServiceInfo.gender}</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">성명</th>
								<td>${customerServiceInfo.counselNm}</td>
								<th bgcolor="#F5F5F5" align="center">학력/학년</th>
								<td>${customerServiceInfo.education}/${customerServiceInfo.session}</td>
								<th bgcolor="#F5F5F5" align="center">직업</th>
								<td>${customerServiceInfo.job}</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">휴대전화</th>
								<td>${customerServiceInfo.mobile}</td>
								<th bgcolor="#F5F5F5" align="center">이메일</th>
								<td>${customerServiceInfo.email}</td>
								<th bgcolor="#F5F5F5" align="center">상담분야</th>
								<td>${customerServiceInfo.counselDivNm}</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">상담방법</th>
								<td>${customerServiceInfo.counselType}</td>
								<th bgcolor="#F5F5F5" align="center">상담 세부주제</th>
								<td>${customerServiceInfo.cause}</td>
								<th bgcolor="#F5F5F5" align="center">사전질문</th>
								
								<td>
 									<c:choose>
										<c:when test="${customerServiceInfo.counselType eq '100433' }">
											<button class="counselDiagnosis" type="button" counselCd="${defaultInfo.counselCd }" intakeCd="${customerServiceInfo.intakeCd }">자세히</button>
										</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose> 
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px"><li><strong>기본정보</strong></li></td>
				</tr>
				<tr>
				<%-- ${defaultInfo.counselType} --%>
				<%-- ${customerServiceInfo} --%>
					<td>
						<table cellpadding="6" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<th width="10%" bgcolor="#F5F5F5" align="center">상담일자</th>
								<td width="20%">${defaultInfo.scheduleDt}</td>
								<th width="10%" bgcolor="#F5F5F5" align="center">전화상담시간</th>
								<td width="18%">${defaultInfo.scheduleTime}</td>
								<th width="10%" bgcolor="#F5F5F5" align="center">일지 작성일자</th>
								<td width="32%">${defaultInfo.regDt}</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">내담자명</th>
								<td>${customerServiceInfo.counselNm}</td>
								<th bgcolor="#F5F5F5" align="center">신청코드</th>
								<td>${defaultInfo.counselCd}</td>
								<th bgcolor="#F5F5F5" align="center">상담자명</th>
								<td>${defaultInfo.counselorNm}</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">고객사</th>
								<td>${defaultInfo.clientNm}</td>
								<th bgcolor="#F5F5F5" align="center">직원과의 관계</th>
								<td>${customerServiceInfo.relation}</td>
								<th bgcolor="#F5F5F5" align="center">고객사</th>
								<td>${defaultInfo.clientCd}</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">연락처</th>
								<td>${customerServiceInfo.mobile}</td>
								<th bgcolor="#F5F5F5" align="center">사례위험도</th>
								<td>${defaultInfo.risks}</td>
								<th bgcolor="#F5F5F5" align="center">회기정보</th>
								<td>${customerServiceInfo.intakeNum}</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">서비스 기간</th>
								<td >${defaultInfo.period}</td>
								<th bgcolor="#F5F5F5" align="center">잔여/전체 포인트</th>
								<td>${defaultInfo.point}</td>
								<th class="line" align="center"></th>
								<td>
								</td>
							</tr>
							<tr>
								<th bgcolor="#F5F5F5" align="center">고객사 상담운영 담당자</th>
								<td  colspan="5">${defaultInfo.clientMgrNm}</td>
							</tr>
							<tr align="left" height="30px" >
								<th class="line" align="center">고객사<br>주요정책</td>
								<td colspan="5">
								 	<textarea rows="5" cols="10" id="ir1" name="memo" style="width:90%; height:100px;border: 0px;" readonly="readonly">${customerServiceInfo.memoTt} </textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px"><li><strong>동의서 등록</strong></li></td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px">상담동의서</td>
				</tr>
				<tr>
					<td>
						<form id="addConsultAgreementFiles" action="/partner/customermanagement/addAgreementFiles" method="POST" enctype="multipart/form-data">
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<input type="file" name="consultAgreement" style='width: 40%;'>
									<a href="javascript:fileDownLoad('${customerServiceInfo.filefath2}','${customerServiceInfo.filename101}')">${customerServiceInfo.filename101}</a>
									<input type="button" id="btnConsultAgreement" value="등록">
								</td>
							</tr>
						</table>

							<input type="hidden" name="centerSeq" class="centerSeq" value="${customerServiceInfo.centerSeq}">
							<input type="hidden" name="intakeCd" class="intakeCd" value="${customerServiceInfo.intakeCd}">
							<input type="hidden" name="counselCd" class="counselCd" value="${defaultInfo.counselCd}">
							<input type="hidden" name="counselNm" class="counselNm" value="${customerServiceInfo.counselNm}">
							<input type="hidden" name="clientCd" class="clientCd" value="${defaultInfo.clientCd}">
							<input type="hidden" name="fileSeq" class="fileSeq" value="${customerServiceInfo.fileSeq101}">
							<input type="hidden" name="docSts" class="docSts" value="1">
							<input type="hidden" name="docType" class="docType" value="1">
						
						</form> 
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px">개인정보동의서</td>
				</tr>
				<tr>
					<td>
						<form id="addPrivateAgreementFiles" action="/partner/customermanagement/addAgreementFiles" method="POST" enctype="multipart/form-data">
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<input type="file" name="privateAgreement" style='width: 40%;'>
									<a href="javascript:fileDownLoad('${customerServiceInfo.filefath102}','${customerServiceInfo.filename102}')">${customerServiceInfo.filename102}</a>
									<input type="button" id="btnPrivateAgreement" value="등록">
								</td>
							</tr>
						</table>
							<input type="hidden" name="centerSeq" class="centerSeq" value="${customerServiceInfo.centerSeq}">
							<input type="hidden" name="intakeCd" class="intakeCd" value="${customerServiceInfo.intakeCd}">
							<input type="hidden" name="counselCd" class="counselCd" value="${defaultInfo.counselCd}">
							<input type="hidden" name="counselNm" class="counselNm" value="${customerServiceInfo.counselNm}">
							<input type="hidden" name="clientCd" class="clientCd" value="${defaultInfo.clientCd}">
							<input type="hidden" name="fileSeq" class="fileSeq" value="${customerServiceInfo.fileSeq102}">
							<input type="hidden" name="docSts" class="docSts" value="2">
							<input type="hidden" name="docType" class="docType" value="1">
						</form>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px">생명존중서약서</td>
				</tr>
				<tr>
					<td>
						<form id="addLifeAgreementFiles" action="/partner/customermanagement/addAgreementFiles" method="POST" enctype="multipart/form-data">
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<input type="file" name="lifeAgreement" style='width: 40%;'>
									<a href="javascript:fileDownLoad('${customerServiceInfo.filefath103}','${customerServiceInfo.filename103}')">${customerServiceInfo.filename103}</a>
									<input type="button" id="btnLifeAgreement" value="등록">
								</td>
							</tr>
						</table>
							<input type="hidden" name="centerSeq" class="centerSeq" value="${customerServiceInfo.centerSeq}">
							<input type="hidden" name="intakeCd" class="intakeCd" value="${customerServiceInfo.intakeCd}">
							<input type="hidden" name="counselCd" class="counselCd" value="${defaultInfo.counselCd}">
							<input type="hidden" name="counselNm" class="counselNm" value="${customerServiceInfo.counselNm}">
							<input type="hidden" name="clientCd" class="clientCd" value="${defaultInfo.clientCd}">
							<input type="hidden" name="fileSeq" class="fileSeq" value="${customerServiceInfo.fileSeq103}">
							<input type="hidden" name="docSts" class="docSts" value="3">
							<input type="hidden" name="docType" class="docType" value="1">
						</form>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px">심리검사동의서</td>
				</tr>
				<tr>
					<td>
						<form id="addMentalAgreementFiles" action="/partner/customermanagement/addAgreementFiles" method="POST" enctype="multipart/form-data">
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<input type="file" name="mentalAgreement" style='width: 40%;'>
									<a href="javascript:fileDownLoad('${customerServiceInfo.filefath104}','${customerServiceInfo.filename104}')">${customerServiceInfo.filename104}</a>
									<input type="button" id="btnMentalAgreement" value="등록">
								</td>
							</tr>
						</table>
							<input type="hidden" name="centerSeq" class="centerSeq" value="${customerServiceInfo.centerSeq}">
							<input type="hidden" name="intakeCd" class="intakeCd" value="${customerServiceInfo.intakeCd}">
							<input type="hidden" name="counselCd" class="counselCd" value="${defaultInfo.counselCd}">
							<input type="hidden" name="counselNm" class="counselNm" value="${customerServiceInfo.counselNm}">
							<input type="hidden" name="clientCd" class="clientCd" value="${defaultInfo.clientCd}">
							<input type="hidden" name="fileSeq" class="fileSeq" value="${customerServiceInfo.fileSeq104}">
							<input type="hidden" name="docSts" class="docSts" value="4">
							<input type="hidden" name="docType" class="docType" value="1">
						</form>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px">상담회기동의서</td>
				</tr>
				<tr>
					<td>
						<form id="addReflectionAgreementFiles" action="/partner/customermanagement/addAgreementFiles" method="POST" enctype="multipart/form-data">
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<input type="file" name="ReflectionAgreement" style='width: 40%;'>
									<a href="javascript:fileDownLoad('${customerServiceInfo.filefath105}','${customerServiceInfo.filename105}')">${customerServiceInfo.filename105}</a>
									<input type="button" id="btnReflectionAgreement" value="등록">
								</td>
							</tr>
						</table>
							<input type="hidden" name="centerSeq" class="centerSeq" value="${customerServiceInfo.centerSeq}">
							<input type="hidden" name="intakeCd" class="intakeCd" value="${customerServiceInfo.intakeCd}">
							<input type="hidden" name="counselCd" class="counselCd" value="${defaultInfo.counselCd}">
							<input type="hidden" name="counselNm" class="counselNm" value="${customerServiceInfo.counselNm}">
							<input type="hidden" name="clientCd" class="clientCd" value="${defaultInfo.clientCd}">
							<input type="hidden" name="fileSeq" class="fileSeq" value="${customerServiceInfo.fileSeq105}">
							<input type="hidden" name="docSts" class="docSts" value="5">
							<input type="hidden" name="docType" class="docType" value="1">
						</form>
					</td>
				</tr>
			</table>
			
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
							<tr>
						    	<td align="left" class="subtitle">연장 및 서류요청</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px" style="color:red">연장 신청을 하시려면 아래의 파일을 다운로드 받아 업로드 후 승인요청 해주시기 바랍니다.</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px"><a href="javascript:fileDownLoad('/extentiondocuments.zip', 'extentiondocuments.zip');"><span>연장 신청서류 다운로드</span></a></td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td height="10px">연장신청서 업로드</td>
				</tr>
				<tr>
					<td>
						<form id="addExtendApplyFiles" action="/partner/customermanagement/addAgreementFiles" method="POST" enctype="multipart/form-data">
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">

							<tr>
								<td>
									<input type="file" name="ExtendApply" style='width: 40%;'>
									<a href="javascript:fileDownLoad('${customerServiceInfo.filefath1}','${customerServiceInfo.filename1}')">${customerServiceInfo.filename1}</a>
									<c:if test="${customerServiceInfo.apprStatus1 eq null}">
										<input type="button" id="btnExtendApply" value="파일 업로드">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus1 eq '1'}">
										<input type="button" value="미확인">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus1 eq '2'}">
										<input type="button" value="승인요청">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus1 eq '3'}">
										<input type="button" value="승인대기">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus1 eq '4'}">
										<input type="button" value="고객사 승인완료">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus1 eq '5'}">
										<input type="button" value="고객사 승인불가">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus1 eq '6'}">
										<input type="button" value="승인">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus1 eq '7'}">
										<input type="button" value="승인불가">
									</c:if>
								</td>
							</tr>
						</table>
							<input type="hidden" name="centerSeq" class="centerSeq" value="${customerServiceInfo.centerSeq}">
							<input type="hidden" name="intakeCd" class="intakeCd" value="${customerServiceInfo.intakeCd}">
							<input type="hidden" name="counselCd" class="counselCd" value="${defaultInfo.counselCd}">
							<input type="hidden" name="counselNm" class="counselNm" value="${customerServiceInfo.counselNm}">
							<input type="hidden" name="clientCd" class="clientCd" value="${defaultInfo.clientCd}">
							<input type="hidden" name="fileSeq" class="fileSeq" value="${customerServiceInfo.fileSeq1}">
							<input type="hidden" name="docSts" class="docSts" value="1">
							<input type="hidden" name="docType" class="docType" value="2">
						</form>
					</td>
				</tr>
				<tr>
					<td height="10px">상담소견서 업로드</td>
				</tr>

				<tr>
					<td>
						<form id="addConsultOpinionFiles" action="/partner/customermanagement/addAgreementFiles" method="POST" enctype="multipart/form-data">
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<input type="file" name="ConsultOpinion" style='width: 40%;'>
									<a href="javascript:fileDownLoad('${customerServiceInfo.filefath2}','${customerServiceInfo.filename2}')">${customerServiceInfo.filename2}</a>
									<c:if test="${customerServiceInfo.apprStatus2 eq null}">
										<input type="button" id="btnConsultOpinion" value="파일 업로드">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus2 eq '1'}">
										<input type="button" value="미확인">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus2 eq '2'}">
										<input type="button" value="승인요청">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus2 eq '3'}">
										<input type="button" value="승인대기">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus2 eq '4'}">
										<input type="button" value="고객사 승인완료">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus2 eq '5'}">
										<input type="button" value="고객사 승인불가">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus2 eq '6'}">
										<input type="button" value="승인">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus2 eq '7'}">
										<input type="button" value="승인불가">
									</c:if>
								</td>
							</tr>
						</table>
							<input type="hidden" name="centerSeq" class="centerSeq" value="${customerServiceInfo.centerSeq}">
							<input type="hidden" name="intakeCd" class="intakeCd" value="${customerServiceInfo.intakeCd}">
							<input type="hidden" name="counselCd" class="counselCd" value="${defaultInfo.counselCd}">
							<input type="hidden" name="counselNm" class="counselNm" value="${customerServiceInfo.counselNm}">
							<input type="hidden" name="clientCd" class="clientCd" value="${defaultInfo.clientCd}">
							<input type="hidden" name="fileSeq" class="fileSeq" value="${customerServiceInfo.fileSeq2}">
							<input type="hidden" name="docSts" class="docSts" value="2">
							<input type="hidden" name="docType" class="docType" value="2">
						</form>
					</td>
				</tr>
				<tr>
					<td height="10px">상담확인증 업로드</td>
				</tr>
				<tr>
					<td>
						<form id="addConsultConfirmFiles" action="/partner/customermanagement/addAgreementFiles" method="POST" enctype="multipart/form-data">
						<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
							
							<tr>
								<td>
									<input type="file" name="ConsultConfirm" style='width: 40%;'>
									<a href='javascript:fileDownLoad("${customerServiceInfo.filefath3}","${customerServiceInfo.filename3}")'>${customerServiceInfo.filename3}</a>
									<c:if test="${customerServiceInfo.apprStatus3 eq null}">
									<input type="button" id="btnConsultConfirm" value="파일 업로드">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus3 eq '1'}">
										<input type="button" value="미확인">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus3 eq '2'}">
										<input type="button" value="승인요청">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus3 eq '3'}">
										<input type="button" value="승인대기">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus3 eq '4'}">
										<input type="button" value="고객사 승인완료">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus3 eq '5'}">
										<input type="button" value="고객사 승인불가">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus3 eq '6'}">
										<input type="button" value="승인">
									</c:if>
									<c:if test="${customerServiceInfo.apprStatus3 eq '7'}">
										<input type="button" value="승인불가">
									</c:if>
								</td>
							</tr>
						</table>
							<input type="hidden" name="centerSeq" class="centerSeq" value="${customerServiceInfo.centerSeq}">
							<input type="hidden" name="intakeCd" class="intakeCd" value="${customerServiceInfo.intakeCd}">
							<input type="hidden" name="counselCd" class="counselCd" value="${defaultInfo.counselCd}">
							<input type="hidden" name="counselNm" class="counselNm" value="${customerServiceInfo.counselNm}">
							<input type="hidden" name="clientCd" class="clientCd" value="${defaultInfo.clientCd}">
							<input type="hidden" name="fileSeq" class="fileSeq" value="${customerServiceInfo.fileSeq3}">
							<input type="hidden" name="docSts" class="docSts" value="3">
							<input type="hidden" name="docType" class="docType" value="2">
						</form>
					</td>
				</tr>
				<tr>
					<td><br><br><input type="button" id="mokrokBtn" style="height:30px; width:100px;margin-left: 40%;cursor: pointer;" value="목록"></td>
				</tr>
			</table>
		</td>
	</tr>		
</div>
</table>
</body>
</html>