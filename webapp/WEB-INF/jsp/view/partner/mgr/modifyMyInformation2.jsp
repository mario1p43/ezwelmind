<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>나의 정보관리777</title>
<script type="text/javascript">
	var num = 0;
	var de ="";
	var count = 0;
	var delCnt = 1;
j$(document).ready(function(){

	<c:if test='${not empty mgr.rrn}'>
	var rrn = '${mgr.rrn}';
	var time = new Date();
	var year = time.getFullYear();
	var rrnYear;
 	if(rrn.substring(7) <= 2){
		rrnYear  = "19"+rrn.substring(0,2) ;
	}else if(2 < rrn.substring(7) <= 4){
		rrnYear  = "20"+rrn.substring(0,2) ;
	}
 	
	var age = (year - rrnYear+1)+'세';
	 document.getElementById("age").innerHTML = age;
	</c:if>

	
	j$("#delPhotoBtn").click(function(){
		j$("#delPhoto").val('${mgrSub.fileNm }');
		return false;
	});
	
	
	j$("#modifyBtn").click(function(){
		j$("#num").val(num);
		j$("#count").val(count);
		
		var tempPwd = $.trim($("#userPwd").val());
		if(tempPwd != "1230987" && tempPwd != ""){
			j$("#imsiPwdYn").val("N");
		}

		j$("#modifyMyInformation").submit();
		return false;
	});

	
	$.validate({
		form : '#modifyMyInformation',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
		$('[name=mobile]').val($('#mobile1').val() + "-" + $('#mobile2').val() + "-" + $('#mobile3').val()); 
		}
	});
	
});

function delCertRow(e,h){
	var certCnt = '${mgrCertCnt}';
	if(certCnt == delCnt){
		alert("최소 1개 이상 등록 해야합니다.");
		return false;
	}
	de += e+",";
	
	document.getElementById("d").innerHTML = "<input type='hidden' name='D' value='"+de+"' /> "
	count++;
	delCnt++
	document.getElementById(h).style.display = "none";
}


function addRow(e){
	var params = {};
	var strData = "";
	if(num == (10-'${mgrCertCnt}')){
		alert("10개까지 등록 가능합니다.");
		return false;
	}
	num++;
	var oRow = e.insertRow(num);
	var oCel = oRow.insertCell();
	
	//oCel.innerHTML = "<comm:select name='certCd"+num+"'  code='100275' /><input type='text' name='etc"+num+"' id='certEtc"+num+"' /><input type='file' name='file"+num+"' data-validation='required' data-validation-error-msg-required='첨부파일은 필수입니다.' />";
	j$.ajax({
		url: '/partner/mgr/ajaxCert',
		data: params,
		dataType: 'json',
		type: 'GET',
		cache:true,
		success: function(data, textStatus){
			strData =	"<select class='certClass' name='certCd"+num+"' id='certCd"+num+"' onChange='changeCert("+num+")' data-validation='required'>";
			strData +=	"<option value=''>선택</option>";
			j$.each(data.serviceList, function(i, serviceList){
				strData += "   <option value='"+serviceList.commCd+"'>"+serviceList.commNm+"</option>";
			});
			strData +=	"</select>";	
			strData +=	"<input type='text' name='etc"+num+"' id='certEtc"+num+"' style='width: 210px'/><input type='file' name='file_"+num+"' data-validation='required' data-validation-error-msg-required='첨부파일은 필수입니다.' />";
			oCel.innerHTML = strData;
			
		}
	});
	}

