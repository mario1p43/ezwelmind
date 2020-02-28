<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제휴사계정</title>
<script type="text/javascript">
j$(document).ready(function(){
	var chkId = 0;
	//밸리데이션 체크
	$.validate({
		form : '#cspAdd',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			if($('#mobile1').val() != ''){
			$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
			}
			if($('#telNum1').val() != ''){
			$('[name=telNum]').val($('#telNum1').val() + "-" + $('#telNum2').val() + "-" + $('#telNum3').val());
			}
			if(chkId != 1){
				alert("아이디 중복확인을 해야합니다.");
				return false;
			}
			if(j$('#userPwd').val() != j$('#userPwdChk').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			if(j$('#searchcsp').val() == ""){
				alert("제휴사명을 선택해주세요.");
				return false;
			}
		}
	});
	
	j$('#userId').change(function(){
		chkId = 0;
	});
	

	j$('#chkId').click(function() {
		
		var params = {};
		var strData = "";
		var userId = $("#userId").val()
		params.userId  = userId;
		if(userId == ""){
			return false;
		}else{
		j$.ajax({
			url: '/partner/mgr/checkId',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				var d =  data.mgr
				if(data.mgr != null){
				if(d.userId != ""){
					alert("중복되는 아이디가 존재합니다.");
					$("#userId").val("");
					chkId = 0;
				}
				}else{
					chkId = 1;
					alert("등록가능한 아이디입니다.");
				}
			}
		});
		}
		
	});
	
	j$('#addBtn').click(function() {
		j$("#cspAdd").submit();
	});
	
});

function getcspPopup() {
	window.open("/madm/service/csp/cspPopup?Oform=cspAccount", "cspPopup", "width=800, height=600,  scrollbars=1");
}
</script>
</head>
<body>

<form id="cspAdd" name="cspAdd" action="/madm/service/csp/cspAccountInsert" method="POST" >
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">제휴사계정</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
				<ul>
					<li>기본정보</li>
				</ul>
					<!-- 배너 정보 영역 시작 -->
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 담당자명</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="userNm"  data-validation="required" data-validation-error-msg-required="담당자명을 확인해주세요.">
					    	</td>
  						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 아이디</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="userId" id="userId">
					    		<input type="button" id="chkId" value="중복확인">
					    	</td>
  							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 비밀번호</th>
					    	<td class="line" width="35%">
					    		<input type="password" name="userPwd" id="userPwd"  data-validation="required" data-validation-error-msg-required="비밀번호를 확인해주세요.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 제휴사명</th>
					    	<td class="line" width="35%">
					    		<input type="text" id="searchcsp" name="searchcsp" value="${param.cspNm }" disabled="disabled" >
								<input type="hidden" id="searchcspCd" name="cspCd" value="${param.cspCd }">
								<input type="button" value="찾아보기" onclick="javascript:getcspPopup();" >
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 비밀번호확인</th>
					    	<td class="line" width="35%">
					    		<input type="password" name="userPwdChk" id="userPwdChk"  data-validation="required" data-validation-error-msg-required="비밀번호확인을 확인해주세요.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 이메일</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="email"  data-validation="email" data-validation-error-msg-email="이메일을 확인해주세요.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;휴대전화</th>
					    	<td class="line" width="35%">
					    		<input type="number" id="mobile1" maxlength="3" style="width: 10%;" />-
					    		<input type="number" id="mobile2" maxlength="4" style="width: 10%;" />-
					    		<input type="number" id="mobile3" maxlength="4" style="width: 10%;" />
					    		<input type="hidden" name="mobile">
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;전화번호</th>
					    	<td class="line" width="35%">
					    		<input type="number" id="telNum1" maxlength="3" style="width: 10%;" />-
					    		<input type="number" id="telNum2" maxlength="4" style="width: 10%;" />-
					    		<input type="number" id="telNum3" maxlength="4" style="width: 10%;" />
					    		<input type="hidden" name="telNum">
					    	</td>
						</tr>
						
					</table>
					
					<ul>
						<li>관리자 메모</li>
					</ul>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
								<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;내용</th>
						    	<td class="line" colspan="3">
						    		<textarea rows="4" cols="50" style="width: 95%" name="memo" ></textarea>
						    	</td>
							</tr>
					</table>
				
				</td>
			</tr>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table  cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td align="center" >
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<button onclick="history.back()" style="height:30px; width:100px;" type="button">등록취소</button>
										&nbsp;&nbsp;&nbsp;
							    		<button id="addBtn" style="height:30px; width:100px;" type="button">등록하기</button>
					    			</tr>
					    		</table>
					    	</td>
						</tr>
					</table>
					<!-- 버튼 영역 종료 -->
				</td>
			</tr>


		</table>
	</td>
</tr>

</table>
</form>


</body>
</html>