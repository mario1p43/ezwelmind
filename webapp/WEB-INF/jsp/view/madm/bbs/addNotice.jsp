<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>공지사항 관리</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script language="JavaScript" type="text/javascript" src="/resources/js/bcrypt.js"></script>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];

j$(document).ready(function(){

	<c:if test='${not empty vo.authCd}'>
	var chkValue = '${vo.authCd}';
	console.log(chkValue);
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
			$('[name=sAuthCd][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	<c:if test='${not empty vo.area1}'>
	var chkValue = '${vo.area1}';
	console.log(chkValue);
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
			$('[name=area1][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if> 

 	<c:if test='${not empty vo.channelType}'>
	var chkValue = '${vo.channelType}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=channelType][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if> 
	
	j$("#addNotice").validate({
		onkeyup:false,
		onclick:false,
		onfocusout:false,
		showErrors:function(errorMap, errorList){
			if (this.numberOfInvalids()) {
				alert(errorList[0].message);
			}
		},
		rules : {
			notice  : {required:true},
			subject : {required:true},
			content : {required:true},
			dispYn  : {required:true}
		},
		messages: {
			notice  : "구분을 선택하세요",
			subject : "제목을 입력하세요",
			content : "내용을 입력하세요",
			dispYn  : "노출여부를 체크해주세요"
		},
		submitHandler: function(form) {
			var tempVal = j$("#ir1").text();
			var checkVal = "<p>&nbsp;</p>";
			
			var startDt = $(".startDt").val();
			var startTime = $(".startTime").val();
			var endDt = $(".endDt").val();
			var endTime = $(".endTime").val();
			
			if($("input[name=mainDispYn]:checked").val() == "Y") {
				if(startDt != "" && startTime != "" 
						&& endDt != "" && endTime != "") {
					$("#mainStartDt").val(startDt.replace(/-/gi, "") + startTime.replace(":", "") + "00");
					$("#mainEndDt").val(endDt.replace(/-/gi, "") + endTime.replace(":", "") + "00");
				} else {
					alert("메인노출기간을 선택하세요.");
					return false;
				}	
			}

			if(checkVal == tempVal){
				alert("내용을 입력하세요");
				return false;
			}
			form.submit();
		}
	});

	j$('#insertBtn').click(function(){
		if($("#reqCd1").val() ==""){
			alert("구분을 선택해 주세요");
			return false;
		}
		
		
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
				
		j$.alert('등록하겠습니까?',function(){
				j$("#addNotice").submit();
			 },function(){
			 	return false;
			 }
     	);
		return false;
	});

	j$('#updateBtn').click(function() {
		if($("#reqCd1").val() ==""){
			alert("구분을 선택해 주세요");
			return false;
		}
		
		
		j$("#addNotice").attr("action","/madm/bbsNotice/update");
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.
		j$.alert('수정하시겠습니까?',function(){
			j$("#addNotice").submit();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$('#deleteBtn').click(function() {
		j$("#addNotice").attr("action","/madm/bbsNotice/delete");
		j$.alert('삭제하시겠습니까?',function(){
			location.href = "/madm/bbsNotice/delete?dataSeq=" + j$('#dataSeq').val();
		 },function(){
		 	return false;
		 }
 	);
	return false;
	});

	j$("#cancleBtn").click(function(){
		location.href = "/madm/bbsNotice/list?bbsCd=notice&serviceType=SANGDAM4U";
		return false;
	});
	
	j$("#checkAll").click(function(){
		if ( $("#checkAll").prop('checked') ) {
			j$("input[id^=check_]").prop('checked',true);
		}else if( $("#checkAll").prop('checked') == false ){
			j$("input[id^=check_]").prop('checked',false);
		}
	});
	
	$( ".startDt, .endDt").datepicker({
		showOn: "both",
		buttonImageOnly: true,
		buttonImage: "//img.ezwelmind.co.kr/sangdam4u/images/comunity/ico_calendar.gif",
		buttonText: "달력보기",
		changeMonth: true, 
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		closeText: '닫기',
		monthNamesShort: [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" ],
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		yearRange: "-1:+1",
		beforeShow: function (){},
		dateFormat: "yy-mm-dd",
		onSelect: function (dateText){
			
		}
	});
	
	j$('.startTime, .endTime').timepicker({ 
	    timeFormat: 'HH:mm', 
		minTime: '00:00',
        maxHour: 24,
        maxMinutes: 59,
        startTime: new Date(0,0,0,0,0,0),
        interval: 60,
        change: function(time) {
        	
        }
	});
	
	
	j$('#area1').change(function(){
		var params = {};
		var strData = "";
		var area1 = this.value
		params.area1  = area1;
		
		j$('#subData').remove();	
		
		if(area1 == 100016){
			
		}else{
		
		
			j$.ajax({
				url: '/madm/centerInfo/ajaxArea',
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,
				success: function(data, textStatus){
					strData += "<span id='subData'>";
					strData += "<select id='area2' name='area2' data-validation='required' data-validation-error-msg-required='군/구을 확인 해주세요.'>";
					strData += "<option value=''>군/구 선택</option>";
					
					j$.each(data.serviceList, function(i, serviceList){
						strData += "   <option value='"+serviceList.commCd+"'>"+serviceList.commNm+"</option>";
					});
					
					strData += "</select>";
					strData += "</span>";
					j$('#area2').show();
					j$('#area2').after(strData);  

				}
			});
		}

		return false;
		
	}); 
	
	$("#checkAreaAll").change(function(){
        if($("#checkAreaAll").is(":checked")){
			$('[name=area1][value=100007]').prop('checked',true);
			$('[name=area1][value=100008]').prop('checked',true);
			$('[name=area1][value=100009]').prop('checked',true);
			$('[name=area1][value=100010]').prop('checked',true);
			$('[name=area1][value=100011]').prop('checked',true);
			$('[name=area1][value=100012]').prop('checked',true);
			$('[name=area1][value=100013]').prop('checked',true);
			$('[name=area1][value=100014]').prop('checked',true);
			$('[name=area1][value=100015]').prop('checked',true);
			$('[name=area1][value=100016]').prop('checked',true);
			$('[name=area1][value=100017]').prop('checked',true);
			$('[name=area1][value=100018]').prop('checked',true);
			$('[name=area1][value=100019]').prop('checked',true);
			$('[name=area1][value=100020]').prop('checked',true);
			$('[name=area1][value=100021]').prop('checked',true);
			$('[name=area1][value=100022]').prop('checked',true);
			$('[name=area1][value=100023]').prop('checked',true);
        }else{
        	$('[name=area1][value=100007]').prop('checked',false);
			$('[name=area1][value=100008]').prop('checked',false);
			$('[name=area1][value=100009]').prop('checked',false);
			$('[name=area1][value=100010]').prop('checked',false);
			$('[name=area1][value=100011]').prop('checked',false);
			$('[name=area1][value=100012]').prop('checked',false);
			$('[name=area1][value=100013]').prop('checked',false);
			$('[name=area1][value=100014]').prop('checked',false);
			$('[name=area1][value=100015]').prop('checked',false);
			$('[name=area1][value=100016]').prop('checked',false);
			$('[name=area1][value=100017]').prop('checked',false);
			$('[name=area1][value=100018]').prop('checked',false);
			$('[name=area1][value=100019]').prop('checked',false);
			$('[name=area1][value=100020]').prop('checked',false);
			$('[name=area1][value=100021]').prop('checked',false);
			$('[name=area1][value=100022]').prop('checked',false);
			$('[name=area1][value=100023]').prop('checked',false);
        }
    });
	
	
/* 	j$('#checkAreaAll').click(function() {
		if($("#checkAreaAll").attr("checked") == true){
			
			$("#checkAreaAll").attr("checked")

			
		}else{
			
		}
		
	}); */
	
	
	
});



j$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir1",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
  		 },
	    fCreator: "createSEditor2"
	});
});
</script>
</head>
<body>

<form id="addNotice" name="addNotice"  action="/madm/bbsNotice/add" method="POST" enctype="multipart/form-data">

<c:if test="${vo ne null}">
	<input type="hidden" name="dataSeq" id="dataSeq" value="${vo.dataSeq}">
</c:if>



<input type="hidden" name="dataType" value="100005">
<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
	<td height="20px">
		<input type="hidden" name="serviceType" id="serviceType" value="${serviceType }">
		<input type="hidden" name="bbsCd" id="bbsCd" value="${bbsCd }">
		<%-- <input type="hidden" name="authCd" id="authCd" value="${authCd }"> --%>
	<td>
<tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">
			    	<c:choose>
						<c:when test="${viewMode eq 'add'}">
							공지사항 등록
						</c:when>
						<c:otherwise>
							공지사항 상세
						</c:otherwise>
					</c:choose>
		    	</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
	        <tr>
	            <td class="line" width="15%" height="40px" align="center" bgcolor="#F5F5F5">구분</td>
	            <td width="85%">
					<comm:select id="reqCd1" name="reqCd1" code="101042"  basicValue="------선택------" selectValue="${vo.reqCd1}"/>
				</td>
	        </tr>
	        <tr>
	            <td class="line" width="15%" align="center" bgcolor="#F5F5F5">제목</td>
	            <td width="85%" colspan="3">
	            	<input type="text" name="subject" style="width:90%;" value="${vo.subject}" />
	            </td>
	        </tr>
	        <tr>
				<td class="line" align="center" bgcolor="#F5F5F5">등록자</td>
	            <td align="left" colspan="3">
					<c:choose>
						<c:when test="${viewMode eq 'add'}">
			            	<sec:authentication property="principal.user.userNm"/>
						</c:when>
						<c:otherwise>
							${vo.regNm }
						</c:otherwise>
					</c:choose>
				</td>
	        </tr>
	        <c:if test="${serviceType eq 'SANGDAM4U' }">
        	<tr>
				<td class="line" align="center" bgcolor="#F5F5F5">구분</td>
	            <td align="left" colspan="3">
	            	<comm:select id="reqCd1" name="reqCd1" code="100549" selectValue="${vo.reqCd1 }" />
				</td>
	        </tr>
	        </c:if>
	        <tr>
	            <td class="line" width="" align="center" bgcolor="#F5F5F5">내용</td>
	            <td colspan="3">
	            	<textarea rows="10" cols="30" id="ir1" name="content" style="width:100%; height:400px;">${vo.content}</textarea>
	            </td>
	        </tr>
	        <tr>
	            <td class="line" width="" height="40px" align="center" bgcolor="#F5F5F5">노출</td>
	            <td colspan="3">
					<input type="radio" name="dispYn" value="Y" ${vo.dispYn != 'N' ? 'checked':''}> 노출
					<input type="radio" name="dispYn" value="N" ${vo.dispYn == 'N' ? 'checked':''}> 비노출
				</td>
	        </tr>
	        
	        <c:if test="${serviceType eq 'PARTNER' }">
	        	<tr>
		            <td class="line" width="" height="40px" align="center" bgcolor="#F5F5F5">메인노출</td>
		            <td colspan="3">
						<input type="radio" name="mainDispYn" value="Y" ${vo.mainDispYn != 'N' ? 'checked':''}> 노출
						<input type="radio" name="mainDispYn" value="N" ${vo.mainDispYn == 'N' ? 'checked':''}> 비노출
					</td>
		        </tr>
		        <tr align="left" height="30px">
					<td align="center"  bgcolor="#F5F5F5">지역구분</td>
			    	<td colspan="3" align="left">
			    					<input type="checkbox" id="checkAreaAll" onclick="checkArea()" checked="checked">전체
			    					</br>
					    			<input type="checkbox" name="area1" value="100007" checked="checked">강원도
					    			<input type="checkbox" name="area1" value="100008" checked="checked">경기도
					    			<input type="checkbox" name="area1" value="100009" checked="checked">경상남도
					    			<input type="checkbox" name="area1" value="100010" checked="checked">경상북도
					    			<input type="checkbox" name="area1" value="100011" checked="checked">광주광역시
					    			<input type="checkbox" name="area1" value="100012" checked="checked">대구광역시
					    			<input type="checkbox" name="area1" value="100013" checked="checked">대전광역시
					    			<input type="checkbox" name="area1" value="100014" checked="checked">부산광역시
					    			</br>
					    			<input type="checkbox" name="area1" value="100015" checked="checked">서울특별시
					    			<input type="checkbox" name="area1" value="100016" checked="checked">세종특별자치시
					    			<input type="checkbox" name="area1" value="100017" checked="checked">울산광역시
					    			<input type="checkbox" name="area1" value="100018" checked="checked">인천광역시
					    			<input type="checkbox" name="area1" value="100019" checked="checked">전라남도
					    			<input type="checkbox" name="area1" value="100020" checked="checked">전라북도
					    			<input type="checkbox" name="area1" value="100021" checked="checked">제주특별자치도
					    			<input type="checkbox" name="area1" value="100022" checked="checked">충청남도
					    			<input type="checkbox" name="area1" value="100023" checked="checked">충청북도
					    			</td>
		   				
	   			<tr>
					<td align="center"   bgcolor="#F5F5F5">접속권한
										
					</td>
	 					<td align="left" colspan="3">
	 					
	 					<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_ADMIN" />제휴사관리자
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_CENTER" />센터장
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_SANGDAM" />상담
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_SEND" />파견
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_GROUP" />집단
						<input type="checkbox" name="sAuthCd" value="ROLE_PARTNER_TEACHER" />강사
					</td> 
				</tr> 
				<tr>
		        	<td align="center" width="13%"  bgcolor="#F5F5F5">상담유형</td>
					<td width="40%">
						<input type="checkbox" name="channelType" data-validation-qty="1-4" value="100001"></input>심리
						<input type="checkbox" name="channelType" data-validation-qty="1-4" value="100002"></input>법률
						<input type="checkbox" name="channelType" data-validation-qty="1-4" value="100003"></input>재무
						<input type="checkbox" name="channelType" data-validation-qty="1-4" value="100004"></input>심리검사
					</td>
				</tr>
		        
		        
		        <tr>
		            <td class="line" width="" height="40px" align="center" bgcolor="#F5F5F5">메인노출기간</td>
		            <td colspan="3">
						<input type="text" name="startDt" class="startDt cal_box" autocomplete="off" datetimeonly="true" style="width:93px;" value="${fn:substring(vo.mainStartDt, 0, 8) }" />
						<input type="text" name="startTime" class="startTime cal_box" autocomplete="off" datetimeonly="true" style="width:115px; margin-top:5px;" value="${fn:substring(vo.mainStartDt, 8, 12) }"/> 
						~ 
						<input type="text" name="endDt" class="endDt cal_box" autocomplete="off" datetimeonly="true" style="width:93px;" value="${fn:substring(vo.mainEndDt, 0, 8) }" />
						<input type="text" name="endTime" class="endTime cal_box" autocomplete="off" datetimeonly="true" style="width:115px; margin-top:5px;" value="${fn:substring(vo.mainEndDt, 8, 12) }" />
						
						<input type="hidden" id="mainStartDt" name="mainStartDt" />
						<input type="hidden" id="mainEndDt" name="mainEndDt" />
					</td>
		        </tr>
	        </c:if>

	        <tr>
	            <td class="line" width="" align="center" bgcolor="#F5F5F5">첨부파일</td>
	            <td colspan="3">
	            	<div>
	            		<a href="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" >${files1.fileNm}</a><br>
	            		<c:if test="${imgChk1 eq 'img'}">
	            			<img src="<spring:eval expression="@global['upload.http.img']" />${files1.filePath}" width="100px" height="100px"><br>
	            		</c:if>
	            		<input type="file" name="file" id="file01" size="50"    /><br>
	            		<input type="hidden" name="file1" value="${files1.fileSeq}" >
	            	</div>
					<br>
					<div>
	            		<a href="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" >${files2.fileNm}</a><br>
	            		<c:if test="${imgChk2 eq 'img'}">
	            			<img src="<spring:eval expression="@global['upload.http.img']" />${files2.filePath}" width="100px" height="100px"><br>
	            		</c:if>
	            		<input type="file" name="file" id="file02" size="50"    /><br>
	            		<input type="hidden" name="file2" value="${files2.fileSeq}" >

	            	</div>
					<br>
					<div>
	            		<a href="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" >${files3.fileNm}</a><br>
	            		<c:if test="${imgChk3 eq 'img'}">
	            			<img src="<spring:eval expression="@global['upload.http.img']" />${files3.filePath}" width="100px" height="100px"><br>
	            		</c:if>
	            		<input type="file" name="file" id="file03" size="50"    /><br>
	            		<input type="hidden" name="file3" value="${files3.fileSeq}" >
	            	</div>
					<br>
					<div>
	            		<a href="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" >${files4.fileNm}</a><br>
	            		<c:if test="${imgChk4 eq 'img'}">
	            			<img src="<spring:eval expression="@global['upload.http.img']" />${files4.filePath}" width="100px" height="100px"><br>
	            		</c:if>
	            		<input type="file" name="file" id="file04" size="50"    /><br>
	            		<input type="hidden" name="file4" value="${files4.fileSeq}" >
	            	</div>
					<br>
					<div>
	            		<a href="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" >${files5.fileNm}</a><br>
	            		<c:if test="${imgChk5 eq 'img'}">
	            			<img src="<spring:eval expression="@global['upload.http.img']" />${files5.filePath}" width="100px" height="100px"><br>
	            		</c:if>
	            		<input type="file" name="file" id="file05" size="50"    /><br>
	            		<input type="hidden" name="file5" value="${files5.fileSeq}" >
	            	</div>
					<br>
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
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
		    		<c:choose>
						<c:when test="${viewMode eq 'add'}">
							<input type="button" id="insertBtn" value="저장" style="height:30px; width:100px;">
						</c:when>
						<c:otherwise>
							<input type="button" id="updateBtn" value="수정" style="height:30px; width:100px;">
							<input type="button" id="deleteBtn" value="삭제" style="height:30px; width:100px;">
						</c:otherwise>
					</c:choose>
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

