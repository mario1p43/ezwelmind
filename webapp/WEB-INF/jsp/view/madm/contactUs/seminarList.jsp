<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>기업세미나 참가 문의</title>
<script language="JavaScript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		j$("#searchBtn").click(function(){
			j$("#frm").submit();
			return false;
		});
		
		j$(".downBtn").click(function(){
			var reqType = bEnco(j$("#reqType").val());
			j$(".downBtn").hide();
			location.href = "/madm/bbsEnterSeminar/excelDownload?reqType="+reqType;
		});
	});
</script>
</head>
<body>

<form:form id="frm" modelAttribute="bbsAddDto" action="/madm/bbsEnterSeminar/seminarList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">기업세미나 참가 문의</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="130px">
								※ 회차 구분 : <comm:select name="reqType" code="100817" id="reqType" selectValue="${param.reqType}"/>
							</td>
							<td align="left" id="btn02" width="40px">
								<a href="#">
									<span id="searchBtn"> 검 색 </span>
								</a>
							</td>
							<td align="left" id="btn02" class="hideBtn" width="60px">
								<a href="#">
									<span class="downBtn"> 엑셀다운 </span>
								</a>
							</td>
							<td align="right">
								<strong>
									<c:choose>
										<c:when test="${not empty paging }">
										총 ${paging.totalCount}건
										</c:when>
										<c:otherwise>총 0건</c:otherwise>
									</c:choose>
								</strong>
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
			                  <th width="5%">순번</th>
			                  <th width="7%">회차</th>
			                  <th width="18%">회사(기관명)</th>
			                  <th width="10%">담당자</th>
			                  <th width="13%">소속부서</th>
			                  <th width="8%">직급</th>
			                  <th width="14%">유선번호</th>
			                  <th width="14%">e-mail</th>
			                  <th width="10%">등록일</th>
			                </tr>
			            </thead>

						<tbody>
						<c:if test="${not empty paging }">
							<c:forEach var="list" items="${paging.list}" varStatus="status">
								<tr>
									<td class="no">${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
									<td><strong>${list.bbsTypeNm}</strong></td>
									<td><strong>${list.regCompany}</strong></td>
									<td>${list.regNm}</td>
									<td>${list.regDept}</td>
									<td>${list.regGrade}</td>
									<td>${list.regTelNum}</td>
									<td>${list.regEmail}</td>
									<td>${list.regDt}</td>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
					</div>
					<br>
					<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
						<tr>
							<td align="center">
								<c:if test="${not empty paging }">
									<ui:paging value="${paging}"
										btnFirst="${url:img('/images/btn_first.jpg')}"
										btnPrev="${url:img('/images/btn_prev.jpg')}"
										btnNext="${url:img('/images/btn_next.jpg')}"
										btnLast="${url:img('/images/btn_last.jpg')}" />		
								</c:if>
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

