<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>개인정보관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("#modifyMgr").validate({
		onkeyup:false,
		onclick:false,
		onfocusout:false,
		showErrors:function(errorMap, errorList){
			if (this.numberOfInvalids()) {
				alert(errorList[0].message);
			}
		},
		rules : {
			userType  	  : {required:true}
		},
		messages: {
			userType   		: "관리자 유형을 선택하세요"
		},
		submitHandler: function(form) {
			// 핸드폰
			$("[name='mobile']").val("");
			if ($("[name='mobile1']").val() != "" || $("[name='mobile2']").val() != "" || $("[name='mobile3']").val() != "") {
				if ($("[name='mobile1']").val() == "" || $("[name='mobile2']").val() == "" || $("[name='mobile3']").val() == "") {
					alert("모바일 정보를 입력해주세요.");
					$("[name='mobile1']").focus();
					return false;
				} else {
					$("[name='mobile']").val($("[name='mobile1']").val() +"-"+ $("[name='mobile2']").val() +"-" + $("[name='mobile3']").val());

					var regex =  /^(([0-9]{2,3}))-?([0-9]{3,4})-?([0-9]{4})$/;
					if ( !regex.test($("[name='mobile']").val()) ) {
						alert("모바일 정보를 확인해주세요.");
						$("[name='mobile1']").focus();
						return false;
					}
				}
			}

			// 이메일
			if ($("[name='email']").val() == "") {
				alert("이메일을 입력해주세요");
				$("[name='email']").focus();
				return false;
			} else {
				var regex = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
				if (!regex.test($("[name='email']").val())){
					alert("이메일을 잘못입력하였습니다.");
					$("[name='email']").focus();
					return false;
				}
			}
			form.submit();
		}
	});

	$(".onlyNumber").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});

	j$('#updateBtn').click(function() {
		j$("#modifyMgr").attr("action","/madm/mypage/modify");
		
		j$.alert('수정하시겠습니까?',function(){
			var tempPwd = j$("#userPwd").val().trim();
			if(tempPwd != "1230987" && tempPwd != ""){
				j$("#imsiPwdYn").val("N");
			}
			j$("#modifyMgr").submit();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/";
		return false;
	});

});

</script>
</head>
<body>

<div class="web">
	<form:form id="modifyMgr" modelAttribute="mgrDto" action="/madm/mypage/modify" method="PUT">
	<input type="hidden" name="branchCd" value="${vo.branchCd}" />
	<input type="hidden" name="deptCd" value="${vo.deptCd}" />
	<input type="hidden" name="teamCd" value="${vo.teamCd}" />
	<input type="hidden" name="useYn" value="${vo.useYn}" />
	<input type="hidden" name="imsiPwdYn" id="imsiPwdYn"/>
	<!-- 버튼 영역 시작 -->
	<table cellpadding="5" cellspacing="0" border="0" width="700px"" style="border-bottom: 1px solid silver;">
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td align="left" class="subtitle">개인정보관리</td>
		</tr>
	</table>
	<br/>
	<!-- 버튼 영역 종료 -->
	
	<table cellpadding="0" cellspacing="0" border="0" width="700px" height="100%">
	<tr>
		<td valign="top" align="left">
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
				<tr>
					<td class="line" width="20%" height="30" align="center" bgcolor="#F5F5F5">관리자유형</td>
					<td align="left" width="80%" >
						<select name="userType">
							<!-- <option value="">--</option> -->
							<option value="2001" selected>마인드관리자</option>
							<!-- <option value="3001">제휴사관리자</option> -->
						</select>
					</td>
				</tr>
				<tr>
					<td class="line" height="30" align="center" bgcolor="#F5F5F5">I D</td>
					<td>
						<input type="hidden" name="userId" value="${vo.userId }"  maxlength="20" />${vo.userId }
					</td>
				</tr>
				<tr>
					<td class="line" height="30" align="center" bgcolor="#F5F5F5">성명</td>
					<td>
						<input type="hidden" name="userNm" value="${vo.userNm }"  maxlength="20" />${vo.userNm }
					</td>
				</tr>
				<tr>
					<td class="line" height="30" align="center" bgcolor="#F5F5F5">비밀번호</td>
					<td >
						<input type="password" name="userPwd" id="userPwd" style="width:200px;" value="" minlength="4" maxlength="20" /> <span style="color:RED"> * 4~20자 입력 (입력하지 않으면 기존 비번으로 유지됩니다.)</span>
					</td>
				</tr>
				<tr>
					<td class="line" height="30" align="center" bgcolor="#F5F5F5">부서</td>
					<td>${vo.branchNm } ${vo.deptNm } ${vo.teamNm }</td>
				</tr>
				<tr>
					<td class="line" height="30" align="center" bgcolor="#F5F5F5">모바일</td>
					<td>
						<input type="hidden" name="mobile" style="width:200px;" value="${vo.mobile }" />
						<input type="text" name="mobile1" id="b_tel01" class="onlyNumber" value="${vo.mobile1 }" title="연락처 첫번째 자리 입력" style="width:50px;" maxlength="4" style='ime-mode:disabled;'> -
						<input type="text" name="mobile2" id="b_tel02" class="onlyNumber" value="${vo.mobile2 }" title="연락처 가운데 자리 입력" style="width:50px;" maxlength="4" style='ime-mode:disabled;'> -
						<input type="text" name="mobile3" id="b_tel03" class="onlyNumber" value="${vo.mobile3 }" title="연락처 뒷자리 입력" style="width:50px;" maxlength="4" style='ime-mode:disabled;'>
					</td>
				</tr>
				<tr>
					<td class="line" height="30" align="center" bgcolor="#F5F5F5"><font color="RED">*</font> 이메일</td>
					<td>
						<input type="text" name="email" style="width:200px;" value="${vo.email }" />
					</td>
				</tr>
				<tr>
					<td class="line" height="30" align="center" bgcolor="#F5F5F5">사용여부</td>
					<td> ${vo.useYn == 'Y'  ? '사용':'비사용'} </td>
				</tr>
			</table>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
				<tr align="center" height="50px">
					<td class="" colspan="2" align="center">
						<input type="button" id="updateBtn" value="수정" style="height:30px; width:100px;">
						<span style="margin-left: 20px;"></span>
						<input type="button" id="cancleBtn" value="취소" style="height:30px; width:100px;">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</table>
	</form:form>
</div>

</body>
</html>

