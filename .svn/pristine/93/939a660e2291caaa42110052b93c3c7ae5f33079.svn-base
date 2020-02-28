<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/layout/inc/tags.jspf"%>
<html>
<head>
<title>상품등록(온라인강좌)</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var num = 0;
var oEditors1 = [];
var oEditors2 = [];
var oEditors3 = [];
j$(document).ready(function(){
	String.prototype.trim = function()
	 {
	   return this.replace(/^\s+|\s+$/g, "");
	 }
	
	$.validate({
		form : '#onlinegoodsform',
		validateOnBlur : false,
		validateOnAlert : true,
		onSuccess : function(){
			//alert('모든 필수 정보가 입력이 되었습니다.');
		}
		
	});
	
	$(".onlyNumber").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});	
	
	//등록하기
	j$("#insertBtn").click(function(){
		//nhn smart editor check
		oEditors1.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		oEditors2.getById["ir2"].exec("UPDATE_CONTENTS_FIELD", []);
		oEditors3.getById["ir3"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var checkVal = "<P>&nbsp;</P>";
		var tempVal1 = j$("#ir1").text().trim();
		var tempVal2 = j$("#ir2").text().trim();
		var tempVal3 = j$("#ir3").text().trim();
		
		if(checkVal == tempVal1){
			alert("강좌소개 내용을 입력하세요");
			return false;
		}
		
		if(checkVal == tempVal2){
			alert("강사소개 내용을 입력하세요");
			return false;
		}
		
		if(checkVal == tempVal3){
			alert("취소/환불 규정 내용을 입력하세요");
			return false;
		}
		
		
		//file check
		var f1 =   document.getElementById("file1").value;
		var f2 =   document.getElementById("file2").value;
		if(f1 != "" || f2 != ""){
			j$("#fnum").val("1");	
		}
		
		//select option check
		var status = $("select[name=goodsStatus]").val();
		if(status == ""){
			alert("승인유무 값을 선택하세요.");
			return
		}
		j$("#onlinegoodsform").submit();
	});
	
	//미리보기
	//2015.09.04 보류
	j$("#viewBtn").click(function(){
		alert("개발중입니다.");
		//j$("#onlinegoodsform").attr("target","view");
		//j$("#onlinegoodsform").attr("action","/madm/service/enrollment/onlinegoodsview");
		//j$("#onlinegoodsform").submit();
	});
	
});

function autoCal(val){
	//정수만
	var num_check=/^[0-9]*$/;
	//소수점 한자리까지 만
	var num_check2 = /^\d+(?:[.]?[\d])?$/; 
	
	var buy = $('#goodsBuyPrice').val();
	if(num_check.test(buy)){
		buy = parseInt(buy,10);
		
		//할인율을 입력했을 경우
		if(val == "dis"){
			var dis = $('#goodsDisRate').val();
			if(num_check2.test(dis)){
				dis = parseFloat(dis);
				//alert(dis);
				if(dis > 100){
					$('#goodsDisRate').val("");
					alert("할인율은 100을 넘을 수 없습니다.");
				}else{
					sale = buy - ((buy * dis) / 100);
					$('#goodsBuyPrice').val(buy);
					$('#goodsDisRate').val(dis);
					$('#goodsSalePrice').val(sale);
				}
			}else{
				$('#goodsDisRate').val("");
				alert("할인율은 숫자만 입력해주세요.(소주점 한자리까지만 입력가능)");
			}
		}
		
		//매입가를 입력했을 경우
		if(val == "sale"){
			var sale = $('#goodsSalePrice').val();
			if(num_check.test(sale)){
				sale = parseInt(sale,10);
				if(sale > buy){
					$('#goodsSalePrice').val("");
					alert("입력하신 판매가가 매입가보다 큽니다.");
				}else{
					dis = (buy - sale) / buy * 100;
					dis = dis.toFixed(1);
					$('#goodsBuyPrice').val(buy);
					$('#goodsDisRate').val(dis);
					$('#goodsSalePrice').val(sale);
				}
			}else{
				$('#goodsSalePrice').val("");
				alert("판매가는 숫자만 입력해주세요.");
			}
		}
	}else{
		alert("매입가를 입력해주세요.");
	}
}

