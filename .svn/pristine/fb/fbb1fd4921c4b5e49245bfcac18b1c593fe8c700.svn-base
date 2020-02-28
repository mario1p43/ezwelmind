<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상담사관리 등록</title>
<link href="${url:resource('/resources/js/plugin/jquery-ui-1.8.9.custom-datepicker.css')}" rel="stylesheet" type="text/css" />
<link href="${url:resource('/resources/js/plugin/jquery.timepicker.min.css')}" rel="stylesheet" type="text/css" />
<script src="${url:resource('/resources/js/plugin/jquery.timepicker.min.js')}"></script>
<script src="${url:resource('/resources/js/jquery-ui-1.10.3.min.js')}"></script>
<script type="text/javascript">
j$(document).ready(function(){
	var status = '${intake.type}';
	var statusArr = status.split(',');
	
	$('input:checkbox[name="typeArr"]').each(function() {
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


	<c:if test='${not empty vo.cause}'>
	var chkValue = '${vo.cause}';
	var chkArr = chkValue.split(',');
	for (var i = 0; i < chkArr.length; i++) {
		if(chkArr[i] != ""){
		$('[name=cause][value=' + chkArr[i] + ']').attr('checked',true);
		}
	}
	</c:if>
	
	j$("#counselBtn").click(function() {
		var dataSeq = j$("#counselNo").val();
		
		location.href = "/partner/counsel/modifyCounselDetailForm?dataSeq="+dataSeq;
		return false;
	
	});
	
	j$('#addBtn2').click(function() {
		window.location.href = "/partner/sangdam/list";
	});
	
j$('#addBtn').click(function() {
		
		var statusVal=$(':radio[name="status"]:checked').val();

		if($(':radio[name="status"]:checked').val()==undefined){
			alert("진행상태는 필수입니다.");
			return false;
			
		}

		if(${intake.status}=="3"){
			alert("종결된 마음컨설팅은 수정이 불가능 합니다. 확인해 주세요");
			return false;
		}
		if(statusVal=="2"){
			if($("#nextDt").val()==""){
				alert("다음 상담계획은 필수입니다.");
				return false;
			}		
		}else{
		if($("#memo1").val()==""){
			alert("최종목표는 필수입니다.");
			return false;
		}
		if($("#memo2").val()==""){
			alert("과정목표는 필수입니다.");
			return false;
		}
		if($("#memo3").val()==""){
			alert("상담계획은 필수입니다.");
			return false;
		}		
		
		var typeNo=0;
		$("input:checkbox[name=typeArr]:checked").each(function(){
			typeNo++;
		});
		
		if(typeNo==0){
			alert("상담종류는 필수입니다.");
			return false;
		}		
		
		if($("#date").val()==""){
			alert("상담일시는 필수입니다.");
			return false;
		}
		if($("#subject").val()==""){
			alert("회기주제는 필수입니다.");
			return false;
		}
		if($("#mainIssue").val()==""){
			alert("주호소문제는 필수입니다.");
			return false;
		}
		if($("#goal").val()==""){
			alert("상담목표는 필수입니다.");
			return false;
		}


		if($("#intervention").val()==""){
			alert("주요개입은 필수입니다.");
			return false;
		}
		if($("#feedback").val()==""){
			alert("내담자 주요반응은 필수입니다.");
			return false;
		}
		
		if($("#rmemo1").val()==""){
			alert("문제와 관련된 역사적 배경은 필수입니다.");
			return false;
		}		
		if($("#rmemo2").val()==""){
			alert("문제와 관련된 내담자의 내적 요인은 필수입니다.");
			return false;
		}
		if($("#rmemo3").val()==""){
			alert("문제와 관련된 내담자의 상황적 요인은 필수입니다.");
			return false;
		}
		if($("#rmemo4").val()==""){
			alert("내담자의 대인관계 양상은 필수입니다.");
			return false;
		}
		if($("#rmemo5").val()==""){
			alert("내담자의 자원 및 취약점은 필수입니다.");
			return false;
		}
		if($("#rmemo6").val()==""){
			alert("문제에 대한 상담자의 종합적 이해는 필수입니다.");
			return false;
		}
				
		
		if($(':radio[name="risks"]:checked').val()==undefined){
			alert("사례위험도는 필수입니다.");
			return false;
		}
			
		if(statusVal=="1"){
			if($(':radio[name="nextFlag"]:checked').val()==undefined){
				alert("다음 상담계획은 필수입니다.");
				return false;
			}
			
			if($(':radio[name="nextFlag"]:checked').val()=="1"){
				if($("#nextDt").val()==""){
					alert("다음 상담계획은 필수입니다.");
					return false;
				}		
			}
		}else	if(statusVal=="2"){			
			if($(':radio[name="nextFlag"]:checked').val()==undefined){
				alert("다음 상담계획은 필수입니다.");
				return false;
			}
			if($(':radio[name="nextFlag"]:checked').val()=="1"){
				if($("#nextDt").val()==""){
					alert("다음 상담계획은 필수입니다.");
					return false;
				}		
			}									
		}else{
			if($(':radio[name="issue"]:checked').val()==undefined){
				alert("만족도는 필수입니다.");
				return false;
			}		
			
			if($("#callingIssue").val()==""){
				alert("만족도 이유는 필수입니다.");
				return false;
			}		
		}
		


		
		
		var frm = sangdamUpdate;
		var temp ="" ;
		var cnt = 0;
		for(var i=0;i<frm.elements["typeArr"].length;i++){
			if(frm.elements["typeArr"][i].checked > 0){
				if(cnt!=0){   
				   temp +=","+ frm.elements["typeArr"][i].value;
				}else{
				   temp += frm.elements["typeArr"][i].value;
				}
				cnt++;
			    }
		    }		
		 frm.elements["type"].value = temp;
		}
		alert("저장되었습니다.");
		j$("#sangdamUpdate").submit();
		
	});
	
});

function onChg(){
	var counselNo=$("#counselNo").val();
	var pageNum=$("#pageNum option:selected").val();
		
	location.href = "/partner/sangdam/modifySangdamDetailForm?dataSeq="+counselNo+"&pageNum="+pageNum;
}
function chgStatus(val){
	if(val=='1'){
		$("#id1").show();
		$("#id2").hide();
		$("#id3").hide();
		$("#id4").hide();
		$("#id5").hide();
	}else if(val=='2'){
		$("#id1").show();
		$("#id2").hide();
		$("#id3").hide();
		$("#id4").hide();
		$("#id5").hide();
	}else if(val=='3'){
		$("#id1").hide();
		$("#id2").show();
		$("#id3").show();
		$("#id4").show();
		$("#id5").show();
		
	}
}
</script>

</head>
<body>

<form id="sangdamUpdate" name="sangdamUpdate" action="/partner/sangdam/updateSangdamMgr" method="POST" enctype="multipart/form-data">
<input type="hidden" name="intakeCd" id="intakeCd" value="${intake.intakeCd}">
<input type="hidden" name="counselNo" id="counselNo" value="${intake.counselNo}">
<input type="hidden" name="type" id="type" value="${intake.type}">
<input type="hidden" name="recordCd" id="recordCd" value="${record.recordCd}">
<input type=hidden name="intakeNum" id="intakeNum" value="${intake.intakeNum}">

<table cellpadding="0" cellspacing="0" border="0" width="95%" height="100%">
<tr>
		<td height="10px"></td>
	</tr>
	<tr>
		<td align="left" class="subtitle">상담일지 관리</td>
	</tr>
	<tr>
		<td height="10px"></td>
	</tr>
<tr>
	<td valign="top" align="left">		
		<br/>ㆍ고객 마음컨설팅 정보
		
		<table cellpadding="5"  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">			
			<tr>
				<th class="line"  width="170px" colspan="1" align="left" bgcolor="#F5F5F5">* 마음컨설팅</th>
				<td class="line" colspan="5">
					            ${intake.counselNm}/${intake.mobile}
				</td>
			</tr>						
			</table>						
			<br />
		
		<table cellpadding="5"  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">			
			<tr>
				<th class="line"  width="170px" colspan="1" align="left" bgcolor="#F5F5F5">* 고객작성일</th>
				<td class="line" >${ intake.date}&nbsp;${ intake.time}<c:if test="${not empty intake.time}">시</c:if></td>
				<th class="line"  width="170px" colspan="1" align="left" bgcolor="#F5F5F5">* 이름</th>
				<td class="line" >${intake.counselNm}</td>
				<th class="line"  width="170px" colspan="1" align="left" bgcolor="#F5F5F5">* 성별</th>
				<td class="line" >
				<c:if test="${intake.gender eq 'M'}">남자</c:if>
				<c:if test="${intake.gender eq 'F'}">여자</c:if>
				</td>
			</tr>		
			<tr>
				<th class="line"  width="170px" colspan="1" align="left" bgcolor="#F5F5F5">* 생년월일</th>
				<td class="line" >${intake.rrn}</td>
				<th class="line"  width="170px" colspan="1" align="left" bgcolor="#F5F5F5">* 휴대폰번호</th>
				<td class="line" >${intake.mobile}</td>
				<th class="line"  width="170px" colspan="1" align="left" bgcolor="#F5F5F5">* 상담주제</th>
				<td class="line" >${intake.strCause}&nbsp;${intake.strCause1}&nbsp;${intake.strCause2}&nbsp;${intake.strCause3}</td>
			</tr>									
			</table>
					<table cellpadding="5"  cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">			
			<tr>
				
				<td class="line" align="right">
				<input type="button" id="counselBtn" value="정보더보기" style="height:30px; width:100px;">
				</td>
			</tr>						
			</table>		
			
			<br />
	<br/>ㆍ상담의 목표 및 계획	
	<table cellpadding="5"  cellspacing="0"  border="1" width="100%" style="border-collapse:collapse;">
			<tr>
				<th colspan="6" class="line" height="30" align="center" bgcolor="#F5F5F5">상담의 목표 및 계획</td>				
			</tr>
		    <tr>
				<th width="170px" class="line" height="30" align="center" bgcolor="#F5F5F5">* 최종목표(장기목표)</td>
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500" name="memo1" id="memo1" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${intake.memo1}</textarea>
				</td>
			</tr>
			<tr>
				<th width="170px" class="line" height="30" align="center" bgcolor="#F5F5F5">* 과정목표(단기목표)<br>-단기 상담의 경우<br>장기 목표와 동일가능</td>
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500"  name="memo2" id="memo2" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${intake.memo2}</textarea>
				</td>
			</tr>
			<tr>
				<th width="170px" class="line" height="30" align="center" bgcolor="#F5F5F5">* 상담계획</td>
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500"  name="memo3" id="memo3" style="width: 70%" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${intake.memo3}</textarea>
				</td>
			</tr>
			<tr>
				<th colspan="6" class="line" height="30" align="center" bgcolor="#F5F5F5">상담의 주요 종류 - 단회기 상담의 경우, 진행한 상담의 종류를 적어주십시오.</td>				
			</tr>
		
		 <tr>
				<th width="170px" class="line" height="30" align="left" bgcolor="#F5F5F5">*주로 진행할 상담 종류</th>
				<td colspan='5'>
					<input type="checkbox" name="typeArr" id="bcheck_1" value="1" >
				    <label for="bcheck_1">일반상담(언어)</label>		    		
				    <input type="checkbox" name="typeArr" id="bcheck_2" value="2" >
				    <label for="bcheck_2">놀이치료</label>				    
				    <input type="checkbox" name="typeArr" id="bcheck_3" value="3" >
				    <label for="bcheck_3">미술치료</label>				    				    
					<input type="checkbox" name="typeArr" id="bcheck_4" value="4" >
				    <label for="bcheck_4">언어치료</label><br>				    				   
				    <input type="checkbox" name="typeArr" id="bcheck_5" value="5" >
				    <label for="bcheck_5">기타</label>	
					<input type="text" name="etc" id="etc"  value="${intake.etc}" />
					<br><span> * 일반상담 중 진행되는 간단한 그림 그리기 작업은 미술치료로 분류되지 않습니다.</span>
				</td>
			</tr>		
		</table>			
		
		<br/>ㆍ상담일지 정보&nbsp;&nbsp;
		
		<select id="pageNum" name="pageNum" onchange="javascript:onChg();">
		
		
		<c:if test="${intake.status eq '3'}"> 
					<c:forEach var="i" begin="1" end="${intake.intakeNum}" step="1">															
								<option value="${i}"  <c:if test="${param.pageNum eq i}"> selected</c:if>>${i}회기</option>
						</c:forEach>
			</c:if>
		<c:if test="${intake.status ne '3'}"> 
					<c:forEach var="i" begin="1" end="${intake.intakeNum+1}" step="1">															
								<option value="${i}"  <c:if test="${param.pageNum eq i}"> selected</c:if>>${i}회기</option>
						</c:forEach>
			</c:if>						
					</select>
			<table cellpadding="5"  cellspacing="0"  border="1" width="100%" style="border-collapse:collapse;">
			<tr>
								<th class="line"  width="170px" colspan="1" align="center" bgcolor="#F5F5F5">* 상담일시</td>
				<td class="line" colspan="3">
				
	            <input type="text" name="date" id="date" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${record.date}" />
	            &nbsp;
	            <select name="time1" id="time1">	           
		            <option value="10" <c:if test="${record.time1 eq '10'}"> selected</c:if>>10</option>
		            <option value="11" <c:if test="${record.time1 eq '11'}"> selected</c:if>>11</option>
		            <option value="12" <c:if test="${record.time1 eq '12'}"> selected</c:if>>12</option>
		            <option value="13" <c:if test="${record.time1 eq '13'}"> selected</c:if>>13</option>
		            <option value="14" <c:if test="${record.time1 eq '14'}"> selected</c:if>>14</option>
		            <option value="15" <c:if test="${record.time1 eq '15'}"> selected</c:if>>15</option>
		            <option value="16" <c:if test="${record.time1 eq '16'}"> selected</c:if>>16</option>
		            <option value="17" <c:if test="${record.time1 eq '17'}"> selected</c:if>>17</option>
		            <option value="18" <c:if test="${record.time1 eq '18'}"> selected</c:if>>18</option>
		            <option value="19" <c:if test="${record.time1 eq '19'}"> selected</c:if>>19</option>	            	           
	            </select>
	            &nbsp;~&nbsp;
	            <select name="time2" id="time2">	           		            
		            <option value="11" <c:if test="${record.time2 eq '11'}"> selected</c:if>>11</option>
		            <option value="12" <c:if test="${record.time2 eq '12'}"> selected</c:if>>12</option>
		            <option value="13" <c:if test="${record.time2 eq '13'}"> selected</c:if>>13</option>
		            <option value="14" <c:if test="${record.time2 eq '14'}"> selected</c:if>>14</option>
		            <option value="15" <c:if test="${record.time2 eq '15'}"> selected</c:if>>15</option>
		            <option value="16" <c:if test="${record.time2 eq '16'}"> selected</c:if>>16</option>
		            <option value="17" <c:if test="${record.time2 eq '17'}"> selected</c:if>>17</option>
		            <option value="18" <c:if test="${record.time2 eq '18'}"> selected</c:if>>18</option>
		            <option value="19" <c:if test="${record.time2 eq '19'}"> selected</c:if>>19</option>
		            <option value="10" <c:if test="${record.time2 eq '20'}"> selected</c:if>>20</option>	            	           
	            </select>	            
	       					
				</td>
			</tr>
			<tr>
				<th width="170px"  class="line" height="30" align="center" bgcolor="#F5F5F5">대주제</td>				
				<th  width="170px"  class="line" height="30" align="center" bgcolor="#F5F5F5">소주제</td>
				<th colspan="4" class="line" height="30" align="center" bgcolor="#F5F5F5">내용</td>
			</tr>
		    <tr>
				<th width="170px" rowspan='2' class="line" height="30" align="center" bgcolor="#F5F5F5">* 상담의 주제</td>
				<th class="line" >* 회기주제:본 회기의 핵심적 내용 함축</th>					
				<td class="line" colspan="4">					
					<textarea rows="5" cols="80" maxlength="1500" name="subject" id="subject" style="width: 70%" >${record.subject}</textarea>
				</td>
			</tr>
			<tr>
				<th class="line" >* 회기내 내담자의 주호소 문제</th>		
				<td class="line" colspan="4">					
					<textarea rows="5" cols="80" maxlength="1500"  name="mainIssue" id="mainIssue" style="width: 70%">${record.mainIssue}</textarea>
				</td>
			</tr>
		    <tr>
				<th width="170px" rowspan='3' class="line" height="30" align="center" bgcolor="#F5F5F5">* 상담과정</td>
				<th class="line" >* 상담목표</th>					
				<td class="line" colspan="4">					
					<textarea rows="5" cols="80" maxlength="1500" name="goal" id="goal" style="width: 70%" >${record.goal}</textarea>
				</td>
			</tr>
			<tr>
				<th class="line" >* 주요개입</th>		
				<td class="line" colspan="4">					
					<textarea rows="5" cols="80" maxlength="1500"  name="intervention" id="intervention" style="width: 70%" >${record.intervention}</textarea>
				</td>
			</tr>
			<tr>
				<th class="line" >* 내담자 주요 반응</th>		
				<td class="line" colspan="4">					
					<textarea rows="5" cols="80" maxlength="1500"  name="feedback" id="feedback" style="width: 70%" >${record.feedback}</textarea>
				</td>
			</tr>			
			<tr>
				<th width="170px"  rowspan="12" class="line" height="30" align="center" bgcolor="#F5F5F5">* 상담에 대한 분석 및 소견(사례개념화 방식)</td>
				<th colspan="5" class="line" height="30" align="center" bgcolor="#F5F5F5">* 문제와 관련된 역사적 배경(내담자의 문제와 관련된 발달/역사적 배경, 문제의 기원,과거 문제력 및 당시 환경 상황)</td>				
			</tr>
			<tr>				
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500"  name="rmemo1" id="rmemo1" style="width: 70%" >${record.rmemo1}</textarea>
				</td>
			</tr>

			<tr>				
				<th colspan="5" class="line" height="30" align="center" bgcolor="#F5F5F5">* 문제와 관련된 내담자의 내적 요인(자아개념, 통찰내용과 수준, 인지적 스타일 및 특징, 정서적 스타일 및 특징,신체/생리/행동적 특징)</td>				
			</tr>
			<tr>				
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500"  name="rmemo2" id="rmemo2" style="width: 70%" >${record.rmemo2}</textarea>
				</td>
			</tr>
			
			<tr>				
				<th colspan="5" class="line" height="30" align="center" bgcolor="#F5F5F5">* 문제와 관련된 내담자의 상황적 요인(문제와 관련된 현재 생활 여건, 문제를 지속시키는 상황적 요인)</td>				
			</tr>
			<tr>				
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500"  name="rmemo3" id="rmemo3" style="width: 70%" >${record.rmemo3}</textarea>
				</td>
			</tr>
			
			<tr>				
				<th colspan="5" class="line" height="30" align="center" bgcolor="#F5F5F5">* 내담자의 대인관계 양상(대인관계 양상, 문제영역)</td>				
			</tr>
			<tr>				
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500"  name="rmemo4" id="rmemo4" style="width: 70%" >${record.rmemo4}</textarea>
				</td>
			</tr>

			<tr>				
				<th colspan="5" class="line" height="30" align="center" bgcolor="#F5F5F5">* 내담자의 자원 및 취약점(긍정적 상황과 경험 및 강점, 대처 전략, 부정적 상황과 약점)</th>				
			</tr>
			<tr>				
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500"  name="rmemo5" id="rmemo5" style="width: 70%" >${record.rmemo5}</textarea>
				</td>
			</tr>
			
			<tr>				
				<th colspan="5" class="line" height="30" align="center" bgcolor="#F5F5F5">* 문제에 대한 상담자의 종합적 이해(핵심 문제에 대한 이론적 설명, 내담자와 관련된 요인들에 대한 종합적 이해 및 평가)</th>				
			</tr>
			<tr>				
				<td class="line" colspan="5">					
					<textarea rows="5" cols="80" maxlength="1500"  name="rmemo6" id="rmemo6" style="width: 70%" >${record.rmemo6}</textarea>
				</td>
			</tr>												
			<tr>
				<th width="170px" class="line" height="30" align="center" bgcolor="#F5F5F5">기타<br>(특이사항)</th>
				<td colspan='5'>
					<textarea rows="5" cols="80" maxlength="1500"  name="rmemo7" id="rmemo7" style="width: 70%" >${record.rmemo7}</textarea>
				</td>
			</tr>		
			<tr>
				<th rowspan='5' width="170px" class="line" height="30" align="center" bgcolor="#F5F5F5">* 사례위험도</th>
				<th colspan='5' width="170px" class="line" height="30" align="center" bgcolor="#F5F5F5">
					* 다음 중 본 사례에 해당하는 위험도를 체크해 주십시오.
				</th>
			</tr>		
				<tr>
					
				<td >
					<input type="radio" name="risks" id="bcheck_1" value="1" <c:if test="${record.risks eq '1'}"> checked</c:if>> 1단계
				</td>
				<td >
					<input type="radio" name="risks" id="bcheck_2" value="2" <c:if test="${record.risks eq '2'}"> checked</c:if>> 2단계
				</td>
				<td >
					<input type="radio" name="risks" id="bcheck_3" value="3" <c:if test="${record.risks eq '3'}"> checked</c:if>> 3단계
				</td>
				<td >
					<input type="radio" name="risks" id="bcheck_4" value="4" <c:if test="${record.risks eq '4'}"> checked</c:if>> 4단계
				</td>
				<td >
					<input type="radio" name="risks" id="bcheck_5" value="5" <c:if test="${record.risks eq '5'}"> checked</c:if>> 5단계
				</td>				
				
			</tr>				
			<tr>					
				<td >
					-고민에 대한 조언수준의 자문요구<br>
					-내담자가 문제를 해결 할 자원을 충분히 가지고 있음<br>
					-지지자원 및 환경이 충분함
				</td>
				<td >
					-일상생활에 영향을 주는 수준의 문제<br>
					-내담자가 문제를 해결할 자원을 충분히 가지고 있음<br>
					-지지자원 및 환경이 부족할 수 있음
				</td>
				<td >
					-일상생활에 영향을 주며, 그 강도가 2단계 보다 강함<br>
					-내담자가 문제를 해결 할 자원이 충분치 않아, 상담을 통해 자원을 만들어야 할 필요가 있음<br>
					-지지자원 및 환경이 충분치 않음
				</td>
				<td >
					-심리적 상태가 매우 불안정하여 내담자의 안위 및 생명 영위와 관련하여 위협적인 상황일 때<br>
					-내담자의 내적자원과 상관없이 경험자제가 누구에게나 심리적으로 큰 영향을 줄 수 있는 상황일 때				
				</td>
				<td >
					-자신 혹은 타인의 생명을 위협하는 행동을 실제 시행할 가능성이 높고, 시일이 임박하였다고 느낄 때<br>
					-내담자의 내적자원과 상관없이 경험자제가 누구에게나 심리적으로 큰 영향을 줄 수 있는 상황일 때
				</td>								
			</tr>									
			<tr>
				<th colspan="5" class="line" height="30" align="center" bgcolor="#F5F5F5">사례위험도 선택/ 변경 이유(사례위험도로 위의 단계를 선택한 이유 및 변경한 이유를 간단히 기술해 주십시오.)</td>				
			</tr>
			<tr>
				<td colspan='5'>
					<textarea rows="5" cols="80" maxlength="1500"  name="riskReason" id="riskReason" style="width: 70%" >${record.riskReason}</textarea>
				</td>				
			</tr>
			<tr>
				<th  class="line" height="30" align="center" bgcolor="#F5F5F5">첨부파일</td>
				<td colspan='5'>
					<input type='file' name="file_0" />
							<c:if test="${not empty record.filePath1}">		            			
					            	<a href="javascript:fileDownLoad('${record.filePath1}', '${record.fileNm1}');">&nbsp;파일다운로드</a><br>		            			
		            		</c:if>
		            		<br>
		            <input type='file' name="file_1" />
							<c:if test="${not empty record.filePath2}">		            			
					            	<a href="javascript:fileDownLoad('${record.filePath2}', '${record.fileNm2}');">&nbsp;파일다운로드</a><br>		            			
		            		</c:if>		            		
				</td>				
			</tr>
			<tr>
				<th  class="line" height="30" align="center" bgcolor="#F5F5F5">등록/수정일</td>
				<td colspan='5'>
					${record.modiDt}
				</td>				
			</tr>					
		</table>		
			<br/>		
		<table cellpadding="5"  cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">			
			<tr>
				<th class="line"  width="170px" colspan="1" align="center" bgcolor="#F5F5F5">* 진행상태</th>
				<td class="line" colspan="5">
					            <input type="radio" name="status" id="bcheck_1" onchange="javascript:chgStatus('1');"  value="1" <c:if test="${record.status eq '1'}"> checked</c:if>> 진행
					            <input type="radio" name="status" id="bcheck_1" onchange="javascript:chgStatus('2');"  value="2" <c:if test="${record.status eq '2'}"> checked</c:if>> N/S
					            <input type="radio" name="status" id="bcheck_1"  onchange="javascript:chgStatus('3');" value="3" <c:if test="${record.status eq '3'}"> checked</c:if> > 상담종결
				</td>
			</tr>				
			<tr id="id1">
				<th class="line"  width="170px" colspan="1" align="center" bgcolor="#F5F5F5">* 다음상담계획</th>
				<td class="line" colspan="5">
			<input type="radio" name="nextFlag" id="nextFlag_1" value="1" <c:if test="${record.nextFlag eq '1'}"> checked</c:if>> 확정&nbsp;
			          <input type="text" name="nextDt" id="nextDt" class="startDt cal_box" datetimeonly="true" style="width:93px;" value="${record.nextDt}" />
	            &nbsp;
	            <select name="nextTime" id="nextTime">	           
		            <option value="10" <c:if test="${record.nextTime eq '10'}"> selected</c:if>>10</option>
		            <option value="11" <c:if test="${record.nextTime eq '11'}"> selected</c:if>>11</option>
		            <option value="12" <c:if test="${record.nextTime eq '12'}"> selected</c:if>>12</option>
		            <option value="13" <c:if test="${record.nextTime eq '13'}"> selected</c:if>>13</option>
		            <option value="14" <c:if test="${record.nextTime eq '14'}"> selected</c:if>>14</option>
		            <option value="15" <c:if test="${record.nextTime eq '15'}"> selected</c:if>>15</option>
		            <option value="16" <c:if test="${record.nextTime eq '16'}"> selected</c:if>>16</option>
		            <option value="17" <c:if test="${record.nextTime eq '17'}"> selected</c:if>>17</option>
		            <option value="18" <c:if test="${record.nextTime eq '18'}"> selected</c:if>>18</option>
		            <option value="19" <c:if test="${record.nextTime eq '19'}"> selected</c:if>>19</option>	            	           
	            </select>	
	               &nbsp;&nbsp;<input type="radio" name="nextFlag" id="nextFlag_2" value="2" <c:if test="${record.nextFlag eq '2'}"> checked</c:if>> 미정
	           <input type="text" name="nextStr" id="nextStr"  value="${record.nextStr}" />
	            		</td>
			</tr>				
			<tr id="id2">
				<th rowspan='4' class="line"  width="170px" colspan="1" align="center" bgcolor="#F5F5F5">* 만족도</th>
				<th colspan='5' class="line"  align="center" bgcolor="#F5F5F5">* 본 상담에 대해서 상담자로서 어느 정도 만족하십니까?</th>				
			</tr>
			<tr id="id3">	
				<td colspan='5' class="line" >
					<input type="radio" name="issue" id="bcheck_1" value="1" <c:if test="${record.issue eq '1'}"> checked</c:if>> 매우 불만족
					<input type="radio" name="issue" id="bcheck_2" value="2" <c:if test="${record.issue eq '2'}"> checked</c:if>> 불만족
					<input type="radio" name="issue" id="bcheck_3" value="3" <c:if test="${record.issue eq '3'}"> checked</c:if>> 보통
					<input type="radio" name="issue" id="bcheck_4" value="4" <c:if test="${record.issue eq '4'}"> checked</c:if>> 만족
					<input type="radio" name="issue" id="bcheck_5" value="5" <c:if test="${record.issue eq '5'}"> checked</c:if>> 매우 만족
				</td>
			</tr>		
			<tr id="id4">			
				<th colspan='5' class="line"  align="center" bgcolor="#F5F5F5">* 그 이유를 간단히 기술해 주십시오.</th>																
			</tr>											
			<tr id="id5">	
				<td colspan='5' class="line" >
					<textarea rows="5" cols="80" maxlength="1500"  name="callingIssue" id="callingIssue" style="width: 70%" >${record.callingIssue}</textarea>
				</td>
			</tr>			
			</table>						
			<br />					
 		<!-- 버튼 영역 시작 -->
		<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">
			<tr align="center" height="50px">
				<td class="" colspan="2" align="center">
					<input type="button" id="addBtn" value="저장" style="height:30px; width:100px;">
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
<script>
var val2='${record.status}';
if(val2=='1'){
	$("#id1").show();
	$("#id2").hide();
	$("#id3").hide();
	$("#id4").hide();
	$("#id5").hide();
}else if(val2=='2'){
	$("#id1").show();
	$("#id2").hide();
	$("#id3").hide();
	$("#id4").hide();
	$("#id5").hide();
}else if(val2=='3'){
	//console.log(val2);
	$("#id1").hide();
	$("#id2").show();
	$("#id3").show();
	$("#id4").show();
	$("#id5").show();
}
</script>
</body>
</html>