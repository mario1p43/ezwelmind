<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta charset="UTF-8">
<title>교육이수현황</title>
<script type="text/javascript">
<c:if test="${not empty excelResult}">
alert("${excelResult}");
</c:if> 

j$(document).ready(function(){
	j$('.registration').click(function(){
		location.href = "/madm/edu/insertpage";
		return false;
	});
	
	j$('.registrationBulk').click(function(){
		$("#excelForm").submit();
		return false;
	});
	
	j$("#detailInfo").click(function(){
		var selectedTrHtml = $(this).parent("tr").html();
		var eduId = j$('#eduId', selectedTrHtml).val();
		location.href = "/madm/edu/detailviewpage?eduId="+eduId;
		return false;
	});
	
	j$("#excelDownBtn").click(function(){
		location.href = "/madm/edu/archivestatusExcel";
	});
	
	$("#btnExcelUpload").click(function() {
		$("#excelForm").submit();
		return false;
	});
	
	$("#sampleFile").click(function() {
		$(location).attr('href', "/madm/edu/sampleExcel")
	});
	
})
</script>
</head>
<body>
<style>
#detailInfo{
	cursor: pointer;
}
#sampleFile{
	cursor: pointer;
}
</style>

<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px"></td>
	</tr>
	
	<tr>
		<td>
			<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
				<tr>
			    	<td align="left" class="subtitle">교육이수현황</td>
				</tr>
				
			</table>
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
			<td valign="top" align="center">
				<div class="excelArea">
					<div id="sampleFile">sample파일 [Download]</div>
					<div>
						<form id="excelForm" action="/madm/edu/addPayCheck" method="post" enctype="multipart/form-data" >
							<table cellpadding="0" cellspacing="0" border="0" width="80%" align="left" style="border-collapse:collapse;">
								<tr>
									<td>
										<input type="file" name="excelUpload" size="50">
										<input type="button" id="btnExcelUpload" value="업로드"><br><br>
										※ 엑셀업로드 주의사항<br>
										 - 센터코드는 필수값으로 반드시 입력하셔야 합니다.<br>
										 - 같은 센터코드이면 기존 데이터를 덮어쓰기 합니다.<br>
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
	<tr>
		<td align="right">
			<input type="button" class="registration" style="height:30px; width:100px;" value="개별등록"/>
			<input type="button" id="excelDownBtn" style="height:30px; width:100px;" value="엑셀다운"/>
			<!-- <br>
			<form id="excelForm" action="/madm/edu/addeduinfobulk" method="post" enctype="multipart/form-data" >
				<input type="file" name="excelUpload" size="50">
				<input type="button" class="registrationBulk" style="height:30px; width:100px;" value="일괄등록"/>
			</form> -->
		</td>
	</tr>
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td>
			<table class="eduListGrid" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
				<thead>
				<tr align="center" height="50px">
					<th width="5%" >No</th>			
					<th width="15%" >센터명</th>			
					<th width="7%" >상담사명</th>			
					<th width="5%" >성별</th>			
					<th width="10%" >교육명</th>			
					<th width="5%" >이수시간</th>			
					<th width="10%" >교육일자</th>			
					<th width="15%" >교육장소</th>			
					<th width="5%" >교육구분</th>			
					<th width=5%" >교육형태</th>			
					<th width="23%" >비고</th>			
				</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${paging.list}" varStatus="status">
					<tr height="50px">
						<td>
						    <input type="hidden" id="eduId" name="eduId" value="${list.eduId}"/>
							${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
						</td>
						<td>${list.centerNm}</td>
						<td><div id="detailInfo"> ${list.userNm}</div> </td>
						<td>
						<c:if test="${list.gender eq 'M'}">
						남성
						</c:if>
						<c:if test="${list.gender eq 'F'}">
						여성
						</c:if>
						</td>
						<td>${list.eduNm}</td>
						<td>${list.eduHour}</td>
						<td>${list.eduDtFm}-${list.eduDtTo}</td>
						<td>${list.eduPlace}</td>
						<td>${list.eduDiv}</td>
						<td>${list.eduType}</td>
						<td>${list.eduEtc}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<br />
				<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
				<tr>
					<td align="center">
			 			<ui:paging value="${paging}" 
							btnFirst="${url:img('/images/btn_first.jpg')}"
							btnPrev="${url:img('/images/btn_prev.jpg')}"
							btnNext="${url:img('/images/btn_next.jpg')}"
							btnLast="${url:img('/images/btn_last.jpg')}" /> 
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>