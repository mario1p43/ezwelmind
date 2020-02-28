<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제도복사</title>
<script type="text/javascript">
	$(document).ready(function(){

		j$("#selClientCd").change(function() {
			var selClientCd = j$("#selClientCd").val();
			j$("#inputClientCd").val(selClientCd);
		});
		j$("#inputClientCd").change(function() {
			var inputClientCd = j$("#inputClientCd").val();
			j$("#selClientCd").val(inputClientCd);
		});
		
		j$("#selClientCdTarget").change(function() {
			var selClientCd = j$("#selClientCdTarget").val();
			j$("#inputClientCdTarget").val(selClientCd);
		});
		j$("#inputClientCdTarget").change(function() {
			var inputClientCd = j$("#inputClientCdTarget").val();
			j$("#selClientCdTarget").val(inputClientCd);
		});
		
		j$("#insertBtn").click(function(){
			var selClientCd = j$("#selClientCd").val();
			var selClientCdTarget = j$("#selClientCdTarget").val();
			
			if( selClientCd == selClientCdTarget ){
				alert("선택하신 고객사가 동일합니다.\n다시 선택해주세요.");
				return false;
			}else{
				if(confirm("제도 안내를 '"+selClientCd+"'와 동일하게 복사 하시겠습니까?")){
					j$("#clientCopy").submit();
					return false;
				}
				return false;
			}
			return false;
		});
	});
</script>
</head>
<body>

<form:form id="clientCopy" modelAttribute="bbsAddDto" action="/madm/jedoInfo/clientCopy" method="POST">
<table align="left" cellpadding="0" cellspacing="0" border="0" width="85%">
<tr>
	<td height="20px" colspan="3"></td>
</tr>

<tr>
	<td colspan="3">
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">제도복사</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="20px" colspan="3"></td>
</tr>

<tr>
	<td width="45%">
		<!-- 내용 영역 시작 -->
		<table class="" cellpadding="5" align="left" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
			<tr>
				<th>
				 	원본
				</th>
			</tr>
			<tr>
				<td>
					<select id="selClientCd" name="clientCd">
						<option value=""> 고객사를 선택 하세요  </option>
						<c:forEach var="list" items="${clientList }">
							<option value="${list.clientCd }">${list.clientNm } </option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					고객사 코드 : <input id="inputClientCd" type="text" value="">
				</td>
			</tr>
		</table>
	</td>
	
	<td width="10%" style="text-align: center; font-size: 18pt; ">→</td>
	
	<td width="45%">	
		<table class="" cellpadding="5" align="left" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
			<tr>
				<tr>
					<th>
					 	복사 대상
					</th>
				</tr>
				<tr>
					<td>
						<select id="selClientCdTarget" name="clientCdTarget">
							<option value=""> 고객사를 선택 하세요  </option>
							<c:forEach var="list" items="${clientList }">
								<option value="${list.clientCd }">${list.clientNm } </option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						고객사 코드 : <input id="inputClientCdTarget" type="text" value="">
					</td>
				</tr>
			</tr>
		</table>
		<!-- 내용 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="40px" colspan="3"></td>
</tr>

<tr>
	<td align="center" colspan="3">
		<input type="button" value="저장" id="insertBtn">
	</td>
</tr>
</table>
</form:form>
</body>
</html>