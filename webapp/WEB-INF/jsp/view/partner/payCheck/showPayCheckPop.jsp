<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
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

<div style="overflow-x: hidden;">
	<input type="hidden" name="counselCd" value="${payCheck.counselCd }"/>
	<input type="hidden" name="startDt" value="${searchValue.startDt }"/>
	<input type="hidden" name="endDt" value="${searchValue.endDt }"/>
	<input type="hidden" name="searchClientCd" value="${searchValue.searchClientCd }"/>
	<input type="hidden" name="searchStaffNm" value="${searchValue.searchStaffNm }"/>
	<input type="hidden" name="searchMgrNm" value="${searchValue.searchMgrNm }"/>
	<input type="hidden" name="searchCounselorNm" value="${searchValue.searchCounselorNm }"/>
	<input type="hidden" name="searchCenterSeq" value="${searchValue.searchCenterSeq }"/>
	
	<table cellpadding="5" cellspacing="0" border="1px solid silver" style="border-collapse:collapse; width:900px; min-height: 300px;" >
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">상담코드</th>
			<c:if test="${insertType == 'I' }">
	    		<td class="line" width="40%"><input type="text" name="insertCounselCd" value=""/></td>
	    	</c:if>
	    	<c:if test="${insertType == 'U' }">
	    		<td class="line" width="40%">${payCheck.counselCd }</td>
	    	</c:if>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">상담일시</th>
	    	<td class="line" width="40%"><input type="text" name="scheduleDt" value="${payCheck.scheduleDt }"/></td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">고객사코드</th>
	    	<td class="line" width="40%"><input type="text" name="clientCd" value="${payCheck.clientCd }"/></td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">고객사</th>
	    	<td class="line" width="40%"><input type="text" name="clientNm" style="width:200px;" value="${payCheck.clientNm }"/></td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">임직원</th>
	    	<td class="line" width="40%"><input type="text" name="staffNm" value="${payCheck.staffNm }"/></td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">내담자</th>
	    	<td class="line" width="40%"><input type="text" name="mgrNm" value="${payCheck.mgrNm }"/></td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">상담타입</th>
	    	<td class="line" width="40%"><input type="text" name="counselType" value="${payCheck.counselType }"/></td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">상담상태</th>
	    	<td class="line" width="40%"><input type="text" name="counselStatus" value="${payCheck.counselStatus }"/></td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">상담기관</th>
	    	<td class="line" width="40%"><input type="text" name="centerNm" style="width:200px;" value="${payCheck.centerNm }"/></td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">상담기관코드</th>
	    	<td class="line" width="40%"><input type="text" name="centerSeq" value="${payCheck.centerSeq }"/></td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">상담사</th>
	    	<td class="line" width="40%"><input type="text" name="counselorNm" value="${payCheck.counselorNm }"/></td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">상담사 ID</th>
	    	<td class="line" width="40%"><input type="text" name="counselorId" value="${payCheck.counselorId }"/></td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">비용</th>
	    	<td class="line" width="40%"><input type="text" name="price" value="${payCheck.price }"/></td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">세금구분</th>
	    	<td class="line" width="40%"><input type="text" name="taxType" value="${payCheck.taxType }"/></td>
		</tr>
		<tr  height="50px">
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">은행명</th>
	    	<td class="line" width="40%"><input type="text" name="bankNm" value="${payCheck.bankNm }"/></td>
			<th class="line" width="10%" align="center" bgcolor="#F5F5F5">예금주</th>
	    	<td class="line" width="40%"><input type="text" name="accountOwner" style="width:200px;" value="${payCheck.accountOwner }"/></td>
		</tr>
	</table>
	<span>
		<c:if test="${insertType == 'I' }">
			<button id="insertPaycheckBtn" type="button" style="margin-top: 15px;margin-left: 400px;"> 등록</button>
		</c:if>
		<c:if test="${insertType == 'U' }">
			<button id="updatePaycheckBtn" type="button" style="margin-top: 15px;margin-left: 400px;"> 수정</button>
			<button id="deletePaycheckBtn" type="button" style="margin-top: 15px;margin-left: 20px; "> 삭제</button>
		</c:if>
	</span>
</div>