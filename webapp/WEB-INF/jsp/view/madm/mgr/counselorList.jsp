<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담사 확인</title>

<script type="text/javascript">

j$(document).ready(function(){

	j$("#searchBtn").click(function(){
		j$("#searchMgr").submit();		
	});
	
	j$("#excelBtn").click(function(){
		location.href = "/madm/mgr/counselorList/excelDownload";
		j$("#excelBtn").hide();
 		return false;
	});
	
});

function centerReload(setType){
	if(setType == "sel"){
		var tempCenterNm = $("#searchCenterSeq option:selected").text();
		$("#chkCenterNm").val(tempCenterNm);
	}else if(setType == "txt"){
		var centerArrList = new Array();
		<c:forEach var="list" items="${centerList}">
		var arr = { nm : "${list.centerNm}", seq : "${list.centerSeq}"};
		centerArrList.push(arr);
		</c:forEach>

		var tempCenterNm = $("#chkCenterNm").val();
		for(var i=0 ; i < centerArrList.length ; i++){
			var checkCenterArr = centerArrList[i];
			if(checkCenterArr.nm.indexOf(tempCenterNm) != -1) {
				$("#searchCenterSeq").val(checkCenterArr.seq);
				break;
			}	
		}
	}
}

</script>
</head>
<body>

<form id="searchMgr" name="searchMgr" modelAttribute="CounselorInfoMgrDto" action="/madm/mgr/counselorList" >
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">상담사 확인</td>
				<td align="right">
					<input type="button" id="excelBtn" value="엑셀다운로드">
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1"  width="100%" style="border-collapse:collapse;">
			<tr>
				<th align="center" width="13%">센터명</th>
				<td >
					<select name="searchCenterSeq" id="searchCenterSeq" style="height: 20px;" onchange="centerReload('sel');">
						<option value="">상담센터를 선택하세요</option>
						<c:forEach var="list" items="${centerList}" varStatus="listCnt">
								<option value="${list.centerSeq }" <c:if test="${list.centerSeq eq param.searchCenterSeq }"> selected </c:if> >${list.centerNm }</option>
						</c:forEach>
					</select>
					<input type="text" id="chkCenterNm" value="" onchange="centerReload('txt');" onkeyup="centerReload('txt');" style="width:200px;" placeholder="상담센터명을 입력 또는 선택하세요.">
				</td>
				<th align="center" width="13%">상담사명</th>
				<td><input type="text" name="userNm" id="userNm" size="50%" maxlength="25" value="${param.userNm}"/></td>
			</tr>
		</table>
	</td>
</tr>


<tr><td height="20px"></td></tr>

<tr>
	<td align="center">
		<input type="button" id="searchBtn" name="searchBtn" style="height:30px; width:100px;" value="검색"/>
	</td>
</tr>

<tr><td height="20px"></td></tr>

			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건 |
								</strong>
								<span style="margin-left: 5px;"></span>
								<strong>페이지 : ${paging.currentPage}/${paging.getPageCount()} </strong>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="" cellpadding="5" align="" id="" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
							<tr>
								<th width="4%" >순번</th>
								<th width="7%">상담사명</th>
								<th width="6%" >생년월일</th>
								<th width="10%">소속</th>
								<th width="6%">권한</th>
								<th width="7%">학력</th>
								<th width="10%">출신교</th>
								<th width="8%">학과</th>
								<th width="auto;">경력</th>
								<th width="10%">자격</th>
								<th width="10%">기타(자격)</th>
								<th width="5%">사용여부</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td>${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}</td>
								<td>${list.userNm}</td>
								<td>${list.rrn}</td>
								<td>${list.centerNm}</td>
								<td>${list.authCd }</td>
								<td>${list.education}</td>
								<td>${list.university}</td>
								<td>${list.department }</td>
								<td>${list.career}</td>
								<td>${list.cert}</td>
								<td>${list.etcCert}</td>
								<td>${list.useYn}</td>
							</tr>
 						</c:forEach> 
						</tbody>
					</table>
					<br />
					
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
		
</tr>
</table>
</form>
</body>
</html>

