<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>금액설정</title>
<script type="text/javascript">
j$(document).ready(function(){
	//고객사 예산 설정
	setbudget();
	
	// 상담유형 rowspan
	// rows value get
	/* for (var i=pTlb_r.rows.length-1; i>0; i--) {
	  var o_tr=pTlb_r.rows(i);
	  var o_tr2=pTlb_r.rows(i-1);
	
	  // cells valus get
	  var o_td=o_tr.cells(0);
	  var o_td2=o_tr2.cells(0);
	
	  if (o_td.innerText==o_td2.innerText) {
	    o_td2.rowSpan+=o_td.rowSpan;
	    o_td.removeNode(true);
	  }
	} */
	 
	//display on/off 
	if($('#searchClientCd').val()){
		bTlb_m.style.display = "";
		bTlb_r.style.display = "";
		pTlb_m.style.display = "";
		pTlb_r.style.display = "";
		pbtn.style.display = "";
	}else{
		bTlb_m.style.display = "none";
		bTlb_r.style.display = "none";
		pTlb_m.style.display = "none";
		pTlb_r.style.display = "none";
		pbtn.style.display = "none";
	} 
	
	
	
	$(".onlyNumber").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$(".price").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	j$("#allBtn").click(function(){
		j$(".price").val(j$("#basePrice").val());		
	});
	
	
	j$(".insBtn").click(function(){
		if(j$("#searchClientNm").val() == null){
			alert("고객사명/코드 정보가 올바르지 않습니다.");
			return;
		}
		if(j$("#tbudget").val() == ""){
			alert("가용예산 정보를 입력하셔야 합니다.");
			return;
		}
		if(j$("#rbudget").val() == ""){
			alert("예비비 정보를 입력하셔야 합니다.");
			return;
		}
		var c = j$("#count").val();	
		for(var i=0; i<c; i++){
			var j=100005+i;

			if(j$("#iprice"+j).val() == ""){
				alert("상담/검사 비용 설정(대면) 정보를 입력하셔야 합니다.");
				return;
			}
			if(j$("#tprice"+j).val() == ""){
				alert("상담/검사 비용 설정(전화) 정보를 입력하셔야 합니다.");
				return;
			}
			if(j$("#bprice"+j).val() == ""){
				alert("상담/검사 비용 설정(1:1게시판) 정보를 입력하셔야 합니다.");
				return;
			}
		}
		
				
		j$("#amountListForm").attr("action","/madm/operations/setbudget");
		j$("#amountListForm").submit();		
	});
	
});

function getSelectValue()
{
	//고객사 코드 입력
	$('#searchClientCd').val($('#searchClientNm option:selected').val());
	//일괄 입력값 비우기
	j$("#basePrice").val("");
	j$("#tbudget").val("");
	j$("#rbudget").val("");
	j$("#amountListForm").submit();
}

function getTextValue()
{	
	var cd = $('#searchClientCd').val();
	$("#searchClientNm").val(cd).attr("selected", "selected");
	
	$.ajax({
		url: "/madm/operations/checkClientCd",
		data:"&searchClientCd="+ $('#searchClientCd').val(),
		dataType: 'json',
		success: function (response) {
			var cc = response.countCd;
			if(cc>0){
				j$("#basePrice").val("");
				j$("#tbudget").val("");
				j$("#rbudget").val("");
				j$("#amountListForm").submit();
			}else{
				alert("입력하신 고객사 코드가 존재하지 않습니다.");	
			}
		}
	});
}

function setbudget(){
	if($('#searchClientCd').val() != ""){
		$.ajax({
			url: "/madm/operations/getbudget",
			data:"&clientCd="+ $('#searchClientCd').val(),
			dataType: 'json',
			success: function (response) {
				var bd = response.budget;
				$("#tbudget").val(bd.assignBudget);
				$("#rbudget").val(bd.reBudget);
			}
		});
		
	}
	
}

</script>
</head>
<body>
<form id="amountListForm" action="/madm/operations/amount" method="POST">
<input type="hidden" id="count" name="count" value="${amountcount }" />

