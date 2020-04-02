<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta charset="UTF-8">
<title>연장신청</title>
<script type="text/javascript">
j$(document).ready(function(){
	j$("#btnExtendApply").click(function(){
		
		var aa = $("[name=ExtendApply]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("연장신청서 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("연장신청서를 재업로드 하시겠습니까?")){
			j$("#addExtendApplyFiles").submit();
		}
	});
	
	j$("#btnConsultOpinion").click(function(){
		
		var aa = $("[name=ConsultOpinion]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("상담소견서 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("상담소견서를 재업로드 하시겠습니까?")){
			j$("#addConsultOpinionFiles").submit();
		}
	});
	
	j$("#btnConsultConfirm").click(function(){
		
		var aa = $("[name=ConsultConfirm]").val();
		if(aa == null || aa == "" || typeof aa == "undefined"){
			alert("상담확인증 파일을 등록하여 주십시요.");
			return false;
		}
		
		
		if(confirm("상담확인증을 재업로드 하시겠습니까?")){
			j$("#addConsultConfirmFiles").submit();
		}
	});
	
	
	j$('.counselorListDetail').click(function(){
		var userId = j$(this).attr("value");
		location.href = "/madm/mgr/getCounselorMgrDetail?userId="+userId;
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
	
	
	$("#okBtn1").click(function(){
		var chk_info1 = $(".chk_info1:checked").val();
		if(chk_info1 ==null || typeof chk_info1 == "undefined" || chk_info1 ==""){
			alert("연장신청서의 상태값을 설정해 주십시요.");	
			return false;
		}else{
			$(".chkInfo1").val(chk_info1);
		}
		
		if(confirm("연장신청서의 상태값을 등록하시겠습니까?")){
			j$("#addExtendApplyStatus1").submit();
		}
	});
	
	$("#okBtn2").click(function(){
		var chk_info2 = $(".chk_info2:checked").val();
		if(chk_info2 ==null || typeof chk_info2 == "undefined" || chk_info2 ==""){
			alert("연장신청서의 상태값을 설정해 주십시요.");	
			return false;
		}else{
			$(".chkInfo2").val(chk_info2);
		}
		if(confirm("상담소견서 상태값을 등록하시겠습니까?")){
			j$("#addExtendApplyStatus2").submit();
		}
	});
	
	$("#okBtn3").click(function(){
		var chk_info3 = $(".chk_info3:checked").val();
		if(chk_info3 ==null || typeof chk_info3 == "undefined" || chk_info3 ==""){
			alert("연장신청서의 상태값을 설정해 주십시요.");	
			return false;
		}else{
			$(".chkInfo3").val(chk_info3);
		}
		if(confirm("상담확인증 상태값을 등록하시겠습니까?")){
			j$("#addExtendApplyStatus3").submit();
		}
	});
	
	
})
	function blind(){
		$("#popupBox").css("display","none");
	}
function showDocument(counselCd ,intakeCd,counselNm,centerSeq,clientCd,apprStatus1,apprStatus2,apprStatus3,regId1,regId2,regId3,regDt1,regDt2,regDt3,fileSeq1,fileSeq2,fileSeq3){
	$(".counselCd").val(counselCd);
	$(".intakeCd").val(intakeCd);
	$(".counselNm").val(counselNm);
	$(".centerSeq").val(centerSeq);
	$(".clientCd").val(clientCd);
	var checkbox1Radio =apprStatus1;
	var checkbox2Radio =apprStatus2;
	var checkbox3Radio =apprStatus3;
	
	$(".chk_info1:radio[value='"+checkbox1Radio+"']").prop('checked', true); 
	$(".chk_info2:radio[value='"+checkbox2Radio+"']").prop('checked', true); 
	$(".chk_info3:radio[value='"+checkbox3Radio+"']").prop('checked', true);
	
	$("#fileSeq1").val(fileSeq1);
	$("#fileSeq2").val(fileSeq2);
	$("#fileSeq3").val(fileSeq3);
	
	
	if(regId1 ==null || typeof regId1 == "undefined" || regId1 ==""){
		$("#regIdText1").text("");
	}else{
		$("#regIdText1").text(regId1);
	}
	
	if(regId2 ==null || typeof regId2 == "undefined" || regId2 ==""){
		$("#regIdText2").text("");
	}else{
		$("#regIdText2").text(regId2);
	}
	
	if(regId3 ==null || typeof regId3 == "undefined" || regId3 ==""){
		$("#regIdText3").text("");
	}else{
		$("#regIdText3").text(regId3);
	}
	
	if(regDt1 ==null || typeof regDt1 == "undefined" || regDt1 ==""){
		$("#regDt1").text("");
	}else{
		$("#regDt1").text(regDt1);
	}
	
	if(regDt2 ==null || typeof regDt2 == "undefined" || regDt2 ==""){
		$("#regDt2").text("");
	}else{
		$("#regDt2").text(regDt2);
	}
	
	if(regDt3 ==null || typeof regDt3 == "undefined" || regDt3 ==""){
		$("#regDt3").text("");
	}else{
		$("#regDt3").text(regDt3);
	}
	
	$("#popupBox").css("display","block");
}
</script>
</head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication var="sesUser" property="principal.user" />
</sec:authorize>

<body>
<div id="popupBox" style="display: none;">
<h2>서류확인</h2>
<table>

<tr>
	<td>
		
		<table cellpadding="5" align="" cellspacing="0" border="1" width="500px" style="text-align:center; border-collapse:collapse;" >
			<tr>
				<th height="10px" colspan="4">연장신청서</th>
			</tr>
			<tr>	
				<th width="20%">최종 승인자 </th>
				<td width="20%"><span id="regIdText1"></span></td>
				<th width="30%">최종 승인일자 </th>
				<td width="30%"><span id="regDt1"></span></td>
			</tr>
			<tr>
				<td colspan="4">
					<form id="addExtendApplyFiles" action="/partner/customermanagement/addAgreementFilesMadm" method="POST" enctype="multipart/form-data">
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
						<tr>
							<td>
								<input type="file" name="ExtendApply" style='width: 80%;'>
								<input type="button" id="btnExtendApply" value="재업로드">
							</td>
						</tr>
					</table>
						<input type="hidden" name="centerSeq" class="centerSeq" value="">
						<input type="hidden" name="intakeCd" class="intakeCd" value="">
						<input type="hidden" name="counselCd" class="counselCd" value="">
						<input type="hidden" name="counselNm" class="counselNm" value="">
						<input type="hidden" name="clientCd" class="clientCd" value="">
						<input type="hidden" name="docSts" class="docSts" value="2">
						<input type="hidden" name="docType" class="docType" value="1">
						<input id="fileSeq1" type="hidden" name="fileSeq" class="fileSeq" value="">
					</form>
				</td>
			</tr>
			<tr>
				<th width="20%">승인상태 </th>
				<td colspan="3">			
					<form id="addExtendApplyStatus1" action="/partner/customermanagement/updateAgreementStatus" method="POST" enctype="multipart/form-data">		
						<c:if test="${userTeam.teamCd eq '101031'}">
							<input type="radio" class="chk_info1" name="chk_info1" value="1">미확인
							<input type="radio" class="chk_info1" name="chk_info1" value="2">승인요청
							<input type="radio" class="chk_info1" name="chk_info1" value="3">승인대기
							<br>
							<input type="radio" class="chk_info1" name="chk_info1" value="4">고객사 승인완료
							<input type="radio" class="chk_info1" name="chk_info1" value="5">고객사 승인불가
							<br>
							<input type="radio" class="chk_info1" name="chk_info1" value="6">승인
							<input type="radio" class="chk_info1" name="chk_info1" value="7">승인불가
						</c:if>
						<c:if test="${userTeam.teamCd eq '101033'}">
							<input type="radio" class="chk_info1" name="chk_info1" value="1">미확인
							<input type="radio" class="chk_info1" name="chk_info1" value="2">승인요청
							<input type="radio" class="chk_info1" name="chk_info1" value="3">승인대기
							<br>
							<input type="radio" class="chk_info1" name="chk_info1" value="6">승인
							<input type="radio" class="chk_info1" name="chk_info1" value="7">승인불가
						</c:if>
						<c:if test="${userTeam.teamCd eq '101032'}">
							<input type="radio" class="chk_info1" name="chk_info1" value="1">미확인
							<br>
							<input type="radio" class="chk_info1" name="chk_info1" value="4">고객사 승인완료
							<input type="radio" class="chk_info1" name="chk_info1" value="5">고객사 승인불가
						</c:if>
						<input type="hidden" name="chkInfo" class="chkInfo1" value="9999">
						<input type="hidden" name="recordCd" class="recordCd" value="">
						<input type="hidden" name="intakeCd" class="intakeCd" value="">
						<input type="hidden" name="counselCd" class="counselCd" value="">
						<input type="hidden" name="counselNm" class="counselNm" value="">
						<input type="hidden" name="centerSeq" class="centerSeq" value="">
						<input type="hidden" name="clientCd" class="clientCd" value="">
						<input type="hidden" name="docSts" class="docSts" value="2">
						<input type="hidden" name="docType" class="docType" value="1">
						<div class="popupBtn" id="okBtn1">변경</div>
					</form>
				</td>
			</tr>
			
			<tr>
			<td  colspan="4">
				</td>
			</tr>
			<tr>
				<th height="10px" colspan="4">상담소견서</th>
			</tr>
			<tr>	
				<th width="20%">최종 승인자 </th>
				<td width="20%"><span id="regIdText2"></span></td>
				<th width="30%">최종 승인일자 </th>
				<td width="30%"><span id="regDt2"></span></td>
			</tr>
			<tr>
				<td colspan="4">
					<form id="addConsultOpinionFiles" action="/partner/customermanagement/addAgreementFilesMadm" method="POST" enctype="multipart/form-data">
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
						<tr>
							<td>
								<input type="file" name="ConsultOpinion" style='width: 80%;'>
								<input type="button" id="btnConsultOpinion" value="재업로드">
							</td>
						</tr>
					</table>
						<input type="hidden" name="centerSeq" class="centerSeq" value="">
						<input type="hidden" name="intakeCd" class="intakeCd" value="">
						<input type="hidden" name="counselCd" class="counselCd" value="">
						<input type="hidden" name="counselNm" class="counselNm" value="">
						<input type="hidden" name="clientCd" class="clientCd" value="">
						<input type="hidden" name="docSts" class="docSts" value="2">
						<input type="hidden" name="docType" class="docType" value="2">
						<input id="fileSeq2" type="hidden" name="fileSeq" class="fileSeq" value="">
					</form>
				</td>
			</tr>
			<tr>
				<th width="20%">승인상태 </th>
				<td  colspan="3">
					<form id="addExtendApplyStatus2" action="/partner/customermanagement/updateAgreementStatus" method="POST" enctype="multipart/form-data">		
					<c:if test="${userTeam.teamCd eq '101031'}">
							<input type="radio" class="chk_info2" name="chk_info2" value="1">미확인
							<input type="radio" class="chk_info2" name="chk_info2" value="2">승인요청
							<input type="radio" class="chk_info2" name="chk_info2" value="3">승인대기
							<br>
							<input type="radio" class="chk_info2" name="chk_info2" value="4">고객사 승인완료
							<input type="radio" class="chk_info2" name="chk_info2" value="5">고객사 승인불가
							<br>
							<input type="radio" class="chk_info2" name="chk_info2" value="6">승인
							<input type="radio" class="chk_info2" name="chk_info2" value="7">승인불가
						</c:if>
						<c:if test="${userTeam.teamCd eq '101033'}">
							<input type="radio" class="chk_info2" name="chk_info2" value="1">미확인
							<input type="radio" class="chk_info2" name="chk_info2" value="2">승인요청
							<input type="radio" class="chk_info2" name="chk_info2" value="3">승인대기
							<br>
							<input type="radio" class="chk_info2" name="chk_info2" value="6">승인
							<input type="radio" class="chk_info2" name="chk_info2" value="7">승인불가
						</c:if>
						<c:if test="${userTeam.teamCd eq '101032'}">
							<input type="radio" class="chk_info2" name="chk_info2" value="1">미확인
							<br>
							<input type="radio" class="chk_info2" name="chk_info2" value="4">고객사 승인완료
							<input type="radio" class="chk_info2" name="chk_info2" value="5">고객사 승인불가
						</c:if>
						<input type="hidden" name="chkInfo" class="chkInfo2" value="8888">
						<input type="hidden" name="recordCd" class="recordCd" value="">
						<input type="hidden" name="intakeCd" class="intakeCd" value="">
						<input type="hidden" name="counselCd" class="counselCd" value="">
						<input type="hidden" name="counselNm" class="counselNm" value="">
						<input type="hidden" name="centerSeq" class="centerSeq" value="">
						<input type="hidden" name="clientCd" class="clientCd" value="">
						<input type="hidden" name="docSts" class="docSts" value="2">
						<input type="hidden" name="docType" class="docType" value="2">
						<div class="popupBtn" id="okBtn2">변경</div>
					</form>
				</td>
			</tr>
			
			
			<tr>
			<td  colspan="4">
				</td>
			</tr>
			<tr>
				<th height="10px" colspan="4">상담확인증</th>
			</tr>
			<tr>	
				<th width="20%">최종 승인자 </th>
				<td width="20%"><span id="regIdText3"></span></td>
				<th width="30%">최종 승인일자 </th>
				<td width="30%"><span id="regDt3"></span></td>
			</tr>
			<tr>
				<td colspan="4">
					<form id="addConsultConfirmFiles" action="/partner/customermanagement/addAgreementFilesMadm" method="POST" enctype="multipart/form-data">
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left">
						<tr>
							<td>
								<input type="file" name="ConsultConfirm" style='width: 80%;'>
								<input type="button" id="btnConsultConfirm" value="재업로드">
							</td>
						</tr>
					</table>
						<input type="hidden" name="centerSeq" class="centerSeq" value="">
						<input type="hidden" name="intakeCd" class="intakeCd" value="">
						<input type="hidden" name="counselCd" class="counselCd" value="">
						<input type="hidden" name="counselNm" class="counselNm" value="">
						<input type="hidden" name="clientCd" class="clientCd" value="">
						<input type="hidden" name="docSts" class="docSts" value="2">
						<input type="hidden" name="docType" class="docType" value="3">
						<input id="fileSeq3" type="hidden" name="fileSeq" class="fileSeq" value="">
					</form>
				</td>
			</tr>
			<tr>
				<th width="20%">승인상태 </th>
				<td  colspan="3">
					<form id="addExtendApplyStatus3" action="/partner/customermanagement/updateAgreementStatus" method="POST" enctype="multipart/form-data">		
					<c:if test="${userTeam.teamCd eq '101031'}">
							<input type="radio" class="chk_info3" name="chk_info3" value="1">미확인
							<input type="radio" class="chk_info3" name="chk_info3" value="2">승인요청
							<input type="radio" class="chk_info3" name="chk_info3" value="3">승인대기
							<br>
							<input type="radio" class="chk_info3" name="chk_info3" value="4">고객사 승인완료
							<input type="radio" class="chk_info3" name="chk_info3" value="5">고객사 승인불가
							<br>
							<input type="radio" class="chk_info3" name="chk_info3" value="6">승인
							<input type="radio" class="chk_info3" name="chk_info3" value="7">승인불가
						</c:if>
						<c:if test="${userTeam.teamCd eq '101033'}">
							<input type="radio" class="chk_info3" name="chk_info3" value="1">미확인
							<input type="radio" class="chk_info3" name="chk_info3" value="2">승인요청
							<input type="radio" class="chk_info3" name="chk_info3" value="3">승인대기
							<br>
							<input type="radio" class="chk_info3" name="chk_info3" value="6">승인
							<input type="radio" class="chk_info3" name="chk_info3" value="7">승인불가
						</c:if>
						<c:if test="${userTeam.teamCd eq '101032'}">
							<input type="radio" class="chk_info3" name="chk_info3" value="1">미확인
							<br>
							<input type="radio" class="chk_info3" name="chk_info3" value="4">고객사 승인완료
							<input type="radio" class="chk_info3" name="chk_info3" value="5">고객사 승인불가
						</c:if>
						<input type="hidden" name="chkInfo" class="chkInfo3" value="8888">
						<input type="hidden" name="recordCd" class="recordCd" value="">
						<input type="hidden" name="intakeCd" class="intakeCd" value="">
						<input type="hidden" name="counselCd" class="counselCd" value="">
						<input type="hidden" name="counselNm" class="counselNm" value="">
						<input type="hidden" name="centerSeq" class="centerSeq" value="">
						<input type="hidden" name="clientCd" class="clientCd" value="">
						<input type="hidden" name="docSts" class="docSts" value="2">
						<input type="hidden" name="docType" class="docType" value="3">
						<div class="popupBtn" id="okBtn3">변경</div>
					</form>
				</td>
			</tr>
			
			
		</table>
		<div class="popupBtnBox">
			<div class="closeBtn" onclick="blind();">닫기</div>
		</div>
		

		
	</td>
</tr>

</table>

</div>
<style>
#popupBox{
	border: 1px solid gray;
    width: 500px;
    height: 750px;
    z-index: 100;
    position: absolute;
    background: white;
    top: 100px;
    left: 30%;
    box-shadow: 5px 5px 5px 5px #dddddd6b;
    padding:10px 35px;
    text-align: center;
    font-size: 13px;
}
.popupBtnBox{
	margin-left: 100px;
    margin-right: auto;
}
.popupBtn{
	border:1px solid gray;
	width: 50px;
	padding:5px;
    cursor: pointer;
    float:right;
    margin-right: 20px;
}
.closeBtn{
	border:1px solid gray;
	width: 100px;
	padding:5px;
    cursor: pointer;
    float:right;
    
    margin-top: 20px;
}
button{
    cursor: pointer;
}
</style>
<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px"></td>
	</tr>
	
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
			    	<td align="left" class="subtitle">연장신청</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
				<thead>
				<tr align="center" height="50px">
					<th width="5%" >신청일자</th>			
					<th width="10%" >고객사</th>			
					<th width="5%" >임직원명</th>			
					<th width="5%" >내담자명</th>			
					<th width="5%" >사례위험도</th>			
					<th width="10%" >상담센터</th>			
					<th width="5%" >상담사</th>
					<th width="8%" >연장신청서</th>
					<th width="5%" >연장신청서<br>승인상태</th>
					<th width="8%" >상담소견서</th>
					<th width="5%" >상담소견서<br>승인상태</th>
					<th width="8%" >상담확인증</th>
					<th width="5%" >상담확인증<br>승인상태</th>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<th width="5%" >포인트부여</th>
					</sec:authorize>
					<th width="8%" >담당자 체크</th>				
				</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${paging.list}" varStatus="status">
					<tr height="50px">
					<td>${list.regDt1}</td>
					<td>${list.clientNm}</td>
					<td>${list.ownerNm}</td>
					<td>${list.counselNm}</td>
					<td>${list.risk}단계</td>
					<td>${list.centerNm}</td>
					<td>${list.counselorNm}</td>
 					<td><a href="javascript:fileDownLoad('${list.filefath1}','${list.filename1}')">${list.filename1}</a></td>
 					<td>
 					<c:if test="${list.apprStatus1 eq '1' }">
 					미확인
 					</c:if>
 					<c:if test="${list.apprStatus1 eq '2' }">
 					승인요청
 					</c:if>
 					<c:if test="${list.apprStatus1 eq '3' }">
 					승인대기
 					</c:if>
 					<c:if test="${list.apprStatus1 eq '4' }">
 					고객사 승인완료
 					</c:if>
 					<c:if test="${list.apprStatus1 eq '5' }">
 					고객사 승인불가
 					</c:if>
 					<c:if test="${list.apprStatus1 eq '6' }">
 					승인
 					</c:if>
 					<c:if test="${list.apprStatus1 eq '7' }">
 					승인불가
 					</c:if>
 					<br>
 					<c:if test="${list.regDt1 ne null }">
					(${list.regDt1 })
					</c:if>
 					</td>
					<td><a href="javascript:fileDownLoad('${list.filefath2}','${list.filename2}')">${list.filename2}</a></td>
					<td><c:if test="${list.apprStatus2 eq '1' }">
 					미확인
 					</c:if>
 					<c:if test="${list.apprStatus2 eq '2' }">
 					승인요청
 					</c:if>
 					<c:if test="${list.apprStatus2 eq '3' }">
 					승인대기
 					</c:if>
 					<c:if test="${list.apprStatus2 eq '4' }">
 					고객사 승인완료
 					</c:if>
 					<c:if test="${list.apprStatus2 eq '5' }">
 					고객사 승인불가
 					</c:if>
 					<c:if test="${list.apprStatus2 eq '6' }">
 					승인
 					</c:if>
 					<c:if test="${list.apprStatus2 eq '7' }">
 					승인불가
 					</c:if>
					<br>
					<c:if test="${list.regDt2 ne null }">
					(${list.regDt2 })
					</c:if>
					</td>
					<td><a href="javascript:fileDownLoad('${list.filefath3}','${list.filename3}')">${list.filename3}</a></td>
					<td>
					<c:if test="${list.apprStatus3 eq '1' }">
 					미확인
 					</c:if>
 					<c:if test="${list.apprStatus3 eq '2' }">
 					승인요청
 					</c:if>
 					<c:if test="${list.apprStatus3 eq '3' }">
 					승인대기
 					</c:if>
 					<c:if test="${list.apprStatus3 eq '4' }">
 					고객사 승인완료
 					</c:if>
 					<c:if test="${list.apprStatus3 eq '5' }">
 					고객사 승인불가
 					</c:if>
 					<c:if test="${list.apprStatus3 eq '6' }">
 					승인
 					</c:if>
 					<c:if test="${list.apprStatus3 eq '7' }">
 					승인불가
 					</c:if>
					<br>
					<c:if test="${list.regDt3 ne null }">
					(${list.regDt3 })
					</c:if>
					
					</td> 
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<td><button class="givePointToUser" type="button" clientCd="${list.clientCd }" userKey="${list.userKey }">부여</button></td>

					</sec:authorize>
					
					<td>
					
					
					<button onclick="showDocument(${list.counselCd },${list.intakeCd },'${list.counselNm }',${list.centerSeq },'${list.clientCd }','${list.apprStatus1}','${list.apprStatus2 }','${list.apprStatus3 }','${list.regId1 }','${list.regId2 }','${list.regId3 }','${list.regDt1 }','${list.regDt2 }','${list.regDt3 }' ,'${list.fileSeq1 }','${list.fileSeq2 }','${list.fileSeq3 }' )" >보기</button></td>

<%-- 					<td>
						<c:if test="${list.extensionStatus eq '100930'}">
							상담연장 신청상태
						</c:if>
		    			<c:if test="${list.extensionStatus eq '100931'}">
							상담연장 승인
						</c:if>
						<c:if test="${list.extensionStatus eq '100932'}">
							상담연장 완료
						</c:if>
					
					</td> --%>
						<%--<td>${list.regDt}</td>
						<td>${list.clientNm}</td>
						<td>${list.staffNm}</td>
						<td>${list.counselNm}</td>
			 			<c:choose>
							<c:when test="${list.riskDegree ne null}">
								<td>${list.riskDegree}단계</td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose> 
						<td>${list.centerNm}</td>
						<td>${list.counselorNm}</td>
 						<td>${list.recordCd}</td>
						<td>${list.pointSeq}</td> 
						<td>${sesUser.userNm}</td>
						 <td>${list.extensionStatus}</td> --%>
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
</table>
</body>
</html>