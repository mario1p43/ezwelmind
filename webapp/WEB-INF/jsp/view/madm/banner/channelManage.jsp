<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>채널등록관리</title>
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
	
	j$("#insertCh").click(function(){
		j$.divPop("addChannel", "채널등록", "/madm/layerPopup/addChannelPopup");
		return false;
	});

});
</script>
</head>
<body>

<form:form id="searchCh" modelAttribute="invChannelDto" action="/madm/banner/channelManage" method="GET">
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">채널등록관리</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>채널명</strong></td>
						    	<td colspan="3" width="90%" align="left">
						    		<input name="channelNm" value="${invChannelDto.channelNm }" type="text" style="width:400px;"/>
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td width="10%" bgcolor="#F5F5F5" align="center"><strong>채널코드</strong></td>
						    	<td colspan="3" width="90%" align="left">
						    		<input name="channelCd" value="${invChannelDto.channelCd }" type="text" style="width:400px;"/>
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
								    		<td id="btn01"><a href="#"><span id="insertCh">신규등록</span></a></td>
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
											<td bgcolor="#F5F5F5" width="10%"><strong>순번</strong></td>
											<td bgcolor="#F5F5F5" width="20%"><strong>채널코드</strong></td>
											<td bgcolor="#F5F5F5" width="20%"><strong>채널명</strong></td>
											<td bgcolor="#F5F5F5" width="50%"><strong>채널설명</strong></td>
										</tr>

										<c:forEach var="list" items="${paging.list}" varStatus="status">
										<tr align="center" height="30px">
											<td >${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
											<td >${list.channelCd }</td>
											<td >
												<a href="#" class="channelDetail" value="${list.channelCd }">
													<strong>${list.channelNm }</strong>
												</a>
											</td>
											<td >${list.channelDesc }</td>
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

