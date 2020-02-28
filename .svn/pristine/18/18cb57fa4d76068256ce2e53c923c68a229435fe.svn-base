<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>임직원 등록</title>
<style type="text/css">
.upload_table {border-top:solid 2px #838383;width:100%;border-spacing:0;}
.upload_table th {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#f9f9f9;font-weight: bold;}
.upload_table th:first-child{border-left:none;}
.upload_table td {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#fff;}
.upload_table td:first-child{border-left:none;}
#sampleFile {cursor:pointer;color: rgb(0,0,255);width:300px;text-align:left;padding-top:20px;padding-bottom: 20px;font-size: 23px;font-weight: bold;font-style: italic;}
</style>
<script type="text/javascript">
	<c:if test="${not empty excelResult}">
		alert("${excelResult}");
	</c:if>

	var jsonData = "";
	$(document).ready(function(){
		//clientTypeSetting("${clientCd}");
		
		$.validate({
			form : '#empForm',
			validateOnBlur : true,
			validateOnAlert : true,
		    onSuccess : function() {
				$.ajax({
					type: "POST",
					url: "/madm/user/addEmployeeUser",
					data: jsonData,
					dataType: "json",
					contentType : 'application/json',
					success: function(data, textStatus){
						if (data.result == "0000") {
							alert(data.resultCnt + "명이 등록되었습니다.");
						} else {
							alert("이미 등록된 임직원입니다.");
						}
						location.reload();
					}
				});	
				
				// 서브밋은 벨류데이션을 사용하기 위해 날리고, 실 데이터는 ajax로 joson으로
				// 전송하기 때문에 리턴false 로 submit 은 방지한다.
		    	return false;
			}
		});
		
		$("#insertBtn").click(function(){
			var nullFlag = false;
			var answerList = new Array();
			$(".checkClass").each(function(index) {
				if ($(this).is(":checked")) {
					// index 0부터 시작이고 dom구조는 1부터여서 +1
					var num = (index + 1);
					
					var memberData = new Object();
					memberData.empNum   = $("#empNum" + num).val();
					memberData.userId   = $("#userId" + num).val();
					memberData.userNm   = $("#userNm" + num).val();
					memberData.userPwd  = $("#userPwd" + num).val();
					memberData.branch   = $("#branch" + num).val();
					memberData.grade    = $("#grade" + num).val();
					memberData.clientCd = $("#clientCd" + num).val();
					
					if(requiredValueCheck(memberData)) {
						nullFlag = true;
						return false;
					}										
					answerList.push(memberData);
				}
			});
			
			jsonData = JSON.stringify(answerList);
			
			if (answerList.length == 0 || nullFlag) {
				if (!nullFlag) alert("체크박스를 선택해주세요.");
				return false;
			}
			$("#empForm").submit();
		});
		
		
		$("#btnExcelUpload").click(function() {
			$("#excelForm").submit();
			return false;
		});
		
		
		$(".webUploadType").click(function() {
			$(".webArea").show();
			$(".excelArea").hide();
		});
		
		$(".excelUploadType").click(function() {
			$(".excelArea").show();
			$(".webArea").hide();
		});
		
		$("#sampleFile").click(function() {
			$(location).attr('href', "/madm/userUploadExcel/sampleExcel")
		})
	});

	
function requiredValueCheck(memberData) {	
	if(memberData.userId == "") {
		alert("사번는 필수값입니다.");
		return true;
	}
	if(memberData.userId == "") {
		alert("ID는 필수값입니다.");
		return true;
	}
	if(memberData.userNm == "") {
		alert("성명은 필수값입니다.");
		return true;
	}	
	return false;
}
</script>
</head>
<body>
	
	<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="left" class="subtitle">임직원등록</td>
		</tr>
		<tr>
			<td height="30px"></td>
		</tr>
		<tr>
			<td id="btn01"><a href="#" class="webUploadTypeA"><span class="webUploadType">Web업로드</span></a><a href="#"><span class="excelUploadType">Excel업로드</span></a></td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<div class="webArea">
					<form id="empForm" action="/madm/user/addEmployeeUser" method="POST">
					<table class="upload_table">
						<thead>
							<tr>
								<th>선택</th>
								<th>사번(*)</th>
								<th>ID(*)</th>
								<th>성명(*)</th>
								<th>비밀번호</th>
								<th>이메일</th>
								<th>소속</th>
								<th>직급</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="i" begin="1" end="5">
							<tr>
								<td><input type="checkbox" class="checkClass" id="check${i}"></td>
								<td width="10%">
									<input type="text" id="empNum${i}" size="15"
							    						   data-validation="alphanumeric"
							    						   data-validation-optional="true"
							    						   data-validation-allowing="-_"
							    						   data-validation-error-msg="영문,숫자,특수문자(-_) 만가능합니다.">
							    </td>
								<td width="10%">
									<input type="text" id="userId${i}" size="15" 
							    						   data-validation="alphanumeric"
							    						   data-validation-optional="true"
							    						   data-validation-allowing="-_"
							    						   data-validation-error-msg="영문,숫자,특수문자(-_) 만가능합니다.">
							    </td>
								<td width="10%">
						    		<input type="text" id="userNm${i}" size="20" maxlength="20"
						    						data-validation="custom"
						    						data-validation-optional="true"
													data-validation-regexp="^[가-힣a-zA-Z\s]+$"
			    									data-validation-error-msg-custom="이름은 한글 또는 영문만 입력해주세요">
						    	</td>
						    	<td width="10%">
						    		<input type="text" id="userPwd${i}" size="20" maxlength="20" value="1234">
						    	</td>								
								<td width="15%">
						    		<input type="text" id="email${i}" size="22" maxlength="30"
						    						data-validation="email"
						    						data-validation-optional="true"
			    									data-validation-error-msg="이메일을 확인해주세요.">
						    	</td>
								<td width="4%">
						    		<input type="text" id="branch${i}"
						    						data-validation="custom"
						    						data-validation-optional="true"
													data-validation-regexp="^[가-힣a-zA-Z]+$"
			    									data-validation-error-msg-custom="소속은 한글 또는 영문만 입력해주세요">
						    	</td>
						    	<td width="4%">
						    		<input type="text" id="grade${i}"
						    						data-validation="custom"
						    						data-validation-optional="true"
													data-validation-regexp="^[가-힣a-zA-Z]+$"
			    									data-validation-error-msg-custom="직급은 한글 또는 영문만 입력해주세요">
						    	</td>
						    	<input type="hidden" id="clientCd${i}" value="${clientCd}">
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</form>
				</div>
				
				<div class="excelArea" style="display:none;">
					<div id="sampleFile">sample파일 [Download]</div>
					<div>
						<form id="excelForm" action="/madm/userUploadExcel/addUser" method="post" enctype="multipart/form-data" >
							<input type="hidden" name="clientCd" value="${clientCd}">
							<table cellpadding="0" cellspacing="0" border="0" width="80%" align="left" style="border-collapse:collapse;">
								
								<tr>
									<td>
										<input type="file" name="excelUpload" size="50">
										<input type="button" id="btnExcelUpload" value="업로드"><br><br>
										※ 엑셀업로드 주의사항<br>
										 - 사번, ID, 성명, 비밀번호는 필수입력입니다. (사번 또는 ID 한개만 있으면 반드시 똑같이 입력해주시기 바랍니다)<br>
										 - 사번, ID는 영문, 숫자 특수문자(-_)만 가능합니다.<br>
										 - 이름은 한글, 영문만 가능합니다.<br>
										 - 휴대폰은 반드시 010-1234-1234 양식을 지켜주세요.(없을경우 입력하지 않으면 됩니다.)<br>
										 - 이메일은 반드시 email@email.com 양식을 지켜주세요.(없을경우 입력하지 않으면 됩니다.)<br>
										 - 엑셀 파일의 <span style="text-decoration: underline; font-weight: bold;">셀 서식은 텍스트 서식으로</span> 해주셔야 정확하게 업로드 됩니다.<br>
									</td>
								</tr>
							</table>
						</form>
					</div>
				<div>
			</td>
		</tr>
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td>
				<!-- 버튼 영역 시작 -->
				<table cellpadding="5" cellspacing="0" border="0" width="70%" align="left" style="border-collapse:collapse;">
					<tr>
						<td class="" colspan="4" height="60px" align="center">
							<div class="webArea">
				    			<input type="button" id="insertBtn" value="저장" style="height:30px;width:100px;"/>
				    		</div>
				    	</td>
					</tr>
				</table>
				<!-- 버튼 영역 종료 -->
			</td>
		</tr>
	</table>
</body>
</html>