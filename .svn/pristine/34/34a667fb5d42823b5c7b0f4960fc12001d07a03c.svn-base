<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>제휴사정보</title>
<script type="text/javascript" src="https://ezutil.ezwel.com/resources/js/address/ez-addr.js"></script>
<script type="text/javascript">
j$(document).ready(function(){
	$.validate({
		form : '#cspAdd',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
		$('[name=telNum]').val($('#telNum1').val() + "-" + $('#telNum2').val() + "-" + $('#telNum3').val()); 
		$('[name=faxNum]').val($('#faxNum1').val() + "-" + $('#faxNum2').val() + "-" + $('#faxNum3').val()); 	 
		}
	});

	j$("#addBtn").click(function(){
		var t;
		if($("#type1").prop("checked") == true ){
			t = "100826,";
		}else{
			t = ",";
		}
		if($("#type2").prop("checked") == true ){
			t += "100827,";
		}else{
			t += ",";
		}
		if($("#type3").prop("checked") == true ){
			t += "100828,";
		}else{
			t += ",";
		}
		if($("#type4").prop("checked") == true ){
			t += "100829";
		}else{
		}
		j$("#cType").val(t); 
		
		j$("#cspAdd").submit();
		return false;
	});
	
	$('.addrPopUp').click(function(){
		//var siteUrl = '<spring:eval expression="@global['site.url']" />' + '/resources/jsp/addrSubmit.jsp';
		var siteUrl = '/resources/jsp/addrSubmit.jsp';
		//pZip(siteUrl);
		pZip(siteUrl,'zip1' ,'zip2','addr1','addr2','','','900','550','','');
		return false;
	});
	
	

	j$(".receiptYn").on("click",function() {
		var value = $(this).val();
		if(value == 'Y'){
			$(".noReceipt").attr('disabled',false);
		}else if(value == 'N'){
			$(".noReceipt").attr('disabled',true);
			$(".noReceipt").attr('checked',false);
		}
		
	});
	
	j$(".receiptType").on("click",function() {
		var value = $(this).val();
		if(value == 'C'){
			$('[name=receiptAgent]').attr('disabled',false);
		}else if(value == 'E'){
			$('[name=receiptAgent][value=E]').prop('checked',true);
			$('[name=receiptAgent]').attr('disabled',true);
		}
	});
	
	
	
});

function fSetAddr ( post1, post2, addr1, addr2 ) {
    document.cspAdd.elements["post"].value = post1 + post2;
    document.cspAdd.elements["addr1"].value = addr1;
    document.cspAdd.elements["addr2"].value = addr2;
}

function checkQty(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) )
	{
		return;
	}
	else
	{
		return false;
	}
}
function inputComma(param) {
	var v = param.value;
	var reg = /(^[+-]?\d+)(\d{3})/;
	v += '';
  
	while(reg.test(v)){
		v = v.replace(reg,'$1'+','+'$2');
	}
	$("#" + param.id).val(v);
}

</script>
</head>
<body>

