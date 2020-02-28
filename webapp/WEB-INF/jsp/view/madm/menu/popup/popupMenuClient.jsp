<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<script>
j$(document).ready(function(){
	j$("#clientSearchBtn").click(function(){
		var params = {};
		params.menuSeq = '${menuSeq}';
		params.menuGroup = '${menuGroup}';
		params.clientNm = j$("#clientNm").val();
		getClientList(params);
	});
	
	j$("#clientAllBtn").click(function(){
		var params = {};
		params.menuSeq = '${menuSeq}';
		params.menuGroup = '${menuGroup}';
		getClientList(params);
	});
	
	j$("#clinetAddBtn").click(function(){
		$.divPop("clientDetail", "고객사 정보", "/madm/menu/getClientDetail/layerPopup?menuSeq=" + '${menuSeq}' + "&menuGroup=" + '${menuGroup}' );
	});
	
	
	
});

function clientDetail(clientCd) {
	$.divPop("clientDetail", "고객사 정보", "/madm/menu/getClientDetail/layerPopup?menuSeq=" + '${menuSeq}' + "&menuGroup=" + '${menuGroup}' + "&clientCd=" + clientCd);
}



function getClientList(params) {
	j$.ajax({
		url: '/madm/menu/getClientList/layerPopup',
		data: params,
		dataType: 'json',
		type: 'GET',
		success: function(data, textStatus){
			var strData = "";
			j$.each(data.clientList, function(i, clientList){
				strData += "<tr class='popupMenuClientTrData' align='left' height='30px'>";
				strData += "<td class='line' width='50px' align='center' ><a href='#' onclick=clientDetail('"+clientList.clientCd+"');>"+ clientList.clientCd +"</a></td>";
				strData += "<td class='line' width='50px' align='center' >"+ clientList.clientNm +"</td>";
				strData += "<td class='line' width='50px' align='center' >"+ clientList.payType +"</td>";
				strData += "<td class='line' width='50px' align='center' >"+ clientList.useYn +"</td>";
				strData += "<td class='line' width='50px' align='center' >"+ clientList.dispYn +"</td>";
			});
			j$(".popupMenuClientTrData").remove();
			j$('#popupMenuClientTable > colgroup').after(strData);
		}
	});
}
</script>

<input type="hidden" id="menuSeq" value="${menuSeq}" />
<input type="hidden" id="menuGroup" value="${menuGroup}" />

<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left">
			<span style="display:inline-block; font-size:11pt;padding-left:34px;padding-right:34px;padding-top:5px;padding-bottom:5px; border:1px solid black; ">고객사명</span>
			<input id="clientNm" name="clientNm" type="text" maxlength="30" style="width:200px;height:24px;"/>
			<input id="clientSearchBtn"  type="button" style="height:30px;width:50px;" value="검색"/>
			<input id="clientAllBtn"  type="button" style="height:30px;width:50px;" value="전체"/>
			<input id="clinetAddBtn"   type="button" style="height:30px;width:100px;" value="고객사등록"/>
		</td>
	</tr>
</table>
<br>
<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse;width:583px;" >
	<colgroup>
          <col width="20%"></col>
          <col width="30%"></col>
          <col width="30%"></col>
          <col width="10%"></col>
          <col width="10%"></col>
	</colgroup>
	<tr align="left" height="30px">
		<td class="line" width="47px" align="center" bgcolor="#F5F5F5">고객사코드</td>
		<td class="line" align="center" bgcolor="#F5F5F5">고객사명</td>
    	<td class="line" align="center" bgcolor="#F5F5F5">결제수단</td>
    	<td class="line" align="center" bgcolor="#F5F5F5">사용여부</td>
    	<td class="line" align="center" bgcolor="#F5F5F5">노출여부</td>
	</tr>
</table>
<div style="overflow-x: hidden; overflow-y: scroll; height:200px; width:600px;">
<table id="popupMenuClientTable" cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse;width:583px;" >
	<colgroup>
          <col width="20%"></col>
          <col width="30%"></col>
          <col width="30%"></col>
          <col width="10%"></col>
          <col width="10%"></col>
	</colgroup>
	<c:forEach var="list"  items="${ clientList }" varStatus="status">
		<tr class="popupMenuClientTrData" align="left" height="30px" >
			<td class="line" width="48px" align="center" ><a href='#' onclick="clientDetail('${list.clientCd}');">${list.clientCd}</a></td>
			<td class="line" align="center" >${list.clientNm}</td>    	
	    	<td class="line" align="center" >${list.payType}</td>
	    	<td class="line" align="center" >${list.useYn}</td>
	    	<td class="line" align="center" >${list.dispYn}</td>
		</tr>
	</c:forEach>
</table>
</div>
