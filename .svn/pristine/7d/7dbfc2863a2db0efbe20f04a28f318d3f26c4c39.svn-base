<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담사관리</title>
<style>td { mso-number-format:\@; } </style> 
<%
 response.setHeader("Content-Type", "application/vnd.ms-xls");
 response.setHeader("Content-Disposition", "inline; filename=samplefile.xls");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<form:form id="searchMgr" name="searchMgr" modelAttribute="counselorMgrDto" action="/partner/counsel/counselMgrList" method="GET">
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
				                 <th width="5%" >순번</th>
				                  <th width="10%">내담자명</th>
				                  <th width="10%">휴대폰번호</th>
				                  <th width="15%">고객 작성일</th>
				                  <th width="10%">상담주제</th>
				                  <th width="10%">진행상태</th>
								  <th width="10%">상담사</th>								  
								  <th width="10%">등록/<span class='fontBlue'>수정일</span></th>								  
								  <th width="10%">등록/<span class='fontBlue'>수정자</span></th>
								  <th width="10%">상담일지등록</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
			                  	<td width="">
			                  		<a href="javascript:void(0)" class="publicDetail" value="${list.counselCd}" style="padding-left: 10px;"><strong>${list.counselNm}</strong></a>
			                  	</td>
								<td align="center">${list.mobile}</td>
								<td>${list.counselDd}&nbsp;
									<c:if test="${not empty list.stDt}">${ list.stDt }</c:if><c:if test="${not empty list.edDt}"> - ${ list.edDt }</c:if>
								</td>
								
								<td align="center">${list.strCause}</td>
								<td align="center">
									<a href="javascript:void(0)" class="publicDetail" value="${list.counselCd}" style="padding-left: 10px;"><strong>${list.strStatus}</strong>
								</td>
								<td align="center">${list.counselorNm}</td>
								<c:if test="${ not empty list.modiDt }">
									<td align="center"><span class='fontBlue'>${list.modiDt.substring(0,19)}</span></td>
									<td align="center"><span class='fontBlue'>${list.modiNm}</span></td>
								</c:if>
								<c:if test="${empty list.modiDt }">
									<td align="center">${list.regDt.substring(0,19)}</td>
									<td align="center">${list.regNm}</td>
								</c:if>								
								<td id="btn02" align="center"  >
									<table>
										<tr>
											<td>
												<c:if test="${chkUserId eq false}">
													<c:if test="${chkUserId2 eq list.counselorId}"> 
														<c:if test="${list.strStatus eq '상담예정'}"> &nbsp; </c:if>
														<c:if test="${list.strStatus eq '상담진행'}"> <a href="javascript:void(0)"   style="padding-left: 10px;"><span class="replyBtn" value="${list.counselCd}">상담일지</span></a> </c:if>
														<c:if test="${list.strStatus eq '상담종결'}"> &nbsp; </c:if>
													</c:if>
												</c:if>
												<c:if test="${chkUserId eq true}">									 
													<c:if test="${list.strStatus eq '상담예정'}"> &nbsp; </c:if>
													<c:if test="${list.strStatus eq '상담진행'}"> <a href="javascript:void(0)"   style="padding-left: 10px;"><span class="replyBtn" value="${list.counselCd}">상담일지</span></a> </c:if>
													<c:if test="${list.strStatus eq '상담종결'}"> &nbsp; </c:if>									
												</c:if>
											</td>
										</tr>
									</table>
								</td>
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

