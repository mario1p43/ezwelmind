<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script type="text/javascript">
j$(document).ready(function(){
	j$("#modifyBtn").click(function(){
		var clientCd = $("#popClientCd").val();
		var pollSeq = $("#popPollSeq").val();
		var pollNm = $("#popPollNm").val();
		var initClientCd = $("#initClientCd").val();
		
		if (pollSeq == "") {
			alert("잘못된 접근입니다. 팝업창을 닫고 다시 시도하세요."); 
			return;
		}
		
		if (clientCd == "") {
			alert("온라인진단 코드(고객사코드)를 입력하세요.."); 
			$("#popClientCd").focus();
			return;
		}
		
		if (pollNm == "") {
			alert("설문명을 입력하세요."); 
			$("#popPollNm").focus();
			return;
		}
		
		if(initClientCd != clientCd){
			var params = {};
			params.clientCd = clientCd;

			$.ajax({
				url: '/madm/diagnosis/checkClientCd',
				data: params,
				dataType: 'json',
				type: 'post',
				success: function(data) {
					if (data.resultValue == 0) {
						pollModify();
					}else{
						alert("중복된 온라인진단 코드가 있습니다.");
						return;
					}
				}
			});
		}else{
			pollModify();
		}
		
	});
});

function pollModify(){
	if(confirm("정보를 수정하시겠습니까?")){
		$("#pollModify").submit();
	}
}
</script>

<form:form id="pollModify" modelAttribute="diagnosisDto" action="/madm/diagnosis/pollModify" method="POST">
<div align="center"  style="width: 600px; min-height: 300px; vertical-align: middle;" >
<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px"></td>
	</tr>

	<tr>
		<td>
			<!-- 버튼 영역 시작 -->
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
					<td align="left" class="subtitle">멘탈헬스 자가진단</td>
				</tr>
			</table>
			<!-- 버튼 영역 종료 -->
		</td>
	</tr>

	<tr height="20px;">
		<td></td>
	</tr>
	
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
				<tr>
					<td>
						<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
							<tr height="30px">
								<th width="25%">설문일련번호</th>
								<td width="auto;" align="left">
									${pollDetail.pollSeq}
									<input type="hidden" name="pollSeq" id="popPollSeq" value="${pollDetail.pollSeq}" />
								</td>
							</tr>
							
							<tr>
								<th>설문명</th>
								<td >
									<input type="text" name="pollNm" id="popPollNm" value="${pollDetail.pollNm}" style="width: 95%; height: 30px;"/>
								</td>
							</tr>
							
							<tr>
								<th>온라인진단 코드<br>(고객사코드)</th>
								<td>
									<input type="text" name="clientCd" id="popClientCd" value="${pollDetail.clientCd}" style="width: 95%; height: 30px;"/>
									<input type="hidden" id="initClientCd" value="${pollDetail.clientCd}" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td height="20px"></td>
	</tr>
	
	<tr align="center" width="100%">
		<td id="btn01" colspan="2" ><a href="#" style="margin-left: 47%"><span id="modifyBtn">수정</span></a></td>
	</tr>
	
</table>
</div>
</form:form>
