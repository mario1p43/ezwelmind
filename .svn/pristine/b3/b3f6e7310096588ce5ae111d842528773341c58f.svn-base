<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>푸쉬등록</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors1 = [];
j$(document).ready(function(){
	// 발송대상OS 변경
	j$("#osType").change(function(){
		if(j$(this).val() == "I") {
			j$("input[name=msgType]").attr("disabled", true);
			j$("#imgFile").attr("disabled", true);
		} else {
			j$("input[name=msgType]").attr("disabled", false);
			j$("#imgFile").attr("disabled", false);
		}
	});
	
	// 메세지타입 변경
	j$("input[name=msgType]").change(function(){
		if(j$(this).val() == "T") {
			j$("#imgFile").attr("disabled", true);
		} else {
			j$("#imgFile").attr("disabled", false);
		}
	});
	
	// 저장
	j$("#insertBtn").click(function(){
		var title = j$("#title").val();
		if(title == ""){
			alert("타이틀을 입력하세요. ");
			j$("#title").focus();
			return false;
		}

		var content = j$("#content").val();
		if(content == ""){
			alert("발송내용을 입력하세요. ");
			j$("#content").focus();
			return false;
		}

		var sendDt = j$("#sendDt").val();
		if(sendDt == ""){
			alert("발송일을 선택하세요.");
			j$("#sendDt").focus();
			return false;
		}

		// 안드로이드 이미지푸쉬
		if(j$("#osType").val() == "A" && j$("input[name=msgType]").val() == "I") {
			var imgFile = j$("#imgFile").val();
			if(imgFile == ""){
				alert("이미지를 등록하세요. ");
				j$("#imgFile").focus();
				return false;
			}
		}
		
		j$("#addPush").submit();
	});

	// 취소
	j$("#cancleBtn").click(function(){
		location.href = "/madm/mobile/push/pushManage";
	});

	// 달력셋팅
	j$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
		timepicker:false
	});

	j$("#btstartDt").click(function(){
		j$('.date_timepicker_start').datetimepicker('show');
	});

	j$("#checkAll").click(function(){
		if ( $("#checkAll").prop('checked') ) {
			j$("input[id^=check_]").prop('checked',true);
		}else if( $("#checkAll").prop('checked') == false ){
			j$("input[id^=check_]").prop('checked',false);
		}
	});
});
</script>
</head>
<body>

<form id="addPush" action="/madm/mobile/push/addPush" method="POST" enctype="multipart/form-data">
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >

<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td align="left" class="subtitle">푸쉬등록</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>

<tr>
	<td valign="top" align="center">
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="80%" align="left" style="border-collapse:collapse;">
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">발송대상OS</th>
		    	<td  >
		    		<select id="osType" name="osType">
		    			<option value="">전체</option>
		    			<option value="I">IOS</option>
		    			<option value="A">안드로이드</option>
		    		</select>
		    	</td>
			</tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">메세지타입</th>
		    	<td  >
		    		<input type="radio" id="msgText" name="msgType" value="T" checked> <label for="msgText">Text</label>
		    		<input type="radio" id="msgImage" name="msgType" value="I"> <label for="msgImage">Image</label>
		    	</td>
			</tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">타이틀</th>
		    	<td  >
		    		<input name="title" id="title" value="" type="text" style="width:300px;"/>
		    	</td>
			</tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">발송내용</th>
		    	<td  >
		    		<textarea rows="5" cols="10" id="content" name="content" style="width:100%; height:100px;"></textarea>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">발송일시</th>
		    	<td  width="35%" >
		    		<input type="text" name="sendDt" id="sendDt" size="10" class="date_timepicker_start" value=""/>
					<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					<select id="sendTime" name="sendTime">
						<c:forEach var="sendTime" begin="0" end="23" step="1">
						<option value="${sendTime }">${sendTime }</option>
						</c:forEach>
					</select> 시
		    	</td>
		    </tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">Push 이미지</th>
		    	<td  >
		    		<input name="imgFile" id="imgFile" value="" type="file" style="width:350px;" disabled="disabled" />
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">링크 URL</th>
		    	<td  >
		    		<input name="linkUrl" id="linkUrl" value="" type="text" style="width:300px;"/>
		    	</td>
			</tr>
		</table>
		<!-- 검색 영역 종료 -->
		</td>
	</tr>
	
<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td>
		<!-- 배너 정보 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="80%" align="left" style="border-collapse:collapse;">
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">고객사선택</th>
		    	<td class="line">
    				<table>
    					<tr>
    						<td style="color: #2E64FE;">
    							<input type="checkbox" name="allClientYn" id="checkAll" value="Y">
    							<label for="checkAll"><strong>전체선택</strong></label>
    						</td>
    					</tr>
		    			<c:forEach var="list" items="${clientList}" varStatus="idx">
	    					<c:if test="${(idx.index mod 4) eq 0 }"><tr></c:if>
			    				<td width="200px">
			    					<input type="checkbox" name="clientCdArr" id="check_${list.clientCd }" value="${list.clientCd }">
			    					<label for="check_${list.clientCd }">${list.clientNm }</label>
			    				</td>
	    					<c:if test="${(idx.index mod 4) eq 3 }"></tr></c:if>
						</c:forEach>
    				</table>
		    	</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td>
	<!-- 버튼 영역 시작 -->
	<table cellpadding="5" cellspacing="0" border="0" width="70%" align="left" style="border-collapse:collapse;">
		<tr>
			<td class="" colspan="4" height="60px" align="center">
	    		<input type="button" id="insertBtn" value="저장" style="height:30px;width:100px;"/>
	    		<span style="margin-left: 20px;"></span>
	    		<input type="button" id="cancleBtn" value="취소" style="height:30px;width:100px;"/>
	    	</td>
		</tr>
	</table>
	<!-- 버튼 영역 종료 -->
	</td>
</tr>
</table>
</form>

</body>
</html>

