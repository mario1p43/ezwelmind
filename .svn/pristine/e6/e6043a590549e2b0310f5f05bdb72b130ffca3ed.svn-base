<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사 직급코드 관리</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	clientReload('sel');
	
	j$("#insertBtn").click(function(){
		j$.divPop('gradeCdPop', "고객사 직급코드 관리", j$("#gradeCdPopup"));
		j$("#popClientCd").val(j$("#clientCd").val());
		j$("#modiType").val("insert");
		return false;
	});

	j$("#modifyBtn").click(function(){
		j$.divPop('modifyCommCdPop', "공통코드 조회/수정", j$("#modifyCommCdPopup"));
		return false;
	});
	
	j$("#searchBtn").click(function(){
		if(j$("#clientCd").val() == ""){
			alert("고객사를 선택하세요.");
			return;
		}
		
		j$("#frm").submit();		
	});
	
	j$(".modifyUseYn").click(function(){
		var params = {};
		var commCd = j$(this).attr("commCd");
		var useYn  = j$(this).attr("useYn");
		var clientCd  = j$(this).attr("clientCd");

		if(useYn == "Y"){
			useYn = "N";
		}else if(useYn == "N"){
			useYn = "Y";
		}

		params.commCd = commCd;
		params.useYn  = useYn;
		params.clientCd  = clientCd;

		if(confirm("사용여부를 변경 하시겠습니까?")){
			j$.ajax({
				url: '/madm/client/ajaxModifyGradeCdUseYn',
				data: params,
				dataType: 'json',
				type: 'POST',
				cache:true,
				success: function(data, textStatus){
					window.location.reload();
				}
			});
		}

		return false;
	});
	
	j$(".modifyGradeCd").click(function(){
		j$.divPop('gradeCdPop', "고객사 직급코드 관리", j$("#gradeCdPopup"));
		j$("#popClientCd").val(j$("#clientCd").val());
		j$("#commCd").val(j$(this).attr("commCd"));
		j$("#commNm").val(j$(this).attr("commNm"));
		j$("#commDesc").val(j$(this).attr("commDesc"));
		j$("#modiType").val("update");
		return false;
	});
});

function clientReload(setType){
	if(setType == "sel"){
		var tempClientCd = $("#clientCd option:selected").val();
		if(tempClientCd == "") return;
		var tempClientNm = $("#clientCd option:selected").text();
		$("#chkClientCd").val(tempClientNm);
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

function popModify(){
	
	var clientCd = j$("#popClientCd").val();
	var commNm = j$("#commNm").val();
	var commDesc = j$("#commDesc").val();

	var params = {};
	params.clientCd = clientCd;
	params.commNm = commNm;
	params.commDesc = commDesc;
	params.commCd = j$("#commCd").val();
	params.highCommCd = j$("#highCommCd").val();
	params.modiType = j$("#modiType").val();
	
	if(clientCd == ""){
		alert("고객사코드는 필수 입력값 입니다.");
		j$("#popClientCd").focus();
		return false;
	}
	
	if(commNm == ""){
		alert("직급명을 입력해주세요.");
		j$("#commNm").focus();
		return false;
	}	
	
	$.ajax({
		url: '/madm/client/modifyGradeCd',
		data: params,
		dataType: 'json',
		type: 'POST',
		cache:true,
	    success: function(data) {
			window.location.reload(true); // 페이지 새로고침
	    } // end success
	}); 
	
}

</script>
</head>
<body>

<form id="frm" action="/madm/client/gradeCdList">
<table cellpadding="0" cellspacing="0" border="0" width="95%">
<tr>
	<td height="20px">
		<input type="hidden" name="serviceType" id="serviceType" value="${serviceType }">
		<input type="hidden" name="bbsCd" id="bbsCd" value="${bbsCd }">
	</td>
</tr>

<tr>
	<td>
		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">고객사 직급코드 관리</td>
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
		    			</tr>
		    		</table>
		    	</td>
			</tr>
		</table>
		<!-- 버튼 영역 종료 -->
	</td>
</tr>

<tr>
	<td>
		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
						<tr>
							<c:if test="${not empty clientDto.clientCd }">
								<td id="btn02" align="left"><a href="javascript:void(0);"><span id="insertBtn">신규등록</span></a></td>
							</c:if>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 채널 정보 시작 -->
					<table class="" cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="100%" style="text-align:center; border-collapse:collapse;">
						<thead>
			                <tr>
			                  <th width="10%">공통코드</th>
			                  <th width="20%">직급명</th>
			                  <th width="25%">설명</th>
			                  <th width="15%">옵션코드명</th>
			                  <th width="10%">사용여부</th>
			                </tr>
			            </thead>

						<tbody>
						
							<c:choose>
								<c:when test="${not empty commCdList }">
									<c:forEach var="list" items="${commCdList}">
										<tr>
											<td>
												<a href="javascript:void(0);" class="modifyGradeCd" commCd="${list.commCd}" commNm="${list.commNm }" commDesc="${list.commDesc }">
													<span style="color: blue;">${list.commCd}</span>
												</a>
											</td>
											<td>${list.commNm}</td>
											<td>${list.commDesc}</td>
											<td>${list.optionCd}</td>
											<td>
												<a href="javascript:void(0);" class="modifyUseYn" commCd="${list.commCd}" useYn="${list.useYn}" clientCd="${list.clientCd }">${list.useYn}
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr><td colspan="5">검색 결과가 없습니다. 신규등록 버튼을 클릭하여 새로 등록하세요.</td></tr>
								</c:otherwise>
							</c:choose>
					
						</tbody>
					</table>
					</div>
					<br>
					<table cellpadding="2" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
						<tr>
							<td align="center">
							</td>
						</tr>
					</table>
					<!-- 채널 정보 종료 -->
				</td>
			</tr>
		</table>
		<!-- 채널 영역 종료 -->
	</td>
</tr>
</table>
</form>

<form id="frm" action="/madm/client/">
	<input type="hidden" name="commCd" id="commCd" value="" >
	<input type="hidden" name="highCommCd" id="highCommCd" value="100006" >
	<input type="hidden" name="modiType" id="modiType" value="" >
	<div id="gradeCdPopup" style="display: none; overflow: scroll;" >
		<table cellpadding="0" align="left" cellspacing="0" border="0" width="800px" height="100px">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="5" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr height="50px">
							<th width="15%">고객사코드</th>
							<td width="75%" colspan="3"> <input type="text" name="clientCd" id="popClientCd" readonly="readonly" style="width:200px;"> </td>
						</tr>
						<tr height="50px">
							<th>직급명</th>
							<td> <input type="text" name="commNm" id="commNm" style="width:96%;"> </td>
						</tr>
						<tr height="50px">
							<th>공통코드 설명</th>
							<td colspan="3"> <input type="text" name="commDesc" id="commDesc" style="width:99%;"> </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td align="center" width="100%">
					<input type="button" id="popInsertBtn" onclick="popModify();" value="저장">
				</td>
			</tr>
		</table>
	</div>
</form>

</form>

</body>
</html>

