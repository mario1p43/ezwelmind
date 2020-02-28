<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>팝업 수정</title>

<script src="/resources/StandardCkeditor/ckeditor.js"></script>
<script type="text/javascript" >

j$(document).ready(function(){
	
    CKEDITOR.replace( 'editor1', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'500px',
        filebrowserUploadUrl: '/commons/standardCKeditorFileUpload.ez?userFolder=ezfamilywelfare'
    });
	
	j$("input[id=insertNum]").keypress(function(e) {
	    if (e.which == 13){
	    	doAction('insert');
			return false;
	    };
	}); 
	
	j$("#modifyBtn").click(function(){
		
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

		if(confirm("팝업을 수정 하시겠습니까?")){
			j$("#modifyPopup").submit();
		}
		return false;
	});

	j$("#deleteBtn").click(function(){
		j$("#deletePopup").submit();
		return false;
	});

	j$("#cancleBtn").click(function(){
		if(confirm("전단계로 돌아가시겠습니까?")){
			location.href = "/madm/popupManage/popupMain";
		}
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
	
	// target URL 자동 선택
	j$("#urlAutoChkBtn").click(function(e){
		e.preventDefault();
		var url = j$("#menuUrl").val();
		if(url == "") {
			alert("타겟 URL 없습니다.");
			return;
		}		
		var params = "menuUrl="+encodeURIComponent(url);
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
<form:form id="modifyPopup" name="modifyPopup" modelAttribute="invPopupDto" action="/madm/popupManage/modifyPopupDetail" method="POST" enctype="multipart/form-data">
<input type="hidden" name="popupContent" id="popupContent" value=""/> 

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr><td height="20px"></td></tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">팝업 수정</td>
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
					<input type="hidden" name="popupSeq" id="popupSeq" value="${popupDetail.popupSeq}"/>
	            	${popupDetail.serviceType }
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 제목</th>
	            <td colspan="3" width="">
	            	<input type="text" name="popupTitle" id="popupTitle" value="${popupDetail.popupTitle }" style="width: 300px;">
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 유형</th>
	            <td colspan="3" width="">
	            	<input type="radio" name="popupType" class="popupType" value="U" <c:if test="${popupDetail.popupType eq 'U' }"> checked </c:if>> URL 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="popupType" class="popupType" value="C" <c:if test="${popupDetail.popupType eq 'C' }"> checked </c:if>> 팝업내용
	            </td>
	        </tr>
	        <tr id="popupContentYn" <c:if test="${popupDetail.popupType != 'C' }"> style="display: none;" </c:if> >
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 내용</th>
	            <td colspan="3" width="">
	            	<textarea name="editor1" id="editor1" >
	            		${popupDetail.popupContent }
	            	</textarea>
	            </td>
	        </tr>
	        <tr id="popupUrlYn">
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 이미지 URL</th>
	            <td colspan="3" width="">
	            	<input type="text" name="popupUrl" id="popupUrl" value="${popupDetail.popupUrl }" style="width: 300px;">
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">적용 URL(MENU URL)</th>
	            <td colspan="3" width="">
	            	<input type="text" name="menuUrl" id="menuUrl" value="${popupDetail.menuUrl }" style="width: 300px;">
	            	<!-- <input type="button" id="searchMenu" value="메뉴조회"> -->
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">쿠키 적용 여부</th>
	            <td colspan="3">
	            	<input type="radio" name="cookieUseYn" value="Y" <c:if test="${popupDetail.cookieUseYn eq 'Y' }"> checked="checked" </c:if> > Y 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="cookieUseYn" value="N" <c:if test="${popupDetail.cookieUseYn eq 'N' }"> checked="checked" </c:if> > N
	            	&nbsp;&nbsp;&nbsp;   ex) 오늘 하루 이창 열지 않습니다.
	            </td>
	        </tr>
	        <tr align="left" height="30px">
				<td  width="15%" align="center" bgcolor="#F5F5F5"><strong>시작일/종료일</strong></td>
		    	<td  width="" colspan="3" >
		    		<input type="text" name="startDt" id="startDt" size="10" class="date_timepicker_start" value="${popupDetail.startDt }"/>
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
					<input type="text" name="endDt" id="endDt" size="10" class="date_timepicker_end" value="${popupDetail.endDt }"/>
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
	            	가로 : <input type="text" name="popupWidth"  id="popupWidth"  value="${popupDetail.popupWidth }" style="width: 70px;"> &nbsp;
	            	세로 : <input type="text" name="popupHeight" id="popupHeight" value="${popupDetail.popupHeight }" style="width: 70px;">
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">팝업 위치</th>
	            <td colspan="3">
	            	상단 : <input type="text" name="topPosition"  id="topPosition"  value="${popupDetail.topPosition }" style="width: 70px;"> &nbsp;
	            	왼쪽 : <input type="text" name="leftPosition" id="leftPosition" value="${popupDetail.leftPosition }" style="width: 70px;">
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">사용유무</th>
	            <td colspan="3">
	            	<input type="radio" name="useYn" value="Y" <c:if test="${popupDetail.useYn eq 'Y' }" > checked="checked" </c:if> > Y 
	            	&nbsp;&nbsp;
	            	<input type="radio" name="useYn" value="N" <c:if test="${popupDetail.useYn eq 'N' }" > checked="checked" </c:if> > N
	            </td>
	        </tr>
	        <tr>
	        	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">우선순위</th>
	            <td colspan="3">
	            	<input type="text" name="orderNo" id="orderNo" value="${popupDetail.orderNo }">
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
    							<input type="checkbox" name="allClientYn" id="checkAll" value="Y" <c:if test="${popupDetail.allClientYn eq 'Y'}"> checked </c:if>>
    							<label for="checkAll"><strong>전체선택</strong></label>
    						</td>
    					</tr>
		    			<c:forEach var="list" items="${clientList}" varStatus="idx">
	    					<c:if test="${(idx.index mod 4) eq 0 }"><tr></c:if>
			    				<td width="200px">
			    					<input type="checkbox" name="clientCdArr" id="check_${list.clientCd }" value="${list.clientCd }" <c:if test="${list.popupSeq eq popupDetail.popupSeq}"> checked </c:if> >
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
					<input type="button" id="modifyBtn" value="수정" style="height:30px; width:100px;">
		    		<span style="margin-left: 20px;"></span>
		    		<input type="button" id="cancleBtn" value="취소" style="height:30px; width:100px;">
		    		<span style="margin-left: 20px;"></span>
		    		<input type="button" id="deleteBtn" value="삭제" style="height:30px; width:100px;">
		    	</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form:form>

<form:form id="deletePopup" modelAttribute="invPopupDto" action="/popupManage/modifyPopupDetail" method="DELETE">
	<input type="hidden" name="popupSeq" value="${popupDetail.popupSeq}">
</form:form>
</body>
</html>

