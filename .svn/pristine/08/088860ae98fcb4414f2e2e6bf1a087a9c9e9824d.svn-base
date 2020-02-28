<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제도복사</title>
<script type="text/javascript">
	$(document).ready(function(){

		j$("input").keypress(function(e) {
		    if (e.which == 13){
		    	var inputClientCd = j$("#inputClientCd").val();
				j$("#selClientCd").val(inputClientCd);
				
		    	j$("#searchForm").submit();
				return false;
		    };
		});
		
		j$("#selClientCd").change(function() {
			var selClientCd = j$("#selClientCd").val();
			j$("#inputClientCd").val(selClientCd);
			
	    	j$("#searchForm").submit();
		});
		j$("#inputClientCd").change(function() {
			var inputClientCd = j$("#inputClientCd").val();
			j$("#selClientCd").val(inputClientCd);
			
	    	j$("#searchForm").submit();
		});
		
		j$('#checkAll').click(function(){
			if (j$("#checkAll").is(":checked")) {
				j$('input:checkbox[name="checkClient"]').each(function(){
					j$(this).prop("checked", true);
				})
			} else {
				j$('input:checkbox[name="checkClient"]').each(function(){
					j$(this).prop("checked", false);
				});
			}
		});
		
		j$('#searchBtn').click(function(){
			j$("#searchForm").submit();
		});
		
		j$('#deleteBtn').click(function(){
			if( j$("input[id=check]:checked").length == 0 ) {
				 j$.alert("선택된 값이 없습니다.");
				 return;
			}

			j$.alert("변경 하시겠습니까?", function() {
				j$('input:checkbox[name="checkClient"]:checked').each(function(){
					alert(j$(this).attr("value"));
				});

				//j$("form[name='modifyForm']").submit();
			}, function() {
			}); // end alert
		});
	});
</script>
</head>
<body>

<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px" colspan="2"> </td>
	</tr>
	<tr>
		<td align="left" colspan="2" class="subtitle">고객사 제도 관리</td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
	<form:form name="searchForm" id="searchForm" modelAttribute="bbsAddDto" method="GET" action="/madm/jedoInfo/clientDelete">
	<!-- 검색/조건 영역 start -->
	<tr>
		<td colspan="2">
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr>
					<td bgcolor="#F5F5F5" align="center"><strong>고객사 선택</strong></td>
					<td>
						<select id="selClientCd" name="clientCd">
							<option value=""> 고객사를 선택 하세요  </option>
							<c:forEach var="list" items="${clientList }">
								<option value="${list.clientCd }" <c:if test="${list.clientCd eq param.clientCd }"> selected </c:if> >${list.clientNm } </option>
							</c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;
						<b>고객사 코드 : </b> <input id="inputClientCd" type="text" value="${param.clientCd }">
						&nbsp;&nbsp;
						<span class="button"><a id="searchBtn" href="#">검색</a></span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="30px"></td>
	</tr>
	<!-- 검색/조건 영역 end -->
	</form:form>

	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td align="left" class="tabledesc"> · 설명을 입력하는 부분 입니다.</td>
					<td align="right">
						<span class="button"><a id="deleteBtn" href="#">삭제</a></span>
					</td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td>
			<form:form id="modifyForm" name="modifyForm" modelAttribute="bbsAddDto" action="/acl/authUser" method="PUT">
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr>
					<th><input type="checkbox" id="checkAll" /> </th>
					<th>페이지명</th>
					<th>페이지키</th>
					<th>적용여부</th>
				</tr>
				<c:forEach var="list" items="${jedoClientList }">
					<tr align="center">
						<td><input type="checkbox" id="check" name="checkClient" value="${list.dataSeq}"/></td>
						<td>${list.subject }</td>
						<td>${list.pageKey }</td>
						<td>
							<c:choose>
								<c:when test="${not empty list.clientCd}">Y</c:when>
								<c:otherwise>N</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
			</form:form>
		</td>
	</tr>

	<!-- 페이지 영역 start -->
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="center">
		</td>
	</tr>
</table>
</body>
</html>