function addRow(info){
	if(num >= $("select[name=lecCount]").val()){
		alert("설정된 회차수 이상의 회차정보는 등록하실 수 없습니다.");
		return
	}
	
	num++;
	
	var rowlen = info.rows.length;
	var row = info.insertRow(rowlen);
	
		
	row.insertCell(0).innerHTML = num;
	row.insertCell(1).innerHTML = "<input type='text' name='lecNmArr' value='' style='width: 150px;' data-validation='required' data-validation-error-msg='강의명을 확인 해주세요.'/>";
	
	//var cell = row.insertCell(2);
	//cell.innerHTML = "<input type='text' name='lecTimeArr' id='lecTimeArr' value='' style='width: 150px;' class='onlyNumber' data-validation='required' data-validation-error-msg='강의시간 확인 해주세요.'/>";
	//cell.className = "onlyNumber";
	
	row.insertCell(2).innerHTML = "<input type='text' name='lecTimeArr' value='' style='width: 150px;' data-validation='required' data-validation-error-msg='강의시간 확인 해주세요.'/>";
	row.insertCell(3).innerHTML = "<input type='text' name='lecPathArr' value='' style='width: 150px;' data-validation='required' data-validation-error-msg='강좌URL 확인 해주세요.'/>";
	row.insertCell(4).innerHTML = "<input type='checkbox' name='lecPayYnArr"+num+"' id='lecPayYnArr"+num+"' value='Y'>";

	}

function delRow(info){
	if(num == 0){
		return false;
	}
	var rowlen = info.rows.length;
	var row = info.deleteRow(rowlen - 1);
	num--;
}

function checkRow(){
	//select selected value
	var selcount = $("select[name=lecCount]").val();
	//현재 회창 정보 row수
	var rowlen = info.rows.length;
	
	if(selcount<rowlen){
		for(var j=rowlen-selcount; j>1; j--){
			delRow(info);
		}
	}
}

function getcspPopup() {
	window.open("/madm/service/enrollment/cspPopup?Oform=ogoods", "cspPopup", "width=600, height=400,  scrollbars=1");
}

 j$(function(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors1,
	    elPlaceHolder: "ir1",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
  		 },
	    fCreator: "createSEditor2"
	});
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors2,
	    elPlaceHolder: "ir2",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    htParams : {bUseToolbar : true,
            fOnBeforeUnload : function(){},
            fOnAppLoad : function(){}
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
  		 },
	    fCreator: "createSEditor2"
	});
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors3,
	    elPlaceHolder: "ir3",
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
<form id="onlinegoodsform" name="onlinegoodsform" action="/madm/service/enrollment/insertonlinegoods" method="POST" enctype="multipart/form-data">
<input type="hidden" name="fnum" id="fnum" value="0" >
<input type="hidden" name="cspCd" id="cspCd" >

