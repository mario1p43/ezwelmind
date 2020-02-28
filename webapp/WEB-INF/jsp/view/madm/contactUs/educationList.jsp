<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>교육문의</title>
<script type="text/javascript">
	$(document).ready(function(){

	 	j$("input").keypress(function(e) {
		    if (e.which == 13){
		    	j$("#searchService").submit();
				return false;
		    };
		});
		
		j$("#searchBtn").click(function(){
			j$("#searchService").submit();
			return false;
		});
	});
</script>
</head>
<body>

<form:form id="searchService" modelAttribute="bbsAddDto" action="madm/bbsEnterEducation/educationList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">교육문의</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건
								</strong>
							</td>
							<td align="right">
								<input type="text" id="searchNm" name="searchNm" placeholder="회사(기관명)을 입력 하세요." value="${param.searchNm}" style="width:200px; height:20px;"/>
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
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr>
			                  <th width="8%">순번</th>
			                  <th width="25%">회사(기관명)</th>
			                  <th width="12%">담당자</th>
			                  <th width="20%">e-mail</th>
			                  <th width="20%">통화가능시간</th>
			                  <th width="15%">등록일</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr>
								<td class="no">${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
								<td><a href="/madm/bbsEnterEducation/educationDetail?dataSeq=${list.dataSeq}"><strong>${list.regCompany}</strong></a></td>
								<td>${list.regNm}</td>
								<td>${list.regEmail}</td>
								<td>${list.contactDt}</td>
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
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form:form>
</body>
</html>