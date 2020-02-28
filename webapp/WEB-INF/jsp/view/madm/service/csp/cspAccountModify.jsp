<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제휴사계정</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	j$("#userImsiPwdUpdateBtn").click(function(){
		// 비밀번호 초기화 - 임시비밀번호 : mind1234!@
		var params = {};
		params.userId = j$(this).attr("value");
		
		if( params.userId.length > 0 ){
			jQuery.ajax({
				url: "/madm/service/csp/userImsiPwdUpdate",
				data: params,
				type: "POST",
				dataType: "json",
				success: function(data, textStatus){
					if(data.resultVal == 'success'){
						alert(" 정상적으로 변경 하였습니다. \n- 임시 비밀번호는 'mind1234!@'입니다. \n- 로그인 후 비밀번호를 변경해야 이용 가능합니다.");
					}else{
						alert("비밀번호 변경에 실패했습니다. \n오류가 지속되면 담당자에게 문의바랍니다.");
					}
				}
			});
		}
		
	});
	
	j$("#addBtn").click(function(){
		
		j$("#cspModify").attr("action","/madm/service/csp/cspAccountUpdate");
		j$("#cspModify").submit();
		return false;
	});
	
	j$("#noBtn").click(function(){
		
		j$("#cspModify").attr("action","/madm/service/csp/cspAccountUseNo");
		j$("#cspModify").submit();
		return false;
	});
	
	//밸리데이션 체크
	$.validate({
		form : '#cspModify',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			if($('#mobile1').val() != ''){
			$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
			}
			if($('#telNum1').val() != ''){
			$('[name=telNum]').val($('#telNum1').val() + "-" + $('#telNum2').val() + "-" + $('#telNum3').val());
			}
			
		}
	});
	
});
</script>

</head>
<body>

<form id="cspModify" name="cspModify" action="/madm/service/csp/cspAccountUpdate" method="POST" >
<input type="hidden" name="userId" value="${mgr.userId }">
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
					    	<td class="line" width="35%">
					    		<input type="text" name="userNm" value="${mgr.userNm }" data-validation="required" data-validation-error-msg-required="담당자명을 확인해주세요.">
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;제휴사명</th>
					    	<td class="line" width="35%">
								${mgr.cspNm } 
					    	</td>
  						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;아이디</th>
					    	<td class="line" width="35%">
					    		<table>
					    			<tr>
					    				<td>${mgr.userId }</td>
					    				<td id="btn01" style="padding-left: 40px;"> <a href="javascript:void(0);" id="userImsiPwdUpdateBtn" value="${mgr.userId }"> <span>비밀번호 초기화</span> </a> </td>
					    			</tr>
					    		</table>
					    	</td>
  							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;승인상태</th>
					    	<td class="line" width="35%">
					    		<input type="radio" name="mgrStatus" value="Y" ${mgr.mgrStatus == 'Y' ? 'checked':''}>승인
					    		<input type="radio" name="mgrStatus" value="N" ${mgr.mgrStatus == 'N' ? 'checked':''}>정지
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 이메일</th>
					    	<td class="line" colspan="3">
					    		<input type="text" name="email" value="${mgr.email }"  data-validation="email" data-validation-error-msg-email="이메일을 확인해주세요.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;휴대전화</th>
					    	<td class="line" width="35%">
					    		<input type="number" id="mobile1" maxlength="3" style="width: 10%;" value="${mgr.mobile1 }"/>-
					    		<input type="number" id="mobile2" maxlength="4" style="width: 10%;" value="${mgr.mobile2 }" />-
					    		<input type="number" id="mobile3" maxlength="4" style="width: 10%;" value="${mgr.mobile3 }" />
					    		<input type="hidden" name="mobile">
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;전화번호</th>
					    	<td class="line" width="35%">
					    		<input type="number" id="telNum1" maxlength="3" style="width: 10%;" value="${mgr.telNum1 }" />-
					    		<input type="number" id="telNum2" maxlength="4" style="width: 10%;" value="${mgr.telNum2 }" />-
					    		<input type="number" id="telNum3" maxlength="4" style="width: 10%;" value="${mgr.telNum3 }" />
					    		<input type="hidden" name="telNum">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;등록일시/등록자</th>
					    	<td class="line" width="35%">
					    		<c:if test="${not empty mgr.regDt}">
 							    	${mgr.regDt }&nbsp;(${mgr.regNm })
					    		</c:if>
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;수정일시/수정자</th>
					    	<td class="line" width="35%">
						    	<c:if test="${not empty mgr.modiDt}">
					    			${mgr.modiDt }&nbsp;(${mgr.modiNm })
					    		</c:if>
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
						    		<textarea rows="4" cols="50" style="width: 95%" name="memo" >${mgr.memo }</textarea>
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
										<button id="noBtn" style="height:30px; width:100px;" type="button">사용안함</button>
										&nbsp;&nbsp;&nbsp;
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