<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>온라인 진단자 등록</title>
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
		
		$.validate({
			form : '#empForm',
			validateOnBlur : true,
			validateOnAlert : true,
		    onSuccess : function() {
				$.ajax({
					type: "POST",
					url: "/madm/clientPoll/addOnlineUser",
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
					memberData.userId   = $("#userId" + num).val();
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
			$(location).attr('href', "/madm/clientPoll/sampleExcel")
		})
	});

	
function requiredValueCheck(memberData) {	
	if(memberData.userId == "") {
		alert("ID는 필수값입니다.");
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
			<td align="left" class="subtitle">온라인 진단자 등록</td>
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
					<form id="empForm" action="/madm/clientPoll/addOnlineUser" method="POST">
					<table class="upload_table">
						<thead>
							<tr>
								<th>선택</th>
								<th>ID(*)</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="i" begin="1" end="5">
							<tr>
								<td><input type="checkbox" class="checkClass" id="check${i}"></td>
								<td>
									<input type="text" id="userId${i}" size="15" 
							    						   data-validation="alphanumeric"
							    						   data-validation-optional="true"
							    						   data-validation-allowing="-_"
							    						   data-validation-error-msg="영문,숫자,특수문자(-_) 만가능합니다.">
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
						<form id="excelForm" action="/madm/clientPoll/uploadExcel/addUser" method="post" enctype="multipart/form-data" >
							<input type="hidden" name="clientCd" value="${clientCd}">
							<table cellpadding="0" cellspacing="0" border="0" width="80%" align="left" style="border-collapse:collapse;">
								<tr>
									<td>
										<input type="file" name="excelUpload" size="50">
										<input type="button" id="btnExcelUpload" value="업로드"><br><br>
										※ 엑셀업로드 주의사항<br>
										 - ID는 필수입력입니다.<br>
										 - ID는 영문, 숫자 특수문자(-_)만 가능합니다.<br>
										 - 엑셀파일로 등록시 기존 온라인 진단자 명단은 삭제되고, 새로 등록됩니다.<br>
										 - web으로 등록시 기존 온라인 진단자 명단에 추가 등록됩니다.<br>
										 - 온라인 진단자 명단이 없는 경우에는 해당 고객사 임직원 전체가 대상입니다.<br>
										 - 온라인 진단자 명단이 있는 경우에는 해당 고객사의 등록된 온라인 진단자만 대상입니다.<br>
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