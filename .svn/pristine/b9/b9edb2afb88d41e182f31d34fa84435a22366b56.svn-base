<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>메뉴코드 상세</title>
<script>
$(document).ready(function(){
	$("#addBtn").click(function() {

		if ($("[name=menuNm]").val() == "") {
			alert("메뉴명을 입력해주세요.");
			return false;
		}

		if ($("[name=menuUrl]").val() == "") {
			alert("메뉴 URL을 입력해주세요.");
			return false;
		}


		$("#menuForm").submit();
		return false;

	});

});
</script>
</head>
<body>
<form id="menuForm" action="/madm/menuCode/add" method="post">
<input name="menuCd" type="hidden" value="${detail.menuCd}" />

<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
	<td valign="top" align="center">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="80%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">메뉴코드 상세</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<!-- 배너 정보 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="1" width="80%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">메뉴코드</td>
					    	<td class="line" colspan="3">
					    		<c:if test="${not empty detail.menuCd}">
					    			${detail.menuCd}
					    		</c:if>
					    		<c:if test="${empty detail.menuCd}">
					    			자동으로 생성됩니다.
					    		</c:if>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">메뉴유형</td>
					    	<td class="line" colspan="3">

					    		<select name="menuGroup">
					    			<option value="usr"  <c:if test="${detail.menuGroup eq 'usr'}">selected</c:if> >사용자</option>
					    			<option value="madm" <c:if test="${detail.menuGroup eq 'madm'}">selected</c:if> >관리자</option>
					    			<option value="partner" <c:if test="${detail.menuGroup eq 'partner'}">selected</c:if> >제휴사</option>
					    			<option value="cadm" <c:if test="${detail.menuGroup eq 'cadm'}">selected</c:if> >고객사관리자</option>
					    		</select>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">메뉴구분</td>
					    	<td class="line" colspan="3">
					    		<input type="text" name="menuDiv" value="${detail.menuDiv}" size="40" />
					    		* 메뉴 구분을 위해 사용되며 실제 메뉴에 노출되지 않습니다.
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">메뉴명</td>
					    	<td class="line" colspan="3">
					    		<input type="text" name="menuNm" value="${detail.menuNm}" size="80" />
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<td class="line" width="120px" align="center" bgcolor="#F5F5F5">메뉴URL</td>
					    	<td class="line" colspan="3">
					    		<input type="text" name="menuUrl" value="${detail.menuUrl}"" size="80" />
					    	</td>
						</tr>
						<c:if test="${not empty detail.menuCd}">
							<tr align="left" height="30px">
								<td class="line" width="120px" align="center" bgcolor="#F5F5F5">등록자/등록일시</td>
						    	<td class="line" colspan="3">
						    		${detail.regId} / ${detail.regDt}
						    	</td>
							</tr>
							<tr align="left" height="30px">
								<td class="line" width="120px" align="center" bgcolor="#F5F5F5">수정자/수정일시</td>
						    	<td class="line" colspan="3">
						    		${detail.modiId} / ${detail.modiDt}
						    	</td>
						</tr>
						</c:if>
					</table>
					<!-- 배너 정보 영역 종료 -->

					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;">
						<tr align="center" height="50px">
							<td class="" colspan="2" align="center">
					    		<button id="addBtn" style="height:30px; width:100px;">
									<c:if test="${not empty detail.menuCd}">
						    			수정
						    		</c:if>
						    		<c:if test="${empty detail.menuCd}">
						    			등록
						    		</c:if>
					    		</button>
					    	</td>
						</tr>
					</table>
					<!-- 버튼 영역 종료 -->
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form>

</body>
</html>

