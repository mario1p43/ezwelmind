<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담비 업로드</title>
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
		
		$("#btnExcelUpload").click(function() {
			$("#excelForm").submit();
			return false;
		});
		
		$("#sampleFile").click(function() {
			$(location).attr('href', "/partner/payCheckMgr/sampleExcel")
		})
	});
</script>
</head>
<body>
	
	<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >
		<tr>
			<td height="20px"></td>
		</tr>
		<tr>
			<td align="left" class="subtitle">상담비 정산 > 상담비 업로드</td>
		</tr>
		<tr>
			<td height="30px"></td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<div class="excelArea">
					<div id="sampleFile">sample파일 [Download]</div>
					<div>
						<form id="excelForm" action="/partner/payCheckMgr/addPayCheck" method="post" enctype="multipart/form-data" >
							<table cellpadding="0" cellspacing="0" border="0" width="80%" align="left" style="border-collapse:collapse;">
								<tr>
									<td>
										<input type="file" name="excelUpload" size="50">
										<input type="button" id="btnExcelUpload" value="업로드"><br><br>
										※ 엑셀업로드 주의사항<br>
										 - 상담코드는 필수값으로 반드시 입력하셔야 합니다.<br>
										 - 같은 상담코드이면 기존 데이터를 덮어쓰기 합니다.<br>
										 - 이 데이터는 독립적인 데이터로 다른 데이터와 연동되지 않습니다.<br>
										 - 엑셀 파일의 <span style="text-decoration: underline; font-weight: bold;">셀 서식은 텍스트 서식으로</span> 해주셔야 정확하게 업로드 됩니다.<br>
									</td>
								</tr>
							</table>
						</form>
					</div>
				<div>
			</td>
		</tr>
	</table>
</body>
</html>