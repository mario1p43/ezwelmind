<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상담신청정보</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">


j$(document).ready(function(){
	j$("#time").val("${vo.time}");
	j$("#ctime").val("${vo.ctime}");
	if("${vo.cstatus}"=="2" || "${vo.cstatus}"=="4"){		
		j$("#cstatus").val("${vo.cstatus}");	
	}
	
	//j$('#time option[value="${vo.time}"]').attr('selected', 'selected');
	
	var status = '${vo.cause}';
	var statusArr = status.split(',');
	
	$('input:checkbox[name="statusArr"]').each(function() {
		for(var i=0; i < statusArr.length; i++){
	    	if(this.value == statusArr[i]){ //값 비교
	    		this.checked = true; //checked 처리
	    	}
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
			var pollSeq = j$(this).parent().parent().attr("id");
			var name = j$(this).attr("name");
			updateDateAndTime(pollSeq, name, dateText.replace(/-/gi,""), 'date');
		}
	});	

	function updateDateAndTime(pollSeq, name, datetime, type){
		//alert(pollSeq +" " + name + " " + datetime);
		
		j$.ajax({
			type: "POST",
			url: "/madm/diagnosis/updateDateAndTime",
			cache: false,
			//async:false,
			data:"pollSeq="+pollSeq+"&"+name+"="+datetime,
			beforeSend: function() {
				
			},
			success: function(data){
				if(data == "1"){
					alert(type +" " + datetime +" 업데이트완료!");
				}
			},
			complete: function() {
				
			},
			error: function(data){
				alert("업데이트 오류");
			}
		});
	}
	j$('#updateBtn').click(function() {		
		
		
		var contactNo = j$("input[name='dataSeq']").val();
		if(contactNo){
			var counNm = j$("input[name='counNm']").val();
			var mobile = j$("input[name='mobile']").val();		
			var gender = j$("input[name='genderArr']").val();			
			var date = j$("input[name='date']").val();		
			var time = j$("select[name='time']").val();
			var cdate = j$("input[name='cdate']").val();
			var ctime = j$("select[name='ctime']").val();
			

			if(!counNm){
				alert("이름을 입력해 주세요");
				return false;
			}
			if(!mobile){
				alert("휴대폰은 번호만 입력해 주세요");
				return false;
			}
			if(!gender){
				alert("성별을 선택해 주세요");
				return false;
			}
			
			if(!date){
				alert("상담희망일을 선택해 주세요");
				return false;
			}
			if(!time){
				alert("상담희망시간을 선택해 주세요");
				return false;
			}
			if(j$("#cstatus").val()!="2"){
				if(!cdate){
					alert("상담예약일을 선택해 주세요");
					return false;
				}
				if(!ctime){
					alert("상담예약시간을 선택해 주세요");
					return false;
				}
			}
			
			var chk=0;
			$("input:checkbox[name=statusArr]:checked").each(function(){
				chk++;				
			});			
			if(chk==0){
				alert("상담주제는 필수 입니다.");
				return false;
			}
			
			
			
				
	
			j$.alert('수정 하시겠습니까?',function(){				
				j$("#addPublic").submit();
				alert("수정되었습니다.");
			 },function(){
			 	return false;
			 }
	 		);
			return false;
		}else{
			alert("시스템 점검 중입니다. 잠시 후 다시 이용해 주세요.");
			return false;
		}
	});

	j$("#cancleBtn").click(function(){
		location.href = "/partner/booking/list?bbsCd=sangdam&serviceType=hue";
		return false;
	});

});

</script>
</head>
<body>
<form id="addPublic" name="addPublic"  action="/partner/booking/update" method="post">
<input type="hidden" name="dataSeq" value="${vo.contactNo}">
<!--
<input type="hidden" name="subject" value="${vo.subject}">

<input type="hidden" name="clientCd" value="${vo.clientCd}">
<input type="hidden" name="replyDataSeq" value="${vo.replyDataSeq}">
<input type="hidden" id="status" name="status" value="">
<input type="hidden" id="replyYn" name="replyYn" value="">
-->
<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
	<td height="20px">
		<input type="hidden" name="serviceType" id="serviceType" value="${serviceType }">		
	<td>
<tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">
					상담신청정보
		    	</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">*이름</th>
	            <td width="85%" colspan="3">
	            <input type="text" name="counNm" value="${vo.counNm}">
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">*휴대폰번호</th>
	            <td width="85%" colspan="3">
	            <input type="NUMBER" name="mobile" value="${vo.mobile}">
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">*성별</th>
	            <td width="85%" colspan="3">
	            		    		<input type="radio" name="genderArr" id="check_M"  value="M" <c:if test="${vo.gender eq 'M'}"> checked </c:if>>
				    <label for="check_M">남</label>
				    
				    <input type="radio" name="genderArr" id="check_F"  value="F" <c:if test="${vo.gender eq 'F'}"> checked </c:if>>
				    <label for="check_F">여</label>
	            </td>
	        </tr>	        
	    	<tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">생년월일</th>
	            <td width="85%" colspan="3">
	            <input type="NUMBER" name="rrn" value="${vo.rrn}">
	            </td>
	        </tr>
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">*상담희망일</th>
	            <td width="85%" colspan="3">
	            <input type="text" name="date" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${vo.date}"/>
	            &nbsp;
	            <select name="time" id="time">	           
		            <option value="10">10</option>
		            <option value="11">11</option>
		            <option value="12">12</option>
		            <option value="13">13</option>
		            <option value="14">14</option>
		            <option value="15">15</option>
		            <option value="16">16</option>
		            <option value="17">17</option>
		            <option value="18">18</option>
		            <option value="19">19</option>	            	           
	            </select>
	            </td>
	        </tr>

	    	<tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">*상담주제</th>
	            <td width="85%" colspan="3">
	            			   
		    		<input type="checkbox" name="statusArr" id="bcheck_1" value="1" >
				    <label for="bcheck_1">건강한 마음</label>
		    		
		    		<input type="checkbox" name="statusArr" id="bcheck_2" value="2">
				    <label for="bcheck_2">성장하는 삶</label>
				    
				    <input type="checkbox" name="statusArr" id="bcheck_3" value="3" >
				    <label for="bcheck_3">행복한 가정</label>
				    
				    <input type="checkbox" name="statusArr" id="bcheck_4" value="4" >
				    <label for="bcheck_4">즐거운 직장</label>

					<input type="checkbox" name="statusArr" id="bcheck_5" value="5" >
				    <label for="bcheck_5">기타</label>				    
	            </td>
	        </tr>
	        
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">상담세부주제</th>
	            <td width="85%" colspan="3">
	            <input type="text" name="memo" value="${vo.memo}" size="100">
	            </td>
	        </tr>
	            	        
	        
		</table>
	</td>
</tr>
<tr>
	<td height="20px"></td>
</tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="0" width="100%" align="center" style="border-bottom: 1px solid silver;">
			<tr>
		    	<td align="left" class="subtitle">
					예약정보
		    	</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td valign="top" align="left">
		<table cellpadding="5" cellspacing="0" border="1" width="100%" style="border-collapse:collapse; margin: 15px auto 5px auto;">
		<tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">*상담예약일</th>
	            <td width="85%" colspan="3">
	            <input type="text" name="cdate" class="endDt cal_box" datetimeonly="true" style="width:93px;" value="${vo.cdate}"/>
	            &nbsp;
	            <select name="ctime" id="ctime">
		            <option value="10">10</option>
		            <option value="11">11</option>
		            <option value="12">12</option>
		            <option value="13">13</option>
		            <option value="14">14</option>
		            <option value="15">15</option>
		            <option value="16">16</option>
		            <option value="17">17</option>
		            <option value="18">18</option>
		            <option value="19">19</option>	        
	            </select>
	            </td>
	        </tr>
			<tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">상태</th>
	            <td width="85%" colspan="3">	            
	            <select id="cstatus" name="cstatus">
	            	<option value="3">선택</option>
	            	<option value="2">신청취소</option>	            	
	            	<option value="4">상담완료</option>
	            </select>
	            </td>
	        </tr>	        
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">상담사메모</th>
	            <td width="85%" colspan="3">
	            <input type="text" name="cmemo" value="${vo.cmemo}" size="100">
	            </td>
	        </tr>            	        
	        <tr>
	            <th class="line" width="15%" align="center" bgcolor="#F5F5F5">SMS발송</th>
	            <td width="85%" colspan="3">
	            <input type="radio" name="smsArr" id="smsArr"  value="on" >
				    <label for="smsArr">발송</label>
	            </td>
	        </tr>     	        
		</table>
	</td>
</tr>
<tr>
<td height="20px">*SMS발송 체크박스를 선택시 상담신청고객에게 안내 SMS가 전송됩니다.</td>
</tr>
<tr>
	<td>
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="updateBtn" value="수정" style="height:30px; width:100px;">
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

