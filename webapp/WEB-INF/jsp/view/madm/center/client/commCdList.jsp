<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>고객사 공통코드 관리</title>
<script type="text/javascript">
j$(document).ready(function(){
	
	clientReload('sel');
	
	j$("#insertBtn").click(function(){
		j$.divPop('insertCommCdPop', "공통코드 신규등록", j$("#insertCommCdPopup"));
		j$("#popClientCd").val(j$("#clientCd").val());
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
	
	j$("#popInsertBtn").click(function(){
		alert(1);
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

function highCommCdChange(){
	var highDept = $("#highCommCd option:selected").attr("opCd");
	var hihgNm = $("#highCommCd option:selected").attr("hihgNm");
	$("#showOptionCd").val(hihgNm + " (" + highDept + ")");
}
</script>
</head>d
<body>

<form id="frm" action="/madm/client/commCdList">
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
		    	<td align="left" class="subtitle">고객사 공통코드 관리</td>
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
			
			<tr align="left" height="30px">
				<td width="15%" bgcolor="#F5F5F5" align="center"><strong>유형</strong></td>
		    	<td colspan="3" align="left">
		    		<input type="radio" <c:if test="${empty clientDto.optionCd}"> checked </c:if> name="optionCd" id="sel00" value=""> <label for="sel00">전체</label>
		    		<input type="radio" <c:if test="${clientDto.optionCd eq '소속1' }"> checked </c:if> name="optionCd" id="sel01" value="소속1" style="margin-left: 20px;"> <label for="sel01">소속1</label>
		    		<input type="radio" <c:if test="${clientDto.optionCd eq '소속2' }"> checked </c:if> name="optionCd" id="sel02" value="소속2" style="margin-left: 20px;"> <label for="sel02">소속2</label>
		    		<input type="radio" <c:if test="${clientDto.optionCd eq '소속3' }"> checked </c:if> name="optionCd" id="sel03" value="소속3" style="margin-left: 20px;"> <label for="sel03">소속3</label>
		    		<input type="radio" <c:if test="${clientDto.optionCd eq '소속4' }"> checked </c:if> name="optionCd" id="sel04" value="소속4" style="margin-left: 20px;"> <label for="sel04">소속4</label>
		    		<input type="radio" <c:if test="${clientDto.optionCd eq '직급' }"> checked </c:if> name="optionCd" id="sel05" value="직급" style="margin-left: 20px;"> <label for="sel05">직급</label>
		    		<input type="radio" <c:if test="${clientDto.optionCd eq '재직상태' }"> checked </c:if> name="optionCd" id="sel06" value="재직상태" style="margin-left: 20px;"> <label for="sel06">재직상태</label> 
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
							<td align="left" width="86%"></td>
							<c:if test="${not empty clientDto.clientCd }">
								<td id="btn02" ><a href="javascript:void(0);"><span id="insertBtn">신규등록</span></a></td>
								<td id="btn02" ><a href="javascript:void(0);"><span id="modifyBtn">조회/수정</span></a></td>
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
			                  <th width="20%">상위코드</th>
			                  <th width="20%">코드명</th>
			                  <th width="25%">설명</th>
			                  <th width="15%">옵션코드명</th>
			                  <th width="10%">사용여부</th>
			                </tr>
			            </thead>

						<tbody>
						<c:forEach var="list" items="${commCdList}">
							<c:choose>
								<c:when test="${list.highCommCd eq '-1' }">
									<tr style="border: 1.5px solid black;">
										<th>${list.commCd}</th>
										<th>${list.highCommNm}(${list.highCommCd})</th>
										<th>${list.commNm}</th>
										<th>${list.commDesc}</th>
										<th>${list.optionCd}</th>
										<th>${list.useYn}</th>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td>${list.commCd}</td>
										<td>${list.highCommNm}(${list.highCommCd})</td>
										<td>${list.commNm}</td>
										<td>${list.commDesc}</td>
										<td>${list.optionCd}</td>
										<td>${list.useYn}</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
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
<div id="insertCommCdPopup" style="display: none; overflow: scroll;" >
	<table cellpadding="0" align="left" cellspacing="0" border="0" width="800px" height="100px">
		<tr>
			<td height="10px">
				<input type="hidden" id="setValue" value="">
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="5" cellspacing="5" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<tr height="50px">
						<th width="15%">고객사코드</th>
						<td width="75%" colspan="3"> <input type="text" name="clientCd" id="popClientCd" readonly="readonly" style="width:200px;"> </td>
					</tr>
					<tr height="50px">
						<th width="15%">상위코드</th>
						<td width="35%">
							<select name="highCommCd" id="highCommCd" onchange="highCommCdChange();" style="width:200px; height:25px;">
								<option value=""> - 선 택 - </option>
								<c:forEach var="list" items="${popCommCdList}">
									<option value="${list.commCd }" opCd="${list.optionCd }" hihgNm="${list.highCommNm }"> ${list.commNm } </option>
								</c:forEach>
							</select>
						</td>
						<th width="15%">상위코드<br>소속구분</th>
						<td width="35%"> <input type="text" name="showOptionCd" id="showOptionCd" readonly="readonly" style="width:96%;"> </td>
					</tr>
					<tr height="50px">
						<th>공통코드명</th>
						<td> <input type="text" name="commNm" id="commNm" style="width:96%;"> </td>
						<th>옵션코드명<br>(소속구분)</th>
						<td> 
							<select name="optionCd" id="optionCd" style="width:200px; height:25px;">
								<option value=""> - 선 택 - </option>
								<option value="포인트 항목">포인트 항목</option>
								<option value="재직상태">재직상태</option>
								<option value="소속1">소속1</option>
								<option value="소속2">소속2</option>
								<option value="소속3">소속3</option>
								<option value="소속4">소속4</option>
							</select>
						</td>
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
				<input type="button" id="popInsertBtn" value="저장">
			</td>
		</tr>
	</table>
</div>
</form>

<form id="frm" action="/madm/client/">
<div id="modifyCommCdPopup" style="display: none; overflow: scroll;" >
	<table cellpadding="0" align="left" cellspacing="0" border="0" width="800px" height="100px">
		<tr>
			<td height="10px">
				<input type="hidden" id="setValue" value="">
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="5" cellspacing="5" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<tr height="50px">
						<th width="15%">고객사코드</th>
						<td width="75%" colspan="3"> <input type="text" name="clientCd" id="" readonly="readonly" style="width:200px;"> </td>
					</tr>
					<tr height="50px">
						<th width="15%">상위코드</th>
						<td width="35%">
							<select name="highCommCd" id="highCommCd" onchange="highCommCdChange();" style="width:200px; height:25px;">
								<option value=""> - 선 택 - </option>
								<c:forEach var="list" items="${popCommCdList}">
									<option value="${list.commCd }" opCd="${list.optionCd }" hihgNm="${list.highCommNm }"> ${list.commNm } </option>
								</c:forEach>
							</select>
						</td>
						<th width="15%">상위코드<br>소속구분</th>
						<td width="35%"> <input type="text" name="showOptionCd" id="showOptionCd" readonly="readonly" style="width:96%;"> </td>
					</tr>
					<tr height="50px">
						<th>공통코드명</th>
						<td> <input type="text" name="commNm" id="commNm" style="width:96%;"> </td>
						<th>옵션코드명<br>(소속구분)</th>
						<td> 
							<select name="optionCd" id="optionCd" style="width:200px; height:25px;">
								<option value=""> - 선 택 - </option>
								<option value="포인트 항목">포인트 항목</option>
								<option value="재직상태">재직상태</option>
								<option value="소속1">소속1</option>
								<option value="소속2">소속2</option>
								<option value="소속3">소속3</option>
								<option value="소속4">소속4</option>
							</select>
						</td>
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
				<input type="button" id="popModifyBtn" value="저장">
			</td>
		</tr>
	</table>
</div>
</form>

</body>
</html>