<table cellpadding="0" cellspacing="0" border="0" width="100%"  >
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
					    	<td align="left" class="subtitle">상품등록(온라인강좌)</td>
						</tr>
					</table>
				</td>
			</tr>


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 판매유형</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5">현금영수증여부</th>
				    	<td class="line" width="35%" >
				    		<input  type="radio" name="receiptYn" value="Y" data-validation="required" data-validation-error-msg="현금영수증여부를 선택 해주세요."> 발행
				    		<input  type="radio" name="receiptYn" value="N" > 미발행(현장발행)
				    	</td>
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">면세유무</th>
				    	<td class="line" width="35%" >
				    		<input  type="radio" name="dutyYn" value="Y" data-validation="required" data-validation-error-msg="면세유무를 선택 해주세요." > 과세
				    		<input  type="radio" name="dutyYn" value="N" > 면세
				    	</td>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 강좌 정보</h3></td>	
			</tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">강좌명</th>
				    	<td class="line" width="85%" colspan="3">
				    		<input type="text" name="goodsNm" value="" style="width: 650px;" data-validation="required" data-validation-error-msg="강좌명을 입력 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">요약설명</th>
				    	<td class="line" colspan="3">
				    		<textarea rows="5" cols="10" name="goodsDes" style="width:100%; height:100px;" data-validation="required" data-validation-error-msg="요약설명을 입력 해주세요." ></textarea>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">썸네일(목록)</th>
						<td class="line" colspan="3">
							<input type="file" name="file1" id="file1" style="width: 400px;" data-validation="required" data-validation-error-msg="썸네일(목록)파일을 추가 해주세요."/>&nbsp;
						</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">썸네일(상세)</th>
						<td class="line" colspan="3">
							<input type="file" name="file2" id="file2" style="width: 400px;" data-validation="required" data-validation-error-msg="썸네일(상세)파일을 추가 해주세요."/>&nbsp;
						</td>
					</tr>	
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">교재</th>
						<td class="line" >
							<input type="text" name="goodsTextbook" value="" style="width: 250px;" data-validation="required" data-validation-error-msg="교재를 입력 해주세요."/>
						</td>
						<th class="line" align="center" bgcolor="#F5F5F5">총 수강시간</th>
						<td class="line" >
							<input type="text" name="goodsTotEdu" value="" style="width: 150px;" class="onlyNumber" data-validation="required" data-validation-error-msg="총 수강시간을 입력 해주세요."/>
							※ 분 단위로 숫자만 입력하세요
						</td>
					</tr>					
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">강좌소개</th>
				    	<td class="line" colspan="3">
				    		<textarea rows="5" cols="10" id="ir1" name="goodsContent" style="width:100%; height:100px;"></textarea>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">승인유무</th>
				    	<td class="line" colspan="3">
				    		<comm:select name="goodsStatus" code="100800"  basicValue="전체" selectValue="" />
				    	</td>
					</tr>
				</table>		
				</td>
			</tr>



			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 강사 정보</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5" width="100px">강사명</th>
				    	<td class="line" width="85%" colspan="3">
				    		<input type="text" name="goodsAuth" value="" style="width: 250px;" data-validation="required" data-validation-error-msg="강사명을 입력 해주세요."/>
				    	</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">강사소개</th>
				    	<td class="line" colspan="3">
				    		<textarea rows="5" cols="10" id="ir2" name="goodsIntroduce" style="width:100%; height:100px;"></textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			
			
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 회차 정보</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">회차수</th>
				    	<td class="line" width="35%" >
				    		<select name="lecCount" onchange="checkRow();">
				    			<c:forEach var="lectureCount" begin="00" end="50" step="1">
										<option value="${lectureCount}">${lectureCount}</option>
								</c:forEach>
				    		</select>
				    	</td>
				    	<th class="line" width="15%" align="center" bgcolor="#F5F5F5">수강기간</th>
						<td class="line" width="35%" >
							결제 후 
							<input type="text" name="goodsUsePeriod" value="" style="width: 150px;" class="onlyNumber" data-validation="required" data-validation-error-msg="수강기간을 확인 해주세요."/>
							일 까지 가능
						</td>
					</tr>
					<tr align="left" height="30px">
						<th class="line" align="center" bgcolor="#F5F5F5">회차정보</th>
				    	<td class="line" colspan="3" >
				    		<table id="info" cellpadding="4" cellspacing="0" border="1" width="95%" style="border-collapse:collapse;">
					    		<tr>
					    			<td>강의 번호</td>
					    			<td>강의명</td>
					    			<td>시간(분)</td>
					    			<td>강좌URL</td>
					    			<td>무료 여부</td>
					    		</tr>
					    		<input type="button" onclick="addRow(info);" value="+" />
					    		<!-- <input type="button" onclick="delRow(info);" value="-" /> -->
				    		</table>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 취소/환불 규정</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5" width="120px">취소/환불 규정</th>
				    	<td class="line" width="85%" >
				    		<textarea rows="5" cols="10" id="ir3" name="goodsCancelRefund" style="width:100%; height:100px;"></textarea>
				    	</td>
					</tr>
				</table>
				</td>
			</tr>


			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* 가격정보</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5">가격</th>
				    	<td class="line" width="85%" colspan="3">
				    		정상가
				    		<input type="text" name="goodsNormalPrice" value="" maxlength="10" style="width: 150px;" class="onlyNumber" data-validation="required" data-validation-error-msg="정상가를 확인 해주세요."/>
				    		매입가
				    		<input type="text" id="goodsBuyPrice" name="goodsBuyPrice" value="" maxlength="10" style="width: 150px;" class="onlyNumber" data-validation="required" data-validation-error-msg="매입가를 확인 해주세요."/>
				    		*<input type="text" id="goodsDisRate" name="goodsDisRate" value="" onchange="autoCal('dis');" maxlength="4" style="width: 100px;" data-validation="required" data-validation-error-msg="매입가를  확인 해주세요."/>
				    		%
				    		판매가
				    		<input type="text" id="goodsSalePrice" name="goodsSalePrice" value="" onchange="autoCal('sale');" maxlength="10" style="width: 150px;" data-validation="required" data-validation-error-msg="판매가를 확인 해주세요."/>
				    		<input type="checkbox" name="goodsPayYn" value='Y'>신청형
				    	</td>
					</tr>
				</table>
				</td>
			</tr>

			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><h3>* CP업체</h3></td>	
			</tr>
			<tr>
				<td>
				<table cellpadding="4" cellspacing="0" border="1" width="100%" style="border-collapse:collapse;">
					<tr align="left" height="30px">
						<th class="line" width="15%" align="center" bgcolor="#F5F5F5">업체명</th>
						<td width="85%">
				    		<input type="text" name="cspNm" value="" style="width: 350px;" data-validation="required" data-validation-error-msg="업체명을 확인 해주세요."/>
				    		<input type="button" value="찾아보기" onclick="javascript:getcspPopup();" >
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
					<!-- 버튼 영역 시작 -->
					<table cellpadding="5" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;" bordercolor="#DDDDDD">
						<tr>
							<td align="center" colspan="4">
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td>
								    		<button id="viewBtn" style="height:30px; width:100px;" type="button">미리보기</button>
								    		<button id="insertBtn" style="height:30px; width:100px; margin-left: 50px;" type="button">등록완료</button>
							    		</td>
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