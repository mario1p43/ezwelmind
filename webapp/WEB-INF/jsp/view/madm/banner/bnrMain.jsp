<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>배너채널관리</title>
<script type="text/javascript">
j$(document).ready(function(){

	j$(".corList").click(function(){
		var channelCd = j$(this).attr("id");
		var strData = "";
		var params = {};
		params.channelCd = channelCd;

		j$('#subData').remove();

		j$.ajax({
			url: '/madm/banner/ajaxCornerList',
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,
			success: function(data, textStatus){
				var ListLength = data.cornerList.length;
				if(data.cornerList.length > 0) {
					var rowSpanNum = ListLength +1;

					strData += "<div id='subData'>";

					strData += "<table cellpadding='0' cellspacing='0' border='0' width='100%' align='left' style='overflow-x: scroll; overflow-y: hidden;'>";
					strData += "<tr><td>";
					strData += "<table cellpadding='5' cellspacing='0' border='0' width='95%' style='border-collapse:collapse;'>";
					strData += "<tr align='' height='30px'>";
					strData += "<td align='left'>";
					strData += "<h3>코너관리("+data.chCd+")</h3><input type='hidden' id='chCd' value='"+data.chCd+"'/></td>";
					strData += "</td></tr></table></td></tr>";
					strData += "<tr><td>";

					strData += "<table cellpadding='5' id='corRow' align='left' cellspacing='0' border='1' width='95%' style='border-collapse:collapse;'>";
					strData += "<tr align='' height='50px'>";
					strData += "   <td width='9%' align='center' bgcolor='#F5F5F5'><strong>코너코드</strong></td>";
					strData += "   <td width='24%' align='center' bgcolor='#F5F5F5'><strong>코너명</strong></td>";
					strData += "   <td width='22%' align='center' bgcolor='#F5F5F5'><strong>설명</strong></td>";
					strData += "   <td width='10%' align='center' bgcolor='#F5F5F5'><strong>상품<br>전시수</strong></td>";
					strData += "   <td width='9%' align='center' bgcolor='#F5F5F5'><strong>등록자</strong></td>";
					strData += "   <td width='9%' align='center' bgcolor='#F5F5F5'><strong>등록일시</strong></td>";
					strData += "   <td width='9%' align='center' bgcolor='#F5F5F5'><strong>수정자</strong></td>";
					strData += "   <td width='9%' align='center' bgcolor='#F5F5F5'><strong>수정일시</strong></td>";
					strData += "</tr>";

					j$.each(data.cornerList, function(i, cornerList){
						strData += "<tr class='' align='center'>";
						strData += "   <td class=''>"+cornerList.cornerCd+"</td>";
						strData += "   <td class=''>"+cornerList.cornerNm+"</td>";
						strData += "   <td class=''>"+cornerList.cornerDesc+"</td>";
						strData += "   <td class=''>"+cornerList.dispNum+"</td>";
						strData += "   <td class=''>"+cornerList.regId+"</td>";
						strData += "   <td class=''>"+cornerList.regDt+"</td>";
						strData += "   <td class=''>"+cornerList.modiId+"</td>";
						strData += "   <td class=''>"+cornerList.modiDt+"</td>";
						strData += "</tr>";
					});

					strData += "</table>";
				}else{
					strData += "<div id='subData'>";

					strData += "<table cellpadding='0' cellspacing='0' border='0' width='100%' align='left' style='overflow-x: scroll; overflow-y: hidden;'>";
					strData += "<tr><td>";
					strData += "<table cellpadding='5' cellspacing='0' border='0' width='95%' style='border-collapse:collapse;'>";
					strData += "<tr align='' height='30px'>";
					strData += "<td align='left'>";
					strData += "<h3>코너관리("+data.chCd+")</h3><input type='hidden' id='chCd' value='"+data.chCd+"'/></td>";
					strData += "</td></tr></table></td></tr>";
					strData += "<tr><td>";

					strData += "<tr class='' align='left'>";
					strData += "   <td class='' colspan='8'><table border='1' width='95%' height='150px'><tr><td align='center'><h4>조회 내역이 없습니다.</h></td></tr></table></td>";
					strData += "</tr>";

					strData += "</table>";
				}
				strData += "</table>";
				strData += "</div>";

				j$('#corRow').show();
				j$('#corRow').after(strData);
			}
		});
		return false;
	});
	
	j$("#insertCh").click(function(){
		j$.divPop("addChannel", "채널등록", "/madm/layerPopup/addChannelPopup");
		return false;
	});
	
	j$("#insertCor").click(function(){
		j$.divPop("addCorner", "코너등록", "/madm/layerPopup/addCorner");
		return false;
	});
});
</script>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%">
<tr>
	<td>
		<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td align="left" class="subtitle">배너채널관리</td>
			</tr>
			<tr>
				<td height="10px"></td>
			</tr>
		</table>

		<!-- 채널 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="30%" align="left">
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="95%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr align="" height="30px">
							<td width="30%" align="left">
								<h3>채널관리</h3>
							</td>
							<td width="70%" align="right">
								<input type="button" id="insertCh" 	value="채널등록" />&nbsp;&nbsp;
								<input type="button" id="insertCor" value="코너등록" />
							</td> 
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 채널 정보 시작 -->
					<table cellpadding="5" align="" id="chRow" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
						<tr align="" height="50px">
							<td class="" width="20%" align="center" bgcolor="#F5F5F5"><strong>채널코드</strong></td>
							<td class="" width="40%" align="center" bgcolor="#F5F5F5"><strong>채널명</strong></td>
							<td class="" width="40%" align="center" bgcolor="#F5F5F5"><strong>설명</strong></td>
						</tr>

						<c:forEach var="list" items="${chDetailList}" varStatus="status">
						<tr height="40px" align="center">
							<td class="">${list.channelCd}</td>
							<td class="corList" id="${list.channelCd}"><a href="#"><strong>${list.channelNm}</strong></a></td>
							<td class="">${list.channelDesc}</td>
						</tr>
						</c:forEach>
					</table>
					<!-- 채널 정보 종료 -->
				</td>
			</tr>
		</table>
		<!-- 채널 영역 종료 -->

		<!-- 코너 영역 시작 -->
		<table cellpadding="0" cellspacing="0" border="0" width="70%" align="left" style="overflow-x: scroll; overflow-y: hidden;">
			<tr>
				<td>
					<!-- 채널 정보 시작 -->
					<div id="corRow" style="display: none;"></div>
					<!-- 채널 정보 종료 -->
				</td>
			</tr>
		</table>
		<!-- 코너 영역 종료 -->
	</td>
</tr>
</table>

</body>
</html>

