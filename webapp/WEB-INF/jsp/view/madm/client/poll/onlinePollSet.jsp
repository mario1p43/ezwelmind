<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>온라인진단 진단자정보</title>
<script type="text/javascript">
j$(document).ready(function(){
	clientReload("sel");
	
	j$("#searchBtn").click(function(){
		if(j$("#clientCd").val() == ""){
			alert("고객사를 선택하세요.");
			return;
		}
		
		j$("#frm").submit();		
	});
	
	$("#btnAddItem").click(function() {
		if ($("#onlineItems").val() == "") {
			alert("추가할 진단자정보를 선택해주세요.");
			$("#onlineItems").focus();
			return;
		}
		
		var clientCd = j$("#clientCd").val();
		if(clientCd == ""){
			alert("고객사를 선택하세요.");
			return;
		}
		
		$.ajax({
			url: '/madm/client/addClientSub',
			data: {
					clientCd : clientCd,
					gubunType : "HOME_ONLINE",
					dispType : $("#onlineItems").val(),
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
		var clientCd = j$("#clientCd").val();
		if(clientCd == ""){
			alert("고객사를 선택하세요.");
			return;
		}
		
		$.ajax({
			url: '/madm/client/deleteClientSub',
			data: {
					clientCd : clientCd,
					gubunType : "HOME_ONLINE",
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
		var clientCd = j$("#clientCd").val();
		if(clientCd == ""){
			alert("고객사를 선택하세요.");
			return;
		}
		
		$.ajax({
			url: '/madm/client/updateClientSub',
			data: {
					clientCd : clientCd,
					gubunType : "HOME_ONLINE",
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
	
	j$('.onlineTargetAddBtn').click(function() {
		
		var clientCd = j$("#clientCd").val();
		if(clientCd == ""){
			alert("고객사를 선택하세요.");
			j$("#clientCd").focus();
			return false;
		}

		location.href = "/madm/clientPoll/onlineTargetAddDetail?clientCd=" + clientCd;
	});
	
}); // end Ready

function clientReload(setType){
	if(setType == "sel"){
		var tempClientCd = $("#clientCd option:selected").val();
		if(tempClientCd == "") return;
		
		console.log(tempClientCd);
		
		var tempClientNm = $("#clientCd option:selected").text();
		$("#chkClientCd").val(tempClientNm);
		
		console.log(tempClientNm);
		
	}else if(setType == "txt"){
		var tempClientCd = $("#chkClientCd").val();
		if(tempClientCd == "") return;
		
		var clientList = new Array();
		<c:forEach var="list" items="${clientList}">
		var arr = { nm : "${list.clientNm}", cd : "${list.clientCd}"};
		clientList.push(arr);
		</c:forEach>
		
		for(var i=0 ; i < clientList.length ; i++){
			var checkClientArr = clientList[i];
			if(checkClientArr.nm.indexOf(tempClientCd) != -1) {
				$("#clientCd").val(checkClientArr.cd);
				break;
			}	
		}
	}
}
</script>
</head>
<body>

<form id="frm" action="/madm/clientPoll/onlinePollSet">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px">
	</td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">온라인진단 진단자정보 관리</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="10px"></td>
</tr>
<tr>
	<td>
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD" >
			<tr align="left" height="30px">
				<td width="15%" bgcolor="#F5F5F5" align="center"><strong>고객사</strong></td>
		    	<td colspan="3" align="left">
		    		<select id="clientCd" name="clientCd" style="width:200px; height:25px;" onchange="clientReload('sel');">
		    			<option value="">---- 선택 ----</option>
		    			<c:forEach var="list" items="${clientList}">
		    				<option value="${list.clientCd }" <c:if test="${list.clientCd eq clientDto.clientCd}"> selected </c:if> >${list.clientNm }</option>
		    			</c:forEach>
		    		</select>
		    		<input type="text" id="chkClientCd" value="${clientDto.clientCd }" onkeyup="clientReload('txt');" style="width:350px; height:25px;" placeholder="고객사명을 입력 또는 선택하세요.">
		    		<span style="color: red;">※ 등록된 고객사만 선택 가능합니다. </span>
		    	</td>
			</tr>
		</table>
		<!-- 검색 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="10px"></td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
			<tr>
				<td align="center" colspan="4">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
				    		<td id="btn01"><a href="javascript:void(0);"><span id="searchBtn">검 색</span></a></td>
				    		<td id="btn01"><a href="javascript:void(0);"><span class="onlineTargetAddBtn">온라인 진단자 등록</span></a></td>
		    			</tr>		    			
		    		</table>
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td height="10px">
		<p><b>
		※ 온라인진단 등록 후 진단자정보 셋팅 하시면 됩니다. (등록은 DR 요청)<br>
		 - 관리자에서 셋팅한 온라인진단 주소는 'www.ezwelmind.com/poll/고객사코드' 입니다. <br>
		 - 소속, 직급은 상담포유 셋팅 값과 연동됩니다. <br>
		</b></p>
	</td>
</tr>

<c:if test="${ not empty clientDto.clientCd }">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td height="20px"></td>
				</tr>
				<tr>
					<td align="left" class="subtitle">등록 (${clientDto.clientCd})</td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td>
						<!-- 검색 영역 시작 -->
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td width="20%" bgcolor="#F5F5F5" align="center">
									<strong>진단자정보 리스트</strong>
								</td>
						    	<td width="14%" align="left">
						    		<select id="onlineItems">
										<option value="">선택해주세요.</option>
										<c:forEach var="list" items="${ onlinePollList }">
											<c:if test="${empty list.dispType }">
												<option value="${list.commCd}">${list.commNm}</option>
											</c:if>
										</c:forEach>
									</select>
						    	</td>
						    	<td id="btn02" align="left" width="auto;"><a href="javascript:void(0)"><span id="btnAddItem">등 록</span></a></td>
							</tr>
						</table>
						<!-- 검색 영역 종료 -->
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
						<table class="" cellpadding="10" align="" id="chRow" cellspacing="0" border="1" width="80%" style="text-align:center; border-collapse:collapse;">
							<thead>
								<tr align="center" height="25px">
									<th width="50%">메뉴명</th>
									<th>필수여부</th>
									<th>삭제하기</th>
								</tr>
				            </thead>
	
							<tbody>
								<c:choose>
									<c:when test="${not empty onlinePollList }">
										<c:forEach var="list" items="${onlinePollList}">
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
									</c:when>
									<c:otherwise>
										<tr align="center" height="30px" colspan="3">
											<td>검색 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
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
</c:if> <!-- end not empty clientDto.clientCd --> 

</table>
</form>

</body>
</html>

