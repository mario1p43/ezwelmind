<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>코너등록관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	j$("#searchCorner").submit();
			return false;
	    };
	});

	j$("#searchBtn").click(function(){
		j$("#searchCorner").submit();
		return false;
	});

	j$(".cornerDetail").click(function(){
		var cornerCd = j$(this).attr("value");
		location.href = "/madm/banner/modifyCornerDetail?cornerCd="+cornerCd;
		return false;
	});

	j$("#insertCor").click(function(){
		j$.divPop("addCorner", "코너등록", "/madm/layerPopup/addCorner");
		return false;
	});

});
</script>
<style type="text/css">
	.fontBlue{color: #2E64FE; }
</style>
</head>
<body>

<form:form id="searchCorner" modelAttribute="invCornerDto" action="/madm/banner/cornerManage" method="GET">
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">코너등록관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>코너명</strong></td>
						    	<td width="40%" align="left">
						    		<input name="cornerNm" value="${invCornerDto.cornerNm }" type="text" style="width:200px;"/>
						    	</td>
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>코너코드</strong></td>
						    	<td width="40%" align="left">
						    		<input name="cornerCd" value="${invCornerDto.cornerCd }" type="text" style="width:200px;"/>
						    	</td>
							</tr>
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>

				<tr>
					<td height="10px"></td>
				</tr>

				<tr>
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
								    		<td id="btn01"><a href="#"><span id="insertCor">신규등록</span></a></td>
								    		<td><span style="margin-left: 20px;"></span></td>
								    		<td id="btn01"><a href="#"><span id="searchBtn">검 색</span></a></td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>

				<tr>
					<td>
						<!-- 채널 영역 시작 -->
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr>
											<td align="right">
												<strong>조회건 : ${paging.totalCount} </strong>
												<span style="margin-left: 20px;"></span>
												<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<!-- 채널 정보 시작 -->
									<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
										<tr align="center" height="50px">
											<th width="5%">순번</th>
											<th width="10%">채널코드</th>
											<th width="25%">코너명</th>
											<th width="30%">코너설명</th>
											<th width="10%">상품전시갯수</th>
											<th width="10%">등록/<span class="fontBlue">수정자</span></th>
											<th width="10%">등록/<span class="fontBlue">수정일시</span></th>
										</tr>

										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >${list.channelCd }</td>
											<td >
												<a href="#" class="cornerDetail" value="${list.cornerCd }&channelCd=${list.channelCd }">
													<strong> ${list.cornerNm } </strong>
												</a>
											</td>
											<td >${list.cornerDesc }</td>
											<td >${list.dispNum }</td>
											<c:choose>
												<c:when test="${not empty list.modiId}">
													<td><span class="fontBlue">${list.modiId}</span></td>
													<td><span class="fontBlue">${list.modiDt}</span></td>
												</c:when>
												<c:otherwise>
													<td>${list.regId}</td>
													<td>${list.regDt}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										</c:forEach>
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
									<!-- 채널 정보 종료 -->
								</td>
							</tr>
						</table>
						<!-- 채널 영역 종료 -->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form:form>

</body>
</html>

