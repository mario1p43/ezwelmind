<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>메뉴코드 등록관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$("input").keypress(function(e) {
	    if (e.which == 13){
	    	j$("#searchCh").submit();
			return false;
	    };
	});

	j$("#searchBtn").click(function(){
		j$("#searchCh").submit();
		return false;
	});

	j$(".channelDetail").click(function(){
		var channelCd = j$(this).attr("value");
		location.href = "/madm/banner/modifyChannelDetail?channelCd="+channelCd;
		return false;
	});



});
</script>
</head>
<body>

<form id="searchCh" action="/madm/menuCode/menuCodeList" method="post">
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">메뉴코드 등록관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">

						    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>메뉴구분</strong></td>
						    	<td width="40%" align="left">
									<select name="menuGroup">
										<%--<option value="">전체</option> --%>
						    			<option value="usr"  <c:if test="${param.menuGroup eq 'usr'}">selected</c:if> >사용자</option>
						    			<option value="madm" <c:if test="${param.menuGroup eq 'madm'}">selected</c:if> >관리자</option>
						    			<option value="partner" <c:if test="${param.menuGroup eq 'partner'}">selected</c:if> >제휴사</option>
						    			<option value="cadm" <c:if test="${param.menuGroup eq 'cadm'}">selected</c:if> >고객사관리자</option>
						    		</select>
						    	</td>
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>메뉴코드</strong></td>
						    	<td width="40%" align="left">
						    		<input name="menuCd" value="${param.menuCd}" type="text" style="width:200px;"/>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>메뉴명</strong></td>
						    	<td width="40%" align="left">
						    		<input name="menuNm" value="${param.menuNm}" type="text" style="width:200px;"/>
						    	</td>

						    	<td width="10%" bgcolor="#F5F5F5" align="center"><strong>메뉴URL</strong></td>
						    	<td width="40%" align="left">
						    		<input name="menuUrl" value="${param.menuUrl}" type="text" style="width:200px;"/>
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
								    		<td id="btn01"><a href="/madm/menuCode/menuCodeDetail"><span>신규등록</span></a></td>
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
											<td bgcolor="#F5F5F5"><strong>메뉴코드</strong></td>
											<td bgcolor="#F5F5F5"><strong>메뉴유형</strong></td>
											<td bgcolor="#F5F5F5"><strong>메뉴명</strong></td>
											<td bgcolor="#F5F5F5"><strong>메뉴URL</strong></td>
											<td bgcolor="#F5F5F5"><strong>등록자</strong></td>
											<td bgcolor="#F5F5F5"><strong>등록일시</strong></td>
											<td bgcolor="#F5F5F5"><strong>수정자</strong></td>
											<td bgcolor="#F5F5F5"><strong>수정일시</strong></td>
										</tr>

										<c:forEach var="list" items="${paging.list}" varStatus="status">
											<tr height="35px">
												<td><a href="/madm/menuCode/menuCodeDetail?menuCd=${list.menuCd}"><b>${list.menuCd}</b></a></td>
												<td>${list.menuGroup}</td>
												<td>[${list.menuDiv}]${list.menuNm}</td>
												<td>${list.menuUrl}</td>
												<td>${list.regId}</td>
												<td>${list.regDt}</td>
												<td>${list.modiId}</td>
												<td>${list.modiDt}</td>
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
</form>

</body>
</html>

