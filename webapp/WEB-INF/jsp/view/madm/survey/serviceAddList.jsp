<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사 관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("#insertBtn").click(function(){
		var checkSvcNm = j$("#svcNm").val();
		if(checkSvcNm == ""){
			alert("서비스명을 입력하세요.");
			j$("#svcNm").focus();
			return false;
		}
		
		var checkSvcDesc = j$("#svcDesc").val();
		if(checkSvcDesc == ""){
			alert("서비스 설명을 입력하세요.");
			j$("#svcDesc").focus();
			return false;
		}
		
		j$.alert('등록하겠습니까?',function(){
				j$("#searchSvcNm").val('');
				j$("#searchAddService").attr("action","/madm/survey/insertService");
				j$("#searchAddService").submit();
			 },function(){
			 	return false;
			 }
	 	);
	});
	
	j$("#searchBtn").click(function(){
		j$("#searchAddService").submit();
		return false;
	});

	j$("#surveyListBtn").click(function(){
		location.href = "/madm/survey/surveyList";
		return false;
	});

});
</script>

</head>


<body>

<form id="searchAddService" name="searchAddService" modelAttribute="surveyDto" action="/madm/survey/serviceAddList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">서비스 관리</td>
				<td align="right">
					<input type="button" id="surveyListBtn" value="목록보기">
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
								<table cellpadding="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
									<tr align="left" height="30px">
										<th width="10%" bgcolor="#F5F5F5" align="center">서비스명</th>
								    	<td width="40%" align="left"  style="padding-left: 5px;">
								    		<input type="text" id="svcNm" name="svcNm" style="width:350px;"/>
								    	</td>
									</tr>
									<tr>
										<th width="10%" bgcolor="#F5F5F5" align="center">서비스설명</th>
								    	<td width="40%" align="left"  style="padding-left: 5px; height: 110px;">
											<textarea rows="5" id="svcDesc" name="svcDesc" style="width:90%"></textarea>
										</td>
									</tr>
								</table>
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
										    		<td><input type="button" id="insertBtn" value="저장">
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
					<table id="rtbl" cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<tr>
										<td align="left">
											<strong>총 ${paging.totalCount} 건 |</strong>
											<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
										</td>
										<td align="right">
											<strong>서비스명 </strong>
											<input type="text" name="searchSvcNm" id="searchSvcNm" size="50" value="${param.searchSvcNm }"/>
										</td>
										<td align="right" width="5%"><input type="button" id="searchBtn" value="검색"> </td>
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
										<th >서비스명</th>
										<th >서비스설명</th>
										<th >작성자</th>
										<th >등록일시</th>
									</tr>
									</tr>
									<c:choose>
										<c:when test="${paging.totalCount >= 1}">
											<c:forEach var="list" items="${paging.list}" varStatus="status">
											<tr align="center" height="30px">
												<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
												<td >${list.svcNm }</td>
												<td ><a href="#" class="detail" value="${list.svcSeq }" >${list.svcDesc}</a></td>
												<td >${list.regNm }</td>
												<td >${list.regDt }</td>
											</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</table>
								<br>
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
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>

