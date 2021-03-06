<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>관리자 수정</title>
<script type="text/javascript">
j$(document).ready(function(){

	$("[name='branchCd']").change(function() {
		//초기화 시작
		$("select[name='deptCd'] option").remove();
		$("select[name='teamCd'] option").remove();

		$("[name='deptCd']").append("<option value=''>소속2</option>");
		$("[name='teamCd']").append("<option value=''>소속3</option>");
		//초기화 완료

		if ($(this).val() != "" && $(this).val() != null) {
			$.ajax({
				url: "/madm/mgr/getMgrDeptList?highCommCd=" + $(this).val(),
				dataType: 'json',
				success: function (response) {

					var iter = response.mgrDeptList;
					var element = "";
					for (var i = 0; i < iter.length; i++) {
						element += "<option value='" + iter[i].commCd + "'>" + iter[i].commNm + "</option>";
					}

					if (element != "") {
						$("[name='deptCd']").append(element);
					}
				}
			});
		}
	});

	$("[name='deptCd']").change(function() {
		//초기화 시작
		$("select[name='teamCd'] option").remove();
		$("[name='teamCd']").append("<option value=''>소속3</option>");
		//초기화 완료

		if ($(this).val() != "" && $(this).val() != null) {

			$.ajax({
				url: "/madm/mgr/getMgrTeamList?highCommCd=" + $(this).val(),
				dataType: 'json',
				success: function (response) {

					var iter = response.mgrTeamList;
					var element = "";
					for (var i = 0; i < iter.length; i++) {
						element += "<option value='" + iter[i].commCd + "'>" + iter[i].commNm + "</option>";
					}

					if (element != "") {
						$("[name='teamCd']").append(element);
					}
				}
			});
		}
	});

	$(".onlyNumber").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});

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
			userType  	  : {required:true},
			//branchCd  	  : {required:true}
		},
		messages: {
			userType   		: "관리자 유형을 선택하세요",
			//branchCd   		: "소속을 선택하세요"
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

	j$('#insertBtn').click(function(){
		j$.alert('등록하겠습니까?',function(){
				j$("#addMgr").submit();
			 },function(){
			 	return false;
			 }
	 	);
		return false;
	});

	j$('#updateBtn').click(function() {
		j$("#modifyMgr").attr("action","/madm/mgr/modify");
		j$.alert('수정하시겠습니까?',function(){
			j$("#modifyMgr").submit();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$('#deleteBtn').click(function() {
		j$("#addMgr").attr("action","/madm/mgr/delete");
		j$.alert('삭제하시겠습니까?',function(){
			location.href = "/madm/mgr/delete?userId=" + j$('#userId').val();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	/* j$("#cancleBtn").click(function(){
		location.href = "/madm/mgr/mgrList";
		return false;
	}); */

});

</script>
</head>
<body>
<form:form id="modifyMgr" modelAttribute="mgrDto" action="/madm/mgr/modify" method="PUT">
<!-- 버튼 영역 시작 -->
<table cellpadding="5" cellspacing="0" border="0" width="700px"" style="border-bottom: 1px solid silver;">
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="left" class="subtitle">관리자 수정</td>
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
					<%-- <c:choose>
						<c:when test="${serviceType eq 'madm' }">
							<input type="hidden" name="userType" value="2001">관리자
						</c:when>
						<c:when test="${serviceType eq 'cadm' }">
							<input type="hidden" name="userType" value="4001">고객사
						</c:when>
						<c:when test="${serviceType eq 'partner' }">
							<input type="hidden" name="userType" value="3001">제휴사
						</c:when>
					</c:choose> --%>
					<select name="userType">
						<option value="2001" <c:if test="${vo.userType eq '2001' }"> selected </c:if> >마인드관리자</option>
						<option value="3001" <c:if test="${vo.userType eq '3001' }"> selected </c:if> >제휴사관리자</option>
						<option value="4001" <c:if test="${vo.userType eq '4001' }"> selected </c:if> >고객사관리자</option>
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
					<input type="password" name="userPwd" style="width:200px;" value="" minlength="4" maxlength="20" /> <span style="color:RED"> * 4~20자 입력 (입력하지 않으면 기존 비번으로 유지됩니다.)</span>
				</td>
			</tr>
			<tr>
				<td class="line" height="30" align="center" bgcolor="#F5F5F5">부서</td>
				<td>
					<comm:select name="branchCd" code="100316"  basicValue="소속1" selectValue="${vo.branchCd}" />
					<select name="deptCd" style="height:20px" >
						<option value="">소속2</option>
						<c:if test="${vo.branchCd ne null}">
							<c:forEach var="list" items="${ deptList }">
								<option value="${list.commCd }" ${list.commCd == vo.deptCd ? 'selected':''}>${list.commNm}</option>
							</c:forEach>
						</c:if>
					</select>
					<select name="teamCd" style="height:20px" >
						<option value="">소속3</option>
						<c:if test="${vo.deptCd ne null}">
							<c:forEach var="list" items="${ teamList }">
								<option value="${list.commCd }" ${list.commCd == vo.teamCd ? 'selected':''}>${list.commNm}</option>
							</c:forEach>
						</c:if>
					</select>
				</td>
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
				<td>
					<input type="radio" name="useYn" value="Y" ${vo.useYn == 'Y'  ? 'checked':''} /> 사용
					<input type="radio" name="useYn" value="N" ${vo.useYn == 'N'  ? 'checked':''} /> 비사용
				</td>
			</tr>
		</table>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="updateBtn" value="수정" style="height:30px; width:100px;">
					<span style="margin-left: 20px;"></span>
					<input type="button" id="cancleBtn" onclick="history.back()" value="취소" style="height:30px; width:100px;">
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form:form>

</body>
</html>