<table cellpadding="0" align="left" cellspacing="0" border="0" width="95%">
	<tr>
		<td>
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td height="20px"></td>
					</tr>
					<tr>
						<td align="left" class="subtitle">금액설정</td>
					</tr>
					<tr>
						<td height="10px"></td>
					</tr>
				</table>
			
				<tr>
					<td>
						<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>고객사명</strong></td>
						    	<td align="left">
						    		<select id="searchClientNm" name="searchClientNm" onChange="getSelectValue();">
						    			<option value="">고객사를 선택하세요</option>
						    			<c:forEach var="list" items="${emplist}" varStatus="status">
						    				<option value="${list.clientCd}" ${param.searchClientNm == list.clientCd  ? 'selected':''}>${list.clientNm}</option>
										</c:forEach>
						    		</select>
						    	</td>
						    	<td bgcolor="#F5F5F5" align="center"><strong>고객사코드</strong></td>
						    	<td><input type="text" id="searchClientCd" name="searchClientCd" onChange="getTextValue();" value="${param.searchClientCd }" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<table id="bTlb_m" cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td height="20px"></td>
					</tr>
					<tr>
						<td align="left" class="subtitle">고객사 예산 설정</td>
					</tr>
					<tr>
						<td height="10px"></td>
					</tr>
				</table>
				
				<tr>
					<td>
						<table id="bTlb_r" cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
							<tr align="left" height="30px">
								<td bgcolor="#F5F5F5" align="center"><strong>가용예산</strong></td>
						    	<td align="left">
						    	<input type="text" id="tbudget" name="tbudget" class="onlyNumber" value="${param.tbudget }" />원
						    	</td>
						    	<td bgcolor="#F5F5F5" align="center"><strong>예비비</strong></td>
						    	<td><input type="text" id="rbudget" name="rbudget" class="onlyNumber" value="${param.rbudget }" />원</td>
							</tr>
							<tr>
								<td colspan="4"><span>* 가용예산 설정 : 상담포유에서 사용하는 전체 회사포인트로 잔여 % 비율을 나타내기 위한 금액입니다.</span></td>
							</tr>
							<tr>
								<td colspan="4"><span>* 예비비 설정 : 전체 회사 포인트 이용이 끝난 상태에서 추가비용이 발생할 떄 정산문제를 해결하기 위한 금액입니다.</span></td>
							</tr>
						</table>
					</td>
				</tr>
				

				
				<table id="pTlb_m"cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td height="20px"></td>
					</tr>
					<tr>
						<td align="left" class="subtitle">상담/검사 비용 설정</td>
						<td align="right"><input type="text" class="onlyNumber" id="basePrice"> </td>
						<td align="right" width="5%"><input type="button" id="allBtn" value="일괄입력"> </td>
					</tr>
					<tr>
						<td height="10px"></td>
					</tr>
				</table>
				
				<table id="pTlb_r" cellpadding="5" align="" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="center" height="50px">
						<th >상담유형</th>
						<th >상담분야</th>
						<th >대면상담</th>
						<th >전화상담</th>
						<th >1:1 게시판 상담</th>
					</tr>
					
					<c:forEach var="list" items="${amountlist}" varStatus="status">
						<tr align="center" height="30px">
						<c:choose>
							<c:when test="${list.highCategoryCd == 100001}">
								<td >심리</td>
							</c:when>
							<c:when test="${list.highCategoryCd == 100002}">
								<td >법률</td>
							</c:when>
							<c:when test="${list.highCategoryCd == 100003}">
								<td >재무</td>
							</c:when>
							<c:when test="${list.highCategoryCd == 100004}">
								<td >심리검사</td>
							</c:when>
						</c:choose>
							<td ><input type="hidden" name="categoryCd${list.categoryCd }" value="${list.categoryCd }" /> ${list.categoryNm}</td>
							<td ><input type="text" class="price" id="iprice${list.categoryCd }" name="iprice${list.categoryCd }" value="${list.price01 }" />원</td>
							<td ><input type="text" class="price" id="tprice${list.categoryCd }" name="tprice${list.categoryCd }" value="${list.price02 }" />원</td>
							<td ><input type="text" class="price" id="bprice${list.categoryCd }" name="bprice${list.categoryCd }" value="${list.price03 }" />원</td>
						</tr>
					</c:forEach>
				</table>
						
				<table id="pbtn" cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
					<tr>
						<td align="center" colspan="4">
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
						    		<td id="btn01"><a href="#"><span class="insBtn">저 장</span></a></td>
				    			</tr>
				    		</table>
				    	</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>