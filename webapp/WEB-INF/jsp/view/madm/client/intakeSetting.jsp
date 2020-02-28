<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>서비스 이용목록</title>
<script type="text/javascript">
$(document).ready(function() {
	
	$.ajax({
		url: '/madm/client/getChannelInfo',
		data: {
				clientCd : '${param.clientCd}',
				gubunType : "CHANNEL"
			},
		dataType: 'json',
		type: 'get',
		success: function(data){
			var list = data.resultValue;
			for (var i = 0; i < list.length; i++) {
				if (list[i].dispYn == "Y") {
					$("#" + list[i].gubunType + "-" + list[i].dispType).prop("checked", true);
				} else {
					$(".sub_" + list[i].dispType).attr("disabled", true);
				}
				
				
				$.ajax({
					url: '/madm/client/getChannelInfo',
					data: {
							clientCd : '${param.clientCd}',
							gubunType : "CHANNEL_" + list[i].dispType + "_METHOD"
						},
					dataType: 'json',
					type: 'get',
					success: function(data){
						var list = data.resultValue;
						for (var i = 0; i < list.length; i++) {
							if (list[i].dispYn == "Y") {
								$("#" + list[i].gubunType + "-" + list[i].dispType).prop("checked", true);
							}
						}
					}
				});
			}
		}
	});
	
	$( "input[type=checkbox]" ).on( "click", function() {
		var id = $(this).attr("id").split("-");
		var dispYn = "";
		if ($(this).is(":checked")) {
			dispYn = "Y";
		} else {
			dispYn = "N";
		}
		
		$.ajax({
			url: '/madm/client/updateClientSub',
			data: {
					clientCd : '${param.clientCd}',
					gubunType : id[0],
					dispType : id[1],
					essenYn : "Y",
					dispYn : dispYn
				},
			dataType: 'json',
			type: 'post',
			success: function(data){
				if (data.resultValue == "1") {
					alert("변경이 완료되었습니다.");
					location.reload(true);
				} else {
					alert("변경에 실패하였습니다.");
				}
			}
		});
		
	});
		
		
		
});  // end ready
	
</script>
</head>
<body>



<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">등록 (${param.clientCd})</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="40%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="30%" bgcolor="#F5F5F5" align="center">
									<strong>개인정보관리 리스트</strong>
								</td>
						    	<td width="70%" align="left">
						    		<select id="privateItems">
										<option value="">선택해주세요.</option>
										<c:forEach var="list" items="${ myPrivateList }">
											<c:if test="${empty list.dispType }">
												<option value="${list.commCd}">${list.commNm}</option>
											</c:if>
										</c:forEach>
									</select>
						    	</td>
							</tr>
						</table>
						<!-- 검색 영역 종료 -->
					</td>
				</tr>
				<tr id="trIntake">
					<td>
						<!-- 버튼 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="0" width="40%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr>
								<td align="center" colspan="4">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
								    		<td id="btn01"><a href="#"><span id="btnAddItem">등 록</span></a></td>
						    			</tr>
						    		</table>
						    	</td>
							</tr>
						</table>
						<!-- 버튼 영역 종료 -->
					</td>
				</tr>
				<tr>
					<td height="30px"></td>
				</tr>

			</table>
	
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td align="left" class="subtitle">등록 리스트</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<table class="" cellpadding="10" align="" id="chRow" cellspacing="0" border="1" width="40%" style="text-align:center; border-collapse:collapse;">
							<thead>
								<tr align="center" height="25px">
									<th>심리상담</th>
									<th>
										대면:<input type="checkbox" id="CHANNEL_100001_METHOD-100433" class="sub_100001">
										전화:<input type="checkbox" id="CHANNEL_100001_METHOD-100434" class="sub_100001">
										게시판:<input type="checkbox" id="CHANNEL_100001_METHOD-100435" class="sub_100001">
									</th>
									<th>
										<input type="checkbox" id="CHANNEL-100001">
									</th>
								</tr>
				            </thead>
							<tbody>
								<c:forEach var="list" items="${category_100001}">
									<tr align="center" height="30px">
										<td style="background-color:#BDBDBD"></td>
										<td>${list.categoryNm}</td>
										<td>
											
											<input type="checkbox" id="CHANNEL_100001_SUB-${list.categoryCd}" class="sub_100001" <c:if test="${list.dispYn eq 'Y'}">checked</c:if>>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<thead>
								<tr align="center" height="25px">
									<th>법률/세무상담</th>
									<th>
										대면:<input type="checkbox" id="CHANNEL_100002_METHOD-100433" class="sub_100002">
										전화:<input type="checkbox" id="CHANNEL_100002_METHOD-100434" class="sub_100002">
										게시판:<input type="checkbox" id="CHANNEL_100002_METHOD-100435" class="sub_100002">
									</th>
									<th>
										<input type="checkbox" id="CHANNEL-100002">
									</th>
								</tr>
				            </thead>
							<tbody>
								<c:forEach var="list" items="${category_100002}">
									<tr align="center" height="30px">
										<td style="background-color:#BDBDBD"></td>
										<td>${list.categoryNm}</td>
										<td>
											<input type="checkbox" id="CHANNEL_100002_SUB-${list.categoryCd}"  class="sub_100002" <c:if test="${list.dispYn eq 'Y'}">checked</c:if>>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<thead>
								<tr align="center" height="25px">
									<th>재무상담</th>
									<th>
										대면:<input type="checkbox" id="CHANNEL_100003_METHOD-100433" class="sub_100003">
										전화:<input type="checkbox" id="CHANNEL_100003_METHOD-100434" class="sub_100003">
										게시판:<input type="checkbox" id="CHANNEL_100003_METHOD-100435" class="sub_100003">
									</th>
									<th>
										<input type="checkbox" id="CHANNEL-100003">
									</th>
								</tr>
				            </thead>
							<tbody>
								<c:forEach var="list" items="${category_100003}">
									<tr align="center" height="30px">
										<td style="background-color:#BDBDBD"></td>
										<td>${list.categoryNm}</td>
										<td>
											<input type="checkbox" id="CHANNEL_100003_SUB-${list.categoryCd}"  class="sub_100003" <c:if test="${list.dispYn eq 'Y'}">checked</c:if>>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</td>
				</tr>
				<tr>
					<td height="30px"></td>
				</tr>
				
			</table>
			
		</td>
	</tr>
</table>
<div id="viewlayout" onmouseOver="this.style.display='block'" onMouseOut="this.style.display='none'" style="display:none; position:fixed;"></div>
</body>
</html>

