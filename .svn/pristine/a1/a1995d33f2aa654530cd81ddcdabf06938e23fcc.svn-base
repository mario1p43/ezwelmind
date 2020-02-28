<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제도안내</title>
<script type="text/javascript">
	$(document).ready(function(){

	 	j$("input").keypress(function(e) {
		    if (e.which == 13){
		    	var inputClientCd = j$("#inputClientCd").val();
				j$("#selClientCd").val(inputClientCd);
				
		    	j$("#searchJedoInfo").submit();
				return false;
		    };
		});
		
		j$("#searchBtn").click(function(){
			j$("#searchJedoInfo").submit();
			return false;
		});
		
		j$("#insertBtn").click(function(){
			location.href = "/madm/jedoInfo/addJedo"
			return false;
		});
		
		j$("#selClientCd").change(function() {
			var selClientCd = j$("#selClientCd").val();
			j$("#inputClientCd").val(selClientCd);
			
			if(selClientCd != ""){
				j$("#searchJedoInfo").submit();
			}
		});
		
		j$("#inputClientCd").change(function() {
			var inputClientCd = j$("#inputClientCd").val();
			j$("#selClientCd").val(inputClientCd);
		});
	});
</script>
<style type="text/css">
	.fontBlue{color: #2E64FE; }
</style>
</head>
<body>

<form:form id="searchJedoInfo" modelAttribute="bbsAddDto" action="/madm/jedoInfo/list" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">상담포유 - 제도안내</td>
		    	<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<table cellpadding="0" cellspacing="0" border="0" width="100%" alrign="center">
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
								<select name="clientCd" id="selClientCd">
									<option value=""> 고객사를 선택 하세요  </option>
									<c:forEach var="list" items="${clientList }">
										<option value="${list.clientCd }" <c:if test="${param.clientCd eq list.clientCd}"> selected </c:if>   >${list.clientNm } </option>
									</c:forEach>
								</select>
								<span style="margin-left: 20px;"></span>
								<input type="text" id="inputClientCd" placeholder="고객사 코드를 입력하세요" value="${param.clientCd}" style="width:200px; height:20px;"/>
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
			                  <th>순번</th>
			                  <th>적용URL</th>
			                  <th>제도명</th>
			                  <th>적용여부</th>
			                  <th>등록/<span class="fontBlue">수정자</span></th>
			                  <th>등록/<span class="fontBlue">수정일</span></th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr>
								<td class="no">${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
								<td>/jedo/${list.pageKey}</td>
								<td><a href="/madm/jedoInfo/modifyJedoDetail?dataSeq=${list.dataSeq }"><strong>${list.subject}</strong></a></td>
								<td>
									<c:choose>
										<c:when test="${not empty list.clientCd}">Y</c:when>
										<c:otherwise>N</c:otherwise>
									</c:choose>
								</td>
								<c:choose>
									<c:when test="${not empty list.modiNm}">
										<td><span class="fontBlue">${list.modiNm}</span></td>
										<td><span class="fontBlue">${list.modiDt}</span></td>
									</c:when>
									<c:otherwise>
										<td>${list.regNm}</td>
										<td>${list.regDt}</td>
									</c:otherwise>
								</c:choose>
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