function delRow(e){
	if(num == 0){
		return false;
	}
	var oTr = e.deleteRow(num);
	num--;
}
function changeCert(num){
		var fm =  document.modifyMyInformation;
		switch(num){
			case(1) :
				if(fm.certCd1.options[fm.certCd1.selectedIndex].value != "100747" && fm.certCd1.options[fm.certCd1.selectedIndex].value != ""){
					$("#certEtc1").val(fm.certCd1.options[fm.certCd1.selectedIndex].text);
				    $("#certEtc1").attr('disabled', true);
				}else{
					$("#certEtc1").val("");
			        $("#certEtc1").attr('disabled', false);
				}
			break;
			case(2) :
				if(fm.certCd2.options[fm.certCd2.selectedIndex].value != "100747" && fm.certCd2.options[fm.certCd2.selectedIndex].value != ""){
					$("#certEtc2").val(fm.certCd2.options[fm.certCd2.selectedIndex].text);
				    $("#certEtc2").attr('disabled', true);
				}else{
					$("#certEtc2").val("");
			        $("#certEtc2").attr('disabled', false);
				}
				break;
			case(3) :
				if(fm.certCd3.options[fm.certCd3.selectedIndex].value != "100747" && fm.certCd3.options[fm.certCd3.selectedIndex].value != ""){
					$("#certEtc3").val(fm.certCd3.options[fm.certCd3.selectedIndex].text);
				    $("#certEtc3").attr('disabled', true);
				}else{
					$("#certEtc3").val("");
			        $("#certEtc3").attr('disabled', false);
				}
				break;
			case(4) :
				if(fm.certCd4.options[fm.certCd4.selectedIndex].value != "100747" && fm.certCd4.options[fm.certCd4.selectedIndex].value != ""){
					$("#certEtc4").val(fm.certCd4.options[fm.certCd4.selectedIndex].text);
				    $("#certEtc4").attr('disabled', true);
				}else{
					$("#certEtc4").val("");
			        $("#certEtc4").attr('disabled', false);
				}
				break;
			case(5) :
				if(fm.certCd5.options[fm.certCd5.selectedIndex].value != "100747" && fm.certCd5.options[fm.certCd5.selectedIndex].value != ""){
					$("#certEtc5").val(fm.certCd5.options[fm.certCd5.selectedIndex].text);
				    $("#certEtc5").attr('disabled', true);
				}else{
					$("#certEtc5").val("");
			        $("#certEtc5").attr('disabled', false);
				}
				break;
			case(6) :
				if(fm.certCd6.options[fm.certCd6.selectedIndex].value != "100747" && fm.certCd6.options[fm.certCd6.selectedIndex].value != ""){
					$("#certEtc6").val(fm.certCd6.options[fm.certCd6.selectedIndex].text);
				    $("#certEtc6").attr('disabled', true);
				}else{
					$("#certEtc6").val("");
			        $("#certEtc6").attr('disabled', false);
				}
				break;
			case(7) :
				if(fm.certCd7.options[fm.certCd7.selectedIndex].value != "100747" && fm.certCd7.options[fm.certCd7.selectedIndex].value != ""){
					$("#certEtc7").val(fm.certCd7.options[fm.certCd7.selectedIndex].text);
				    $("#certEtc7").attr('disabled', true);
				}else{
					$("#certEtc7").val("");
			        $("#certEtc7").attr('disabled', false);
				}
				break;
			case(8) :
				if(fm.certCd8.options[fm.certCd8.selectedIndex].value != "100747" && fm.certCd8.options[fm.certCd8.selectedIndex].value != ""){
					$("#certEtc8").val(fm.certCd8.options[fm.certCd8.selectedIndex].text);
				    $("#certEtc8").attr('disabled', true);
				}else{
					$("#certEtc8").val("");
			        $("#certEtc8").attr('disabled', false);
				}
				break;
			case(9) :
				if(fm.certCd9.options[fm.certCd9.selectedIndex].value != "100747" && fm.certCd9.options[fm.certCd9.selectedIndex].value != ""){
					$("#certEtc9").val(fm.certCd9.options[fm.certCd9.selectedIndex].text);
				    $("#certEtc9").attr('disabled', true);
				}else{
					$("#certEtc9").val("");
			        $("#certEtc9").attr('disabled', false);
				}
				break;
			case(10) :
				if(fm.certCd10.options[fm.certCd10.selectedIndex].value != "100747" && fm.certCd10.options[fm.certCd10.selectedIndex].value != ""){
					$("#certEtc10").val(fm.certCd10.options[fm.certCd10.selectedIndex].text);
				    $("#certEtc10").attr('disabled', true);
				}else{
					$("#certEtc10").val("");
			        $("#certEtc10").attr('disabled', false);
				}
				break;
			default :
				break;
		}
	}
</script>
</head>
<body>
<form id="modifyMyInformation" name="modifyMyInformation" action="/partner/mgr/update" method="POST" enctype="multipart/form-data">

<input type="hidden" name="imsiPwdYn" id="imsiPwdYn">
<input type="hidden" name="num" id="num">
<input type="hidden" name="count" id="count">
<input type="hidden" name="delPhoto" id="delPhoto">
<input type="hidden" name="mgrCertCnt" id="mgrCertCnt" value="${mgrCertCnt}">

