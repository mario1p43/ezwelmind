<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>팝업 등록</title>

<script src="/resources/StandardCkeditor/ckeditor.js"></script>
<script type="text/javascript">
var oEditors = [];

j$(document).ready(function(){
	
    CKEDITOR.replace( 'editor1', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'500px',
        filebrowserUploadUrl: '/commons/standardCKeditorFileUpload.ez?userFolder=ezfamilywelfare'
    });


	j$("#addBtn").click(function(){
		var popupTitle = j$("#popupTitle").val();
		if(popupTitle == ""){
			alert("팝업 제목을 입력하세요.");
			j$("#popupTitle").focus();
			return false;
		}
		
		var popupContent = CKEDITOR.instances.editor1.getData();
		var popupUrl = j$("#popupUrl").val();
		var tempVal = j$(":radio[name=popupType]:checked").val();
		if(tempVal == 'C'){
			if(popupContent == ""){
				alert("팝업 내용을 입력하세요.");
				j$("#editor1").focus();
				return false;
			}else{
				j$("#popupContent").val(popupContent);
			}
		}else{
			if(popupUrl == ""){
				alert("팝업 이미지 URL을 입력하세요.");
				j$("#popupUrl").focus();
				return false;
			}
		}
		
		var menuUrl = j$("#menuUrl").val();
		if(menuUrl == ""){
			alert("적용 URL(MENU URL)을 입력하세요.");
			j$("#menuUrl").focus();
			return false;
		}
		
		var startDt = j$("#startDt").val();
		var endDt	= j$("#endDt").val();
		if(startDt == "" || endDt == ""){
			alert("시작/종료일을 입력하세요.");
			j$("#startDt").focus();
			return false;
		}
		
		var popupWidth = j$("#popupWidth").val();
		var popupHeight	= j$("#popupHeight").val();
		if(popupWidth == "" || popupHeight == ""){
			alert("팝업 사이즈를 입력하세요.");
			j$("#popupWidth").focus();
			return false;
		}
		
		var topPosition  = j$("#topPosition").val();
		var leftPosition = j$("#leftPosition").val();
		if(topPosition == "" || leftPosition == ""){
			alert("팝업 위치를 입력하세요.");
			j$("#topPosition").focus();
			return false;
		}
		
		var orderNo = j$("#orderNo").val();
		if(orderNo == ""){
			alert("우선순위를 입력하세요.");
			j$("#orderNo").focus();
			return false;
		}

		if(confirm("팝업을 등록 하시겠습니까?")){
			j$("#addPopup").submit();
		}
		return false;
	});
	
	j$("#cancleBtn").click(function(){
		if(confirm("전단계로 돌아가시겠습니까?")){
			location.href = "/madm/popupManage/popupMain";
		}
		return false;
	});
	
	j$("#searchMenu").click(function(){
		alert("메뉴조회");
		return false;
	});
	
	j$(".popupType").change(function() {
		 var tempVal = j$(this).val();
		 if(tempVal == 'C'){
			 j$("#popupUrlYn").hide();
			 j$("#popupContentYn").show();
		 }else{
			 j$("#popupContentYn").hide();
			 j$("#popupUrlYn").show();
		 }
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
	
	j$("#checkAll").click(function(){
		if ( $("#checkAll").prop('checked') ) {
			j$("input[id^=check_]").prop('checked',true);
		}else if( $("#checkAll").prop('checked') == false ){
			j$("input[id^=check_]").prop('checked',false);
		}
	});
	
	j$("#urlAutoChkBtn").click(function(e){
		e.preventDefault();
		var url = j$("#menuUrl").val();
		if(url == "") {
			alert("적용 URL 없습니다.");
			return;
		}		
		var params = "menuUrl="+url;
		j$.ajax({
			url: '/madm/common/menuURLtoClientList',
			type: 'POST',
			data: params,
			dataType: 'json',			
			cache:false,
			success: function(data, textStatus){	
				j$("input[id^=check_]").prop('checked',false);
				j$("#checkAll").prop('checked',false) 
				j$(data).each(function() {
					//console.log(this.clientCd);
					j$("input[id=check_"+this.clientCd+"]").prop('checked',true);
				});
			},
			error: function(e) {
				console.log("error:",e.responseText);
			}
		});
	});
});
</script>
</head>
<body>

<form id="addPopup" name="frm" action="/madm/popupManage/addPopup" method="POST" enctype="multipart/form-data">
<input type="hidden" name="useYn" value="Y"/> 
<input type="hidden" name="popupContent" id="popupContent" value=""/> 

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr><td height="20px"></td></tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">팝업 등록</td>
			</tr>
		</table>
	</td>
</tr>

<tr><td height="20px"></td></tr>

<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">서비스</th>
	            <td colspan="3" width="">
	            	<select name="serviceType" style="width:150px;">
	            		<c:forEach var="list" items="${serviceList}">
	            			<option value="${list.optionCd }">${list.commNm}</option>
	            		</c:forEach>
	            	</select>
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 제목</th>
	            <td colspan="3" width="">
	            	<input type="text" name="popupTitle" id="popupTitle" value="" style="width: 300px;">
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 유형</th>
	            <td colspan="3" width="">
	            	<input type="radio" name="popupType" class="popupType" value="U" checked="checked" > URL 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="popupType" class="popupType" value="C" > 팝업내용
	            </td>
	        </tr>
	        <tr id="popupContentYn" style="display: none;">
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 내용</th>
	            <td colspan="3" width="">
	            	<!-- <textarea rows="10" cols="30" id="ir1" name="popupContent" style="width:100%; height:250px;"></textarea> -->
	            	<!-------------------------------웹에디터시작--------------------------->
		    		<textarea name="editor1" id="editor1" ></textarea>
					<!-------------------------------웹에디터 끝---------------------------->
	            </td>
	        </tr>
	        <tr id="popupUrlYn">
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 이미지 URL</th>
	            <td colspan="3" width="">
	            	<input type="text" name="popupUrl" id="popupUrl" value="" style="width: 300px;">
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">적용 URL(MENU URL)</th>
	            <td colspan="3" width="">
	            	<input type="text" name="menuUrl" id="menuUrl" value="" style="width: 300px;">
	            	<!-- <input type="button" id="searchMenu" value="메뉴조회"> -->
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">쿠키 적용 여부</th>
	            <td colspan="3">
	            	<input type="radio" name="cookieUseYn" value="Y" checked="checked" > Y 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="cookieUseYn" value="N" > N
	            	&nbsp;&nbsp;&nbsp;   ex) 오늘 하루 이창 열지 않습니다.
	            </td>
	        </tr>
	        <tr align="left" height="30px">
				<td  width="15%" align="center" bgcolor="#F5F5F5"><strong>시작일/종료일</strong></td>
		    	<td  width="" colspan="3" >
		    		<input type="text" name="startDt" id="startDt" size="10" class="date_timepicker_start" value=""/>
					<img id="btstartDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					
					<select name="startTime">
						<option value="000000">00시</option>
						<option value="010000">01시</option>
						<option value="020000">02시</option>
						<option value="030000">03시</option>
						<option value="040000">04시</option>
						<option value="050000">05시</option>
						<option value="060000">06시</option>
						<option value="070000">07시</option>
						<option value="080000">08시</option>
						<option value="090000">09시</option>
						<option value="100000">10시</option>
						<option value="110000">11시</option>
						<option value="120000">12시</option>
						<option value="130000">13시</option>
						<option value="140000">14시</option>
						<option value="150000">15시</option>
						<option value="160000">16시</option>
						<option value="170000">17시</option>
						<option value="180000">18시</option>
						<option value="190000">19시</option>
						<option value="200000">20시</option>
						<option value="210000">21시</option>
						<option value="220000">22시</option>
						<option value="230000">23시</option>
						<option value="240000">24시</option>
					</select>
					
					&nbsp;~&nbsp;
					<input type="text" name="endDt" id="endDt" size="10" class="date_timepicker_end" value=""/>
					<img id="btendDt" src="${url:img('/images/icon02.jpg')}"border="0" />
					
					<select name="endTime">
						<option value="000000">00시</option>
						<option value="010000">01시</option>
						<option value="020000">02시</option>
						<option value="030000">03시</option>
						<option value="040000">04시</option>
						<option value="050000">05시</option>
						<option value="060000">06시</option>
						<option value="070000">07시</option>
						<option value="080000">08시</option>
						<option value="090000">09시</option>
						<option value="100000">10시</option>
						<option value="110000">11시</option>
						<option value="120000">12시</option>
						<option value="130000">13시</option>
						<option value="140000">14시</option>
						<option value="150000">15시</option>
						<option value="160000">16시</option>
						<option value="170000">17시</option>
						<option value="180000">18시</option>
						<option value="190000">19시</option>
						<option value="200000">20시</option>
						<option value="210000">21시</option>
						<option value="220000">22시</option>
						<option value="230000">23시</option>
						<option value="240000">24시</option>
					</select>
					
		    	</td>
		    </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 사이즈</th>
	            <td colspan="3">
	            	가로 : <input type="text" name="popupWidth"  id="popupWidth"  value="" style="width: 50px;">px &nbsp;
	            	세로 : <input type="text" name="popupHeight" id="popupHeight" value="" style="width: 50px;">px
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 위치</th>
	            <td colspan="3">
	            	상단 : <input type="text" name="topPosition"  id="topPosition"  value="" style="width: 50px;">% &nbsp;
	            	왼쪽 : <input type="text" name="leftPosition" id="leftPosition" value="" style="width: 50px;">%
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
	            <td colspan="3">
	            	<input type="text" name="orderNo" id="orderNo" value="1" style="width:50px; text-align: center;" >
	            </td>
	        </tr>
	        <!-- <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">레이어 팝업 여부</th>
	            <td colspan="3">
	            	<input type="radio" name="layerYn" value="Y" checked="checked" > Y 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="layerYn" value="N" > N
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">리사이즈 적용 여부</th>
	            <td width="35%">
	            	<input type="radio" name="resizeUseYn" value="Y" > Y 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="resizeUseYn" value="N" checked="checked" > N
	            </td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">스크롤 적용 여부</th>
	            <td width="35%">
	            	<input type="radio" name="scrollUseYn" value="Y" > Y 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="scrollUseYn" value="N" checked="checked" > N
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">쿠키 적용 여부</th>
	            <td width="35%">
	            	<input type="radio" name="cookieUseYn" value="Y" checked="checked" > Y 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="cookieUseYn" value="N" > N
	            </td>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">쿠키 적용 기간(시간)</th>
	            <td width="35%">
		            <input type="text" name="cookieLimitDay" value="24" style="width:50px; text-align: center;">시간
	            </td>
	        </tr> -->
		</table>
	</td>
</tr>

<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td>
		<!-- 배너 정보 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
			<tr align="left" height="30px">
				<th class="line" width="15%" align="center" bgcolor="#F5F5F5">고객사선택</th>
		    	<td class="line" >
    				<table>
    					<tr>
    						<td><button id="urlAutoChkBtn" style="height:30px; width:100px;">URL 자동선택</button></td>
    					</tr>
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

<tr><td height="20px"><td><tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="addBtn" value="등록" style="height:30px; width:100px;">
		    		<span style="margin-left: 20px;"></span>
		    		<input type="button" id="cancleBtn" value="취소" style="height:30px; width:100px;">
		    	</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>

