<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>페이지 등록 관리</title>
<script type="text/javascript">
	$(document).ready(function(){

	 	j$("input").keypress(function(e) {
		    if (e.which == 13){
		    	j$("#searchPage").submit();
				return false;
		    };
		});
		
		j$("#searchBtn").click(function(){
			j$("#searchPage").submit();
			return false;
		});
	});
</script>
</head>
<body>

<form:form id="searchPage" modelAttribute="bbsPageDto" action="/madm/counselor/counselorList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">전문가 등록</td>
				<td align="right"></td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
<%-- 									총 ${paging.totalCount}건 --%>
								</strong>
							</td>
							<td align="right">
								<input type="text" id="searchNm" name="searchNm" placeholder="기관명 및 성명을 입력 하세요." value="${param.searchNm}" style="width:200px; height:20px;"/>
							</td>
							<td id="btn02" width="40px">
								<a href="#">
									<span id="searchBtn">검색</span>
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- 채널 정보 시작 -->
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr>
			                  <th width="5%" >순번</th>
			                  <th width="15%">요청타입</th>
			                  <th width="30%">기관명 및 성명</th>
			                  <th width="50%">등록일</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr>
								<td>${list.reqSeq}</td>
								<td>${list.reqType eq '100307' ? '상담기관(센터)' : '개인(상담사)' }</td>
								<td align="left"><a href="/madm/counselor/counselorDetail?reqSeq=${list.reqSeq}&reqType=${list.reqType}"><b>${list.reqNm}</b></a></td>
								<td>${list.regDt}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</div>
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
</form:form>
</body>
</html>

