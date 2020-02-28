<%@ page import="com.ezwel.core.support.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<head>
<title>사용자권한</title>
<script language=JavaScript>
	j$(document).ready(function(){
		j$('#checkAll').click(function(){
			if (j$("#checkAll").is(":checked")) {
				j$('input:checkbox[name="userAuthKeyArr"]').each(function(){
					j$(this).prop("checked", true);
				})
			} else {
				j$('input:checkbox[name="userAuthKeyArr"]').each(function(){
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
				j$('input:checkbox[name="userAuthKeyArr"]:unchecked').each(function(){
					j$(this).parent().parent().remove();
				});

				j$("form[name='modifyForm']").submit();
			}, function() {
			}); // end alert
		});

		j$("#btSearch").click(function(){
			j$("form[name='searchForm']").submit();
		});

		if ("${param.isSuccess}" == "true") {
			j$.alert("정상적으로 변경 되었습니다.");
		}
	});
</script>
</head>
<table cellpadding="0" cellspacing="0" border="0" width="95%">
	<tr>
		<td height="20px" colspan="2"> </td>
	</tr>
	<tr>
		<td align="left" colspan="2" class="subtitle"> 사용자 관리</td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
	<form:form name="searchForm" modelAttribute="userAuthParam" method="GET" action="/acl/authUser">
	<!-- 검색/조건 영역 start -->
	<tr>
		<td colspan="2">
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr>
					<td bgcolor="#F5F5F5" align="center"><strong>검색조건</strong></td>
					<td>
						<form:select path="searchKey" cssClass="search">
							<form:option value="USER_NM">이름</form:option>
							<form:option value="USER_ID">아이디</form:option>
						</form:select>
						<form:input cssClass="search" path="searchKwd" placeholder="검색어를 입력하세요" />
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
					<td bgcolor="#F5F5F5" align="center"><strong>권한</strong></td>
					<td>
						<form:select path="searchAuthCode" cssClass="search">
							<form:option value="">권한설정</form:option>
							<c:forEach var="list" items="${authList}">
								<form:option value="${list.authCd}"> ${list.authNm} </form:option>
							</c:forEach>
						</form:select>
					</td>					
				</tr>
			</table>
		</td>		
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="center">
			<input type="button" id="btSearch" value="검색" />
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
						<span class="button"><a name="modifyBtn" href="#">저장</a></span>
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
			<form:form id="modifyForm" name="modifyForm" modelAttribute="userAuthParam" action="/acl/authUser" method="PUT">
			<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
				<tr>
					<th><input type="checkbox" id="checkAll" /> </th>
					<th>아이디</th>
					<th>타입</th>
					<th>이름</th>
					<th>권한</th>
				</tr>
				<tr align="center">
					<c:forEach var="user" items="${paging.list}" varStatus="status">
						<tr height="30">
							<td align="center"><input type="checkbox" id="check" name="userAuthKeyArr" value="${user.userAuthKey}" /></td>
							<td align="center">${user.userId}</td>
							<td align="center">${user.userTypeNm}</td>
							<td align="center">${user.userNm}</td>
							<td align="center">
								<table>
									<tr>
										<td align="center">
											<select name="authCdArr">
												<option value="">등급설정</option>
												<c:forEach var="list" items="${authList}">
													<c:choose>
													<c:when test="${user.authCd == list.authCd}">
														<option value="${list.authCd}" selected> ${list.authNm} </option>
													</c:when>
													<c:otherwise>
														<option value="${list.authCd}"> ${list.authNm} </option>
													</c:otherwise>
													</c:choose>
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