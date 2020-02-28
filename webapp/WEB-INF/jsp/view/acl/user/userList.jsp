<%@ page import="com.ezwel.core.support.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<script language=JavaScript>
	j$(document).ready(function(){
		j$('#checkAll').click(function(){
			if (j$("#checkAll").is(":checked")) {
				j$('input:checkbox[name="userIdArr"]').each(function(){
					j$(this).prop("checked", true);
				})
			} else {
				j$('input:checkbox[name="userIdArr"]').each(function(){
					j$(this).prop("checked", false);
				});
			}
		});

		j$("a[name='modifyBtn']").click(function(){
			if( j$("input[id=check]:checked").length == 0 ) {
				 j$.alert("선택된 값이 없습니다.");
				 return;
			}

			j$.alert("변경 하시겠습니까?", function() {
				j$("form[name='modifyForm']").submit();
			}, function() {
			}); // end alert
		});

		j$("a[name='searchUser']").click(function(){
			j$("form[name='searchForm']").submit();
		});

		if ("${param.isSuccess}" == "true") {
			j$.alert("정상적으로 변경 되었습니다.");
		}
	});
</script>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td height="20px" colspan="2"> </td>
	</tr>
	<tr>
		<td align="left" colspan="2" class="subtitle"> 사용자 관리</td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
	<form:form name="searchForm" modelAttribute="user" method="GET" action="/acl/user">
	<!-- 검색/조건 영역 start -->
	<tr>
		<td colspan="2">
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr>
					<td bgcolor="#F5F5F5" align="center"><strong>검색조건</strong></td>
					<td>
						<form:select path="searchKey">
							<form:option value="USER_NM">이름</form:option>
						</form:select>
						<form:input path="searchKwd" placeholder="검색어를 입력하세요" />
						<span class="button black"><a name="searchUser" href="#">조회</a></span>
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
					<td align="left" class="tabledesc"> · 변경은 체크박스 선택 후 저장을 눌러 주세요.</td>
					<td align="right">
						<span class="button black"><a name="modifyBtn" href="#">저장</a></span>
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
			<form:form id="modifyForm" name="modifyForm" modelAttribute="user" action="/acl/user" method="POST">
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr>
					<th><input type="checkbox" id="checkAll" /> </th>
					<th>아이디</th>
					<th>이름</th>
					<th>권한</th>
				</tr>
				<tr align="center">
					<c:forEach var="user" items="${paging.list}" varStatus="status">
						<tr height="30">
							<td align="center"><input type="checkbox" id="check" name="userIdArr" value="${status.index}▒${user.userId}" /></td>
							<td align="center">${user.userId}</td>
							<td align="center">${user.userNm}</td>
							<td align="center">
								<table>
									<tr>
										<td align="center">
											<select name="authCdArr">
												<c:choose>
													<c:when test="${not empty user.authCd}" >
														<option value=${user.authCd}>${user.authNm}</option>
													</c:when>
													<c:otherwise>
														<option value="">등급설정</option>
													</c:otherwise>
												</c:choose>
												<c:forEach var="list" items="${authNmList}">
													<option value="${list.authCd}"> ${list.authNm} </option>
												</c:forEach>
											</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
				</tr>
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
			<ui:paging value="${paging}"
				btnFirst="${url:img('/images/btn_first.jpg')}"
				btnPrev="${url:img('/images/btn_prev.jpg')}"
				btnNext="${url:img('/images/btn_next.jpg')}"
				btnLast="${url:img('/images/btn_last.jpg')}" />
		</td>
	</tr>
</table>