<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
	<td valign="top" align="left">
	<!-- 컨텐츠 시작 영역 start -->
		<table cellpadding="0" cellspacing="0" border="0" width="95%">
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="5" cellspacing="0" border="0" width="100%" align="left" style="border-bottom: 1px solid silver;">
						<tr>
					    	<td align="left" class="subtitle">나의 정보관리</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td>
					<ul>
						<li><strong>개인정보</strong></li>
					</ul>
				</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">성명(아이디)</th>
				    	<td class="line" width="35%" >${mgr.userNm }&nbsp;(${mgr.userId })</td>
				    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">나이/성별</th>
				    	<td class="line" width="35%" ><label id="age" ></label>  /
						<c:choose>
							<c:when test="${mgrSub.gender eq 'M'}">
								남성
							</c:when>
							<c:otherwise>
								여성
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">비밀번호</th>
				    	<td class="line" colspan="3" >
				    		<input type="password" name="userPwd" id="userPwd" style="width:200px;" value="" minlength="4" maxlength="20" /> <span style="color:RED"> * 입력하지 않으면 기존 비번으로 유지됩니다.</span>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line"  align="left" bgcolor="#F5F5F5">* 연락처</th>
				    	<td class="line"  >
				    		<input type="text" id="mobile1" maxlength="3" value="${mgr.mobile1 }" style="width: 10%;" data-validation="length number" data-validation-length="2-3"  data-validation-error-msg="연락처를 확인 해주세요." />-
				    		<input type="text" id="mobile2" maxlength="4" value="${mgr.mobile2 }" style="width: 10%;" data-validation="length number" data-validation-length="3-4"  data-validation-error-msg="연락처를 확인 해주세요." />-
				    		<input type="text" id="mobile3" maxlength="4" value="${mgr.mobile3 }" style="width: 10%;" data-validation="length number" data-validation-length="4-4"  data-validation-error-msg="연락처를 확인 해주세요." />
				    		<input type="hidden" name="mobile">
				    	</td>
				    	<th class="line"  align="left" bgcolor="#F5F5F5">* 이메일</th>
				    	<td class="line"  >
				    		<input type="text" name="email" value="${mgr.email }" style="width: 150px;"  data-validation="email"  data-validation-error-msg="이메일을 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line"  align="left" bgcolor="#F5F5F5">* 학력</th>
				    	<td class="line" colspan="3" >
				    		<input  type="radio" name="education" value="M" ${mgrSub.education == 'M' ? 'checked':''}> 석사
				    		<input  type="radio" name="education" value="D" ${mgrSub.education == 'D' ? 'checked':''}> 박사
				    		<input type="text" name="university" value="${mgrSub.university }" style="width: 150px;" data-validation="required"  data-validation-error-msg-required="대학원을 확인 해주세요."/> 대학원	<input type="text" name="department" value="${mgrSub.department }" style="width: 150px;" data-validation="required"  data-validation-error-msg-required="학과를 확인 해주세요."/> 학과
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line"  align="left" bgcolor="#F5F5F5">* 경력</th>
						<td class="line" colspan="3">※ 업무를 수행하신 기간, 기관명, 담당업무를 기술해 주세요.<br>
							<textarea rows="4" cols="50" style="width: 95%" name="career" data-validation="required"  data-validation-error-msg-required="경력을 확인 해주세요.">${mgrSub.career }</textarea>
						</td>
					</tr>	
					<tr align="left" height="30px">
						<th class="line"  align="left" bgcolor="#F5F5F5">* 자격&nbsp;&nbsp; <input type="button" onclick="addRow(cert);" value="+" />&nbsp;<input type="button" onclick="delRow(cert);" value="-" /> </th>
						<td class="line" colspan="3">
						<table id="cert">
							<tr align="left" >
							<td class="line" >
								<c:forEach var="list" items="${mgrCert}" varStatus="listCnt">
								 <div id="${listCnt.index }" > 
									<comm:commNmOut code="${list.certCd }" option="commCd"  />
									<c:if test="${list.certCd eq 100747}">(${list.etc })</c:if>
									 / ${list.fileNm }
									 
									  <input type="button" value="다운로드" onclick="fileDownLoad('${list.filePath}', '${list.fileNm}')" ><input type="button" value="삭제" onclick="delCertRow('${list.fileNm }','${listCnt.index }');"><input type="hidden" id="d"> <br></div>
								</c:forEach>
							</td>
							</tr>
						</table>	
						</td>
					</tr>	
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">* 한줄소개</th>
				    	<td class="line" colspan="3" >
				    		<input type="text" name="memo" value="${mgrSub.memo }" style="width: 95%;" data-validation="required"  data-validation-error-msg-required="한줄소개를 확인 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="left" bgcolor="#F5F5F5">사진</th>
				    	<td class="line" colspan="3" >
				    		<input type="file" name="picAdd" />&nbsp;
				    		${mgrSub.fileNm }
				    		<input type="button" value="삭제" id="delPhotoBtn" >
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
					<ul>
						<li><strong>상담유형</strong></li>
					</ul>
				</td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="3" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 유형선택</th>
				    	<td class="line" >
				    		<comm:commNmOut code="${mgrSub.channelType }"  option="category"/>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>
					<table cellpadding="3" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<c:if test="${not empty mgrSub.mentalDiv}">
						<tr>
			            	<th rowspan="3" width="15%" bgcolor="#F5F5F5" align="center">심리</th>
			            	<th width="15%" bgcolor="#F5F5F5" align="center">* 상담대상</th>
				    		<td><comm:commNmOut code="${mgrSub.mentalAges }"  option="commCd"/></td>
						</tr>
						<tr>
				    		<th width="15%" bgcolor="#F5F5F5" align="center">* 상담분야</th>
					    		<td>
					    			<comm:commNmOut code="${mgrSub.mentalDiv }"  option="category"/>
					    			<c:if test="${not empty mgrSub.mentalDivEtc}">(${mgrSub.mentalDivEtc })</c:if>
					    		</td>
				    		</tr>
				    		<tr>
					    		<th width="15%" bgcolor="#F5F5F5" align="center">* 상담방법</th>
					    		<td><comm:commNmOut code="${mgrSub.mentalType }" option="commCd" /></td>
				    		</tr>           	
 						</c:if>
 						
 						<c:if test="${not empty mgrSub.lawDiv}">
 						<tr>
			            	<th rowspan="2" width="15%" bgcolor="#F5F5F5" align="center">법률</th>
					    	<th width="15%" bgcolor="#F5F5F5" align="center">* 상담분야</th>
					    		<td><comm:commNmOut code="${mgrSub.lawDiv }"  option="category"/></td>
				    		</tr>
					    	<tr>
					    		<th width="15%" bgcolor="#F5F5F5" align="center">* 상담방법</th>
					    		<td><comm:commNmOut code="${mgrSub.lawType }"  option="commCd"/></td>
				    		</tr>
  						</c:if>
  						
						<c:if test="${not empty mgrSub.financeDiv}">
						<tr>
			            	<th rowspan="2" width="15%" bgcolor="#F5F5F5" align="center">재무</th>
			            	<th width="15%" bgcolor="#F5F5F5" align="center">* 상담분야</th>
				    		<td><comm:commNmOut code="${mgrSub.financeDiv }"  option="category"/></td>
			    		</tr>
			    		<tr>
				    		<th width="15%" bgcolor="#F5F5F5" align="center">* 상담방법</th>
				    		<td><comm:commNmOut code="${mgrSub.financeType }"  option="commCd"/></td>
			    		</tr>
 						</c:if> 
 												
 						<c:if test="${not empty mgrSub.diagnosisDiv}">
 						<tr>
			            	<th rowspan="3" width="15%" bgcolor="#F5F5F5" align="center">심리검사</th>
			            	<th width="15%" bgcolor="#F5F5F5" align="center">* 상담대상</th>
				    		<td><comm:commNmOut code="${mgrSub.diagnosisAges }"  option="commCd"/></td>
			    		</tr>
			    		<tr>
				    		<th width="15%" bgcolor="#F5F5F5" align="center">* 상담분야</th>
				    		<td>
				    			<comm:commNmOut code="${mgrSub.diagnosisDiv }"  option="category"/>
				    			<c:if test="${not empty mgrSub.diagnosisDivEtc}">(${mgrSub.diagnosisDivEtc })</c:if>
				    		</td>
			    		</tr>
			    		<tr>
				    		<th width="15%" bgcolor="#F5F5F5" align="center">* 상담방법</th>
				    		<td><comm:commNmOut code="${mgrSub.diagnosisType }"  option="commCd"/></td>
			    		</tr>
  						</c:if>

				</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="80%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td align="center" colspan="4">
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
							    		<button id="modifyBtn" style="height:30px; width:100px;" type="button">수정</button>
					    			</tr>
					    		</table>
					    	</td>
						</tr>
					</table>
					<!-- 버튼 영역 종료 -->
				</td>
			</tr>
			
		</table>
	</td>
</tr>
</table>
</form>













</body>
</html>