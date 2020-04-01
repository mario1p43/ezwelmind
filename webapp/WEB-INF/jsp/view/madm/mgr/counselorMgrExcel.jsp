<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담사관리</title>
<%
 response.setHeader("Content-Type", "application/vnd.ms-xls");
 response.setHeader("Content-Disposition", "inline; filename=samplefile.xls");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<form:form id="searchMgr" name="searchMgr" modelAttribute="counselorMgrDto" action="/madm/mgr/counselorMgrList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="80%">
<tr>
	<td height="20px"></td>
</tr>


<tr><td height="20px"></td></tr>

			<tr>
				<td>
					<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
							<tr>
								<th width="" rowspan="2" style="width: 20px !important;">순번</th>
								<th width="" rowspan="2" style="width: 150px !important;">센터코드</th>
								<th width="" rowspan="2" style="width: 150px !important;">센터명</th>
								<th width="" rowspan="2" style="width: 50px !important;">상담사ID</th>
								<th width="" rowspan="2" style="width: 50px !important;">상담사명</th>
								<th width="" rowspan="2" style="width: 30px !important;">나이</th>
								<th width="" rowspan="2" style="width: 30px !important;">성별</th>
								<th width="" rowspan="2" style="width: 100px !important;">전화번호</th>
								<th width="" rowspan="2" style="width: 100px !important;">이메일</th>
								<th width="" rowspan="2" style="width: 150px !important;">지역구분</th>
								<th width="" rowspan="2" style="width: 150px !important;">센터주소</th>
								<th width="" rowspan="2" style="width: 50px !important;">접속권한</th>
								<th width="" rowspan="2" style="width: 50px !important;">근무형태</th>
								<th width="" rowspan="2" style="width: 50px !important;">상담유형</th>
								<th width="" colspan="2">상담대상</th>
								<th width="" colspan="4">상담분야</th>
								<th width="" colspan="4">상담방법</th>
								<th width="" rowspan="2" style="width: 50px !important;">상태값</th>
								<th width="" rowspan="2" style="width: 60px !important;">최초등록일</th>
								<th width="" rowspan="2" style="width: 60px !important;">정보변경일</th>
							</tr>
							<tr>

								<th style="width: 100px !important;">심리</th>
								<th style="width: 100px !important;">심리검사</th>
								<th style="width: 100px !important;">심리</th>
								<th style="width: 100px !important;">법률</th>
								<th style="width: 100px !important;">재무</th>
								<th style="width: 100px !important;">심리검사</th>
								<th style="width: 100px !important;">심리</th>
								<th style="width: 100px !important;">법률</th>
								<th style="width: 100px !important;">재무</th>
								<th style="width: 100px !important;">심리검사</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td>${list.centerSeq}</td>
								<td><strong>${list.centerNm}</strong></td>
								<td>${list.userId}</a></td>
								<td><a href="#" class="counselorListDetail" value="${list.userId}"><strong>${list.userNm}</strong></a></td>
								<td>${list.rrn}</td>
								<td>${list.gender}</td>
								<td>${list.mobile}</td>
								<td>
									<c:if test="${not empty list.email}">
										${list.email}
									</c:if>
								</td>
								<td>
									${list.area1}
									<c:choose>
										<c:when test="${list.area2 eq null}"></c:when>
										<c:otherwise> /${list.area2 }</c:otherwise>
									</c:choose>
								</td>
								<td>${list.addr1 }${list.addr2 }</td>
								<td>${list.authCd }</td>
								<td>${list.workType}</td>
								<td>
									<c:if test="${not empty list.channelType}">
										${list.channelType}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.mentalAges}">
										${list.mentalAges}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.diagnosisAges}">
										${list.diagnosisAges}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.mentalDiv}">
										${list.mentalDiv}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.lawDiv}">
										${list.lawDiv}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.financeDiv}">
										${list.financeDiv}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.diagnosisDiv}">
										{list.diagnosisDiv}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.mentalType}">
										${list.mentalType}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.lawType}">
										${list.lawType}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.financeType}">
										${list.financeType}
									</c:if>
								</td>
								<td>
									<c:if test="${not empty list.diagnosisType}">
										${list.diagnosisType}
									</c:if>
								</td>
								<td>${list.mgrStatus}</td>
								<td>${list.regDt}</td>
								<td>${list.modiDt}</td>
							</tr>
 						</c:forEach> 
 						
 						
						</tbody>
					</table>
					<br />
					
				</td>
			</tr>
		
</tr>
</table>
</form:form>
</body>
</html>

