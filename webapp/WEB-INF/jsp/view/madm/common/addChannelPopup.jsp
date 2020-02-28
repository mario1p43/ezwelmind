<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<script>
	j$(document).ready(function(){
		j$("#insertBtn").click(function(){
			
			var channelCd = j$("#channelCd").val();
			var regex = /^.*(?=.{3,4})(?=.*[A-Z]).*$/;
			if (!regex.test(channelCd)) {
				alert("채널코드는 알파벳 대문자 3~4자리 입니다.");
				j$("#channelCd").focus();
				return false;
			}
			
			var channelNm = j$("#channelNm").val();
			if(channelNm == ""){
				alert("채널명을 입력하세요.");
				j$("#channelNm").focus();
				return false;
			}
			
			var channelDesc = j$("#channelDesc").val();
			if(channelDesc == ""){
				alert("채널 설명을 입력하세요. ");
				j$("#channelDesc").focus();
				return false;
			}
			
			location.href='/madm/banner/insertChannel?channelCd='+channelCd+'&channelNm='+channelNm+'&channelDesc='+channelDesc;
		});
	});
</script>

<table cellpadding="5" cellspacing="0" border="0" style="border-collapse:collapse; width:400px;" >
	<tr  height="50px">
		<th class="line" width="" align="center" bgcolor="#F5F5F5">채널코드</th>
    	<td class="line" ><br><input type="text" id="channelCd" value="" maxlength="4" style="width: 100px;"/>
    		<br><br>※채널코드는 알파벳 대문자 3~4자리 입니다.</td>
	</tr>
	<tr  height="50px">
		<th class="line" width="" align="center" bgcolor="#F5F5F5">채널명</th>
    	<td class="line" ><input type="text" id="channelNm" value="" style="width: 200px;"/></td>
	</tr>
	<tr  height="50px">
		<th class="line" width="" align="center" bgcolor="#F5F5F5">채널설명</th>
    	<td class="line" ><input type="text" id="channelDesc" value="" style="width: 200px;"/></td>
	</tr>
	<tr align="center" height="60px">
		<td colspan="2">
			<input type="button" id="insertBtn" value="등록" />
		</td>
	</tr>
</table>
