<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마음컨설팅 관리</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script type="text/javascript">
if(${familyCnt}==0) var num = 1;
else var num = ${familyCnt};
var chgnum=1;
var num0 = 1;
var de ="";
var delCnt = 1;
var chkId = 0;
j$(document).ready(function(){
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


	<c:if test='${not empty vo.cause}'>
	var chkValue = '${vo.cause}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=cause][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	

	
	//밸리데이션 체크
	$.validate({
		form : '#counselorAdd',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
			//$('[name=rrn]').val($('#rrn1').val() + "-" + $('#rrn2').val());
			$('[name=rrn]').val($('#rrn1').val());
			if(chkId != 1){
				alert("아이디 중복확인을 해야합니다.");
				return false;
			}
			else if(j$('#userPwd').val() != j$('#userPwdChk').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	});
	
	j$('#addBtn2').click(function() {
		window.location.href = "/partner/counsel/list";
	});
	j$('#addBtn').click(function() {
		
		var chkCounselorId=$("#chkCounselorId").val();
		var chkuserNm=$("#userNm").val();
		
		
		if(chkCounselorId!=chkuserNm){
			if(chkCounselorId!=""){
				alert("상담사를 변경하실 경우 변경할 상담사 선택 후 [마음컨설팅생성] 버튼을 클릭해 주셔야 정상 변경됩니다.");
				return false;	
			}
			
		}
		if(${vo.status}=="3"){
			alert("종결된 마음컨설팅은 수정이 불가능 합니다. 확인해 주세요");
			return false;
		}
		if($("#date").val()==""){
			alert("고객 작성일은 필수입니다.");
			return false;
		}
		if($("#counselNm").val()==""){
			alert("이름은 필수입니다.");
			return false;
		}
		if($("#gender").val()==""){
			alert("성별은 필수입니다.");
			return false;
		}
		if($("#rrn").val()==""){
			alert("생년월일은 필수입니다.");
			return false;
		}
		if($("#mobile").val()==""){
			alert("휴대폰번호는 숫자만 입력해 주세요.휴대폰번호는 필수입니다.");
			return false;
		}
		
		if($("#mainIssue").val() ==0){
			alert("상담주제는 필수입니다.");
			return false;
		}
		if($("#counselText").val()==""){
			alert("주호소 문제는 필수입니다.");
			return false;
		}
		if($("#opinion").val()==""){
			alert("마음컨설팅 소견은 필수입니다.");
			return false;
		}		
		//상담사 중복체크
		var intakeCd=$("#intakeCd").val();
		var userNm=$("#userNm option:selected").val();
		var counselCd=$("#counselCd").val();
		var params = {};	
		params.intakeCd  = intakeCd;
		params.userNm  = userNm;
		params.counselCd=counselCd;
		if(intakeCd == ""){
			alert("마음컨설팅을 먼저 등록해 주세요.");
		}else{
			j$.ajax({			
				url: "/partner/counsel/checkUser",
				data: params,
				dataType: 'json',
				type: 'GET',
				cache:true,			
				 	success: function(data, textStatus){
				 	var d =  data.mgr

					if(data.mgr != null){
						if(d.counselorId != ""){						
							alert("다른 마음컨설팅에 동일한 상담사가 존재 합니다. 확인해 주세요");
						}
						}else{						
							j$("#num").val(num);
							j$("#num0").val(num0);
							if( confirm( "수정하시겠습니까?") ){
								j$("#counselUpdate").submit();
							}
						}			 									 
				},		
				error: function(data){
					alert("업데이트 오류");
				}
			});
		}
		

	});
	
});

function faddSangdam() {
		
	var intakeCd=$("#intakeCd").val();
	var userNm=$("#userNm option:selected").val();
	var params = {};	
	params.intakeCd  = intakeCd;
	params.userNm  = userNm;
	params.counselCd="";
	
	if(${vo.status}=="3"){
		alert("종결된 마음컨설팅은 신규 상담일지 생성이 불가능 합니다. 확인해 주세요");
		return false;
	}
	
	if(intakeCd == ""){
		alert("마음컨설팅을 먼저 등록해 주세요.");
	}else{
		j$.ajax({			
			url: "/partner/counsel/checkUser",
			data: params,
			dataType: 'json',
			type: 'GET',
			cache:true,			
			 	success: function(data, textStatus){
			 		
			 	var d =  data.mgr
			 	
				if(data.mgr != null){					
					if(d.counselorId != ""){					
						alert("마음컨설팅에 동일한 상담사가 존재 합니다. 확인해 주세요");
					}else if(d.counselorId == ""){
						alert("마음컨설팅에 상담원이 등록되지 않은 건이 존재 합니다. 확인해 주세요");
					}
				}else{						
					
						j$("#counselUpdate").attr('action','/partner/counsel/updateCounselMgr2').submit();			
				}			 									 
			},		
			error: function(data){
				alert("업데이트 오류");
			}
		});
	}
}


 function addRow(e){
	var params = {};
	var strData = "";
	
	if(num == (10)){
		alert("10개까지 등록 가능합니다.");
		return false;
	}
	num++;
	var oRow = e.insertRow(num);
	var oCel1 = oRow.insertCell(0);
	var oCel2 = oRow.insertCell(1);
	var oCel3 = oRow.insertCell(2);
	var oCel4 = oRow.insertCell(3);
	var oCel5 = oRow.insertCell(4);
	
			oCel1.innerHTML = "<input type='text' name='fname"+num+"' id='fname"+num+"' style='width: 150px'/>";
			oCel2.innerHTML = "<input type='text' name='frelation"+num+"' id='frelation"+num+"' style='width: 150px'/>";
			oCel3.innerHTML = "<input type='text' name='fage"+num+"' id='fage"+num+"' style='width: 150px'/>";
			oCel4.innerHTML = "<input type='text' name='fjob"+num+"' id='fjob"+num+"' style='width: 150px'/>";
			
			strData="<input type='radio' name='fgrade"+num+"' id='fgrade"+num+"' value='1'  /> 매우 멀다";
			strData+=" <input type='radio' name='fgrade"+num+"' id='fgrade"+num+"' value='2'  /> 멀다"; 
			strData+=" <input type='radio' name='fgrade"+num+"' id='fgrade"+num+"' value='3'  /> 보통";
			strData+=" <input type='radio' name='fgrade"+num+"' id='fgrade"+num+"' value='4'  /> 가깝다";
			strData+=" <input type='radio' name='fgrade"+num+"' id='fgrade"+num+"' value='5'  /> 매우 가깝다";								
			oCel5.innerHTML =strData;

	} 
 function addRow1(e){
		var params = {};
		var strData = "";
		
		if(num0 == (4)){
			alert("5개까지 등록 가능합니다.");
			return false;
		}
		num0++;
		var oRow = e.insertRow(num0);
		var oCel = oRow.insertCell();
		
		strData +=	"<input type='text' name='etc"+num0+"' id='certEtc"+num0+"' style='width: 210px'/><input type='file' name='file_"+num0+"' data-validation='required' data-validation-error-msg-required='첨부파일은 필수입니다.' />";
		oCel.innerHTML = strData;

		} 
function delRow(e){
	if(num == 1){
		alert("최소1개 이상 등록 하셔야 합니다.");
		return false;
	}
	var oTr = e.deleteRow(num);
	num--;
}
function delRow1(e){
	if(num0 ==1){
		alert("최소2개 이상 등록 하셔야 합니다.");
		return false;
	}
	var oTr = e.deleteRow(num0);
	num0--;
}

</script>

</head>
<body>

<form id="counselUpdate" name="counselUpdate" action="/partner/counsel/updateCounselMgr" method="POST" enctype="multipart/form-data">
<input type="hidden" name="num" id="num">
<input type="hidden" name="num0" id="num0">
<input type="hidden" name="intakeCd" id="intakeCd" value="${vo.intakeCd}">
<input type="hidden" name="counselCd" id="counselCd" value="${vo.counselCd}">
<input type="hidden" name="familyCnt" id="familyCnt" value="${familyCnt}">
<input type="hidden" name="chkCounselorId" id="chkCounselorId" value="${vo.counselorId}">

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="left" class="subtitle">마음컨설팅 관리</td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
<tr>
	<td valign="top" align="left">		
		<br/>ㆍ기본정보
		
		<table cellpadding="5"  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">			
			<tr>
				<th class="line"  width="170px" colspan="1" align="left" bgcolor="#F5F5F5">* 고객작성일</td>
				<td class="line" colspan="3">
        			<input type="text" name="counselDd" id="counselDd" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${vo.counselDd}" />
		            &nbsp;
		            시작시간 : 
		            <select name="stDt" id="stDt">	           
			            <option value="1000" <c:if test="${vo.stDt eq '1000'}"> selected</c:if>>10:00</option>
			            <option value="1100" <c:if test="${vo.stDt eq '1100'}"> selected</c:if>>11:00</option>
			            <option value="1200" <c:if test="${vo.stDt eq '1200'}"> selected</c:if>>12:00</option>
			            <option value="1300" <c:if test="${vo.stDt eq '1300'}"> selected</c:if>>13:00</option>
			            <option value="1400" <c:if test="${vo.stDt eq '1400'}"> selected</c:if>>14:00</option>
			            <option value="1500" <c:if test="${vo.stDt eq '1500'}"> selected</c:if>>15:00</option>
			            <option value="1600" <c:if test="${vo.stDt eq '1600'}"> selected</c:if>>16:00</option>
			            <option value="1700" <c:if test="${vo.stDt eq '1700'}"> selected</c:if>>17:00</option>
			            <option value="1800" <c:if test="${vo.stDt eq '1800'}"> selected</c:if>>18:00</option>
			            <option value="1900" <c:if test="${vo.stDt eq '1900'}"> selected</c:if>>19:00</option>	            	           
			            <option value="2000" <c:if test="${vo.stDt eq '2000'}"> selected</c:if>>20:00</option>
			            <option value="2100" <c:if test="${vo.stDt eq '2100'}"> selected</c:if>>21:00</option>
			            <option value="2200" <c:if test="${vo.stDt eq '2200'}"> selected</c:if>>22:00</option>
		            </select>
		            종료시간 : 
		            <select name="edDt" id="edDt">	           
			            <option value="1100" <c:if test="${vo.edDt eq '1100'}"> selected</c:if>>11:00</option>
			            <option value="1200" <c:if test="${vo.edDt eq '1200'}"> selected</c:if>>12:00</option>
			            <option value="1300" <c:if test="${vo.edDt eq '1300'}"> selected</c:if>>13:00</option>
			            <option value="1400" <c:if test="${vo.edDt eq '1400'}"> selected</c:if>>14:00</option>
			            <option value="1500" <c:if test="${vo.edDt eq '1500'}"> selected</c:if>>15:00</option>
			            <option value="1600" <c:if test="${vo.edDt eq '1600'}"> selected</c:if>>16:00</option>
			            <option value="1700" <c:if test="${vo.edDt eq '1700'}"> selected</c:if>>17:00</option>
			            <option value="1800" <c:if test="${vo.edDt eq '1800'}"> selected</c:if>>18:00</option>
			            <option value="1900" <c:if test="${vo.edDt eq '1900'}"> selected</c:if>>19:00</option>
			            <option value="2000" <c:if test="${vo.edDt eq '2000'}"> selected</c:if>>20:00</option>	    
			            <option value="2100" <c:if test="${vo.edDt eq '2100'}"> selected</c:if>>21:00</option>	                   	           
			            <option value="2200" <c:if test="${vo.edDt eq '2200'}"> selected</c:if>>22:00</option>
			            <option value="2300" <c:if test="${vo.edDt eq '2300'}"> selected</c:if>>23:00</option>
		            </select>
					<span> * 고객이 '마음컨설팅'을 작성한 날짜(상담일)을 기입해 주세요.</span>
				</td>
			</tr>
			<tr align="left" height="30px">
				<th class="line" height="30" align="left" bgcolor="#F5F5F5">* 이름</th>
				<td class="line" colspan="3">
					<input type="text" name="counselNm" id="counselNm" value="${vo.counselNm}"  style="width:20%;"  data-validation="required"  data-validation-error-msg-required="이름을 확인 해주세요."/>
				</td>
			</tr>
			<tr>
	            <th class="line" height="30" align="left" bgcolor="#F5F5F5">* 성별</th>
	            <td width="85%" colspan="3">
	            	<input type="radio" name="gender" id="gender"  value="M"  <c:if test="${vo.gender eq 'M'}"> checked</c:if> >
				    <label for="check_M">남</label>				    
				    <input type="radio" name="gender" id="gender"  value="F" <c:if test="${vo.gender eq 'F'}"> checked</c:if>>
				    <label for="check_F">여</label>
	            </td>
	        </tr>	        
	    	<tr>
	            <th class="line" height="30" align="left" bgcolor="#F5F5F5">* 생년월일</th>
	            <td width="85%" colspan="3">
	            <input type="NUMBER" name="rrn"  id="rrn"  value="${vo.rrn}">
	            &nbsp;&nbsp;ex)&nbsp;19850530
	            </td>
	        </tr>
	        <tr>
	            <th class="line" height="30" align="left" bgcolor="#F5F5F5">* 휴대폰번호</th>
	            <td width="85%" colspan="3">
	            <input type="NUMBER" name="mobile" id="mobile" value="${vo.mobile}">
	            &nbsp;&nbsp;ex)&nbsp;01012345678
	            </td>
	        </tr>
	        <tr>
	            <th class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp; 이메일</th>
	            <td width="85%" colspan="3">
	            <input type="text" name="email" id="email" value="${vo.email}">
	            </td>
	        </tr>	        
	        <tr>
			<tr>			
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp; 결혼상태</th>
				<td colspan="3">
					<%-- <input type="radio" name="marry"  id="marry"  value="1" data-validation="required" data-validation-error-msg-required="근무형태를 확인해주세요." <c:if test="${vo.marry eq '1'}"> checked</c:if>/> 미혼
					<input type="radio" name="marry"  id="marry" value="2" <c:if test="${vo.marry eq '2'}"> checked</c:if>/> 기혼
					<input type="radio" name="marry"  id="marry" value="3" <c:if test="${vo.marry eq '3'}"> checked</c:if>/> 이혼
					<input type="radio" name="marry"  id="marry" value="4" <c:if test="${vo.marry eq '4'}"> checked</c:if>/> 사별 --%>
					<commClient:select name="marry" id="marry" clientCd="hue" code="100002" basicValue="---- 선 택 ----"  selectValue="${vo.marry}"/>
				</td>							
			</tr>
			<tr>
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;학력</th>
				<td colspan="3">
					<commClient:select name="education" id="education" clientCd="hue" code="100001"	basicValue="---- 선 택 ----"  selectValue="${vo.education}"/>
					<commClient:select name="session" id="session" clientCd="hue" code="100003"	basicValue="---- 선 택 ----"  selectValue="${vo.session }"/>
				<%-- 	 <select name="education" id="education">
					 <option value="" <c:if test="${vo.education eq ''}"> selected</c:if>>선택</option>	           		            
		            <option value="1" <c:if test="${vo.education eq '1'}"> selected</c:if>>초등학교</option>
		            <option value="2" <c:if test="${vo.education eq '2'}"> selected</c:if>>중학교</option>
		            <option value="3" <c:if test="${vo.education eq '3'}"> selected</c:if>>고등학교</option>
		            <option value="4" <c:if test="${vo.education eq '4'}"> selected</c:if>>대학교</option>
		            <option value="5" <c:if test="${vo.education eq '5'}"> selected</c:if>>대학원</option>		            	            	           
	            </select>
	            	 <select name="session" id="session">
	            	 <option value="" <c:if test="${vo.session eq ''}"> selected</c:if>>선택</option>	           		            
		            <option value="1" <c:if test="${vo.session eq '1'}"> selected</c:if>>재학</option>
		            <option value="2" <c:if test="${vo.session eq '2'}"> selected</c:if>>졸업</option>
		            <option value="3" <c:if test="${vo.session eq '3'}"> selected</c:if>>중퇴</option>		            	            	          
	            </select> --%>
				</td>
			</tr>		
						
			</table>
		

		<br/>ㆍ가족관계
		
		<table cellpadding="5"  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">			
			<tr>
				<th class="line"  width="160px" colspan="1" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;가족관계&nbsp;&nbsp; <input type="button" id="plus" onclick="addRow(cert);" value="+" />&nbsp;<input type="button" onclick="delRow(cert);" value="-" /> </th>
						<td class="line" colspan="3">
						<table id="cert"   cellpadding="5"  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">		
							<tr align="left" >
							<td width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">							
							성명
							</td>
							<td width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">
							관계
							</td>
							<td width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">
							연령
							</td>
							<td width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">
							직업
							</td>
							<td width="" class="line" height="30" align="left" bgcolor="#F5F5F5">
							친밀도
							</td>
							</tr>
							<c:if test="${familyCnt eq 0}">							
								<tr align="left" >
								<td class="line" >							
								<input type='text' name="fname1" id="fname1" style="width: 150px" />
								</td>
								<td class="line" >							
								<input type='text' name="frelation1" id="frelation1" style="width: 150px" />
								</td>
								<td class="line" >							
								<input type='text' name="fage1" id="fage1" style="width: 150px"  />
								</td>
								<td class="line" >							
								<input type='text' name="fjob1" id="fjob1" style="width: 150px"  />
								</td>
								<td class="line"  >							
								<input type="radio" name="fgrade1" id="fgrade1"  value="1"  /> 매우 멀다
								<input type="radio" name="fgrade1" id="fgrade1" value="2"  /> 멀다 
								<input type="radio" name="fgrade1" id="fgrade1" value="3"  /> 보통
								<input type="radio" name="fgrade1" id="fgrade1" value="4"  /> 가깝다
								<input type="radio" name="fgrade1" id="fgrade1" value="5"  /> 매우 가깝다
								</td>
								</tr>
							</c:if>
							<c:if test="${familyCnt  > 0}">
							<c:forEach var="list" items="${familyList}" varStatus="listCnt">						
								<tr align="left" >
								<td class="line" >							
								<input type='text' name="fname${listCnt.count}" id="fname${listCnt.count}" style="width: 150px" value="${list.fname}" />
								</td>
								<td class="line" >							
								<input type='text' name="frelation${listCnt.count}" id="frelation${listCnt.count}" style="width: 150px" value="${list.frelation}"/>
								</td>
								<td class="line" >							
								<input type='text' name="fage${listCnt.count}" id="fage${listCnt.count}" style="width: 150px" value="${list.fage}"/>
								</td>
								<td class="line" >							
								<input type='text' name="fjob${listCnt.count}" id="fjob${listCnt.count}" style="width: 150px" value="${list.fjob}"/>
								</td>
								<td class="line"  >							
								<input type="radio" name="fgrade${listCnt.count}" id="fgrade${listCnt.count}"  value="1"  <c:if test="${list.fgrade eq '1'}"> checked</c:if>/> 매우 멀다
								<input type="radio" name="fgrade${listCnt.count}" id="fgrade${listCnt.count}" value="2"   <c:if test="${list.fgrade eq '2'}"> checked</c:if> /> 멀다 
								<input type="radio" name="fgrade${listCnt.count}" id="fgrade${listCnt.count}" value="3"   <c:if test="${list.fgrade eq '3'}"> checked</c:if>/> 보통
								<input type="radio" name="fgrade${listCnt.count}" id="fgrade${listCnt.count}" value="4"   <c:if test="${list.fgrade eq '4'}"> checked</c:if> /> 가깝다
								<input type="radio" name="fgrade${listCnt.count}" id="fgrade${listCnt.count}" value="5"   <c:if test="${list.fgrade eq '5'}"> checked</c:if>/> 매우 가깝다
								</td>
								</tr>
							</c:forEach>
							</c:if>
						</table>	
						</td>
					</tr>			
			</table>

	
		
				
		
					
