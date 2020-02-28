<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<script>
	j$(document).ready(function(){
		j$("#insertBtn").click(function(){

			var channelCd 	= j$("select[name=channelCd] option:selected").val();
			if (channelCd == "") {
				alert("코너를 선택하세요.");
				j$("#channelCd").focus();
				return false;
			}
			
			var cornerNm = j$("#cornerNm").val();
			if(cornerNm == ""){
				alert("코너명을 입력하세요.");
				j$("#cornerNm").focus();
				return false;
			}
			
			var cornerDesc = j$("#cornerDesc").val();
			if(cornerDesc == ""){
				alert("코너설명을 입력하세요. ");
				j$("#cornerDesc").focus();
				return false;
			}
			
			var numConfirm = /^([1-9]{1})([0-9]{0,1})$/;
			var dispNum = j$("#dispNum").val();
			if(dispNum == ""){
				alert("상품 전시수를 입력하세요.");
				j$("#dispNum").focus();
				return false;
			}else if ( !numConfirm.test(dispNum) ) {
				alert("상품 전시수를 확인해주세요.");
				j$("#dispNum").focus();
				return false;
			} 
			
			location.href='/madm/banner/insertCorner?channelCd='+channelCd+'&cornerNm='+cornerNm+'&cornerDesc='+cornerDesc+'&dispNum='+dispNum;
		});
	});
</script>

<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse; width:400px;" >
	<tr  height="30px">
		<th class="line" width="" align="center" bgcolor="#F5F5F5">채널코드</th>
    	<td class="line" >
    		<select name="channelCd" id="channelCd">
    			<option value="">---- 선택 ----</option>
    			<c:forEach var="list" items="${channelList}" varStatus="status">
    				<option value="${list.channelCd}" ${invBannerParam.channelCd == list.channelCd  ? 'selected':''}>${list.channelNm}</option>
				</c:forEach>
    		</select>
    	</td>
	</tr>
	<tr  height="30px">
		<th class="line" width="" align="center" bgcolor="#F5F5F5">코너명</th>
    	<td class="line" ><input type="text" id="cornerNm" name="cornerNm" style="width: 200px;"/></td>
	</tr>
	<tr  height="30px">
		<th class="line" width="" align="center" bgcolor="#F5F5F5">코너설명</th>
    	<td class="line" ><input type="text" id="cornerDesc" name="cornerDesc" style="width: 200px;"/></td>
	</tr>
	<tr  height="30px">
		<th class="line" width="" align="center" bgcolor="#F5F5F5">상품전시수</th>
    	<td class="line" ><input type="text" id="dispNum" name="dispNum" maxlength="2" style="width: 100px;"/></td>
	</tr>
	<tr align="center" height="60px">
		<td colspan="2">
			<input type="button" id="insertBtn" value="등록" />
		</td>
	</tr>
</table>