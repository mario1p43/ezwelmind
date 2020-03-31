<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<style>
	.popup-wrapper{background-color:#FFFFFF;padding-bottom:2vw}
	.popup-wrapper .popup-title-wrapper{display:flow-root;padding:5vw}
	.popup-wrapper .popup-title-wrapper .popup-title{float:left;font-size:20px;font-weight:bold}
	.popup-wrapper .popup-title-wrapper .popup-close{float:right;cursor:pointer}
	.popup-wrapper .popup-title-wrapper .popup-close img{width:14px;height:14px;padding:3px;vertical-align:-webkit-baseline-middle;}
	
	.popup-wrapper .popup-content-wrapper{display:flow-root;padding:2.6vw 4.5vw;font-size:14px}	
	.popup-wrapper .popup-content-wrapper.border-top{border-top:1px solid #BDBDBD}
	.popup-wrapper .popup-content-wrapper .content-title{float:left;width:38%;font-weight:bold}
	.popup-wrapper .popup-content-wrapper .content-data{float:left;width:62%}
	.popup-wrapper .popup-content-wrapper .content-data input{width:100%;border:0;font-size:14px;outline:none}

	.popup-bottom-wrapper .bottom-btn-insert{float:left;width:100%;height:11vw;font-weight:bold;font-size:16px;color:white;text-align:center;background-color:#006CBA;border:0;outline:none}
	.popup-bottom-wrapper .bottom-btn-update{float:left;width:62.5%;height:11vw;font-weight:bold;font-size:16px;color:white;text-align:center;background-color:#006CBA;border:0;outline:none}
	.popup-bottom-wrapper .bottom-btn-delete{float:left;width:37.5%;height:11vw;font-weight:bold;font-size:16px;color:#828282;text-align:center;background-color:#E0E0E0;border:0;outline:none}
</style>

<script>
	$("#insertPaycheckBtn").click(function(){
		if(confirm("등록하시겠습니까?")){
			var params = {};
			var counselCd 			= $("input[name='insertCounselCd']").val();
			var clientCd			= $("input[name='clientCd']").val();
			var clientNm			= $("input[name='clientNm']").val();
			var scheduleDt			= $("input[name='scheduleDt']").val();
			var staffNm				= $("input[name='staffNm']").val();
			var mgrNm				= $("input[name='mgrNm']").val();
			var counselType			= $("input[name='counselType']").val();
			var counselStatus		= $("input[name='counselStatus']").val();
			var centerNm			= $("input[name='centerNm']").val();
			var centerSeq			= $("input[name='centerSeq']").val();
			var counselorNm			= $("input[name='counselorNm']").val();
			var counselorId			= $("input[name='counselorId']").val();
			var price				= $("input[name='price']").val();
			var taxType				= $("input[name='taxType']").val();
			var bankNm				= $("input[name='bankNm']").val();
			var accountOwner		= $("input[name='accountOwner']").val();
			
			params.counselCd 		= counselCd;
			params.clientCd 		= clientCd;
			params.clientNm 		= clientNm;
			params.scheduleDt		= scheduleDt;
			params.staffNm			= staffNm;
			params.mgrNm			= mgrNm;
			params.counselType 		= counselType;
			params.counselStatus 	= counselStatus;
			params.centerNm 		= centerNm;
			params.centerSeq		= centerSeq;
			params.counselorNm		= counselorNm;
			params.counselorId		= counselorId;
			params.price 			= price;
			params.taxType 			= taxType;
			params.bankNm			= bankNm;
			params.accountOwner		= accountOwner;
			
			var startDt				= $("input[name='startDt']").val();
			var endDt 				= $("input[name='endDt']").val();
			var searchClientCd		= $("input[name='searchClientCd']").val();
			var searchStaffNm 		= $("input[name='searchStaffNm']").val();
			var searchMgrNm 		= $("input[name='searchMgrNm']").val();
			var searchCounselorNm 	= $("input[name='searchCounselorNm']").val();
			var searchCenterSeq 	= $("input[name='searchCenterSeq']").val();
			
			$.ajax({
				url: "/partner/payCheckMgr/insertPayCheck",
				data:params,
				dataType: 'json',
				success: function (response) {
					var resultCnt = response.resultCnt;
					if(resultCnt > 0){
						alert("정산 정보가 등록되었습니다.");
						location.href = "/partner/payCheck/payCheckList"+"?startDt="+startDt+"&endDt="+endDt
										+"&searchClientCd="+searchClientCd+"&searchStaffNm="+searchStaffNm
										+"&searchMgrNm="+searchMgrNm+"&searchCounselorNm="+searchCounselorNm
										+"&searchCenterSeq="+searchCenterSeq;
					}else{
						alert("정산 정보 등록에 실패하였습니다.");
					}
				}
			});
		}
		return false;
	});
	
	$("#updatePaycheckBtn").click(function(){
		if(confirm("수정하시겠습니까?")){
			var params = {};
			var counselCd 			= $("input[name='counselCd']").val();
			var clientCd			= $("input[name='clientCd']").val();
			var clientNm			= $("input[name='clientNm']").val();
			var scheduleDt			= $("input[name='scheduleDt']").val();
			var staffNm				= $("input[name='staffNm']").val();
			var mgrNm				= $("input[name='mgrNm']").val();
			var counselType			= $("input[name='counselType']").val();
			var counselStatus		= $("input[name='counselStatus']").val();
			var centerNm			= $("input[name='centerNm']").val();
			var centerSeq			= $("input[name='centerSeq']").val();
			var counselorNm			= $("input[name='counselorNm']").val();
			var counselorId			= $("input[name='counselorId']").val();
			var price				= $("input[name='price']").val();
			var taxType				= $("input[name='taxType']").val();
			var bankNm				= $("input[name='bankNm']").val();
			var accountOwner		= $("input[name='accountOwner']").val();
			
			params.counselCd 		= counselCd;
			params.clientCd 		= clientCd;
			params.clientNm 		= clientNm;
			params.scheduleDt		= scheduleDt;
			params.staffNm			= staffNm;
			params.mgrNm			= mgrNm;
			params.counselType 		= counselType;
			params.counselStatus 	= counselStatus;
			params.centerNm 		= centerNm;
			params.centerSeq		= centerSeq;
			params.counselorNm		= counselorNm;
			params.counselorId		= counselorId;
			params.price 			= price;
			params.taxType 			= taxType;
			params.bankNm			= bankNm;
			params.accountOwner		= accountOwner;
			
			var startDt				= $("input[name='startDt']").val();
			var endDt 				= $("input[name='endDt']").val();
			var searchClientCd		= $("input[name='searchClientCd']").val();
			var searchStaffNm 		= $("input[name='searchStaffNm']").val();
			var searchMgrNm 		= $("input[name='searchMgrNm']").val();
			var searchCounselorNm 	= $("input[name='searchCounselorNm']").val();
			var searchCenterSeq 	= $("input[name='searchCenterSeq']").val();
			
			$.ajax({
				url: "/partner/payCheckMgr/updatePayCheck",
				data:params,
				dataType: 'json',
				success: function (response) {
					var resultCnt = response.resultCnt;
					if(resultCnt > 0){
						alert("정산 정보가 수정되었습니다.");
						location.href = "/partner/payCheck/payCheckList"+"?startDt="+startDt+"&endDt="+endDt
										+"&searchClientCd="+searchClientCd+"&searchStaffNm="+searchStaffNm
										+"&searchMgrNm="+searchMgrNm+"&searchCounselorNm="+searchCounselorNm
										+"&searchCenterSeq="+searchCenterSeq;
					}else{
						alert("정산 정보 수정에 실패하였습니다.");
					}
				}
			});
		}
		return false;
	});
	
	$("#deletePaycheckBtn").click(function(){
		if(confirm("삭제하시겠습니까?")){
			var params = {};
			var counselCd 			= $("input[name='counselCd']").val();
			var startDt				= $("input[name='startDt']").val();
			var endDt 				= $("input[name='endDt']").val();
			var searchClientCd		= $("input[name='searchClientCd']").val();
			var searchStaffNm 		= $("input[name='searchStaffNm']").val();
			var searchMgrNm 		= $("input[name='searchMgrNm']").val();
			var searchCounselorNm 	= $("input[name='searchCounselorNm']").val();
			var searchCenterSeq 	= $("input[name='searchCenterSeq']").val();
			
			params.counselCd 		= counselCd;
			
			$.ajax({
				url: "/partner/payCheckMgr/deletePayCheck",
				data: params,
				dataType: 'json',
				success: function (response) {
					var resultCnt = response.resultCnt;
					if(resultCnt > 0){
						alert("정산 정보가 삭제되었습니다.");
						location.href = "/partner/payCheck/payCheckList"+"?startDt="+startDt+"&endDt="+endDt
										+"&searchClientCd="+searchClientCd+"&searchStaffNm="+searchStaffNm
										+"&searchMgrNm="+searchMgrNm+"&searchCounselorNm="+searchCounselorNm
										+"&searchCenterSeq="+searchCenterSeq;
					}else{
						alert("정산 정보 삭제에 실패하였습니다.");
					}
				}
			});
		}
		return false;
	});
</script>

<input type="hidden" name="counselCd" value="${payCheck.counselCd }"/>
<input type="hidden" name="startDt" value="${searchValue.startDt }"/>
<input type="hidden" name="endDt" value="${searchValue.endDt }"/>
<input type="hidden" name="searchClientCd" value="${searchValue.searchClientCd }"/>
<input type="hidden" name="searchStaffNm" value="${searchValue.searchStaffNm }"/>
<input type="hidden" name="searchMgrNm" value="${searchValue.searchMgrNm }"/>
<input type="hidden" name="searchCounselorNm" value="${searchValue.searchCounselorNm }"/>
<input type="hidden" name="searchCenterSeq" value="${searchValue.searchCenterSeq }"/>
	
<div class="popup-wrapper">
	<div class="popup-title-wrapper">
		<span class="popup-title">상담비정산 상세정보</span>
		<span class="popup-close btClose"><img src="${url:resource('/resources/img/close_btn.png')}"></span>
	</div>
	<div class="popup-content-wrapper">
		<div class="content-title">상담코드</div>
		<div class="content-data">
			<c:if test="${insertType == 'I' }">
	    		<input type="text" name="insertCounselCd" value=""/>
	    	</c:if>
	    	<c:if test="${insertType == 'U' }">
	    		${payCheck.counselCd}
	    	</c:if>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">상담일시</div>
		<div class="content-data">
			<input type="text" name="scheduleDt" value="${payCheck.scheduleDt }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">고객사코드</div>
		<div class="content-data">
			<input type="text" name="clientCd" value="${payCheck.clientCd }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">고객사</div>
		<div class="content-data">
			<input type="text" name="clientNm" value="${payCheck.clientNm }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">임직원</div>
		<div class="content-data">
			<input type="text" name="staffNm" value="${payCheck.staffNm }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">내담자</div>
		<div class="content-data">
			<input type="text" name="mgrNm" value="${payCheck.mgrNm }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">상담타입</div>
		<div class="content-data">
			<input type="text" name="counselType" value="${payCheck.counselType }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">상담상태</div>
		<div class="content-data">
			<input type="text" name="counselStatus" value="${payCheck.counselStatus }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">상담기관</div>
		<div class="content-data">
			<input type="text" name="centerNm" value="${payCheck.centerNm }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">상담기관코드</div>
		<div class="content-data">
			<input type="text" name="centerSeq" value="${payCheck.centerSeq }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">상담사</div>
		<div class="content-data">
			<input type="text" name="counselorNm" value="${payCheck.counselorNm }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">상담사 ID</div>
		<div class="content-data">
			<input type="text" name="counselorId" value="${payCheck.counselorId }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">비용</div>
		<div class="content-data">
			<input type="text" name="price" value="${payCheck.price }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">세금구분</div>
		<div class="content-data">
			<input type="text" name="taxType" value="${payCheck.taxType }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">은행명</div>
		<div class="content-data">
			<input type="text" name="bankNm" value="${payCheck.bankNm }"/>
		</div>
	</div>
	<div class="popup-content-wrapper border-top">
		<div class="content-title">예금주</div>
		<div class="content-data">
			<input type="text" name="accountOwner" value="${payCheck.accountOwner }"/>
		</div>
	</div>
</div>
<div class="popup-bottom-wrapper">
	<c:if test="${insertType == 'I' }">
		<button id="insertPaycheckBtn" class="bottom-btn-insert"> 등록</button>
	</c:if>
	<c:if test="${insertType == 'U' }">
		<button id="deletePaycheckBtn" class="bottom-btn-delete"> 삭제</button>
		<button id="updatePaycheckBtn" class="bottom-btn-update"> 수정</button>
	</c:if>
</div>