<br/>ㆍ상담정보
	<table cellpadding="5"  cellspacing="0"  border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th width="170px" class="line" height="30" align="left" bgcolor="#F5F5F5">* 상담주제</td>
				<td>
					<commClient:select name="cause" id="cause" clientCd="hue" code="100004"	basicValue="---- 선 택 ----"  selectValue="${vo.cause }"/>
					<!-- <input type="checkbox" name="cause"  id="cause"  value="1" data-validation="checkbox_group" data-validation-qty="min1" data-validation-error-msg="유형을 선택해주세요." /> 건강한 마음
					<input type="checkbox" name="cause"  id="cause" value="2" /> 성장하는 삶
					<input type="checkbox" name="cause"  id="cause" value="3" /> 행복한 가정
					<input type="checkbox" name="cause"  id="cause" value="4" /> 즐거운 직장
					<input type="checkbox" name="cause"  id="cause" value="5" /> 기타 -->
				</td>
			</tr>
		    <tr>
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">* 주호소 문제</td>
				<td class="line" colspan="3">					
					<textarea rows="5" cols="80" maxlength="1500" name="mainIssue" id="mainIssue" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${vo.mainIssue}</textarea>
				</td>
			</tr>
			<tr>
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp; 심리검사</td>
				<td class="line" colspan="3">					
					<textarea rows="5" cols="80" maxlength="1500"  name="counselText" id="counselText" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${vo.counselText}</textarea>
				</td>
			</tr>
			<tr>
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">* 마음컨설팅 소견</td>
				<td class="line" colspan="3">					
					<textarea rows="5" cols="80" maxlength="1500"  name="opinion" id="opinion" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${vo.opinion}</textarea>
				</td>
			</tr>
			
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;첨부파일&nbsp;&nbsp; <input type="button" id="plus" onclick="addRow1(cert1);" value="+" />&nbsp;<input type="button" onclick="delRow1(cert1);" value="-" /> </th>
						<td class="line" colspan="3">
						<table id="cert1">
							<tr align="left" >
							<td class="line" >							
							<input type='text' name="etc0" id="certEtc0" style="width: 210px"/><input type='file' name="file_0" />
							</td>
							</tr>
							<tr align="left" >
							<td class="line" >							
							<input type='text' name="etc1" id="certEtc1" style="width: 210px"/><input type='file' name="file_1" />
							</td>
							</tr>							
						</table>	
						</td>
					</tr>			
			<%-- <tr>
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;첨부파일&nbsp;&nbsp;  </th>
						<td class="line" colspan="3">
						<table id="cert1">
							<tr align="left" >
							<td class="line" >							
							<input type='text' name="etc0" id="certEtc0" style="width: 210px" value="${vo.file1}"/><input type='file' name="file_0" />
							<c:if test="${not empty vo.fileP1}">		            			
					            	<a href="javascript:fileDownLoad('${vo.fileP1}', '${vo.file1}');">&nbsp;파일다운로드</a><br>		            			
		            		</c:if>
							</td>
							</tr>
							<tr align="left" >
							<td class="line" >							
							<input type='text' name="etc1" id="certEtc1" style="width: 210px" value="${vo.file2}"/><input type='file' name="file_1" />
							<c:if test="${not empty vo.fileP2}">		            			
					            	<a href="javascript:fileDownLoad('${vo.fileP2}', '${vo.file2}');">&nbsp;파일다운로드</a><br>		            			
		            		</c:if>
							</td>
							</tr>	
							<tr align="left" >
							<td class="line" >							
							<input type='text' name="etc2" id="certEtc2" style="width: 210px" value="${vo.file3}"/><input type='file' name="file_2" />
							<c:if test="${not empty vo.fileP3}">		            			
					            	<a href="javascript:fileDownLoad('${vo.fileP3}', '${vo.file3}');">&nbsp;파일다운로드</a><br>		            			
		            		</c:if>
							</td>
							</tr>	
							<tr align="left" >
							<td class="line" >							
							<input type='text' name="etc3" id="certEtc3" style="width: 210px" value="${vo.file4}"/><input type='file' name="file_3" />
							<c:if test="${not empty vo.fileP4}">		            			
					            	<a href="javascript:fileDownLoad('${vo.fileP4}', '${vo.file4}');">&nbsp;파일다운로드</a><br>		            			
		            		</c:if>
							</td>
							</tr>	
							<tr align="left" >
							<td class="line" >							
							<input type='text' name="etc4" id="certEtc4" style="width: 210px" value="${vo.file5}"/><input type='file' name="file_4" />
							<c:if test="${not empty vo.fileP5}">		            			
					            	<a href="javascript:fileDownLoad('${vo.fileP5}', '${vo.file5}');">&nbsp;파일다운로드</a><br>		            			
		            		</c:if>
							</td>
							</tr>														
						</table>	
						</td>
					</tr>			 --%>
				<tr>
					<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">진행상태</th>
					<td colspan='3'>
						${vo.strStatus }
					</td>
				</tr>
			 <tr>
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">상담사</th>
				<td colspan='3'>
					<select id="userNm" name="userNm" >
						<option value="" >전체</option>						
						<c:forEach var="list" items="${userList}" varStatus="listCnt">
								<option value="${list.value }"  <c:if test="${vo.counselorId eq list.value}"> selected</c:if>>${list.title }</option>
						</c:forEach>
					</select>
					<input type="button" id="addSangdam" onclick="faddSangdam();" value="마음컨설팅생성" />
					※ 상담사를 변경하실 경우 변경할 상담사 선택 후 "마음컨설팅생성" 버튼을 클릭해 주셔야 정상 변경됩니다.
				</td>
				</tr>		
			<tr>
				<th width="10%" class="line" height="30" align="left" bgcolor="#F5F5F5">등록자</th>
				<td colspan='3'>
					${vo.regNm }
				</td>
			</tr>
		</table>					
 		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="addBtn" value="수정" style="height:30px; width:100px;">
					<span style="margin-left: 20px;"></span>				
					<input type="button" id="addBtn2" value="취소" style="height:30px; width:100px;">
					<span style="margin-left: 20px;"></span>
				</td>
			</tr>
		</table>
		<!-- 버튼 영역 시작 -->
		
	</td>
</tr>

</table>
</form>

</body>
</html>