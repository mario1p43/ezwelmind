<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
	<head>
		<title>Main</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$.ajax({
					url: '/madm/operations/getAllClientJedo',
					dataType: 'json',
					type: 'GET',
					cache: true,
					success: function(data, textStatus){
						
						console.log(data);
						
						var _result = data.resultMap;
						
						for(var key in _result) {
							var html = "";
							var _content = _result[key];
							
							if(_content.length > 0) {
								for(var i in _content) {
									html += '<tr align="center">';
									html += '	<td width="40%">'+_content[i].clientNm+'</td>';				
									html += '	<td width="60%">'+_content[i].pointUsePercent+'%<br/> <span style="font-size: 8px; font-weight: bold;">('+numberWithCommas(_content[i].point)+' / '+numberWithCommas(_content[i].assignBudget)+')</span></td>';
									html += '</tr>';
								}
							} else {
								html += '<tr align="center">';
								html += '	<th colspan="2" style="font-size: 20px; font-weight: bold; height: 300px;">데이터가 없습니다.</th>';				
								html += '</tr>';
							}
							
							
							$("#tbody_" + key).html(html);
						}
						
						
					}, error: function(e) {
						alert("고객사 소진율 조회 중 오류가 발생했습니다.")
					}
				});
			});  // end ready
			
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
		</script>
	</head>
	<body>
		<div>
			<h1 style="font-weight: bold">마인드어드민 &gt; 메인</h1>
		</div>
		<%-- 
			이  름 : <sec:authentication property="principal.user.userNm"/><br>
			아이디 : <sec:authentication property="principal.user.userId"/><br>
			모바일 : <sec:authentication property="principal.user.mobile"/><br>
			이메일 : <sec:authentication property="principal.user.email"/> <br>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="sesUser" property="principal.user" />
		</sec:authorize>
		<c:if test="${sesUser.userId eq '20141025'}">
			<br><br><br><br><br>
			<form action="/madm/main/sendSms" method="post">
			<h3>문자발송테스트</h3>
			수신 : <input type="text" name="recive"/><br>
			발신 : <input type="text" name="send"><br>
			내용 : <input type="text" name="txt" size="150"> <br><br>
			<input type="submit" value="전송" style="height:30px; width:100px;">
			</form>
			
			<br><br><br><br><br>
			<input type="button" onclick="javascript:test_sso('${ssoUrl }');" value="sso테스트">
			
		</c:if>
		<br><br><br><br><br>
		<h3>SSO 로그인 테스트</h3>
		고객사코드 : <input type="text"  id="clientCd"/><br>
		아   이  디 : <input type="text"  id="userId"><br><br>
		<input type="button" class="ssoTest" value="SSO 테스트(엑셀업로드)" 	ssoType="excel"	style="height:30px; width:150px;">
		<input type="button" class="ssoTest" value="SSO 테스트(회원가입)" 		ssoType="join"	style="height:30px; width:150px;"> --%>
		<div style="margin-top: 35px;">
			<h3 style="font-weight: bold; font-size: 1.17em;" class="subtitle">고객사 소진율</h1>
		</div>
		<div style="height: 700px; overflow-y: scroll; border-bottom: 1px solid black; border-top: 1px solid black;">
			<table cellpadding="0" align="left" cellspacing="0" border="0" width="19%" style="margin-right: 1%;">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="20px"></td>
							</tr>
							<tr>
								<td align="center" style="font-weight: bold; font-size:22px; color: navy;">0% ~ 25%</td>
							</tr>
							<tr>
								<td height="10px"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<thead>
								<tr align="center" height="30px">
									<th width="40%">고객사명</th>				
									<th width="60%">소진율</th>
								</tr>
							</thead>
							<tbody id="tbody_0">
								<tr>
									<th colspan="2" style="font-size: 30px; color: navy; font-weight: bold; height: 300px;">Loading..</th>
								</tr>						
							</tbody>
						</table>
					</td>
				</tr>			
			</table>
			<table cellpadding="0" align="left" cellspacing="0" border="0" width="19%" style="margin-right: 1%">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="20px"></td>
							</tr>
							<tr>
								<td align="center" style="font-weight: bold; font-size:22px; color: blue;">26% ~ 50%</td>
							</tr>
							<tr>
								<td height="10px"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<thead>
								<tr align="center" height="30px">
									<th width="40%">고객사명</th>				
									<th width="60%">소진율</th>
								</tr>
							</thead>
							<tbody id="tbody_26">
								<tr>
									<th colspan="2" style="font-size: 30px; color: blue; font-weight: bold; height: 300px;">Loading..</th>
								</tr>						
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<table cellpadding="0" align="left" cellspacing="0" border="0" width="19%" style="margin-right: 1%">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="20px"></td>
							</tr>
							<tr>
								<td align="center" style="font-weight: bold; font-size:22px; color: green;">51% ~ 75%</td>
							</tr>
							<tr>
								<td height="10px"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<thead>
								<tr align="center" height="30px">
									<th width="40%">고객사명</th>				
									<th width="60%">소진율</th>
								</tr>
							</thead>
							<tbody id="tbody_51">
								<tr>
									<th colspan="2" style="font-size: 30px; color: green; font-weight: bold; height: 300px;">Loading..</th>
								</tr>						
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<table cellpadding="0" align="left" cellspacing="0" border="0" width="19%" style="margin-right: 1%">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="20px"></td>
							</tr>
							<tr>
								<td align="center" style="font-weight: bold; font-size:22px; color: orange;">76% ~ 90%</td>
							</tr>
							<tr>
								<td height="10px"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<thead>
								<tr align="center" height="30px">
									<th width="40%">고객사명</th>				
									<th width="60%">소진율</th>
								</tr>
							</thead>
							<tbody id="tbody_76">
								<tr>
									<th colspan="2" style="font-size: 30px; color: orange; font-weight: bold; height: 300px;">Loading..</th>
								</tr>						
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<table cellpadding="0" align="left" cellspacing="0" border="0" width="19%" style="margin-right: 1%">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="20px"></td>
							</tr>
							<tr>
								<td align="center" style="font-weight: bold; font-size:22px; color: red;">91% ↑</td>
							</tr>
							<tr>
								<td height="10px"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<thead>
								<tr align="center" height="30px">
									<th width="40%">고객사명</th>				
									<th width="60%">소진율</th>
								</tr>
							</thead>
							<tbody id="tbody_91">
								<tr>
									<th colspan="2" style="font-size: 30px; color: red; font-weight: bold; height: 300px;">Loading..</th>
								</tr>						
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>

