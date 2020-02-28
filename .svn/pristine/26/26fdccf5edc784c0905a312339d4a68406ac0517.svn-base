<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>버전
등록</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors1 = [];
j$(document).ready(function(){
	j$("#insertBtn").click(function(){
		var title = j$("#title").val();
		if(title == ""){
			alert("제목을 입력하세요.");
			j$("#title").focus();
			return false;
		}
		var content = j$("#content").val();
		if(content == ""){
			alert("내용을 입력하세요.");
			j$("#content").focus();
			return false;
		}
		
		var updateDt = j$("#updateDt").val();
		
		if(updateDt == ""){
			alert("업데이트일자를 선택하세요.");
			j$("#updateDt").focus();
			return false;
		}
		
		var appPath = j$("#appPath").val();
		if(appPath == ""){
			alert("첨부파일을 등록하세요. ");
			j$("#appPath").focus();
			return false;
		}else{
			
			if(j$("#osType").val() == "I"){
				if(appPath.toLowerCase().indexOf(".ipa") < 0){
					alert("선택하신 OS(IOS)의 첨부파일은\n파일확장자가 .ipa만 등록 가능합니다.");
					j$("#appPath").focus();
					return false;		
				}
			}else{
				if(appPath.toLowerCase().indexOf(".apk") < 0){
					alert("선택하신 OS(안드로이드)의 첨부파일은\n파일확장자가 .apk만 등록 가능합니다.");
					j$("#appPath").focus();
					return false;		
				}
			}
			
		}
		if(confirm("등록 하시겠습니까?")){
			j$("#addVersion").submit();
		}else{
			return false;			
		}
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/mobile/version/versionManage";
	});

	j$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
		timepicker:false
	});

	j$("#btstartDt").click(function(){
		j$('.date_timepicker_start').datetimepicker('show');
	});
	
});
</script>
</head>
<body>

<form id="addVersion" action="/madm/mobile/version/addVersion" method="POST" enctype="multipart/form-data">
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >

<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td align="left" class="subtitle">버전 등록</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>

<tr>
	<td valign="top" align="center">
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="80%" align="left" style="border-collapse:collapse;">
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">OS</th>
		    	<td  >
		    		<select id="osType" name="osType">
		    			<option value="I" selected>IOS</option>
		    			<option value="A">안드로이드</option>
		    		</select>
		    	</td>
			</tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">사용유무</th>
		    	<td  >
		    		<input type="radio" name="useYn" value="Y" checked> 사용
		    		<input type="radio" name="useYn" value="N"> 비사용
		    	</td>
			</tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">배포방식</th>
		    	<td  >
		    		<input type="radio" name="releaseType" value="A" checked> 앱스토어
		    		<input type="radio" name="releaseType" value="D"> 다운로드
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">첨부파일(APK or IPA)</th>
		    	<td> 
		    		<input name="appPath" id="appPath" value="" type="file" style="width:350px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">버전코드</th>
		    	<td  >
		    		<input name="versionCd" id="versionCd" value="" type="text" style="width:350px;"/> 예) 1.0.1(숫자와 .만 입력하세요)
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">업데이트일자</th>
		    	<td  width="35%" >
		    		<input type="text" name="updateDt" id="updateDt" size="10" class="date_timepicker_start" value=""/>
					<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
		    	</td>
		    </tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">내용</th>
		    	<td  >
		    		<textarea rows="5" cols="10" id="content" name="content" style="width:100%; height:100px;"></textarea>
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

