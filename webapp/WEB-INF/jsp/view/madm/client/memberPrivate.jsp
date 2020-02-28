<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>서비스 이용목록</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#btnAddItem").click(function() {
			if ($("#privateItems").val() == "") {
				alert("추가할 개인정보관리 리스트를 선택해주세요.");
				$("#privateItems").focus();
				return;
			}
			
			$.ajax({
				url: '/madm/client/addClientSub',
				data: {
						clientCd : '${param.clientCd}',
						gubunType : "MY_PRIVATE",
						dispType : $("#privateItems").val(),
						useYn : "Y",
						dispYn : "Y",
						essenYn : "Y" 
					},
				dataType: 'json',
				type: 'post',
				success: function(data){
					if (data.resultValue == "1") {
						alert("동록이 완료되었습니다.");
						location.reload(true);
					} else {
						alert("등록에 실패하였습니다.");
					}
				}
			});
		});
		
		
		$(".btnRemove").click(function() {
			$.ajax({
				url: '/madm/client/deleteClientSub',
				data: {
						clientCd : '${param.clientCd}',
						gubunType : "MY_PRIVATE",
						dispType : $(this).attr("key") 
					},
				dataType: 'json',
				type: 'post',
				success: function(data){
					if (data.resultValue == "1") {
						alert("삭제가 완료되었습니다.");
						location.reload(true);
					} else {
						alert("삭제에 실패하였습니다.");
					}
				}
			});
		});
		
		
		$(".btnUpdate").click(function () {
			$.ajax({
				url: '/madm/client/updateClientSub',
				data: {
						clientCd : '${param.clientCd}',
						gubunType : "MY_PRIVATE",
						dispType : $(this).attr("key"),
						essenYn : $(this).prev().val()
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
									<th>메뉴명</th>
									<th>필수여부</th>
									<th>삭제하기</th>
								</tr>
				            </thead>
	
							<tbody>
								<c:forEach var="list" items="${myPrivateList}">
									<c:if test="${not empty list.dispType }">
										<tr align="center" height="30px">
											<td>${list.commNm}</td>
											<td>
												<select>
													<option value="Y" <c:if test="${list.essenYn eq 'Y'}">selected</c:if> >Y</option>
													<option value="N" <c:if test="${list.essenYn eq 'N'}">selected</c:if> >N</option>
												</select>
												<input type="button" class="btnUpdate" key="${list.dispType}" value="수정">
											</td>
											<td>
												<input type="button" class="btnRemove" key="${list.dispType}" value="삭제하기">
											</td>
										</tr>
									</c:if>
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

