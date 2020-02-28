<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>관리자 관리</title>
<script language="JavaScript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script type="text/javascript">
j$(document).ready(function(){


	j$("input").keypress(function(e) {
		if (e.which == 13){
			j$("#searchMgr").submit();
			return false;
		};
	});
	j$("#searchBtn").click(function(){
		j$("#searchMgr").submit();
		return false;
	});


	j$("#insertBtn").click(function(){
		var serviceType = '${param.serviceType}';
		location.href = "/madm/mgr/addMgr?serviceType="+serviceType;
		return false;
	});

	j$(".mgrDetail").click(function(){
		var serviceType = '${param.serviceType}';
		var userId = bEnco(j$(this).attr("value"));
		location.href = "/madm/mgr/modifyMgr?userId="+userId+"&amp;serviceType="+serviceType;
		return false;
	});

	if ("${param.insertCnt}" == "1") {
		j$.alert("정상적으로 등록 되었습니다.");
	} else if ("${param.insertCnt}" == "0") {
		j$.alert("동일한 ID가 이미 존재합니다.");
	}
});
</script>
</head>
<body>

<form:form id="searchMgr" modelAttribute="mgrDto" action="/madm/mgr/mgrList" method="GET">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">관리자 등록 관리</td>
				<td align="right">
					<input type="button" id="insertBtn" value="신규등록">
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td colspan="2">
					<table cellpadding="8" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td bgcolor="#F5F5F5" align="center"><strong>아이디</strong></td>
							<td>
								<input type="text" id="userId" name="userId" placeholder="아이디를 입력 하세요." value="${param.userId}" style="width:200px; height:20px;"/>
							</td>
							<td bgcolor="#F5F5F5" align="center"><strong>이름</strong></td>
							<td>
								<input type="text" id="userNm" name="userNm" placeholder="이름을 입력 하세요." value="${param.userNm}" style="width:200px; height:20px;"/>
							</td>
							<td bgcolor="#F5F5F5" align="center"><strong>타입</strong></td>
							<td>
								<form:select path="serviceType" cssClass="search">
									<form:option value="">타입설정</form:option>
									<form:option value="madm">마인드관리자</form:option>
									<form:option value="partner">제휴사관리자</form:option>
									<form:option value="cadm">고객사관리자</form:option>
								</form:select>
							</td>
							<td bgcolor="#F5F5F5" align="center"><strong>사용여부</strong></td>
							<td>
								<form:select path="useYn" cssClass="search">
									<form:option value="">전체</form:option>
									<form:option value="Y">사용</form:option>
									<form:option value="N">미사용</form:option>
								</form:select>
							</td>					
						</tr>
					</table>
				</td>		
			</tr>			
			<tr>
				<td align="center">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
					<tr>
						<td height="10px"></td>
					</tr>
					<tr>
				    	<td id="btn02"><a href="#"><span id="searchBtn">검 색</span></a></td>
		    		</tr>
    				</tbody>
	    		</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="30%">
								<strong>
									총 ${paging.totalCount}건
								</strong>
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
								<th width="5%" >순번</th>
								<th width="6%" >구분</th>
								<th width="10%">관리자ID</th>
								<th width="13%">관리자명</th>
								<th width="12%">소속1</th>
								<th width="12%">소속2</th>
								<th width="12%">소속3</th>
								<th width="15%">이메일</th>
								<th width="5%">사용여부</th>
								<th width="10%">등록일</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px">
								<td class="" width="" align="" bgcolor="">
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td>${list.userTypeNm}</td>
								<td><a href="#" class="mgrDetail" value="${list.userId}"><strong>${list.userId}</strong></a></td>
								<td>${list.userNm}</td>
								<td>${list.branchNm}</td>
								<td>${list.deptNm}</td>
								<td>${list.teamNm}</td>
								<td>${list.email}</td>
								<td>${list.useYn}</td>
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

