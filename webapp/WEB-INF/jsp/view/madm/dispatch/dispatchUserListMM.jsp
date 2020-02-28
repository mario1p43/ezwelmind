<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>마음왕진 | 참여자 목록</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script language="JavaScript" type="text/javascript" src="/resources/js/bcrypt.js"></script>

<script type="text/javascript">
j$(document).ready(function(){
	
});

var DISPATCH = {
	detail : function(seq) {
		location.href="/madm/dispatch/userForm?counselUserSeq="+seq;
	},
	putCounsel : function(userKey, clientCd) {
		location.href="/madm/counsel/counselOrder?searchClientCd="+clientCd+"&searchUserKey="+userKey;
	},
	downloadExcel : function() {
		if(!confirm("엑셀을 다운로드하시겠습니까?")) {
			return false;
		}
		
		$("#searchForm").attr("action", "/madm/dispatch/downloadUserExcel");
		$("#searchForm").attr("method", "post");
		$("#searchForm").submit();
	},
	connectUserKeyPopupOpen : function(clientCd, userId, empNum, name, counselUserSeq) {
		j$.divPop('connectUserKey', '사번 검색', j$("#connectUserKeyPopup"));
		$("#searchClientCd").val(clientCd);
		$("#searchUserNm").val(name);
		$("#searchUserId").val(userId);
		$("#searchEmpNum").val(empNum);
		$("#updateCounselUserSeq").val(counselUserSeq);
		DISPATCH.userKeySearch();
	},
	userKeySearch : function() {
		$.ajax({
			type: "POST",
			url: "/madm/dispatch/getClientMindUserList",
			dataType : "json",
			data : {
					clientCd : $("#searchClientCd").val(), 
					userNm : $("#searchUserNm").val(), 
					userId : $("#searchUserId").val(),
					empNum : $("#searchEmpNum").val()
			},
			success: function(data){
				var html = "";
				
				if(data.length > 0) {
					for(var i in data) {
						html += "<tr>";
						html += "	<td align=\"center\">"+data[i].userKey+"</td>";
						html += "	<td align=\"center\">"+data[i].userNm+"</td>";
						html += "	<td align=\"center\">"+data[i].empNum+"</td>";
						html += "	<td align=\"center\">"+data[i].userId+"</td>";
						html += "	<td align=\"center\"><input type=\"button\" value=\"선택\" onclick=\"DISPATCH.selectKey('"+data[i].userKey+"')\" /></td>";
						html += "</tr>";
					}
				} else {
					html += "<tr><td align=\"center\" colspan=\"5\">검색된 사용자가 없습니다.</td></tr>";
				}
				
				console.log(html);
				
				$("#userKeySearchArea").html(html);
				
			},
			error: function(data){
				alert("ajax error");
				console.log(data);	
			}
		});
	},
	selectKey : function(userKey) {
		$.ajax({
			type: "POST",
			url: "/madm/dispatch/updateUserKey",
			dataType : "json",
			data : {
					userKey : userKey, 
					counselUserSeq : $("#updateCounselUserSeq").val()
			},
			success: function(data){
				if(data == "0") {
					alert("수정 도중 오류가 발생했습니다.");
				} else {
					alert("수정되었습니다.");
					location.reload();
				}
			},
			error: function(data){
				alert("ajax error");
				console.log(data);	
			}
		});
	}
};
</script>
</head>
<body>

<form:form id="searchForm" modelAttribute="dto" action="/madm/dispatch/list" method="GET">
<input type="hidden" name="infoSeq" value="${param.infoSeq }" />
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
				<td align="left" class="subtitle">마음왕진 참여자 목록</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->

		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<td align="left" width="90%">
								<strong>
									총 ${paging.totalCount}건
								</strong>
							</td>
							<%-- <td align="right">
								<input type="text" id="subject" name="subject" placeholder="검색어를 입력 하세요." value="${param.pollNm}" style="width:200px; height:20px;"/>
							</td>
							<td id="btn02" width="40px">
								<a href="#">
									<span id="searchBtn">검색</span>
								</a>
							</td> --%>
							<td align="right" id="btn01" width="80px">
								<a href="#none" onclick="DISPATCH.downloadExcel()">
									<span>엑셀 다운로드</span>
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
								<th width="10%">순번</th>
								<th width="10%">성명</th>
								<th width="10%">아이디</th>
								<th width="10%">사번</th>
								<th width="10%">전화번호</th>
								<th width="10%">이메일</th>
								<th width="10%">등록일시</th>
								<th width="20%">인테이크</th>
								<th width="10%">유저키</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="list" items="${paging.list}" varStatus="status">
							<tr align="" height="50px" id="${list.counselUserSeq}">
								<td>
									${(paging.totalCount - ((paging.currentPage-1) * paging.pageSize)) - status.index}
								</td>
								<td><a href="#none" class="userList" onclick="DISPATCH.detail('${list.counselUserSeq}')"><strong>${list.userNm }</strong></td>
								<td>${list.userId}</td>
								<td>${list.empNum}</td>
								<td>${list.mobile}</td>
								<td>${list.email}</td>
								<td>${fn:substring(list.regDt, 0, 4) }.${fn:substring(list.regDt, 4, 6) }.${fn:substring(list.regDt, 6, 8) } ${fn:substring(list.regDt, 8, 10) }:${fn:substring(list.regDt, 10, 12) }</td>
								<td>${list.counselNm}</td>
								<td>
									<c:choose>
										<c:when test="${!empty list.userKey }">
											<a href="#none" class="userList" onclick="DISPATCH.putCounsel('${list.userKey}', '${list.clientCd }')"><strong>${list.userKey }</strong>
										</c:when>
										<c:otherwise>
											<b><a href="#none" style="color:red" onclick="DISPATCH.connectUserKeyPopupOpen('${list.clientCd}', '${list.userId}', '${list.empNum }', '${list.userNm }', '${list.counselUserSeq }')">미연결</a></b>
										</c:otherwise>
									</c:choose>
								</td>
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


<div id="connectUserKeyPopup" style="display: none">
	<table cellpadding="0" cellspacing="0" border="0" width="750px">
		<tr>
			<td align="center">
				<table cellpadding="5" cellspacing="0" border="1" width="700px" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<thead>
					<tr>
						<td align="center" colspan="5">
							이름 : <input type="text" id="searchUserNm" name="userNm" />&nbsp;&nbsp;&nbsp;
							사번 : <input type="text" id="searchEmpNum" name="empNum" />&nbsp;&nbsp;&nbsp;
							아이디 : <input type="text" id="searchUserId" name="userId" />
							<input type="hidden" id="searchClientCd" name="clientCd" />
							<input type="hidden" id="updateCounselUserSeq" name="counselUserSeq" />
							<input type="button" value="검색" onclick="DISPATCH.userKeySearch()" />
						</td>
					</tr>
					<tr>
						<th align="center">유저키</th>
						<th align="center">이름</th>
						<th align="center">사번</th>
						<th align="center">아이디</th>
						<th align="center">기능</th>
					</tr>
					</thead>
					<tbody id="userKeySearchArea">
						
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td height="20px"></td>
		</tr>
	</table>
</div>
</body>
</html>

