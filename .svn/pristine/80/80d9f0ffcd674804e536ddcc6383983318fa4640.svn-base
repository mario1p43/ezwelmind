<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>배너등록</title>
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
		
		var startDd = j$("#startDd").val();
		var endDd	= j$("#endDd").val();
		if(startDd == "" || endDd == ""){
			alert("시작/종료일을 선택하세요.");
			j$("#startDd").focus();
			return false;
		}
		
		// ios이미지
		var iImg1 = j$("#iImg1").val();
		if(iImg1 == ""){
			alert("이미지를 등록하세요. ");
			j$("#iImg1").focus();
			return false;
		}
		var iImg2 = j$("#iImg2").val();
		if(iImg2 == ""){
			alert("이미지를 등록하세요. ");
			j$("#iImg2").focus();
			return false;
		}
		var iImg3 = j$("#iImg3").val();
		if(iImg3 == ""){
			alert("이미지를 등록하세요. ");
			j$("#iImg3").focus();
			return false;
		}
		
		// 안드로이드 이미지
		var aImg1 = j$("#aImg1").val();
		if(aImg1 == ""){
			alert("이미지를 등록하세요. ");
			j$("#aImg1").focus();
			return false;
		}
		var aImg2 = j$("#aImg2").val();
		if(aImg2 == ""){
			alert("이미지를 등록하세요. ");
			j$("#aImg2").focus();
			return false;
		}
		var aImg3 = j$("#aImg3").val();
		if(aImg3 == ""){
			alert("이미지를 등록하세요. ");
			j$("#aImg3").focus();
			return false;
		}
		var aImg4 = j$("#aImg4").val();
		if(aImg4 == ""){
			alert("이미지를 등록하세요. ");
			j$("#aImg4").focus();
			return false;
		}
		
		if(confirm("등록하시겠습니까?")){			
			j$("#addSplash").submit();
		}
		return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/mobile/splash/splashManage";
	});

	j$('.date_timepicker_start').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				maxDate:j$('.date_timepicker_end').val()?j$('.date_timepicker_end').val():false
			})
		},
		timepicker:false
	});

	j$("#btstartDt").click(function(){
		j$('.date_timepicker_start').datetimepicker('show');
	});

	j$('.date_timepicker_end').datetimepicker({
		format:'Y/m/d',
		onShow:function( ct ){
			this.setOptions({
				minDate:j$('.date_timepicker_start').val()?j$('.date_timepicker_start').val():false
			})
		},
		timepicker:false
	});

	j$("#btendDt").click(function(){
		j$('.date_timepicker_end').datetimepicker('show');
	});
	
});
</script>
</head>
<body>

<form id="addSplash" action="/madm/mobile/splash/addSplash" method="POST" enctype="multipart/form-data">
<table cellpadding="0" align="center" cellspacing="0" border="0" width="95%" >

<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td align="left" class="subtitle">APP스플래쉬 등록</td>
</tr>
<tr>
	<td height="10px"></td>
</tr>

<tr>
	<td valign="top" align="center">
		<!-- 검색 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="80%" align="left" style="border-collapse:collapse;">
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">제목</th>
		    	<td  >
		    		<input name="title" id="title" value="" type="text" style="width:300px;"/>
		    	</td>
			</tr>
		    <tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">내용</th>
		    	<td  >
		    		<textarea rows="5" cols="10" id="content" name="content" style="width:100%; height:100px;"></textarea>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">시작일/종료일</th>
		    	<td  width="35%" >
		    		<input type="text" name="startDt" id="startDt" size="10" class="date_timepicker_start" value=""/>
					<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					&nbsp;~&nbsp;
					<input type="text" name="endDt" id="endDt" size="10" class="date_timepicker_end" value=""/>
					<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
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
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5" rowspan="3">IOS 이미지</th>
		    	<td  >320x480 : 
		    		<input name="iImg1" id="iImg1" value="" type="file" style="width:350px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
		    	<td  >640x960 : 
		    		<input name="iImg2" id="iImg2" value="" type="file" style="width:350px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
		    	<td  >640x1136 : 
		    		<input name="iImg3" id="iImg3" value="" type="file" style="width:350px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5" rowspan="4">안드로이드 이미지</th>
		    	<td  >320x480 : 
		    		<input name="aImg1" id="aImg1" value="" type="file" style="width:350px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
		    	<td  >480x800 : 
		    		<input name="aImg2" id="aImg2" value="" type="file" style="width:350px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
		    	<td  >720x1280 : 
		    		<input name="aImg3" id="aImg3" value="" type="file" style="width:350px;"/>
		    	</td>
			</tr>
			<tr align="left" height="30px">
		    	<td  >1200x1920 : 
		    		<input name="aImg4" id="aImg4" value="" type="file" style="width:350px;"/>
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

