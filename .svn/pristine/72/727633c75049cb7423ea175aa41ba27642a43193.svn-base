<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>주문 & 상담내역 등록 수기처리</title>
<style type="text/css">
.comm_code_example {border-top:solid 2px #838383;width:100%;border-spacing:0;margin-top:30px;}
.comm_code_example th {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#f9f9f9;font-weight: bold;}
.comm_code_example th:first-child{border-left:none;}
.comm_code_example td {border-left:solid 1px #dfdfdf; border-bottom: solid 1px #dfdfdf;text-align:center;background-color:#fff;}
.comm_code_example td:first-child{border-left:none;}

#sampleFile {cursor:pointer;color: rgb(0,0,255);width:300px;text-align:left;padding-top:20px;padding-bottom: 20px;font-size: 23px;font-weight: bold;font-style: italic;}
.fileForm {text-align:left;}
#btnExcelUpload {font-size: 17px;}

ul {padding-left:0px; list-style:none; }
li {padding-left:5px; padding-right:5px; padding-bottom: 5px; padding-top: 5px; }
</style>
<script type="text/javascript">
var delay = 1000;
var submitted = false;

$(document).ready(function() {
	loadAlert();	
	initEvent();
});

function initEvent() {
	$("#sampleFile").click(function() {
		$(location).attr('href', "/madm/employeeManagement/sampleExcel")
	})
	$("#btnExcelUpload").click(function() {
		if(submitted == true) { return; }
		j$("#btnExcelUpload").val("전송중...");
		j$("#btnExcelUpload").attr("disabled","true");
		setTimeout('$("#excelForm").submit()', delay);
		return false;
	});
}

function loadAlert() {
	var msgExcelResult = "${excelResult}";
	if (msgExcelResult != "") {
		alert(msgExcelResult);
	}	
}
</script>
</head>
<body>
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >
	<tr>
		<td height="20px"></td>
	</tr>	
	<tr>
		<td align="left" class="subtitle">주문 & 상담내역 등록 수기처리</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<div id="sampleFile">sample파일 [Download]</div>
			<div class="fileForm">
				<form id="excelForm" action="/madm/employeeManagement/orderHandwork" method="post" enctype="multipart/form-data" >
					<input type="file" name="excelUpload" size="50">
					<input type="button" id="btnExcelUpload" value="업로드">
				</form>
			</div>
			<div>
				<table class="comm_code_example">
					<thead>
						<tr>
							<th>상담대상</th>
							<th>학력</th>
							<th>학년</th>
							<th>직업</th>
							<th>상담분야<br>(CATEGORY_CD)</th>
							<th>상담유형<br>(CATEGORY_CD)</th>
							<th>상담방법</th>
							<th>결제수단</th>
							<th>일지상태</th>
							<th>상담상태</th>
							<th>연장상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<ul>
								<c:forEach var="list" items="${counselingTarget}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${education}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${schoolyear}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${job}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${counseling}">
									<li>${list.categoryNm}<br>[${list.categoryCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${consultationType}">
									<li>${list.categoryNm}<br>[${list.categoryCd}]</li>
								</c:forEach>
								</ul>
							</td>						
							<td>
								<ul>
								<c:forEach var="list" items="${consultationMethods}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${methodOfPayment}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${journalState}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${consultationState}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
							<td>
								<ul>
								<c:forEach var="list" items="${extendedState}">
									<li>${list.commNm}<br>[${list.commCd}]</li>
								</c:forEach>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</td>
	</tr>
</table>
</body>
</html>