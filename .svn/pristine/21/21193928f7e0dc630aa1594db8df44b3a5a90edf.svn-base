<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>

<script>
j$(document).ready(function(){

	j$("#partnerNmBtn").click(function(){
		var params = {};
		params.partnerNm = j$("#partnerNm").val();
		AjaxPartnerCodePopup(params);
	});

	j$("#partnerNmAllBtn").click(function(){
		//InputBox clear
		j$("#partnerNm").val('');
		AjaxPartnerCodePopup();
	});



});

j$(document).on('click','.choiceBar', function(){
	var menuCd = j$(this).children("td:eq(0)").text();
	var menuNm = j$(this).children("td:eq(1)").text();
	var menuUrl = j$(this).children("td:eq(2)").text();

	var callBackFucntion = j$(".divPopupContentLayer").attr("id");
	eval(callBackFucntion +
			"('" + menuCd + "','" + menuNm + "','" + menuUrl + "')"
		);
	j$('.btClose').trigger('click');

	/*
	j$('#partnerCdView').val(sl);
	j$("#partnerCd").val(sl.substring(1,6));
	j$('.btClose').trigger('click');
	*/
});

j$(document).on('mouseenter', '.choiceBar', function(){
	j$(this).css({'background-color':'#E1E1E1','cursor':'pointer'});
});
j$(document).on('mouseout', '.choiceBar', function(){
	j$(this).css('background-color','white');
});

function AjaxPartnerCodePopup(params) {
	j$.ajax({
		url: '/madm/layerPopup/searchPartnerCode',
		data: params,
		dataType: 'json',
		type: 'GET',
		success: function(data, textStatus){
			var strData = "";
			j$.each(data.partnerInfoList, function(i, partnerInfoList){
				strData += "<tr class='trData choiceBar' align='left' height='30px'>";
				strData += "<td class='line' align='center' >"+ (i+1) +"</td>";
				strData += "<td class='line' align='center' >"+ partnerInfoList.partnerNm +"</td>";
				strData += "<td class='line' align='left' >"+ partnerInfoList.serviceType + partnerInfoList.partnerCd +"</td>";
			});
			j$(".trData").remove();
			j$('#partnerCodePopupTable2 > colgroup').after(strData);
		}
	});
}
</script>


<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left">
			<span style="display:inline-block; font-size:11pt;padding-left:34px;padding-right:34px;padding-top:5px;padding-bottom:5px; border:1px solid black; ">사업자명</span>
			<input id="partnerNm" name="partnerNm" type="text" maxlength="30" style="width:200px;height:24px;"/>
			<input id="partnerNmBtn"  name="partnerNmBtn" type="button" style="height:30px;width:50px;" value="검색"/>
			<input id="partnerNmAllBtn"  name="partnerNmAllBtn" type="button" style="height:30px;width:50px;" value="전체"/>
		</td>
	</tr>
</table>
<br>
<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse;width:833px;" >
	<colgroup>
		<col width="10%"></col>
		<col width="30%"></col>
		<col width="60%"></col>
	</colgroup>
	<tr align="left" height="30px">
		<td class="line" width="47px" align="center" bgcolor="#F5F5F5">메뉴코드</td>
    	<td class="line" align="center" bgcolor="#F5F5F5">메뉴명</td>
    	<td class="line" align="center" bgcolor="#F5F5F5">메뉴URL</td>
	</tr>
</table>
<div style="overflow-x: hidden; overflow-y: scroll; height:400px; width:850px;">
<table id="partnerCodePopupTable2" cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse;" width="100%">
	<colgroup>
		<col width="10%"></col>
		<col width="30%"></col>
		<col width="60%"></col>
	</colgroup>
	<c:forEach var="list"  items="${ menuCdList }" varStatus="status">
		<tr class="trData choiceBar" align="left" height="30px" >
			<td class="line" width="48px" align="center" >${list.menuCd}</td>
	    	<td class="line" align="center" >${list.menuNm}</td>
	    	<td class="line" align="left" >${list.menuUrl}</td>
		</tr>
	</c:forEach>
</table>
</div>
