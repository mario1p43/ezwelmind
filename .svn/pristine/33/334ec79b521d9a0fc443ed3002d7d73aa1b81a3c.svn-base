<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>    
<html>
<head>
<title>상담사 등급관리</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	j$('#centerNm').change(function() {
		if(document.searchMgr.centerNm.options[document.searchMgr.centerNm.selectedIndex].value != ""){
			j$("#centerSeq").val(document.searchMgr.centerNm.options[document.searchMgr.centerNm.selectedIndex].value);
			j$("#searchMgr").submit();
		}else{
		}
		
	});
	
	j$('#centerSeq').keydown(function() {
		if(event.keyCode == 13){
		document.searchMgr.centerNm.value = $("#centerSeq").val();
		j$("#searchMgr").submit();
		}
	});
	
	j$('#userNm').keydown(function() {
		if(event.keyCode == 13){
			if(document.searchMgr.centerNm.options[document.searchMgr.centerNm.selectedIndex].value != ""){
				j$("#searchMgr").submit();
			}		}
	});
	
	<c:if test='${not empty param.centerNm}'>
	var chkValue = '${param.centerNm}';
	document.searchMgr.centerNm.value = chkValue;
	</c:if>
	
	// 병 등급 적용
	$("[name='gradeBtn']").click(function() {
		var params = {};
		var $this = $(this); 
		var mgrEvalGrade = $this.prev().val();
		var userId  = j$(this).attr("disp");
		params.mgrEvalGrade = mgrEvalGrade;
		params.userId = userId;
 		if (mgrEvalGrade != "" && mgrEvalGrade != null) {

 		j$.ajax({
			url: '/madm/mgr/ajaxStar',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				//window.location.reload();
				
			}
		});
		
		}else{
			alert("별 등급을 선택해주세요.");
		}
	});
	
	
	
	
});
</script>
</head>
<body>

<form:form id="searchMgr" name="searchMgr" modelAttribute="counselorMgrDto" action="/madm/mgr/starMgr" method="GET">

<table cellpadding="5" cellspacing="0" border="0" width="1300px" style="border-bottom: 1px solid silver;">
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="left" class="subtitle">상담사관리 > 병 등급관리</td>
	</tr>
</table>
<br/>

<table cellpadding="0" cellspacing="0" border="0" width="80%">

<tr>
	<td height="20px">
			<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="7%">&nbsp;&nbsp;센터명</th>
				<td class="line">
					<select id="centerNm" name="centerNm" >
						<option value="">상담센터를 선택하세요</option>
						<c:forEach var="list" items="${centerList}" varStatus="listCnt">
								<option value="${list.centerSeq }" >${list.centerNm }</option>
						</c:forEach>
					</select>
				</td>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="8%">&nbsp;&nbsp;센터코드</th>
				<td class="line"><input type="text" name="centerSeq" id="centerSeq" value="${param.centerSeq }" style="width:150px;"/> </td>
			</tr>
			<tr>
				<th class="line" height="30" align="left" bgcolor="#F5F5F5" width="7%">&nbsp;&nbsp;상담사명</th>
				<td colspan="3"><input type="text" id="userNm" name="userNm" value="${param.userNm }"> </td>
			</tr>
		</table>
	</td>
</tr>
	<c:choose>
	<c:when test="${show eq 1 }">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}명
								</strong>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
							<tr>
								<th width="5%" >순번</th>
								<th width="10%" >센터명</th>
								<th width="10%">상담사명</th>
								<th width="5%" >나이</th>
								<th width="5%">성별</th>
								<th width="7%">근무형태</th>
								<th width="10%">상담유형</th>
								<th width="5%">상태값</th>
								<th width="10%">별 등급</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td><strong>${list.centerNm}</strong></td>
								<td>${list.userNm}</td>
								<td>${list.rrn}</td>
								<td>${list.gender}</td>
								<td>${list.workType}</td>
								<td><comm:commNmOut code="${list.channelType}"  option="category"/></td>
								<td>${list.mgrStatus}</td>
								<td>
									<select name="mgrEvalGrade">
										<option value="">등급선택</option> 
										<option value="1"	${list.mgrEvalGrade == "1" ? 'selected':''}>★</option>
										<option value="2"	${list.mgrEvalGrade == "2" ? 'selected':''}>★★</option>
										<option value="3"	${list.mgrEvalGrade == "3" ? 'selected':''}>★★★</option>
										<option value="4"	${list.mgrEvalGrade == "4" ? 'selected':''}>★★★★</option>
										<option value="5"	${list.mgrEvalGrade == "5" ? 'selected':''}>★★★★★</option>
									</select> 
									<input type="button" value="적용" name="gradeBtn" disp="${list.userId}">
								</td>
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
	
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
	</c:choose>

	
</tr>
</table>
</form:form>
</body>
</html>