<form id="cspAdd" name="cspAdd" action="/madm/service/csp/cspInfoInsert" method="POST" enctype="multipart/form-data">
<input type="hidden" name="cType" id="cType" >
<input type="hidden" name="userType" id="userType" value="3001" >
<input type="hidden" name="useYn" id="useYn" value="Y" >
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
					    	<td align="left" class="subtitle">제휴사 등록</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
				<ul>
					<li>기본정보</li>
				</ul>
					<!-- 배너 정보 영역 시작 -->
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;업체코드</th>
					    	<td class="line" width="35%">
					    		※ 업체 등록 시 자동으로 부여됩니다.
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 업체명</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="cspNm" data-validation="required"  data-validation-error-msg-required="업체명을 확인해주세요.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 업체구분</th>
					    	<td class="line" colspan="3">
					    		<input type="checkbox" name="cspType" id="type1" value="100718" >온라인강좌
								<input type="checkbox" name="cspType" id="type2" value="100720" >온라인심리검사
								<input type="checkbox" name="cspType" id="type3" value="100721" >집단교육
								<input type="checkbox" name="cspType" id="type4" value="100722" >실물배송
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 업체유형</th>
					    	<td class="line" width="35%">
					    		<input type="radio" name="cspDiv" value="100831" checked="checked">일반
					    		<input type="radio" name="cspDiv" value="100832">ASP
					    		<input type="radio" name="cspDiv" value="100833">API
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 승인여부</th>
					    	<td class="line" width="35%">
					    		<select name="cspStatus">
					    			<option value="100846" selected="selected">승인</option>
					    			<option value="100845">대기</option>
					    			<option value="100847">중지</option>
					    		</select>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 대표자명</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="ownerNm" data-validation="required"  data-validation-error-msg-required="대표자명을 확인해주세요.">
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 업태</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="bcond" data-validation="required"  data-validation-error-msg-required="업태를 확인해주세요.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 사업자등록번호</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="bsnsNum" maxlength="12"  data-validation="required"  data-validation-error-msg-required="사업자등록번호를 확인해주세요.">
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 종목</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="bitem" data-validation="required"  data-validation-error-msg-required="종목을 확인해주세요.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 대표전화번호</th>
					    	<td class="line" width="35%">
						    	<input type="text" id="telNum1" value="" style="width: 10%;" maxlength="3"  data-validation="length number" data-validation-length="2-3"  data-validation-error-msg="대표전화번호를 확인 해주세요."/>-
								<input type="text" id="telNum2" value="" style="width: 10%;" maxlength="4"  data-validation="length number" data-validation-length="3-4"  data-validation-error-msg="대표전화번호를 확인 해주세요."/>-
								<input type="text" id="telNum3" value="" style="width: 10%;" maxlength="4"  data-validation="length number" data-validation-length="4-4"  data-validation-error-msg="대표전화번호를 확인 해주세요."/>
								<input type="hidden" name="telNum">
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;홈페이지</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="homepage" >
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;팩스번호</th>
					    	<td class="line" width="35%">
					    		<input type="text" id="faxNum1" value="" style="width: 10%;" />-
								<input type="text" id="faxNum2" value="" style="width: 10%;" />-
								<input type="text" id="faxNum3" value="" style="width: 10%;" />
								<input type="hidden" name="faxNum">
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5"></th>
					    	<td class="line" width="35%">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 사업자등록증</th>
					    	<td class="line" colspan="3">
					    		<input type="file" name="file1" data-validation="required" data-validation-error-msg-required="첨부파일은 필수입니다.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 통장사본등록</th>
					    	<td class="line" colspan="3">
					    		<input type="file" name="file2" data-validation="required" data-validation-error-msg-required="첨부파일은 필수입니다.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 은행/예금주</th>
							<td class="line" width="35%">
							<comm:select name="bankCd" code="100475" />
								<input type="text" name="bankOrder"  style="width: 150px;" data-validation="required" data-validation-error-msg-required="은행/예금주를 확인해주세요."/>
							</td>
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 계좌번호</th>
							<td class="line" width="35%">
								<input type="text" name="bankNum" style="width: 300px;"  data-validation="required custom" data-validation-regexp="^([0-9\-]+)$" data-validation-error-msg="계좌번호를 확인해주세요."  />
							</td>
						</tr>
						<tr>
							<th class="line" width="15%" align="center" bgcolor="#F5F5F5">* 주소</th>
							<td class="line" colspan="3">
								<input type="text" name="post" id="zip" id="b_zipcode01"  class="input_ty center addrPopUp" title="우편번호" style="width:50px;" readonly data-validation="required" data-validation-error-msg-required="업체주소를 확인해주세요.">
								<button class="btn_ty btn_s ml addrPopUp" type="button">우편번호 검색</button>
								<br>
								<input type="text" name="addr1" id="addr1"  style="width: 300px;"  data-validation="required"  data-validation-error-msg-required="업체주소를 확인해주세요."/>
								<input type="text" name="addr2" id="addr2"  style="width: 300px;"  data-validation="required"  data-validation-error-msg-required="업체주소를 확인해주세요."/>
							</td>
						</tr>
					</table>
					<ul>
						<li>담당자정보</li>
					</ul>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 담당자명</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="userNm" data-validation="required"  minlength="4" maxlength="20" data-validation-error-msg-required="담당자명을 확인해주세요.">
					    	</td>
							<!-- <th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 부서/직책</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="deptCd" data-validation="required"  data-validation-error-msg-required="부서/직책을 확인해주세요.">
					    	</td> -->
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 담당자ID</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="userId" data-validation="required"  minlength="4" maxlength="20" data-validation-error-msg-required="담당자ID를 확인해주세요.">
					    	</td>
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 담당자 비밀번호</th>
					    	<td class="line" width="35%">
					    		<input type="password" name="userPwd" data-validation="required" minlength="4" maxlength="20"  data-validation-error-msg-required="비밀번호를 확인해주세요.">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 핸드폰번호</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="mobile" data-validation="required"  data-validation-error-msg-required="핸드폰번호를 확인해주세요.">
					    	</td>
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 이메일</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="email" data-validation="required"  data-validation-error-msg-required="이메일을 확인해주세요.">
					    	</td>
						</tr>
					</table>
					<ul>
						<li>결제정보</li>
					</ul>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">* 현금영수증</th>
					    	<td class="line" width="35%">
					    		<input type="radio" name="receiptYn" class="receiptYn" value="Y" data-validation="required">발행
					    		<input type="radio" name="receiptYn" class="receiptYn" value="N">미발행(현장발행)
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;발행사업자번호</th>
					    	<td class="line" width="35%">
					    		<input type="radio" name="receiptType" value="C" class="noReceipt receiptType">업체
					    		<input type="radio" name="receiptType" value="E" class="noReceipt receiptType">마인드
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;면/과세구분</th>
					    	<td class="line" width="35%">
					    		<input type="radio" name="taxYn" value="Y" class="noReceipt">과세
					    		<input type="radio" name="taxYn" value="N" class="noReceipt">면세
					    		<input type="radio" name="taxYn" value="S" class="noReceipt">영세
					    		
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;발행주체</th>
					    	<td class="line" width="35%">
					    		<input type="radio" name="receiptAgent" value="C" class="noReceipt">업체
					    		<input type="radio" name="receiptAgent" value="E" class="noReceipt">마인드
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;배송비 무료 기준 금액</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="freeDlvrAmt" data-validation="required" value="0" data-validation-error-msg-required="배송비 무료 기준 금액을 확인해주세요." onkeydown="return checkQty(event)" onkeyup='inputComma(this);'>
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;</th>
					    	<td class="line" width="35%">
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;ASP 업체코드</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="aspNm" id="aspNm"  style="width: 300px;"/>&nbsp;예)HWSNC
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;ASP 암호화 키(SEED KEY) 16자리</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="seedKey" id="seedKey" style="width: 500px;"/>
					    	</td>
						</tr>							
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;ASP 접속주소</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="firstUrl" id="firstUrl"  style="width: 500px;"/>
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;ASP 주문주소</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="orderUrl" id="orderUrl"  style="width: 500px;"/>
					    	</td>
						</tr>
						<tr align="left" height="30px">
							<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;ASP 취소주소</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="cancelUrl" id="cancelUrl"  style="width: 500px;"/>
					    	</td>
					    	<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;ASP 주문정보 위변조 확인주소</th>
					    	<td class="line" width="35%">
					    		<input type="text" name="checkUrl" id="checkUrl"  style="width: 500px;"/>
					    	</td>
						</tr>
					</table>
					<ul>
						<li>관리자 메모</li>
					</ul>
					<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<tr align="left" height="30px">
								<th class="line" width="15%" align="left" bgcolor="#F5F5F5">&nbsp;&nbsp;내용</th>
						    	<td class="line" colspan="3">
						    		<textarea rows="4" cols="50" style="width: 95%" name="memo" ></textarea>
						    	</td>
							</tr>
					</table>
				
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- 버튼 영역 시작 -->
					<table  cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td align="center" >
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<button onclick="history.back()" style="height:30px; width:100px;" type="button">등록취소</button>
										&nbsp;&nbsp;&nbsp;
							    		<button id="addBtn" style="height:30px; width:100px;" type="button">등록하기</button>
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