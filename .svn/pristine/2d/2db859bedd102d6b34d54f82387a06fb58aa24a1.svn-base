<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<html>
<head>
<title></title>
<%
 response.setHeader("Content-Type", "application/vnd.ms-xls");
 response.setHeader("Content-Disposition", "inline; filename=samplefile.xls");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>
<tr>
<td>
				<table class="" cellpadding="10" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr >
			                  <th rowspan="2" width="8%" >순번</th>
			                  <th rowspan="2" width="">센터코드</th>
			                  <th rowspan="2" width="">센터명</th>
			                  <th colspan="4" width="">센터구분</th>
			                 
			                  <th rowspan="2" width="">지역구분</th>
			                  <th rowspan="2" width="">인원</th>
			                  <th rowspan="2" width="">노출여부</th>
			                  <th rowspan="2" width="">정산유형</th>
			                  
			                  <th rowspan="2" width="">인근 대중교통</th>
			                  <th rowspan="2" width="">메모</th>
			                  <th rowspan="2" width="">등록일</th>
			                </tr>
			                <tr>
			                 <th>상담</th><th>파견</th><th>집단</th><th>강의</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td>${list.centerSeq}</td>
								<td>${list.centerNm}</td>
								<td>${list.typeCounsel}</td>
								<td>${list.typeDispatch}</td>
								<td>${list.typeGroup}</td>
								<td>${list.typeLecture}</td>
								
								
								<script>
								var chkValue = '${list.centerType}';
								var chkArr = chkValue.split(',');
								for (var i = 0; i < chkArr.length; i++) {
									if(chkArr[i] == '100471'){
										document.getElementById("type1").innerHTML = 'Y';
									}else if(chkArr[i] == '100472'){
										document.getElementById("type2").innerHTML = 'Y';
									}else if(chkArr[i] == '100473'){
										document.getElementById("type3").innerHTML = 'Y';
									}else if(chkArr[i] == '100474'){
										document.getElementById("type4").innerHTML = 'Y';
									}
								};
								
								</script>

								<td>${list.area1 } / ${list.area2 }</td>
								<td>${list.employ}</td>
								<td>${list.dispYn}</td>
								<td><comm:commNmOut code="${list.calcType }"  option="commCd"/>
								<td>${list.publicTraffic}</td>
								<td>${list.mgrMemo}</td>
								<td>${list.regDt}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</td>
					</tr>
</table>
</body>
</html>