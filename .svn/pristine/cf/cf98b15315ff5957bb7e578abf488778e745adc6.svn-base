<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<script>
j$(document).ready(function(){
	
	j$("#searchBtn").click(function(){
		var params = {};
		params.clientNm = j$("#searhContext").val();
		dataSearch(params);
	});
	
	j$("#searchAllBtn").click(function(){
		dataSearch();
	});
	
});

j$(document).on('click','.choiceBar', function(){
	
	var value0 = j$(this).children("td:eq(0)").text();
	var value1 = j$(this).children("td:eq(1)").text();
	
	j$('.popupClientCd').val(value0);
	j$('.popupClientNm').val(value1);
	j$('.popupClientInfo').val(value1 + "(" + value0 + ")");
	
	
	/** 레이어창 닫기 */
	$('body').css({overflow:'visible'});
	$("#mindClientList").parent().fadeOut();
	$("#mindClientList").parent().remove();
	return false;
});

j$(document).on('mouseenter', '.choiceBar', function(){
	j$(this).css({'background-color':'#E1E1E1','cursor':'pointer'});
});
j$(document).on('mouseout', '.choiceBar', function(){
	j$(this).css('background-color','white');
});

function dataSearch(params) {
	j$.ajax({
		url: '/madm/layerPopup/clientListPopup',
		data: params,
		dataType: 'json',
		type: 'GET',
		success: function(data, textStatus){
			var strData = "";
			j$.each(data.clientList, function(i, clientList){
				strData += "<tr class='clintListTrData choiceBar' align='left' height='30px'>";
				strData += "<td class='line' width='50px' align='center' >"+ clientList.clientCd +"</td>";
				strData += "<td class='line' width='50px' align='center' >"+ clientList.clientNm +"</td>";
			});
			j$(".clintListTrData").remove();
			j$('#clientListPopup > colgroup').after(strData);
		}
	});
}
</script>


<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left">
			<span style="display:inline-block; font-size:11pt;padding-left:34px;padding-right:34px;padding-top:5px;padding-bottom:5px; border:1px solid black; ">고객사명</span>
			<input id="searhContext" type="text" maxlength="30" style="width:200px;height:24px;"/>
			<input id="searchBtn"  type="button" style="height:30px;width:50px;" value="검색"/>
			<input id="searchAllBtn"  type="button" style="height:30px;width:50px;" value="전체"/>
		</td>
	</tr>
</table>
<br>
<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse;width:583px;" >
	<colgroup>
          <col width="30%"></col>
          <col width="70%"></col>
	</colgroup>
	<tr align="left" height="30px">
		<td class="line" width="47px" align="center" bgcolor="#F5F5F5">고객사코드</td>
    	<td class="line" align="center" bgcolor="#F5F5F5">고객사명</td>
	</tr>
</table>
<div style="overflow-x: hidden; overflow-y: scroll; height:200px; width:600px;">
<table id="clientListPopup" cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse;width:583px;" >
	<colgroup>
          <col width="30%"></col>
          <col width="70%"></col>
	</colgroup>
	<c:forEach var="list"  items="${ clientList }" varStatus="status">
		<tr class="clintListTrData choiceBar" align="left" height="30px" >
			<td class="line" width="48px" align="center" >${list.clientCd}</td>    	
	    	<td class="line" align="center" >${list.clientNm}</td>
		</tr>
	</c:forEach>
</table>
</div>
