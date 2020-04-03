<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<%@ include file="/WEB-INF/jsp/layout/inc/staticAfter.jspf"%>
<html>
<head>
<title>내담자 관리</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<style>
	table{border-spacing:0!important}
	table td{background:none!important; line-height: 1.5; font-size: 3.6111vw;}
	.counsel_wrapper{background-color: white;padding:0 5.5556vw;padding-bottom:22.2222vw;}
	.box_title{margin-top: 4.4444vw; font-size: 5.5556vw; color: #333;font-weight: bold;margin-bottom: 2.1111vw;}
	.content_wrapper {width: 100%;}
	.flex {display: flex; display: -webkit-flex;}
	.info_label { display:flex; -webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center; width: 28.8889vw; border: 1px solid #828282; background-color:#d2d2d2;height: 8.3333vw;color:#000000; font-size:3.6111vw;; font-weight: bold;border-top:none;}
	.flex:first-child .info_label {border-top: 1px solid #828282;}
	.info_content {display:flex; min-width: 0; width: 56.7778vw; padding-left: 2.2222vw; -webkit-align-items: center; align-items: center; height: 8.3333vw; border-bottom: 1px solid #828282; border-right: 1px solid #828282; background-color:#fff; color:#000000; font-size:3.6111vw;}
	.info_content span {color:black;line-height: 1.2;font-size: 3.6111vw !important;}
	.flex:first-child .info_content {border-top: 1px solid #828282;}
	.big_label {display:flex; width: 88vw; -webkit-justify-content: center; justify-content: center; -webkit-align-items: center; align-items: center;color:#000000; font-size:3.6111vw; font-weight: bold;border-left: 1px solid #828282; border-right: 1px solid #828282; height: 8.3333vw; background-color: #D2D2D2;}
	.text_content {color:#333333;width: 84.2vw; font-size:3.6111vw; padding:1.9444vw; border: 1px solid #828282; background-color: #f2f2f2;}
	.text_content span {display: block; color:#333333; font-size: 3.6111vw !important;}
	.submit_btn {width: 100%; height: 11.1111vw; background-color: #006CBA; font-size: 4.4444vw; font-weight: bold; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); color:white;border: none; margin-top:4.4444vw;}
	.counselDiagnosis {border: none; background-color: #F2F2F2; color:#2F80ED; font-size: 3.6111vw;}
	.info_content a { color: #2F80ED;}

	/* file wrapper */
	.file_label {
		margin-top:2.2222vw;
	}
	.file_wrapper {
		font-size: 3.6111vw;
		display: flex;
		margin-top:2.7778vw;
	}
	.chooose_file_button {
		font-size: 3.6111vw;
		color: #2F80ED;
		background:white;
		border: none;
		margin-right:2.2222vw;
		padding-left:0;
	}
	.submit_file_button { 
		font-size: 3.6111vw;
		color: #2F80ED;
		background:white;
		border: none;
		width: 11.6667vw;
	}
	.file_chooser_wrapper { 
		display: flex;
		border-bottom: 1px solid #C4C4C4;
		-webkit-flex-grow: 1; 
		flex-grow: 1; 
		flex : 1 1 0; 
		-webkit-flex : 1 1 0;
		padding-bottom:0.8333vw;
	}
	.file_wrapper input[type=file] {
		border: 0;
		width: 0;
	}
	.box_description {
		margin-bottom:2.7778vw;
		font-size: 3.3333vw;
		color:#eb5757;
	}
	.doc_donwload_wrapper {
		display: flex;
		-webkit-align-items: center;
		align-items: center;
	}
	.doc_donwload_wrapper img{
		width: 6.6667vw;
		height: 6.6667vw;
	}
	.download_file_button {
		font-size: 3.6111vw;
		color: #2F80ED;
	}
	.submit_doc_button { 
		height: 11.1111vw;
		width: 100%;
		background-color: #006CBA;
		color: white;
		font-size: 4.4444vw;
		font-weight: bold;
		margin-top:5.5556vw;
		margin-bottom: 5.5556vw;
	}
	.mobile_nav {
		height: auto;
	}
</style>
<script type="text/javascript">
j$(document).ready(function(){
	$('.mobile_nav ul li a').eq(1).addClass('active');
	$('.mobile_nav ul li a img').eq(1).attr('src', "${url:resource('/resources/img/consulting_icon_active.png')}");
	j$('.chooose_file_button').on('click', function() {
		j$(this).siblings('input[type=file]').trigger('click');
		return false;
	});

	j$('.file_chooser_wrapper input').on('change', function() {
		j$(this).siblings('a').text(this.files[0].name);
	});
	
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
</head>

<body>
<div class="counsel_wrapper">
	<div class="box_title">내담자 상세정보</div>
	<div class="content_wrapper">
		<div class="flex">
			<div class="info_label">상담 받을 분</div>
			<div class="info_content">
				${customerServiceInfo.relation}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">생년월일</div>
			<div class="info_content">
				${customerServiceInfo.rrn}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">성별</div>
			<div class="info_content">
				<input type="hidden" name="gender" value="${intake_detail.gender }"/> 
				${customerServiceInfo.gender}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">성명</div>
			<div class="info_content">
				${customerServiceInfo.counselNm}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">학력/학년</div>
			<div class="info_content">
				${customerServiceInfo.education}/${customerServiceInfo.session}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">직업</div>
			<div class="info_content">
				<span>${customerServiceInfo.job}</span>
			</div>
		</div>
		<div class="flex">
			<div class="info_label">휴대전화</div>
			<div class="info_content">
				${customerServiceInfo.mobile}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">이메일</div>
			<div class="info_content">
				${customerServiceInfo.email}
			</div>
		</div>


		<div class="flex">
			<div class="info_label">상담 세부주제</div>
			<div class="info_content">
				${customerServiceInfo.cause}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">사전 질문</div>
			<div class="info_content">
				<c:choose>
					<c:when test="${customerServiceInfo.counselType eq '100433' }">
						<button class="counselDiagnosis" type="button" counselCd="${defaultInfo.counselCd }" intakeCd="${customerServiceInfo.intakeCd }">자세히 ></button>
					</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose> 
			</div>
		</div>
	</div>
	<%-- ${defaultInfo.counselType} --%>
	<%-- ${customerServiceInfo} --%>
	<div class="box_title">기본 정보</div>
	<div class="content_wrapper">
		<div class="flex">
			<div class="info_label">상담일자</div>
			<div class="info_content">
				${defaultInfo.scheduleDt}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">전화상담시간</div>
			<div class="info_content">
				${defaultInfo.scheduleTime}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">일지 작성일자</div>
			<div class="info_content">
				${defaultInfo.regDt}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">내담자명</div>
			<div class="info_content">
				${customerServiceInfo.counselNm}
				<!-- <a href="/partner/customermanagement/mainmanage?counselCd=${baseInfo_detail.counselCd}">${customerServiceInfo.counselNm} ></a> -->
			</div>
		</div>
		<div class="flex">
			<div class="info_label">신청코드</div>
			<div class="info_content">
				${defaultInfo.counselCd}
			</div>
		</div>
		
		<div class="flex">
			<div class="info_label">고객명</div>
			<div class="info_content">
				${defaultInfo.clientNm}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">직원간의 관계</div>
			<div class="info_content">
				${customerServiceInfo.relation}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">고객사</div>
			<div class="info_content">
				${defaultInfo.clientCd}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">연락처</div>
			<div class="info_content">
				${customerServiceInfo.mobile}
			</div>
		</div>

		<div class="flex">
			<div class="info_label">회기정보</div>
			<div class="info_content">
				${customerServiceInfo.intakeNum}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">서비스기간</div>
			<div class="info_content">
				${defaultInfo.period}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">잔여/전체 포인트</div>
			<div class="info_content">
				${defaultInfo.point}
			</div>
		</div>
		<div class="flex">
			<div class="info_label">고객사 담당자</div>
			<div class="info_content">
				${defaultInfo.clientMgrNm}
			</div>
		</div>
		<div class="big_label">고객사 주요정책</div>
		<div class="text_content">
			${customerServiceInfo.memoTt}
		</div>
	</div>

</div>

</body>
</html>