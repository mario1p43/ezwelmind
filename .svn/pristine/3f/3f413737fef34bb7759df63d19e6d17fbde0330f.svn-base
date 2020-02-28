<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>수요도조사</title>
<script language="Javascript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
		if (e.which == 13){
			search();
			return false;
		};
	});

	j$("#searchBtn").click(function(){
		search();
	});

	j$("#insertBtn").click(function(){
		location.href = "/madm/survey/surveyNew";
		return false;
	});

	j$("#excelDownBtn").click(function(){
		location.href = "/madm/survey/surveyListExcel";
	});

	j$(".detail").click(function(){
		var surVal = j$(this).attr("value");
		var surArr = surVal.split('&');

		var surSeq = bEnco(surArr[0]);
		var clientCd = surArr[1];

		location.href = "/madm/survey/surveyDetail?surSeq="+surSeq+"&clientCd="+clientCd;
		return false;
	});

	j$("#serviceAddBtn").click(function(){
		location.href = "/madm/survey/serviceAddList";
		return false;
	});

	j$(".choiceUserList").click(function(){
		var popupUrl = "/madm/survey/popup/serviceChoiceListPopup?surSeq=" 
		popupUrl += j$(this).attr("surSeq");
		window.open(popupUrl, "serviceListPopup", "scrollbars=yes, width=700, height=600");
	});
});

function search(){
	j$("#searchSurvey").submit();
	return false;
}
</script>

</head>
<body>
<form id="searchSurvey" name="searchSurvey" action="/madm/survey/surveyList" method="POST">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">수요도 조사</td>
				<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
					<input type="button" id="excelDownBtn" value="엑셀다운로드">
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td>
								<!-- 검색 영역 시작 -->
								<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
									<tr align="left" height="30px">
										<th width="10%" bgcolor="#F5F5F5" align="center">고객사코드/명</th>
								    	<td width="40%" align="left"  style="padding-left: 5px;">
								    		<select id="clientCd" name="clientCd" style="height: 20px;">
								    			<option value="">---- 선택 ----</option>
								    			<c:forEach var="list" items="${clientList}">
								    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq param.clientCd}"> selected </c:if> >${list.clientNm }</option>
								    			</c:forEach>
								    		</select>
								      	</td>
								    	<th width="10%" bgcolor="#F5F5F5" align="center">카테고리</th>
								    	<td width="40%" align="left" style="padding-left: 5px;">
								    		<input type="radio" name="searchSurCate" value="" <c:if test="${empty param.searchSurCate}">checked="checked"</c:if>/> 선택없음
											<c:forEach var="cateList" items="${cateList}">
								    			<input type="radio" name="searchSurCate" value="${cateList.commCd}" <c:if test="${cateList.commCd eq param.searchSurCate}">checked="checked"</c:if>/> ${cateList.commNm}
											</c:forEach>
								    	</td>
									</tr>
									<tr align="left" height="30px">
										<th width="10%" bgcolor="#F5F5F5" align="center">서비스명</th>
								    	<td width="40%" align="left" style="padding-left: 5px;">
								    		<input type="text" id="svsNm" name="svsNm" value="${param.svsNm}" style="width:350px;"/>
								    	</td>
								    	<th width="10%" bgcolor="#F5F5F5" align="center">사용여부</th>
								    	<td width="40%" align="left" style="padding-left: 5px;">
								    	<select name="useYn">
								   		 		<option value="" >---- 선택 ----</option>
								   		 		<option value="Y" <c:if test="${param.useYn eq 'Y'}"> selected </c:if>>Y</option>
								   		 		<option value="N" <c:if test="${param.useYn eq 'N'}"> selected </c:if>>N</option>
								   		 	</select>
								    	</td>
									</tr>


								</table>
								<!-- 검색 영역 종료 -->
							</td>
						</tr>

						<tr>
							<td>
								<!-- 버튼 영역 시작 -->
								<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
									<tr>
										<td align="center" colspan="4">
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
										    		<td><input type="button" id="searchBtn" value="검 색">
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
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<tr>
							<td align="left">
								<strong>총 ${paging.totalCount} 건 |</strong>
								<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
							</td>
							<td align="right">
								<input type="button" id="serviceAddBtn" value="서비스 관리">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="center" height="50px">
							<th >순번</th>
							<th >고객사코드</th>
							<th >카테고리</th>
							<th >서비스명</th>
							<th >노출기간</th>
							<th >사용유무</th>
							<th >선택횟수</th>
						</tr>
						</tr>
						<c:choose>
							<c:when test="${paging.totalCount >= 1}">
								<c:forEach var="list" items="${paging.list}" varStatus="status">
								<tr align="center" height="30px">
									<td width="6%">${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
									<td width="15%">${list.clientCd }</td>
									<td width="10%"><comm:commNmOut option="commCd" code="${list.surCate } "/></td>
									<td width="35%"><a href="#" class="detail" value="${list.surSeq }&${list.clientCd}" ><strong>${list.svcNm}</strong></a></td>
									<td width="20%">${list.surStDt } ~ ${list.surEdDt }</td>
									<td width="6%">${list.useYn }</td>
									<td width="8%">
										<a href="javascript:void(0)" class="choiceUserList" surSeq="${list.surSeq }">
											${list.chooseCnt }
										</a>
									</td>
								</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
					<br>

					<c:choose>
						<c:when test="${paging.totalCount >= 1}">
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
						</c:when>
					</c:choose>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>

